# Adjust to your needs. lua5.1 is ABI-Compatible with luajit.
CFLAGS= -O3 -Wall -Wextra -fPIC -I/usr/include/lua5.1 -shared
LIBS= -llua5.1

.PHONY: clean all
.DEFAULT_GOAL := all

all: time.so

clean:
	rm time.so

time.so: time.c
	$(CC) -o $@ $(CFLAGS) $(LIBS) $<
	strip $@
