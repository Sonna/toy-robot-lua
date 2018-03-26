local test_helpers = {}
-- TestHelpers = {}

-- == Usage example:
--
--     local x = test_helpers.capture_output(function() return print('abc') end)
--     print(x)
--
-- == Caveats:
-- Requires that the function returns the `print()` function and concatinates
-- the string in the print function using `..` or `table.concat({})`; e.g.
--
--     function Rectangle:printArea()
--       return print("The area of Rectangle is " .. self.area)
--     end
--
function test_helpers.capture_output(block)
-- function TestHelpers:capture_output(block)
  local old_print = print
  local new_print = function(...) return(...) end
  print = new_print

  local result = block()

  print = old_print
  return result
end

return test_helpers
-- return TestHelpers
