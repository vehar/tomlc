#!/bin/bash

#re2c toml-re2c.re2c >toml-re2c.c
CC=gcc
mkdir -p rel
$CC -std=c99 -g -O2 toml.c toml-re2c.c toml-lemon.c main.c -o rel/toml
