# lua-time

Simple binding for clock_gettime() and nanosleep().

Allows getting time and sleeping with sub-second accuracy.





# Installation

See [doc/INSTALLATION.md](doc/INSTALLATION.md)

This library is packaged and build using Luarocks, which makes building
and installing easy.

```
git clone https://github.com/max1220/lua-time
cd lua-time
# install locally, usually to ~/.luarocks
luarocks make --local
```

When installing locally you need to tell Lua where to look for modules
installed using Luarocks, e.g.:

```
luarocks path >> ~/.bashrc
```

You can also install the library manually, see documentation.





# Usage

There is detailed usage information in the documentation([doc/USAGE.md](doc/USAGE.md)).

There is also a simple example, in [doc/examples/test.lua](doc/examples/test.lua)

```
time = require("lua-time") -- load module
time.gettime(clock) -- get current time from CLOCK
time.sleep(secs) -- sleep for specified amount of seconds
secs = time.realtime() -- shortcut for time.gettime(time.CLOCK_REALTIME)
secs = time.monotonic() -- shortcut for time.gettime(time.CLOCK_MONOTONIC)
secs, ... = time.delta(f, ...) -- measure time delta for running function f with args ...
```

