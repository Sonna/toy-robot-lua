lu = require('luaunit')

local test_helpers = require("test/test_helpers")
local capture_output = test_helpers.capture_output
local ToyRobot = require("src/ToyRobot")

TestToyRobot = {}
    function TestToyRobot:testProcessWithEXIT()
      local subject = "EXIT\n"
      local tmpfile = io.tmpfile() -- open temporary file
      tmpfile:write("EXIT\n") -- write to it
      tmpfile:seek("set", 0) -- back to start

      local result = capture_output(function() return
          ToyRobot.process(tmpfile)
        end)

      lu.assertEquals(result, "")
      tmpfile:close()  -- close tmp file
    end

    function TestToyRobot:testProcessWithREPORT()
      local subject = "REPORT\nEXIT\n"
      local tmpfile = io.tmpfile() -- open temporary file
      tmpfile:write(subject) -- write to it
      tmpfile:seek("set", 0) -- back to start

      local result = capture_output(function()
          return ToyRobot.process(tmpfile)
        end)

      lu.assertEquals(result, "0,0,NORTH")
      tmpfile:close()  -- close tmp file
    end

    function TestToyRobot:testProcessWithComplexInstructions()
      local subject = "MOVE\nLEFT\nREPORT\nRIGHT\nMOVE\nRIGHT\nMOVE\n" ..
        "REPORT\nPLACE 3,3,SOUTH\nREPORT\nEXIT\n"
      local tmpfile = io.tmpfile() -- open temporary file
      tmpfile:write(subject) -- write to it
      tmpfile:seek("set", 0) -- back to start

      local result = capture_output(function()
          return ToyRobot.process(tmpfile)
        end)

      lu.assertEquals(result, "0,1,WEST\n1,2,EAST\n3,3,SOUTH")
      tmpfile:close()  -- close tmp file
    end

    function TestToyRobot:testMainWithExampleA()
      local subject = "examples/example_a.txt"
      local result = capture_output(function()
          return ToyRobot.main(subject)
        end)

      lu.assertEquals(result, "0,0,NORTH")
    end

    function TestToyRobot:testMainWithExampleB()
      local subject = "examples/example_b.txt"
      local result = capture_output(function()
          return ToyRobot.main(subject)
        end)

      lu.assertEquals(result, "0,0,WEST")
    end

    function TestToyRobot:testMainWithExampleC()
      local subject = "examples/example_c.txt"
      local result = capture_output(function()
          return ToyRobot.main(subject)
        end)

      lu.assertEquals(result, "3,3,NORTH")
    end
-- end TestRobot
