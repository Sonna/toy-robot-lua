require "lunit"

local test_helpers = require("test/test_helpers")
local capture_output = test_helpers.capture_output
-- require("test/test_helpers")
local Rectangle = require("src/simple_class")

module("simple_class_testcase", lunit.testcase)

-- simple_class_tests = {}
    -- function simple_class_tests:test_constructor()
    function test_constructor()
      local r = Rectangle:new(nil, 10, 20)
      assert(r, "`r' was not initialized")
    end

    -- function simple_class_tests:test_length()
    function test_length()
      local r = Rectangle:new(nil, 10, 20)
      assert_equal(10, r.length, "`r.length' was not initialized")
    end

    -- function simple_class_tests:test_breadth()
    function test_breadth()
      local r = Rectangle:new(nil, 10, 20)
      assert_equal(20, r.breadth, "`r.breadth' was not initialized")
    end

    -- function simple_class_tests:test_printArea()
    function test_printArea() -- Fails
      local r = Rectangle:new(nil, 10, 20)
      -- local result = TestHelpers:capture_output(function() return r:printArea() end)
      local result = capture_output(function() return r:printArea() end)
      r:printArea()
      assert_equal(200, result, "`r.printArea' was not captured")
    end
-- end simple_class_tests

-- return simple_class_tests
lunit.main(...)
