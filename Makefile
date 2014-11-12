
CC = gcc

.PHONY:	all
all:	rel/toml dbg/toml

rel:
	mkdir -p rel

dbg:
	mkdir -p dbg

src/toml-lemon.c: src/toml-lemon.lemon
	lemon $<

src/toml-re2c.c: src/toml-re2c.re2c
	re2c --no-generation-date $< >$@

toml-all.c: src/toml-lemon.h src/toml-parser.h src/toml-re2c.c src/toml-lemon.c src/toml.c
	cat $^ >$@

rel/toml: rel toml-all.c main.c
	$(CC) -std=c99 -g -O2 toml-all.c main.c -o $@

dbg/toml: dbg toml-all.c main.c
	$(CC) -std=c99 -g -O0 toml-all.c main.c -o $@

dbg/toml-test: dbg toml-all.c test.c tap/tap.c
	$(CC) -std=c99 -g -O0 -Itap toml-all.c test.c tap/tap.c -o $@

test: dbg/toml-test
	./dbg/toml-test

.PHONY: clean
clean:
	rm -rf dbg
	rm -rf rel
	rm toml-all.c
