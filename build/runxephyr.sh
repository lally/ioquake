#!/bin/bash

if [[ $# -lt 1 ]]
then 
  NEWDISP=:1.0
else
  NEWDISP=$1
fi

echo "Starting Xephyr"
pfexec Xephyr $NEWDISP &
xauth extract - $DISPLAY | DISPLAY=$NEWDISP xauth merge -
echo "You'll have to re-run this script to launch ioquake, it probably won't work this time."

