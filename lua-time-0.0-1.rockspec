package = "lua-time"
version = "0.0-1"
source = {
	url = "git://github.com/max1220/lua-time",
	tag = "0.0-1"
}
description = {
	summary = "Simple binding for clock_gettime() and nanosleep()",
	detailed = [[
		This libraray is a simple binding to clock_gettime() and nanosleep().
		Allows getting time and sleeping with sub-second accuracy.
	]],
	homepage = "http://github.com/max1220/lua-time",
	license = "MIT"
}
dependencies = {
	"lua >= 5.1"
}
build = {
	type = "builtin",
	modules = {
		time = {
			sources = {"src/lua-time.c"},
			defines = {
				"LUAROCK_PACKAGE_VERSION=\""..version.."\"",
				"LUAROCK_PACKAGE_NAME=\""..package.."\""
			}
		}
	}
}
