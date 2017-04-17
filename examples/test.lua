#!/usr/bin/env lua5.1
package.cpath = package.cpath .. ";../?.so"
local time = require("time")

print("Sleeping for 1s in 10 segments")
for i=1, 10 do
	time.sleep(0.1)
	io.write(".")
	io.flush()
end
io.write("\n")

print("Sleeping 2s in 1 segments")
time.sleep(2)

print("Printing time 100ms. ^C to abort.")
while true do
	local start = time.realtime()
	time.sleep(0.1)
	local stop = time.realtime()
	local ms = (stop - start) * 1000
	print(("Start: %fs\tStop: %fs\telapsed: %fms"):format(start, stop, ms))
end
