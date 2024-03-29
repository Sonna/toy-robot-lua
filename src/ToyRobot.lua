local Robot = require("src/Robot")
local util = require("src/util")

local ToyRobot = {}

function ToyRobot.process(file)
  if file ~= nil then
    io.input(file) -- sets the default input file as test.lua
  end

  local output = {}
  local result = ""

  local robot = Robot:new()
  local rawCommand = ""
  local rawArgs = ""

  while true do
    line = io.read("*line")
    if line == "EXIT" or line == nil then break end

    local values = util.split(line, "[^ ]*")
    rawCommand = values[1]

    if values[3] ~= nil then
      rawArgs = values[3]
    elseif values[2] ~= nil then
      rawArgs = values[2]
    else
      rawArgs = ""
    end

    result = robot:exec(rawCommand, rawArgs)
    if result ~= nil then table.insert(output, result) end
  end

  if file ~= nil then
    return table.concat(output, "\n")
  end
end

function ToyRobot.main(argv)
  if argv ~= nil then
    local output = ""
    local filename = argv
    local file = io.open(filename, "r") -- Opens a file in read

    output = ToyRobot.process(file)

    io.close(file)
    return output
  else
    ToyRobot.process(nil)
  end
end

return ToyRobot
