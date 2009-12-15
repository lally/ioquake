#!/bin/bash

if ! pgrep Xephyr 
then
  echo "Starting Xephyr"
  pfexec Xephyr :1.0 &
  xauth extract - $DISPLAY | DISPLAY=:1.0 xauth merge -
  echo "You'll have to re-run this script to launch ioquake, it probably won't work this time."
fi

DISPLAY=:1.0 ./ioquake3.i386 "$@"

