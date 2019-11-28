#!/bin/sh

SYSROOT="${1}"
# Make sure we have enough version components
HDR_VER="${2}.0.0"

HDR_M="${HDR_VER%%.*}"
HDR_V="${HDR_VER#*.}"
HDR_m="${HDR_V%%.*}"
