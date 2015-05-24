----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 15 Mar 2014
-- Resource: GTItrucker/trucker.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local validVehicles = {
	[403] = true, -- Linerunner
	[514] = true, -- Tanker
	[515] = true, -- Roadtrain
}

-- Is Trucker?
--------------->>

function isTrucker(player)
	if (not isElement(player) or getElementType(player) ~= "player") then return false end
	if (exports.GTIjobs:getPlayerJob() ~= "Pilot") then return false end
	if (not isPedInVehicle(player)) then return false end
	local vehicle = getPedOccupiedVehicle(player)
	if (not validVehicles[getElementModel(vehicle)]) then return false end
	return true
end

-- Begin Trucker
----------------->>

function startMission(player, seat)
	if (not isTrucker(player) or seat ~= 0) then return end
	
end
