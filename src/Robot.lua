local TURN = {
  NORTH = { LEFT = "WEST", RIGHT = "EAST" },
  EAST = { LEFT = "NORTH", RIGHT = "SOUTH" },
  SOUTH = { LEFT = "EAST", RIGHT = "WEST" },
  WEST = { LEFT = "SOUTH", RIGHT = "NORTH" },
}

local MOVE = {
  NORTH = { x = 0, y = 1 },
  SOUTH = { x = 0, y = -1 },
  EAST = { x = 1, y = 0 },
  WEST = { x = -1, y = 0 },
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

function Robot:move()
  self.x = self.x + MOVE[self.facing].x
  self.y = self.y + MOVE[self.facing].y

  if self.x < 0 or self.x > 4 then
    self.x = self.x - MOVE[self.facing].x
  end

  if self.y < 0 or self.y > 4 then
    self.y = self.y - MOVE[self.facing].y
  end
end

return Robot
