#!/bin/bash

# I  can  also put  'gmake  release'  in here  to  make  it build  and
# package-up the debugging version, if I ever find a use for that.
TARGETS="release debug" #release

for i in $TARGETS
do
    gmake $i BUILD_GAME_SO=0 BUILD_GAME_QVM=1
    LOC=build/${i}-sunos-i386
    echo $LOC/pak9.pk3
    pushd ${LOC}/baseq3 >/dev/null
    rm -f pak9.pk3
    zip pak9.pk3 vm/*.qvm
    popd >/dev/null
done
