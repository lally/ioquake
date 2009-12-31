#include "ls_render.h"
#include "ls_variables.h"
#include "../renderer/tr_types.h"
#include "../renderer/tr_public.h"
#include "../renderer/tr_local.h"

qboolean LS_Headless (void) {
	return ls_pref_value(LSP_HEADLESS) != 0;
}


static 	void	ls_Shutdown( qboolean destroyWindow );
static	void	ls_BeginRegistration( glconfig_t *config );
static	qhandle_t ls_RegisterModel( const char *name );
static	qhandle_t ls_RegisterSkin( const char *name );
static	qhandle_t ls_RegisterShader( const char *name );
static	qhandle_t ls_RegisterShaderNoMip( const char *name );
static	void	ls_LoadWorld( const char *name );
static	void	ls_SetWorldVisData( const byte *vis );
static	void	ls_EndRegistration( void );
static	void	ls_ClearScene( void );
static	void	ls_AddRefEntityToScene( const refEntity_t *re );
static	void	ls_AddPolyToScene( qhandle_t hShader ,
								   int numVerts,
								   const polyVert_t *verts, int num );
static	int		ls_LightForPoint( vec3_t point, vec3_t ambientLight,
								  vec3_t directedLight, vec3_t lightDir );
static	void	ls_AddLightToScene( const vec3_t org, float intensity,
									float r, float g, float b );
static	void	ls_AddAdditiveLightToScene( const vec3_t org,
											float intensity, float r,
											float g, float b );
static	void	ls_RenderScene( const refdef_t *fd );
static	void	ls_SetColor( const float *rgba );	// NULL = 1,1,1,1
static	void	ls_DrawStretchPic ( float x, float y, float w, float h, 
									float s1, float t1,
									float s2, float t2,
									qhandle_t hShader );	// 0 = white
static	void	ls_DrawStretchRaw (int x, int y, int w, int h,
								   int cols, int rows,
								   const byte *data, int client,
								   qboolean dirty);
static	void	ls_UploadCinematic (int w, int h, int cols, int rows,
									const byte *data, int client,
									qboolean dirty);
static	void	ls_BeginFrame( stereoFrame_t stereoFrame );

	// if the pointers are not NULL, timing info will be returned
static	void	ls_EndFrame( int *frontEndMsec, int *backEndMsec );
static	int		ls_MarkFragments( int numPoints,
								  const vec3_t *points,
								  const vec3_t projection,
								  int maxPoints,
								  vec3_t pointBuffer,
								  int maxFragments,
								  markFragment_t *fragmentBuffer );

static	int		ls_LerpTag( orientation_t *tag,
							qhandle_t model,
							int startFrame,
							int endFrame, 
							float frac,
							const char *tagName );
static	void	ls_ModelBounds( qhandle_t model,
								vec3_t mins,
								vec3_t maxs );

#ifdef __USEA3D
static	void    ls_A3DRenderGeometry) (void *pVoidA3D,
									   void *pVoidGeom,
									   void *pVoidMat,
									   void *pVoidGeomStatus);
#endif
static	void	ls_RegisterFont(const char *fontName,
								int pointSize,
								fontInfo_t *font);
static	void	ls_RemapShader(const char *oldShader,
							   const char *newShader,
							   const char *offsetTime);
static	qboolean ls_GetEntityToken( char *buffer, int size );
static	qboolean ls_inPVS( const vec3_t p1, const vec3_t p2 );

static	void ls_TakeVideoFrame( int h,
								int w,
								byte* captureBuffer,
								byte *encodeBuffer,
								qboolean motionJpeg );

static char * s_models[2048];
static char * s_skins[2048];
static char * s_shaders[2048];
static int s_nmodels, s_nskins, s_nshaders;
extern cvar_t *r_customwidth;
extern cvar_t *r_customheight;
extern cvar_t *r_customPixelAspect;
extern cvar_t *r_ambientScale;
extern cvar_t *r_directedScale;
extern cvar_t *r_debugLight;
extern cvar_t *r_maxpolys;
extern cvar_t *r_maxpolyverts;

