lu = require('luaunit')

local test_helpers = require("test/test_helpers")
local capture_output = test_helpers.capture_output
local Robot = require("src/Robot")

TestRobot = {}
    function TestRobot:testConstructorDefaults()
      local subject = Robot:new()
      lu.assertNotNil(subject, "`subject' was not initialized")
    end

    function TestRobot:testConstructorWithArguments()
      local subject = Robot:new(nil, 1, 2, "EAST")
      lu.assertNotNil(subject, "`subject' was not initialized")

      lu.assertEquals(subject.x, 1)
      lu.assertEquals(subject.y, 2)
      lu.assertEquals(subject.facing, "EAST")
    end

    function TestRobot:testX()
      local subject = Robot:new()
      lu.assertEquals(subject.x, 0, "`subject.x' was not initialized")
    end

    function TestRobot:testY()
      local subject = Robot:new()
      lu.assertEquals(subject.y, 0, "`subject.y' was not initialized")
    end

    function TestRobot:testFacing()
      local subject = Robot:new()
      lu.assertEquals(subject.facing, "NORTH",
        "`subject.facing' was not initialized")
    end

    function TestRobot:testReport()
      local subject = Robot:new()
      local result = capture_output(function() return subject:report() end)

      lu.assertEquals(result, "0,0,NORTH", "`subject.report' was not captured")
    end

    function TestRobot:testLeft()
      local subject = Robot:new()
      subject:left()
      lu.assertEquals(subject.facing, "WEST",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end

    function TestRobot:testLeftFromWEST()
      local subject = Robot:new(nil, 0, 0, "WEST")
      subject:left()
      lu.assertEquals(subject.facing, "SOUTH",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end

    function TestRobot:testLeftFromSOUTH()
      local subject = Robot:new(nil, 0, 0, "SOUTH")
      subject:left()
      lu.assertEquals(subject.facing, "EAST",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end

    function TestRobot:testLeftFromEAST()
      local subject = Robot:new(nil, 0, 0, "EAST")
      subject:left()
      lu.assertEquals(subject.facing, "NORTH",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end

    function TestRobot:testRight()
      local subject = Robot:new()
      subject:right()
      lu.assertEquals(subject.facing, "EAST",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end

    function TestRobot:testRightFromEAST()
      local subject = Robot:new(nil, 0, 0, "EAST")
      subject:right()
      lu.assertEquals(subject.facing, "SOUTH",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end

    function TestRobot:testRightFromSOUTH()
      local subject = Robot:new(nil, 0, 0, "SOUTH")
      subject:right()
      lu.assertEquals(subject.facing, "WEST",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end

    function TestRobot:testRightFromWEST()
      local subject = Robot:new(nil, 0, 0, "WEST")
      subject:right()
      lu.assertEquals(subject.facing, "NORTH",
        "`subject.faicng' was not updated")
      lu.assertEquals(subject.x, 0)
      lu.assertEquals(subject.y, 0)
    end
-- end TestRobot
