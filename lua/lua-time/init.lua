-- load the C module
local time = require("time")

-- this is the table returned with require("lua-time")
local lua_time = {}

-- C functions
lua_time.gettime = time.gettime
lua_time.sleep = time.sleep

-- C constants
lua_time.version = time.version
lua_time.CLOCK_REALTIME = time.CLOCK_REALTIME
lua_time.CLOCK_REALTIME_ALARM = time.CLOCK_REALTIME_ALARM
lua_time.CLOCK_REALTIME_COARSE = time.CLOCK_REALTIME_COARSE
lua_time.CLOCK_TAI = time.CLOCK_TAI
lua_time.CLOCK_MONOTONIC = time.CLOCK_MONOTONIC
lua_time.CLOCK_MONOTONIC_COARSE = time.CLOCK_MONOTONIC_COARSE
lua_time.CLOCK_MONOTONIC_RAW = time.CLOCK_MONOTONIC_RAW
lua_time.CLOCK_BOOTTIME = time.CLOCK_BOOTTIME
lua_time.CLOCK_BOOTTIME_ALARM = time.CLOCK_BOOTTIME_ALARM
lua_time.CLOCK_PROCESS_CPUTIME_ID = time.CLOCK_PROCESS_CPUTIME_ID
lua_time.CLOCK_THREAD_CPUTIME_ID = time.CLOCK_THREAD_CPUTIME_ID


-- get time from CLOCK_REALTIME
function lua_time.realtime()
	return time.gettime(time.CLOCK_REALTIME)
end

-- get time from CLOCK_MONOTONIC
function lua_time.monotonic()
	return time.gettime(time.CLOCK_MONOTONIC)
end

-- pack arguments in table(including argument count)
local function pack(...)
	local t = {...}
	t.n = select("#", ...)
	return t
end

-- get execution time of running function f(...)
function lua_time.delta(f, ...)
	local start = time.gettime(time.CLOCK_MONOTONIC)
	local ret = pack(f(...))
	local stop = time.gettime(time.CLOCK_MONOTONIC)
	local delta = stop-start
	return delta, unpack(ret, 1, ret.n)
end



-- return complete module to user
return lua_time