refexport_t* LS_GetRefAPI(refimport_t *rimport) {
	static refexport_t s_exported;
	static refimport_t ri;
	ri = *rimport;
	
	Com_Memset(&s_exported, 0, sizeof(s_exported));
		// the RE_ functions are Renderer Entry points

	s_exported.Shutdown = ls_Shutdown;

	s_exported.BeginRegistration = ls_BeginRegistration;
	s_exported.RegisterModel = ls_RegisterModel;
	s_exported.RegisterSkin = ls_RegisterSkin;
	s_exported.RegisterShader = ls_RegisterShader;
	s_exported.RegisterShaderNoMip = ls_RegisterShaderNoMip;
	s_exported.LoadWorld = ls_LoadWorld;
	s_exported.SetWorldVisData = ls_SetWorldVisData;
	s_exported.EndRegistration = ls_EndRegistration;

	s_exported.BeginFrame = ls_BeginFrame;
	s_exported.EndFrame = ls_EndFrame;

	s_exported.MarkFragments = ls_MarkFragments;
	s_exported.LerpTag = ls_LerpTag;
	s_exported.ModelBounds = ls_ModelBounds;

	s_exported.ClearScene = ls_ClearScene;
	s_exported.AddRefEntityToScene = ls_AddRefEntityToScene;
	s_exported.AddPolyToScene = ls_AddPolyToScene;
	s_exported.LightForPoint = ls_LightForPoint;
	s_exported.AddLightToScene = ls_AddLightToScene;
	s_exported.AddAdditiveLightToScene = ls_AddAdditiveLightToScene;
	s_exported.RenderScene = ls_RenderScene;

	s_exported.SetColor = ls_SetColor;
	s_exported.DrawStretchPic = ls_DrawStretchPic;
	s_exported.DrawStretchRaw = ls_DrawStretchRaw;
	s_exported.UploadCinematic = ls_UploadCinematic;

	s_exported.RegisterFont = ls_RegisterFont;
	s_exported.RemapShader = ls_RemapShader;
	s_exported.GetEntityToken = ls_GetEntityToken;
	s_exported.inPVS = ls_inPVS;

	s_exported.TakeVideoFrame = ls_TakeVideoFrame;

		r_allowExtensions = ri.Cvar_Get( "r_allowExtensions", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_ext_compressed_textures = ri.Cvar_Get( "r_ext_compressed_textures", "0", CVAR_ARCHIVE | CVAR_LATCH );
	r_ext_multitexture = ri.Cvar_Get( "r_ext_multitexture", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_ext_compiled_vertex_array = ri.Cvar_Get( "r_ext_compiled_vertex_array", "1", CVAR_ARCHIVE | CVAR_LATCH);
	r_ext_texture_env_add = ri.Cvar_Get( "r_ext_texture_env_add", "1", CVAR_ARCHIVE | CVAR_LATCH);

	r_ext_texture_filter_anisotropic = ri.Cvar_Get( "r_ext_texture_filter_anisotropic",
			"0", CVAR_ARCHIVE | CVAR_LATCH );
	r_ext_max_anisotropy = ri.Cvar_Get( "r_ext_max_anisotropy", "2", CVAR_ARCHIVE | CVAR_LATCH );

	r_picmip = ri.Cvar_Get ("r_picmip", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_roundImagesDown = ri.Cvar_Get ("r_roundImagesDown", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_colorMipLevels = ri.Cvar_Get ("r_colorMipLevels", "0", CVAR_LATCH );
	ri.Cvar_CheckRange( r_picmip, 0, 16, qtrue );
	r_detailTextures = ri.Cvar_Get( "r_detailtextures", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_texturebits = ri.Cvar_Get( "r_texturebits", "0", CVAR_ARCHIVE | CVAR_LATCH );
	r_colorbits = ri.Cvar_Get( "r_colorbits", "0", CVAR_ARCHIVE | CVAR_LATCH );
	r_stencilbits = ri.Cvar_Get( "r_stencilbits", "8", CVAR_ARCHIVE | CVAR_LATCH );
	r_depthbits = ri.Cvar_Get( "r_depthbits", "0", CVAR_ARCHIVE | CVAR_LATCH );
	r_overBrightBits = ri.Cvar_Get ("r_overBrightBits", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_ignorehwgamma = ri.Cvar_Get( "r_ignorehwgamma", "0", CVAR_ARCHIVE | CVAR_LATCH);
	r_mode = ri.Cvar_Get( "r_mode", "3", CVAR_ARCHIVE | CVAR_LATCH );
	r_fullscreen = ri.Cvar_Get( "r_fullscreen", "1", CVAR_ARCHIVE );
	r_customwidth = ri.Cvar_Get( "r_customwidth", "1600", CVAR_ARCHIVE | CVAR_LATCH );
	r_customheight = ri.Cvar_Get( "r_customheight", "1024", CVAR_ARCHIVE | CVAR_LATCH );
	r_customPixelAspect = ri.Cvar_Get( "r_customPixelAspect", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_simpleMipMaps = ri.Cvar_Get( "r_simpleMipMaps", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_vertexLight = ri.Cvar_Get( "r_vertexLight", "0", CVAR_ARCHIVE | CVAR_LATCH );
	r_uiFullScreen = ri.Cvar_Get( "r_uifullscreen", "0", 0);
	r_subdivisions = ri.Cvar_Get ("r_subdivisions", "4", CVAR_ARCHIVE | CVAR_LATCH);
	r_smp = ri.Cvar_Get( "r_smp", "0", CVAR_ARCHIVE | CVAR_LATCH);
	r_stereoEnabled = ri.Cvar_Get( "r_stereoEnabled", "0", CVAR_ARCHIVE | CVAR_LATCH);
	r_ignoreFastPath = ri.Cvar_Get( "r_ignoreFastPath", "1", CVAR_ARCHIVE | CVAR_LATCH );
	r_greyscale = ri.Cvar_Get("r_greyscale", "0", CVAR_ARCHIVE | CVAR_LATCH);

	//
	// temporary latched variables that can only change over a restart
	//
	r_displayRefresh = ri.Cvar_Get( "r_displayRefresh", "0", CVAR_LATCH );
	ri.Cvar_CheckRange( r_displayRefresh, 0, 200, qtrue );
	r_fullbright = ri.Cvar_Get ("r_fullbright", "0", CVAR_LATCH|CVAR_CHEAT );
	r_mapOverBrightBits = ri.Cvar_Get ("r_mapOverBrightBits", "2", CVAR_LATCH );
	r_intensity = ri.Cvar_Get ("r_intensity", "1", CVAR_LATCH );
	r_singleShader = ri.Cvar_Get ("r_singleShader", "0", CVAR_CHEAT | CVAR_LATCH );

	//
	// archived variables that can change at any time
	//
	r_lodCurveError = ri.Cvar_Get( "r_lodCurveError", "250", CVAR_ARCHIVE|CVAR_CHEAT );
	r_lodbias = ri.Cvar_Get( "r_lodbias", "0", CVAR_ARCHIVE );
	r_flares = ri.Cvar_Get ("r_flares", "0", CVAR_ARCHIVE );
	r_znear = ri.Cvar_Get( "r_znear", "4", CVAR_CHEAT );
	ri.Cvar_CheckRange( r_znear, 0.001f, 200, qfalse );
	r_zproj = ri.Cvar_Get( "r_zproj", "64", CVAR_ARCHIVE );
	r_stereoSeparation = ri.Cvar_Get( "r_stereoSeparation", "64", CVAR_ARCHIVE );
	r_ignoreGLErrors = ri.Cvar_Get( "r_ignoreGLErrors", "1", CVAR_ARCHIVE );
	r_fastsky = ri.Cvar_Get( "r_fastsky", "0", CVAR_ARCHIVE );
	r_inGameVideo = ri.Cvar_Get( "r_inGameVideo", "1", CVAR_ARCHIVE );
	r_drawSun = ri.Cvar_Get( "r_drawSun", "0", CVAR_ARCHIVE );
	r_dynamiclight = ri.Cvar_Get( "r_dynamiclight", "1", CVAR_ARCHIVE );
	r_dlightBacks = ri.Cvar_Get( "r_dlightBacks", "1", CVAR_ARCHIVE );
	r_finish = ri.Cvar_Get ("r_finish", "0", CVAR_ARCHIVE);
	r_textureMode = ri.Cvar_Get( "r_textureMode", "GL_LINEAR_MIPMAP_NEAREST", CVAR_ARCHIVE );
	r_swapInterval = ri.Cvar_Get( "r_swapInterval", "0",
					CVAR_ARCHIVE | CVAR_LATCH );
	r_gamma = ri.Cvar_Get( "r_gamma", "1", CVAR_ARCHIVE );
	r_facePlaneCull = ri.Cvar_Get ("r_facePlaneCull", "1", CVAR_ARCHIVE );

	r_railWidth = ri.Cvar_Get( "r_railWidth", "16", CVAR_ARCHIVE );
	r_railCoreWidth = ri.Cvar_Get( "r_railCoreWidth", "6", CVAR_ARCHIVE );
	r_railSegmentLength = ri.Cvar_Get( "r_railSegmentLength", "32", CVAR_ARCHIVE );

	r_primitives = ri.Cvar_Get( "r_primitives", "0", CVAR_ARCHIVE );

	r_ambientScale = ri.Cvar_Get( "r_ambientScale", "0.6", CVAR_CHEAT );
	r_directedScale = ri.Cvar_Get( "r_directedScale", "1", CVAR_CHEAT );

	r_anaglyphMode = ri.Cvar_Get("r_anaglyphMode", "0", CVAR_ARCHIVE);

	//
	// temporary variables that can change at any time
	//
	r_showImages = ri.Cvar_Get( "r_showImages", "0", CVAR_TEMP );

	r_debugLight = ri.Cvar_Get( "r_debuglight", "0", CVAR_TEMP );
	r_debugSort = ri.Cvar_Get( "r_debugSort", "0", CVAR_CHEAT );
	r_printShaders = ri.Cvar_Get( "r_printShaders", "0", 0 );
	r_saveFontData = ri.Cvar_Get( "r_saveFontData", "0", 0 );

	r_nocurves = ri.Cvar_Get ("r_nocurves", "0", CVAR_CHEAT );
	r_drawworld = ri.Cvar_Get ("r_drawworld", "1", CVAR_CHEAT );
	r_lightmap = ri.Cvar_Get ("r_lightmap", "0", 0 );
	r_portalOnly = ri.Cvar_Get ("r_portalOnly", "0", CVAR_CHEAT );

	r_flareSize = ri.Cvar_Get ("r_flareSize", "40", CVAR_CHEAT);
	r_flareFade = ri.Cvar_Get ("r_flareFade", "7", CVAR_CHEAT);
	r_flareCoeff = ri.Cvar_Get ("r_flareCoeff", FLARE_STDCOEFF, CVAR_CHEAT);

	r_showSmp = ri.Cvar_Get ("r_showSmp", "0", CVAR_CHEAT);
	r_skipBackEnd = ri.Cvar_Get ("r_skipBackEnd", "0", CVAR_CHEAT);

	r_measureOverdraw = ri.Cvar_Get( "r_measureOverdraw", "0", CVAR_CHEAT );
	r_lodscale = ri.Cvar_Get( "r_lodscale", "5", CVAR_CHEAT );
	r_norefresh = ri.Cvar_Get ("r_norefresh", "0", CVAR_CHEAT);
	r_drawentities = ri.Cvar_Get ("r_drawentities", "1", CVAR_CHEAT );
	r_ignore = ri.Cvar_Get( "r_ignore", "1", CVAR_CHEAT );
	r_nocull = ri.Cvar_Get ("r_nocull", "0", CVAR_CHEAT);
	r_novis = ri.Cvar_Get ("r_novis", "0", CVAR_CHEAT);
	r_showcluster = ri.Cvar_Get ("r_showcluster", "0", CVAR_CHEAT);
	r_speeds = ri.Cvar_Get ("r_speeds", "0", CVAR_CHEAT);
	r_verbose = ri.Cvar_Get( "r_verbose", "0", CVAR_CHEAT );
	r_logFile = ri.Cvar_Get( "r_logFile", "0", CVAR_CHEAT );
	r_debugSurface = ri.Cvar_Get ("r_debugSurface", "0", CVAR_CHEAT);
	r_nobind = ri.Cvar_Get ("r_nobind", "0", CVAR_CHEAT);
	r_showtris = ri.Cvar_Get ("r_showtris", "0", CVAR_CHEAT);
	r_showsky = ri.Cvar_Get ("r_showsky", "0", CVAR_CHEAT);
	r_shownormals = ri.Cvar_Get ("r_shownormals", "0", CVAR_CHEAT);
	r_clear = ri.Cvar_Get ("r_clear", "0", CVAR_CHEAT);
	r_offsetFactor = ri.Cvar_Get( "r_offsetfactor", "-1", CVAR_CHEAT );
	r_offsetUnits = ri.Cvar_Get( "r_offsetunits", "-2", CVAR_CHEAT );
	r_drawBuffer = ri.Cvar_Get( "r_drawBuffer", "GL_BACK", CVAR_CHEAT );
	r_lockpvs = ri.Cvar_Get ("r_lockpvs", "0", CVAR_CHEAT);
	r_noportals = ri.Cvar_Get ("r_noportals", "0", CVAR_CHEAT);
	r_shadows = ri.Cvar_Get( "cg_shadows", "1", 0 );

	r_maxpolys = ri.Cvar_Get( "r_maxpolys", va("%d", MAX_POLYS), 0);
	r_maxpolyverts = ri.Cvar_Get( "r_maxpolyverts", va("%d", MAX_POLYVERTS), 0);

	return  &s_exported;
}
static 	void	ls_Shutdown( qboolean destroyWindow ) {
}
static	void	ls_BeginRegistration( glconfig_t *config ) {}
static	qhandle_t ls_RegisterModel( const char *name ) {
	int i;
	for (i=0; i<s_nmodels; ++i) {
		if (!strcmp(name, s_models[i]))
			return i+1;
	}
	s_models[s_nmodels++] = strdup(name);
	return s_nmodels;
}
static	qhandle_t ls_RegisterSkin( const char *name ) {
	int i;
	for (i=0; i<s_nskins; ++i) {
		if (!strcmp(name, s_skins[i]))
			return i+1;
	}
	s_skins[s_nskins++] = strdup(name);
	return s_nskins;
}
static	qhandle_t ls_RegisterShader( const char *name ) {
	int i;
	for (i=0; i<s_nshaders; ++i) {
		if (!strcmp(name, s_shaders[i]))
			return i+1;
	}
	s_shaders[s_nshaders++] = strdup(name);
	return s_nshaders;
}
static	qhandle_t ls_RegisterShaderNoMip( const char *name ) {
	return ls_RegisterShader(name);
}
static	void	ls_LoadWorld( const char *name ) {}
static	void	ls_SetWorldVisData( const byte *vis ) {}
static	void	ls_EndRegistration( void ) {}
static	void	ls_ClearScene( void ) {}
static	void	ls_AddRefEntityToScene( const refEntity_t *re ) {}
static	void	ls_AddPolyToScene( qhandle_t hShader,
								   int numVerts,
								   const polyVert_t *verts, int num ) {}
static	int		ls_LightForPoint( vec3_t point, vec3_t ambientLight,
								  vec3_t directedLight, vec3_t lightDir ) {
	return 0;
}
static	void	ls_AddLightToScene( const vec3_t org, float intensity,
									float r, float g, float b ) {}
static	void	ls_AddAdditiveLightToScene( const vec3_t org,
											float intensity, float r,
											float g, float b ) {}
static	void	ls_RenderScene( const refdef_t *fd ) {}
static	void	ls_SetColor( const float *rgba ) {}
static	void	ls_DrawStretchPic ( float x, float y, float w, float h,
									float s1, float t1,
									float s2, float t2,
									qhandle_t hShader ) {}
static	void	ls_DrawStretchRaw (int x, int y, int w, int h,
								   int cols, int rows,
								   const byte *data, int client,
								   qboolean dirty) {}
static	void	ls_UploadCinematic (int w, int h, int cols, int rows,
									const byte *data, int client,
									qboolean dirty) {}
static	void	ls_BeginFrame( stereoFrame_t stereoFrame ) {}

	// if the pointers are not NULL, timing info will be returned
static	void	ls_EndFrame( int *frontEndMsec, int *backEndMsec ) {}
static	int		ls_MarkFragments( int numPoints,
								  const vec3_t *points,
								  const vec3_t projection,
								  int maxPoints,
								  vec3_t pointBuffer,
								  int maxFragments,
								  markFragment_t *fragmentBuffer )
{
	return 0;
}

static	int		ls_LerpTag( orientation_t *tag,
							qhandle_t model,
							int startFrame,
							int endFrame, 
							float frac,
							const char *tagName ) {
	return qtrue;
}
static	void	ls_ModelBounds( qhandle_t model,
								vec3_t mins,
								vec3_t maxs ) {
	VectorClear(mins);
	VectorClear(maxs);
}

#ifdef __USEA3D
static	void    ls_A3DRenderGeometry) (void *pVoidA3D,
									   void *pVoidGeom,
									   void *pVoidMat,
									   void *pVoidGeomStatus) {}
#endif
static	void	ls_RegisterFont(const char *fontName,
								int pointSize,
								fontInfo_t *font) {
	// do-nothing.
	Com_Memset(font, 0, sizeof(fontInfo_t));
}
static	void	ls_RemapShader(const char *oldShader,
							   const char *newShader,
							   const char *offsetTime) {}

static	qboolean ls_GetEntityToken( char *buffer, int size ) {
	return qtrue;
}
static	qboolean ls_inPVS( const vec3_t p1, const vec3_t p2 ) {
	return qtrue;
}

static	void ls_TakeVideoFrame( int h,
								int w,
								byte* captureBuffer,
								byte *encodeBuffer,
								qboolean motionJpeg ) {

}
