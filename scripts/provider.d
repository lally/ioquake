#!/usr/sbin/dtrace -s

BEGIN {
	printf ("IOQuake Provider Test\n");

}

quake$1:::sim-total
{
   printf ("sim-total(%d)\n", arg0);
}

quake$1:::sim-players
{
   printf ("sim-players(%d)\n", arg0);
}


