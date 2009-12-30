#!/bin/bash

DIRS="AL SDL12 asm botlib cgame client game ls q3_ui qcommon renderer sdl sys"
#FILES=`find $DIRS -name '*.c' -print`
#FILES=client/cl_main.c
QDEFINES="-DUSE_ICON -I/usr/include/SDL -D_GNU_SOURCE=1 -D_REENTRANT -I/usr/X11/include/NVIDIA -DUSE_MUMBLE -DUSE_VOIP -DFLOATING_POINT -DUSE_ALLOCA -Icode/libspeex/include -DUSE_LOCAL_HEADERS -DPRODUCT_VERSION=\"1.35_SVN1489M\" -DNDEBUG -DOS_STRING=\"solaris\" -DID_INLINE=inline -DPATH_SEP=\'/\' -DARCH_STRING=\"i386\" -DQ3_LITTE_ENDIAN -DDLL_EXT=\".so\" -DSCREWUP -DQDECL -DMAX_QPATH=256"

INCLUDES="-I. -I/usr/include/"

# Taken from the Makefile, and processed quite a bit.
FILES="client/cl_cgame.c  client/cl_cin.c  client/cl_console.c  client/cl_input.c  client/cl_keys.c  client/cl_main.c  client/cl_net_chan.c  client/cl_parse.c  client/cl_scrn.c  client/cl_ui.c  client/cl_avi.c  qcommon/cm_load.c  qcommon/cm_patch.c  qcommon/cm_polylib.c  qcommon/cm_test.c  qcommon/cm_trace.c  qcommon/cmd.c qcommon/common.c qcommon/cvar.c qcommon/files.c qcommon/md4.c qcommon/md5.c qcommon/msg.c qcommon/net_chan.c qcommon/net_ip.c qcommon/huffman.c server/sv_bot.c server/sv_ccmds.c server/sv_client.c server/sv_game.c server/sv_init.c server/sv_main.c server/sv_net_chan.c server/sv_snapshot.c server/sv_world.c qcommon/vm.c qcommon/vm_interpreted.c botlib/be_aas_bspq3.c botlib/be_aas_cluster.c botlib/be_aas_debug.c botlib/be_aas_entity.c botlib/be_aas_file.c botlib/be_aas_main.c botlib/be_aas_move.c botlib/be_aas_optimize.c botlib/be_aas_reach.c botlib/be_aas_route.c botlib/be_aas_routealt.c botlib/be_aas_sample.c botlib/be_ai_char.c botlib/be_ai_chat.c botlib/be_ai_gen.c botlib/be_ai_goal.c botlib/be_ai_move.c botlib/be_ai_weap.c botlib/be_ai_weight.c botlib/be_ea.c botlib/be_interface.c botlib/l_crc.c botlib/l_libvar.c botlib/l_log.c botlib/l_memory.c  renderer/tr_animation.c renderer/tr_backend.c renderer/tr_bsp.c renderer/tr_cmds.c renderer/tr_curve.c renderer/tr_flares.c renderer/tr_font.c renderer/tr_image.c renderer/tr_image_png.c renderer/tr_image_jpg.c renderer/tr_image_bmp.c renderer/tr_image_tga.c renderer/tr_image_pcx.c renderer/tr_init.c renderer/tr_light.c renderer/tr_main.c renderer/tr_marks.c renderer/tr_mesh.c renderer/tr_model.c renderer/tr_noise.c renderer/tr_scene.c renderer/tr_shade.c renderer/tr_shade_calc.c renderer/tr_shader.c renderer/tr_shadows.c renderer/tr_sky.c renderer/tr_surface.c renderer/tr_world.c sdl/sdl_gamma.c sdl/sdl_input.c sdl/sdl_snd.c ls/ls_variables.c sys/con_passive.c sys/con_log.c sys/sys_main.c sys/sys_unix.c"

FAILED="botlib/l_precomp.c botlib/l_script.c botlib/l_struct.c qcommon/vm_x86.c "

cflow $QDEFINES $INCLUDES $FILES
#cflow $DEFINES $INCLUDES "$@"