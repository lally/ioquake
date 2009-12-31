#!/bin/bash

if [[ $# -lt 1 ]]
then 
  NEWDISP=:1.0
else
  NEWDISP=$1
fi

DISPLAY=$NEWDISP ./ioquake3.i386 "$@"

