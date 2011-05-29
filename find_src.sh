#!/bin/bash

find /research/phd/dves/ioquake3/code \( -name '*.cc' -o -name '*.h' -o -name '*.c' -o -name '*.cpp' \) -exec grep -n "$@" {} \; -print | sed -e "s|^\(/.*\)$|`tput setf 4`\1`tput setf 0`|" | sed -e "s|^\([0-9][0-9]*\):|`tput setf 1`\1:`tput setf 2`|"
    


