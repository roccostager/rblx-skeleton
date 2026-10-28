local TableUtils = {}


-- Returns a deep copy of a table
-- Does not consider metatables or circular tables
function TableUtils.simpleDeepCopy(original)
	if type(original) ~= "table" then
		return original
	end

	local copy = {}
	for key, value in original do
		copy[TableUtils.simpleDeepCopy(key)] = TableUtils.simpleDeepCopy(value)
	end

	return copy
end


return TableUtils