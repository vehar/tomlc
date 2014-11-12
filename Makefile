
CC = gcc

.PHONY:	all
all:	rel/toml dbg/toml

rel:
	mkdir -p rel

dbg:
	mkdir -p dbg

rel/toml: rel toml.c toml-re2c.c toml-lemon.c main.c
	$(CC) -std=c99 -g -O2 toml.c toml-re2c.c toml-lemon.c main.c -o rel/toml

dbg/toml: dbg toml.c toml-re2c.c toml-lemon.c main.c
	$(CC) -std=c99 -g -O0 toml.c toml-re2c.c toml-lemon.c main.c -o dbg/toml
