
local function upvalues( func )
	local i = 0;
	if not func then
		return function() end
	else
		return function()
			i = i + 1
			local name, val = debug.getupvalue (func, i)
			if name then
				return i,name,val
			end
		end
	end
end

local function GetUpValues( func )

	local data = {}

	for _,name,val in upvalues( func ) do
		data[name] = val;
	end

	return data

end

local function SetUpValues( func, source )

	for i,name,val in upvalues( func ) do
		if source[name] then
			if val == nil then
				assert( val == nil )
				debug.setupvalue( func, i, source[name] )
			else
			end
			source[name] = nil
		end
	end

end

local upValues = GetUpValues(MarineCommander.GetButtonTable)
upValues.gMarineMenuButtons[kTechId.AdvancedMenu][5] = kTechId.None
SetUpValues(MarineCommander.GetButtonTable, upValues)