#!/bin/bash

#re2c toml-re2c.re2c >toml-re2c.c
CC=gcc
mkdir -p dbg
$CC -std=c99 -g -O0 toml.c toml-re2c.c toml-lemon.c main.c -o dbg/toml
