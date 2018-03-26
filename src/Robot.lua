local TURN = {
  NORTH = { LEFT = "WEST", RIGHT = "EAST" },
  EAST = { LEFT = "NORTH", RIGHT = "SOUTH" },
  SOUTH = { LEFT = "EAST", RIGHT = "WEST" },
  WEST = { LEFT = "SOUTH", RIGHT = "NORTH" },
}

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

function Robot:left()
  self.facing = TURN[self.facing]["LEFT"]
end

function Robot:right()
  self.facing = TURN[self.facing]["RIGHT"]
end

return Robot
