#include "ls_met.h"
#include <assert.h>
#include <string.h>

static struct MET_File s_global;

double MET_tv_sub(struct timeval *before,
				  struct timeval *after) {
	double delta_sec = after->tv_sec - before->tv_sec;
	double after_tv_usec = after->tv_usec;
	if (after->tv_usec < before->tv_usec) {
		delta_sec-= 1.0;
		after_tv_usec += 1000000.0;
	}
	delta_sec += (after_tv_usec - before->tv_usec) / 1000000.0;
	return delta_sec;
}


struct MET_File *MET_GlobalFile(void) {
	return &s_global;
}

void MET_Init(struct MET_File *dest, const char *filename) {
	memset(dest, 0, sizeof (struct MET_File));
	dest->file = fopen(filename, "a+");
	assert(dest->file);
	//	setvbuf(dest->file, dest->buffer, _IOFBF, 65535);
}

void MET_Flush(struct MET_File *dest) {
	assert(dest->file);
	int should = 0; // as in, "should flush"
	if (dest->last_write.tv_sec == 0)
		should = 1;
	else {
		struct timeval now;
		gettimeofday(&now,0);
		if (MET_tv_sub(&dest->last_write, &now) >= 1.0) {
			fflush(dest->file);
			dest->last_write = now;
		}
	}
}
void MET_Close(struct MET_File *dest) {
	assert(dest->file);
	fflush(dest->file);
	fclose(dest->file);
	dest->file = 0;
}

void MET_FreqInit(struct MET_Freq *dest,
				  struct MET_File *file,
				  const char *pat,
				  int bufsz) {
	const int zero_sz = sizeof(struct MET_Freq) + sizeof(double) * (bufsz-1);
	assert(file->file);
	memset(dest, 0, zero_sz);
	dest->file = file;
	dest->pattern = pat;
	dest->sample_buf_sz = bufsz;
}

void MET_FreqSample(struct MET_Freq *dest) {
	assert(dest->file->file);
	// Save the sample.  If we've hit our sample counter, flush.  
	int should_flush = 0;
	if (dest->last.tv_sec == 0) {
		gettimeofday(&dest->last, 0);
	}
	else {
		struct timeval now;
		gettimeofday(&now, 0);
        if (dest->sample_count < dest->sample_buf_sz) {
            dest->samples[dest->sample_count++] = MET_tv_sub(&dest->last, &now); 
        } else {
            should_flush = 1;
        }
	}
	if (should_flush) {
		MET_FreqFlush(dest);
	}
}
void MET_FreqFlush(struct MET_Freq *dest) {
	double total = 0.0;
	int i;
	assert(dest->file->file);
	for (i=0; i<dest->sample_count; ++i) {
		total += dest->samples[i];
	}
	if (dest->sample_count == 0) {
		dest->sample_count = -1;
	}
	fprintf(dest->file->file,
			"Coreloop: %3.2fms, %d samples\n",
			/*			dest->pattern, */
			/* Use milliseconds */ 
			1000.0 * total / dest->sample_count,
			dest->sample_count);
    dest->sample_count = 0;
	MET_Flush(dest->file);
}


void MET_CounterInit(struct MET_Counter *dest,
					 struct MET_File *file,
					 const char *pattern) {
	assert(file->file);
	memset(dest, 0, sizeof(struct MET_Counter));
	dest->file = file;
	dest->pattern = pattern;
}

void MET_CounterSample(struct MET_Counter *dest, int count) {
	assert(dest->file->file);
	if (dest->last.tv_sec == 0) {
		gettimeofday(&dest->last,0);
		assert(dest->count == 0);
	}
	else {
		struct timeval tm;
		gettimeofday(&tm,0);
		dest->count += count;
		double delta = MET_tv_sub(&dest->last, &tm);
		if (delta >= 1.0) {
			dest->last = tm;
			MET_CounterFlush(dest, dest->count / delta);
		}
	}
}

void MET_CounterFlush(struct MET_Counter *dest, double value) {
	assert(dest->file->file);
	fprintf(dest->file->file,
			dest->pattern,
			value);
	dest->count = 0;
	MET_Flush(dest->file);
}

void MET_SimPlayers(int value) {
	
}
