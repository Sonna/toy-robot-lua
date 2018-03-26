-- local iobase = { output = io.output, stdout = io.stdout }
-- local copy = {
--   write = function(self, ...) iobase[self.mode]:write("write ", ...) end,
-- }
-- copy.__index = copy

-- io.stdout = setmetatable({mode = "stdout"}, copy)
-- io.output = function(o) iobase.output(o) return io.stdout end
-- io.stdout:write("test 1\n") -- works
-- io.output():write("test 2\n") -- works
-- io.write("test 3\n") -- doesn't work
-- print("test 4") -- doesn't work


-- Rewrite

captured_output1 = ""
captured_output2 = ""
captured_output3 = ""
captured_output4 = ""

local iobase = { output = io.output, stdout = io.stdout }
local copy = {
  -- write = function(self, ...) iobase[self.mode]:write("write ", ...) end,
  write = function(self, ...) return(...) end,
}
copy.__index = copy

io.stdout = setmetatable({mode = "stdout"}, copy)
io.output = function(o) iobase.output(o) return io.stdout end


old_print = print
new_print = function(...) return(...) end
print = new_print

captured_output1 = io.stdout:write("test 1", "test 1") -- works
print = old_print
print("captured_output1:", captured_output1) -- works
print = new_print

captured_output2 = io.output():write("test 2", "test 2") -- works
print = old_print
print("captured_output2:", captured_output2) -- works
print = new_print

captured_output3 = io.write("test 3\n", "test 3\n") -- doesn't work
print = old_print
print("captured_output3:", io.output(captured_output3)) -- works
print = new_print

captured_output4 = print("test 4", "test 4") -- works
print = old_print
print("captured_output4:", captured_output4) -- works
print = new_print

-- print(debug.getinfo(print, "nfSlu"))
-- print(debug.traceback(print))


old_print = print
print = function(...)
    local calling_script = debug.getinfo(2).short_src
    old_print('Print called by: '..calling_script)
    old_print(...)
end
print('a','b')
print('x','c');

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

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
-- print(debug.getinfo(print, "nfSlu"))
-- print(debug.traceback(print))
print("print:", dump(debug.getinfo(print)))
