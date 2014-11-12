#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

CC=gcc
mkdir -p dbg
$CC -std=c99 -g -O0 toml.c toml-re2c.c toml-lemon.c main.c -o dbg/toml
