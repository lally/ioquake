#ifndef INCLUDE_LS_MET
#define INCLUDE_LS_MET
// -------------------------------------------------------------------
//							 Metrics Core
// -------------------------------------------------------------------
#include <stdio.h>
#include <sys/time.h>

/*
  This core is dead, dead simple.  It's just:
  1) a frequency cycle library
  2) a wrapper around a well-buffered fprintf.
 */

struct MET_File {
	FILE * file;
	struct timeval last_write;
	char buffer[65536];
};

double MET_tv_sub(struct timeval *before, struct timeval *after);

struct MET_File * MET_GlobalFile(void);

void MET_Init(struct MET_File *dest, const char *filename);
void MET_Flush(struct MET_File *dest);
void MET_Close(struct MET_File *dest);

struct MET_Freq {
	struct MET_File *file;
	struct timeval last;
	int     sample_buf_sz, sample_count;
	const char *pattern; // an fprintf() pattern taking a double then
						 // an int (current average, current count)
	double  samples[1]; // delta-t, in seconds (with usec precision).
};

void MET_FreqInit(struct MET_Freq *dest,
				  struct MET_File *file,
				  const char *pattern,
				  int bufsz);

void MET_FreqSample(struct MET_Freq *dest);
void MET_FreqFlush(struct MET_Freq *dest);

struct MET_Counter { // ticks/sec
	struct MET_File *file;
	struct timeval last;
	// Will reset after a second has past.
	
	int count;
	// Nr in the last time interval.
	
	const char *pattern;
	// fprintf pattern.
};

void MET_CounterInit(struct MET_Counter *dest,
					 struct MET_File *file,
					 const char *pattern);
void MET_CounterSample(struct MET_Counter *dest, int count);
void MET_CounterFlush(struct MET_Counter *dest, double value);


void MET_ClientCount(void); // defined in sv_main.c, for var access
							// reasons. 

#endif
