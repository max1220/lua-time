#!/usr/bin/env lua5.1
local time = require("lua-time")

print("Current time in seconds: "..time.realtime())

print("Sleeping 5s...")
time.sleep(5)

print("Sleeping for 5s in 10 segments...")
for i=1, 5 do
	io.write(tostring(i))
	io.flush()
	time.sleep(1)
end
io.write("\n")

print("Printing every 1s. Press ^C to abort.")
while true do
	local dt, ret = time.delta(time.sleep, 1)
	assert(ret==true)
	print(("ms: %.2f"):format(dt*1000))
end
