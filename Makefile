# Adjust to your needs. lua5.1 is ABI-Compatible with luajit.
CFLAGS ?= -Os -Wall -Wextra -Wpedantic -fpic -I/usr/include/lua5.1
LIBFLAGS ?= -shared
STRIP ?= strip

.PHONY: clean all
.DEFAULT_GOAL := all

all: time.so

clean:
	rm -f time.so time.o

time.o: time.c
	$(CC) -c -o $@ $(CFLAGS) $<

time.so: time.o
	$(CC) -o $@ $(LIBFLAGS) $<
	$(STRIP) $@
