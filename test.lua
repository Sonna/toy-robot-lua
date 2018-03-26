lu = require('luaunit')

require('test/simple_class_test')
require('test/TestRobot')

os.exit( lu.LuaUnit.run() )
