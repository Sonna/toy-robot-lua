lu = require('luaunit')

require('test/TestRobot')
require('test/TestToyRobot')

os.exit( lu.LuaUnit.run() )
