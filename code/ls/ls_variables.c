#include "ls_prefs.h"
#include <stdlib.h>
#include <ctype.h>
#include <assert.h>

static ls_pref_t s_prefs[] = {
  // name            default  defl-comment      udata   constructor 
  // --------------- -------- ---------------- -------- -----------
  { "lsp_headless",        0, "initial value",       0, 0 },
  { "lsp_simulator",       0, "initial value",       0, 0 },
  { "lsp_invalid",         0, "invalid!",            0, 0 }
};

int ls_pref_value(ls_pref_id id) {
  assert(id >= 0 && id < LSP_LAST);
  return s_prefs[id].d_value;
}

char *ls_pref_name(ls_pref_id id) {
  assert(id >= 0 && id < LSP_LAST);
  return s_prefs[id].d_name;
}

void *ls_pref_udata(ls_pref_id id) {
  assert(id >= 0 && id < LSP_LAST);
  return s_prefs[id].d_userdata;
}

void ls_pref_set(ls_pref_id		 id,
				 char			*name,
				 int			 value,
				 char			*state_comment,
				 void		    *udata) {
  assert(id >= 0 && id < LSP_LAST);
  s_prefs[id].d_name = name;
  s_prefs[id].d_value = value;
  s_prefs[id].d_state_comment = state_comment;
  s_prefs[id].d_udata = udata;
}

char ** ls_pref_load (int *args, char ** argv) {
  static char *new_argv[512];
  int   resulting_args = 0;
  static char buffer[512];

  for (int i=0; i<*args; ++i) {
	// our syntax is "pref=value", so scan those args with equal signs
	// in them.
	char *eql = strchr(args[i], '=');
	bool used = false;
	char *buf_eql;
	if (eql) {
	  strcpy(buffer, argv[i]);
	  buf_eql = buffer + (eql - argv[i]);
	  *(buf_eql++) = 0;
	  
	  for (int pref=0; pref<LSP_LAST; ++pref) {
		if (!strcmp(s_prefs[pref].d_name, buffer)) {
		  // found the pref.
		  ls_pref_t *prefp = &s_prefs[pref];
		  prefp->d_state_comment = "command-line";
		  if (prefp->d_constructor) {
			used = 1 == prefp->d_constructor(prefp, buf_eql);
		  }
		  else {
			prefp->d_value = atoi(buf_eql);
			used = 1;
		  }
		}
	  }
	}

	if (!used) {
	  // we didn't eat this arg, copy it over.
	  new_argv[resulting_args++] = argv[i];
	}
  }

  *args = resulting_args;
  return new_argv;
}
