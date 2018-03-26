-- Install Lua package mamanger LuaRocks:
--
-- ```console
--     $ wget https://luarocks.org/releases/luarocks-2.4.4.tar.gz
--     $ tar zxpf luarocks-2.4.4.tar.gz
--     $ cd luarocks-2.4.4
--     $ ./configure; sudo make bootstrap
-- ```
--
-- Install `lunit`
--
-- ```console
--     $ sudo luarocks install lunit
-- ```
--
-- Run script
--
-- ```console
--     $ lunit my_testcase.lua
--
--     Loaded testsuite with 2 tests in 1 testcases.
--
--         F.
--
--     2 Assertions checked.
--
--       1) Failure (my_testcase.test_failure):
--     my_testcase.lua:10: failure
--     my_testcase.lua:10: This test always fails!
--
--     Testsuite finished (1 passed, 1 failed, 0 errors).
-- ```
--
require "lunit"
simple_class_test = require("test/simple_class_test")

module( "my_testcase", lunit.testcase )


function test_success()
  assert_false( false, "This test never fails.")
end

-- function test_failure()
--   fail( "This test always fails!" )
-- end
