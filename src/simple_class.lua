-- == Sourced:
-- - [Lua Object Oriented]
--   (https://www.tutorialspoint.com/lua/lua_object_oriented.htm)
--
-- local simple_class =  {}

-- Meta class
Rectangle = {area = 0, length = 0, breadth = 0}

-- Derived class method new

function Rectangle:new(o, length, breadth)
   o = o or {} -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self
   self.length = length or 0
   self.breadth = breadth or 0
   self.area = length * breadth;
   return o
end

-- Derived class method printArea

function Rectangle:printArea()
  return print("The area of Rectangle is " .. self.area)
end

return Rectangle
