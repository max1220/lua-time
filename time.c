#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <time.h>


#define LUA_T_PUSH_S_CF(S, CF) lua_pushstring(L, S); lua_pushcfunction(L, CF); lua_settable(L, -3);
#define NS_IN_S 1000000000


static int l_monotonic(lua_State *L) {
	struct timespec t;
	if (clock_gettime(CLOCK_MONOTONIC, &t) == 0) {
		lua_pushnumber(L, (double)t.tv_sec + ((double)t.tv_nsec)/NS_IN_S);
	} else {
		lua_pushnil(L);
	}
	return 1;
}

static int l_realtime(lua_State *L) {
	struct timespec t;
	if (clock_gettime(CLOCK_REALTIME, &t) == 0) {
		lua_pushnumber(L, (double)t.tv_sec + ((double)t.tv_nsec)/NS_IN_S);
	} else {
		lua_pushnil(L);
	}
	return 1;
}

static int l_sleep(lua_State *L) {
	double dur = lua_tonumber(L, 1);
	struct timespec t = {
		.tv_sec = dur;
		.tv_nsec = (double) ((double)dur-(int)dur)*NS_IN_S;
	};
	nanosleep(&t, NULL);
	return 0;
}


LUALIB_API int luaopen_time(lua_State *L) {
	lua_newtable(L);
	LUA_T_PUSH_S_CF("monotonic", l_monotonic)
	LUA_T_PUSH_S_CF("realtime", l_realtime)
	LUA_T_PUSH_S_CF("sleep", l_sleep)
	return 1;
}
