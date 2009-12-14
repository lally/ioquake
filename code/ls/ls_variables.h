#ifndef INCLUDE_LS_VARIABLES
#define INCLUDE_LS_VARIABLES

/*
 * An external, unsynchronized data facility for storing and
 * retrieving runtime parameters.
 */

struct ls_pref_s;

typedef int (*ls_pref_constructor)(ls_pref_s *dest, char *input);

typedef struct ls_pref_s {
  // A single preference.  Note that some are set at startup and are
  // read-only after, but others may be mutable through software
  // control or console user command.
  
  char    *d_name;          // user-visible name, C-identifier syntax
  int      d_value;         // integral value 
  char    *d_state_comment; // optional marker for who/why the value
							// is where it is.
  void    *d_userdata;      // pointer to whatever you want.
  ls_pref_constructor d_constructor;  // an optional constructor for
									  // (usually) d_userdata.
} ls_pref_t;

enum ls_pref_id {
  LSP_HEADLESS,
  LSP_SIMULATOR,
  LSP_LAST
};

// ACCESSORS
int   ls_pref_value(ls_pref_id id);
char *ls_pref_name (ls_pref_id id);
void *ls_pref_udata(ls_pref_id id);

// MANIPULATOR
void  ls_pref_set  (ls_pref_id	 id,
					char		*name,
					int			 value,
					char		*state_comment,
					void		*udata);
    // Note that we don't provide a means to reset the constructor.  Those
    // are statically determined, and private to this module.

char ** ls_pref_load (int *args, char ** argv);
    // From a main()'s command line input, will provide a copy of the
    // input argv[] with any ls_pref-related data taken out.  The
    // return value is always the same address - a statically
    // allocated internal buffer.  The return value from prior calls
    // is thusly stomped upon subsequent invocation.

#endif /* INCLUDE_LS_VARIABLES */

