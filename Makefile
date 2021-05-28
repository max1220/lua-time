# Adjust to your needs. lua5.1 is ABI-Compatible with luajit.
CFLAGS= -Os -Wall -Wextra -fPIC -I/usr/include/lua5.1 -shared
LIBS= -llua5.1
STRIP ?= strip

.PHONY: clean all
.DEFAULT_GOAL := all

all: time.so

clean:
	rm -f time.so

time.so: time.c
	$(CC) -o $@ $(CFLAGS) $(LIBS) $<
	$(STRIP) $@
