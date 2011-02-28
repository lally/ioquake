#!/bin/bash

cp quake_provider.dtrace quake_provider.d
dtrace -h -s quake_provider.d
rm quake_provider.d
