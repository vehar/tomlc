
CC = gcc

.PHONY:	all
all:	rel/toml dbg/toml

rel:
	mkdir -p rel

dbg:
	mkdir -p dbg

toml-lemon.c: toml-lemon.lemon
	lemon toml-lemon.lemon

toml-re2c.c: toml-re2c.re2c
	re2c --no-generation-date toml-re2c.re2c >toml-re2c.c

rel/toml: rel toml.c toml-re2c.c toml-lemon.c main.c
	$(CC) -std=c99 -g -O2 toml.c toml-re2c.c toml-lemon.c main.c -o rel/toml

dbg/toml: dbg toml.c toml-re2c.c toml-lemon.c main.c
	$(CC) -std=c99 -g -O0 toml.c toml-re2c.c toml-lemon.c main.c -o dbg/toml
