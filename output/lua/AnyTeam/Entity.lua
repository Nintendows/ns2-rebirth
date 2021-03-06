
function EntityListToTable(entityList)

    PROFILE("EntityListToTable")
    	
    assert(entityList ~= nil)
	
	local result = {}	
	
	for _, ent in ientitylist( entityList ) do
        if ent ~= nil then
            result[#result+1] = ent
        end
	end
	
    return result
    
end

function GetEntitiesForTeamTypeWithinXZRange(className, teamType, origin, range)
    
    assert(type(className) == "string")
    assert(type(teamType) == "number")
    assert(origin ~= nil)
    assert(type(range) == "number")
    
    local function inRangeXZFilterFunction(entity)
    
        local inRange = (entity:GetOrigin() - origin):GetLengthSquaredXZ() <= (range * range)
        return inRange and HasMixin(entity, "Team") and entity:GetTeamType() == teamType
        
    end
    return GetEntitiesWithFilter(Shared.GetEntitiesWithClassname(className), inRangeXZFilterFunction)
    
end