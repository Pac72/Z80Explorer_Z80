#!/usr/bin/env bash
#
# Assembles Z80 source file into object code and generates Intel HEX format
# to be loaded into Z80Explorer.
#
# Give it an argument of an ASM file you want to use, or simply drag and drop
# an asm file into it. If you drop an ASM file and there were errors while
# assembling, this script will keep the DOS window open so you can see them.
#
zmac --zmac --oo hex,bds,lst $1

if [ $? -ne 0 ]; then
    echo "------------------------------------------------------"
    echo "Errors processing $1"
    echo "------------------------------------------------------"
    exit 1
fi

cp zout/${1%%.asm}.hex .
