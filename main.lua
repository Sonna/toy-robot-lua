mymathmodule = require("src/mymath") -- require local package
mymathmodule.add(10,20)
mymathmodule.sub(30,20)
mymathmodule.mul(10,20)
mymathmodule.div(30,20)

Rectangle = require("src/simple_class") -- require local packaged class

r = Rectangle:new(nil,10,20)
print("Rectangle length", r.length)
r:printArea()

repeat
  line = io.read("*line") -- os.read()
  print(line)
until line == "EXIT" or line == nil

-- while true do
--   local line = io.read("*line")
--   if line == nil then break end
--   print(line)
-- end
