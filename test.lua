lu = require('luaunit')

require('test/simple_class_test')
require('test/TestRobot')
require('test/TestToyRobot')

os.exit( lu.LuaUnit.run() )
