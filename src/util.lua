local util =  {}

--- splits 'rawString' into pieces matching 'pattern', returns them as an array
function util.split(rawString, pattern)
  local resultTable={}
  rawString:gsub(pattern, function(x) resultTable[#resultTable + 1] = x end)
  return resultTable
end

return util
