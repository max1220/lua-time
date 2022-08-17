# Usage

To load the module, use `time = require("lua-time")`.

You can also load the C module directly, with reduced functionality.
(`time = require("time")`). Only gettime, sleep and constants are available.



# time.gettime(clock)

Return current time, in seconds, from the specifed `clock`.
`clock` is a clock constant, see below.



# time.sleep(secs)

Sleep for specified amount of seconds.



# time.realtime()

Return the time in seconds since an epoch("wall clock").

Intended use is for timestamps,
**not measuring time deltas(measuring execution time etc.)!**

(Shortcut for time.gettime(time.CLOCK_REALTIME))



# time.monotonic()

Return the time in seconds since some arbitrary point in time.

Intended use is for measuring time deltas,
**not for keeping timestamps!**

(Shortcut for time.gettime(time.CLOCK_MONOTONIC))



# time.delta(f, ...)

Measure time delta for running function `f` with arguments `...`.

This is often useful for measuring the execution time of a function,
as a primitive benchmark, or for interactive applications.

Returns the meassured time delta, followed by the return value of `f(...)`.
