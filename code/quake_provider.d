/*
 * IOQuake3 DTrace Provider
 */
provider quake {
	/*************************************************************
	 * SIMULATION PROBES
	 */

	probe sim__total(int); /* (nr total objects simulated)
							sv_main.c:878*/

	probe sim__players(int); /* (nr players simulated) */

	probe core_loop__start();
	probe core_loop__end();
};
