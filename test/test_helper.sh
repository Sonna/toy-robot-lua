#!/usr/bin/env lua
local iobase = { output = io.output, stdout = io.stdout }
local copy = {
  write = function(self, ...) iobase[self.mode]:write("write ", ...) end,
}
copy.__index = copy

io.stdout = setmetatable({mode = "stdout"}, copy)
io.output = function(o) iobase.output(o) return io.stdout end
io.stdout:write("test 1\n") -- works
io.output():write("test 2\n") -- works
io.write("test 3\n") -- doesn't work
print("test 4") -- doesn't work




-- -- popen2()
-- function popen2(...)
--   local in_rd, in_wr = io.pipe()
--   local out_rd, out_wr = io.pipe()
--   local proc, err = os.spawn{stdin = in_rd, stdout = out_wr, ...}
--   in_rd:close(); out_wr:close()
--   if not proc then
--     in_wr:close(); out_rd:close()
--     return proc, err
--   end
--   return proc, out_rd, in_wr
-- end
-- -- usage:
-- local p, i, o = assert(popen2("wc", "-w"))
-- o:write("Hello world"); o:close()
-- print(i:read"*l"); i:close()
-- p:wait()
