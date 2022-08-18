#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>
#include <time.h>

#define LUA_T_PUSH_S_CF(S, CF) lua_pushstring(L, S); lua_pushcfunction(L, CF); lua_settable(L, -3);
#define LUA_T_PUSH_S_I(S, I) lua_pushstring(L, S); lua_pushinteger(L, I); lua_settable(L, -3);
#define LUA_T_PUSH_S_S(S, S2) lua_pushstring(L, S); lua_pushstring(L, S2); lua_settable(L, -3);

#define NS_IN_S 1000000000



// get time with sub-second accuracy
static int l_gettime(lua_State *L) {
	// optional first argument is clock to use(default to REALTIME)
	clockid_t clockid = CLOCK_REALTIME;
	if (lua_isnumber(L, 1)) {
		clockid = lua_tointeger(L, 1);
	}

	// get current time
	struct timespec t;
	if (clock_gettime(clockid, &t) == 0) {
		lua_pushnumber(L, (double)t.tv_sec + ((double)t.tv_nsec)/NS_IN_S);
		return 1;
	}

	return 0;
}

// sleep fo specified number of seconds
static int l_sleep(lua_State *L) {
	// first argument is time to sleep in seconds
	double dur = lua_tonumber(L, 1);
	if (dur<=0) {
		return 0;
	}

	struct timespec t = {
		.tv_sec = dur,
		.tv_nsec = (double) ((double)dur-(int)dur)*NS_IN_S
	};
	nanosleep(&t, NULL);

	lua_pushboolean(L,1);
	return 1;
}



LUALIB_API int luaopen_time(lua_State *L) {
	lua_newtable(L);

	// functions
	LUA_T_PUSH_S_CF("gettime", l_gettime)
	LUA_T_PUSH_S_CF("sleep", l_sleep)

	// constants
	LUA_T_PUSH_S_S("version", LUAROCK_PACKAGE_VERSION)
	LUA_T_PUSH_S_I("CLOCK_REALTIME", CLOCK_REALTIME)
	LUA_T_PUSH_S_I("CLOCK_REALTIME_ALARM", CLOCK_REALTIME_ALARM)
	LUA_T_PUSH_S_I("CLOCK_REALTIME_COARSE", CLOCK_REALTIME_COARSE)
	LUA_T_PUSH_S_I("CLOCK_TAI", CLOCK_TAI)
	LUA_T_PUSH_S_I("CLOCK_MONOTONIC", CLOCK_MONOTONIC)
	LUA_T_PUSH_S_I("CLOCK_MONOTONIC_COARSE", CLOCK_MONOTONIC_COARSE)
	LUA_T_PUSH_S_I("CLOCK_MONOTONIC_RAW", CLOCK_MONOTONIC_RAW)
	LUA_T_PUSH_S_I("CLOCK_BOOTTIME", CLOCK_BOOTTIME)
	LUA_T_PUSH_S_I("CLOCK_BOOTTIME_ALARM", CLOCK_BOOTTIME_ALARM)
	LUA_T_PUSH_S_I("CLOCK_PROCESS_CPUTIME_ID", CLOCK_PROCESS_CPUTIME_ID)
	LUA_T_PUSH_S_I("CLOCK_THREAD_CPUTIME_ID", CLOCK_THREAD_CPUTIME_ID)

	return 1;
}
