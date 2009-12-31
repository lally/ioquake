#!/bin/bash

#
# Connects a client (headless) to the server.
#

SERVER=`ifconfig nge0 | grep inet | cut -d ' ' -f 2`

DISPLAY=:1.0 ./ioquake3.i386 lsp_headless=1 +connect $SERVER "$@"


