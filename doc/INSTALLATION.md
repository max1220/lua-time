# LuaRocks installation

This library is packaged and build using Luarocks, which makes building
and installing easy.

Currently this library is not published on a luarocks server,
so you need to clone this repository and build it yourself:

```
git clone https://github.com/max1220/lua-time
cd lua-time
# install locally, usually to ~/.luarocks
luarocks make --local
```

This will install the module locally, typically in ~/.luarocks.



## Adding to LuaRocks modules to package.path

When installing locally you need to tell Lua where to look for modules
installed using Luarocks, e.g.:

```
luarocks path >> ~/.bashrc
```

This will allow you to `require()` and locally installed LuaRocks package.





# Manual installation

You can also install this library manually, without using LuaRocks.

First, you need to compile the C module, simple go to the `src/` directory
and run `make`:
```
git clone https://github.com/max1220/lua-time
cd lua-time
# compile manually
cd src
make
# install manually
cp time.so /usr/local/lib/lua/5.1/
cp -r ../lua/lua-time /usr/local/share/lua/5.1
```
