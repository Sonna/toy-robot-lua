lu = require('luaunit')

local test_helpers = require("test/test_helpers")
local capture_output = test_helpers.capture_output
local Rectangle = require("src/simple_class")

TestSimpleClass = {}
    function TestSimpleClass:test_constructor()
      local r = Rectangle:new(nil, 10, 20)
      lu.assertNotNil(r, "`r' was not initialized")
    end

    function TestSimpleClass:test_length()
      local r = Rectangle:new(nil, 10, 20)
      lu.assertEquals(r.length, 10, "`r.length' was not initialized")
    end

    function TestSimpleClass:test_breadth()
      local r = Rectangle:new(nil, 10, 20)
      lu.assertEquals(r.breadth, 20, "`r.breadth' was not initialized")
    end

    function TestSimpleClass:test_area()
      local r = Rectangle:new(nil, 10, 20)
      lu.assertEquals(r.area, 200, "`r.area' was not calculated")
    end

    function TestSimpleClass:test_printArea()
      local r = Rectangle:new(nil, 10, 20)
      local result = capture_output(function() return r:printArea() end)

      lu.assertEquals(result, "The area of Rectangle is 200", "`r.printArea' was not captured")
    end
-- end TestSimpleClass
