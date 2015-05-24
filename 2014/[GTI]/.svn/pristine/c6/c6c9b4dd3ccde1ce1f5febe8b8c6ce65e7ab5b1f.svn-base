----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 28 Jan 2014
-- Resource: GTIpoliceArrest/arrest.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

addEvent("onClientPlayerArrested", true)
addEvent("onClientPlayerReleased", true)

local policeMarkers = {}	-- Table of Markers
local policeBlip			-- Police Blip

-- Take Player to Jail
----------------------->>

function takePlayerToJail(criminal, x, y, z, all)
	for i,v in ipairs(all) do
		policeMarkers[i] = createMarker(v[1], v[2], v[3], "cylinder", 4, 30, 155, 255, 175)
		addEventHandler("onClientMarkerHit", policeMarkers[i], jailPlayer)
	end
	policeBlip = createBlip(x, y, z, 30)
end
addEvent("GTIpoliceArrest.takePlayerToJail", true)
addEventHandler("GTIpoliceArrest.takePlayerToJail", root, takePlayerToJail)

function jailPlayer(player, dim)
	if (player ~= localPlayer or not dim) then return end
	for i,marker in ipairs(policeMarkers) do
		removeEventHandler("onClientMarkerHit", marker, jailPlayer)
		destroyElement(marker)
	end
	policeMarkers = {}
	destroyElement(policeBlip)
	policeBlip = nil
	
	triggerServerEvent("GTIpoliceArrest.throwAllPlayersInJail", resourceRoot)
end
