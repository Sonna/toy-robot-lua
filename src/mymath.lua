-- == Sourced:
-- - [Programming in Lua : 15\.1]
--   (https://www.lua.org/pil/15.1.html)
--
-- - [Lua Modules]
--   (https://www.tutorialspoint.com/lua/lua_modules.htm)
--
-- Package local library example
--
local mymath =  {}

function mymath.add(a,b)
   print(a+b)
end

function mymath.sub(a,b)
   print(a-b)
end

function mymath.mul(a,b)
   print(a*b)
end

function mymath.div(a,b)
   print(a/b)
end

return mymath
