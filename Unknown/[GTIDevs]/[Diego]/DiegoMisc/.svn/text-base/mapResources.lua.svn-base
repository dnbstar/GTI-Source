----------------------------------------------->>
-- What		: mapResources.lua
-- Type		: Server
-- For		: Grand Theft International
-- Author	: Diego aka diegonese
-- All rights reserved to GTI 2014/2015 (C)
----------------------------------------------->>
local accessibleAccs = {
["Smoke"]  = true,
["EnemyCRO"] = true
}
--[[
function startResourceMap(thePlayer, cmd, resourceName)
	if (resourceName) then
		local resource = getResourceFromName(resourceName)
		local accountName = getAccountName(getPlayerAccount(thePlayer))
		
		if accessibleAccs[accountName] then
		if string.find(resourceName, "map") or string.find(resourceName, "Map") or string.find(resourceName, "mAp") then 
		
			if getResourceState(resource) == "running" then
				outputChatBox(""..resourceName.." is already running.", thePlayer, 255, 0, 0) return
			end
		
		local start = startResource(resource)
			if (start) then
				outputChatBox("Resource '"..resourceName.."' has been started successfully", thePlayer, 0, 255, 0)
			else 
				outputChatBox("Error - Couldn't start resource "..resourceName..".", thePlayer, 255, 0, 0)
			end
		
		else
			outputChatBox("Error - Access denied. [Not a map resource]", thePlayer, 255, 0, 0)
		end
	else
		outputChatBox("Error - Access denied. [Not a mapper]", thePlayer, 255, 0, 0)
	end
else
	outputChatBox("Error - Specify a resource name to start.", thePlayer, 255, 0, 0)
	end
end
addCommandHandler ("map-start", startResourceMap)
		
function stopTheResource (thePlayer, command, resourceName)
	if (resourceName) then
		local resource = getResourceFromName(resourceName)
		local accountName = getAccountName(getPlayerAccount(thePlayer))
		
		if accessibleAccs[accountName] then
		
		if string.find(resourceName, "map") or string.find(resourceName, "Map") or string.find(resourceName, "mAp") then 
		
		if not getResourceState(resource) == "running" then
			outputChatBox("Error - Resource "..resourceName.." isn't running.", thePlayer, 255, 0, 0) return
		end
		
		local stop = stopResource(resource)
			if (stop) then
				outputChatBox(""..resourceName.." has been stopped successfully", thePlayer, 0, 255, 0)
			else 
				outputChatBox("Error - Couldn't stop resource "..resourceName..".", thePlayer, 255, 0, 0)
			end		
		else
			outputChatBox("Error - Access denied [Not a map resource]", thePlayer, 255, 0, 0)
		end
	else
		outputChatBox("Error - Access denied [Not a mapper]", thePlayer, 255, 0, 0)
	end
else
	outputChatBox("Error - Specify a resource name to stop.", thePlayer, 255, 0, 0)
	end
end
addCommandHandler ("map-stop", stopTheResource)	

function restartTheResource (thePlayer, command, resourceName)
	if (resourceName) then
		local resource = getResourceFromName(resourceName)
		local accountName = getAccountName(getPlayerAccount(thePlayer))
		
		if accessibleAccs[accountName] then
		
		if string.find(resourceName, "map") or string.find(resourceName, "Map") or string.find(resourceName, "mAp") then 
		
		if not getResourceState(resource) == "running" then
			outputChatBox("Error - Resource "..resourceName.." isn't running.", thePlayer, 255, 0, 0) return
		end
		
		local restart = restartResource(resource)
			if (restart) then
				outputChatBox(""..resourceName.." has been restarted successfully", thePlayer, 0, 255, 0)
			else 
				outputChatBox("Error - Couldn't restart resource "..resourceName..".", thePlayer, 255, 0, 0)
			end		
		else
			outputChatBox("Error - Access denied [Not a map resource]", thePlayer, 255, 0, 0)
		end
	else
		outputChatBox("Error - Access denied [Not a mapper]", thePlayer, 255, 0, 0)
	end
else
	outputChatBox("Error - Specify a resource name to start.", thePlayer, 255, 0, 0)
	end
end
addCommandHandler ("map-restart", restartTheResource)	
--]]
function setDimensionOrInterior(thePlayer, cmd, id)
	local theID = tonumber(id)
	local accountName = getAccountName(getPlayerAccount(thePlayer))
	--	outputChatBox(""..theID.."", getPlayerFromName("Diego"))
	local oldInt = getElementInterior(thePlayer)
	local oldDim = getElementDimension(thePlayer)
	if accessibleAccs[accountName]	then
	
	if oldDim == 0 or oldInt == 0 then
	
	if cmd == "setint" then
		if setElementInterior(thePlayer, theID) then
		exports.GTIlogs:outputWeblog("Mapper "..getPlayerName(thePlayer).." moved from interior "..oldInt.." to "..id.."" )
		outputChatBox("You have been moved to interior #"..theID..".", thePlayer, 0, 255, 0)
	end
	elseif cmd == "setdim" then
		if setElementDimension(thePlayer, theID) then
		exports.GTIlogs:outputWeblog("Mapper "..getPlayerName(thePlayer).." moved from dimension "..oldDim.." to "..id.."" )
		outputChatBox("You have been moved to dimension #"..theID..".", thePlayer, 0, 255, 0)
		end
				end
			end
		end
	end
addCommandHandler("setint", setDimensionOrInterior)
addCommandHandler("setdim", setDimensionOrInterior)



