# Adjust to your needs. lua5.1 is ABI-Compatible with luajit.
CFLAGS ?= -O3 -fPIC -std=gnu99 -Wall -Wextra -Wpedantic -DLUAROCK_PACKAGE_VERSION=\"scm-1\"
LIBFLAG ?= -shared
LUA_LIBDIR ?= /usr/local/lib
LUA_INCDIR ?= /usr/include/lua5.1



.PHONY: clean all
.DEFAULT_GOAL := all

all: time.so

clean:
	rm -f time.o time.so

time.o: time.c
	$(CC) $(CFLAGS) -I$(LUA_INCDIR) -c $< -o $@

time.so: time.o
	$(CC) $(LIBFLAG) -o $@ -L$(LUA_LIBDIR) $<
	strip $@

