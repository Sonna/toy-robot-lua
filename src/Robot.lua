Robot = {x = 0, y = 0, facing = "NORTH"}

function Robot:new(o, x, y, facing)
   o = o or {} -- create object if user does not provide one
   setmetatable(o, self)
   self.__index = self
   self.x = x or 0
   self.y = y or 0
   self.facing = facing or "NORTH"
   return o
end

function Robot:report()
  return print(self.x .. ',' .. self.x .. ',' .. self.facing)
end

return Robot
