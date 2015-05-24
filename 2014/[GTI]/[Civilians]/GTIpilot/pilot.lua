----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 21 Dec 2013
-- Resource: GTIpilot/pilot.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local validVehicles = {
	[593] = true,	-- Dodo
	[511] = true,	-- Beagle
}

local CONTINUE_TIMER = 2500
local METERS_IN_MILE = 1609.34

local oldArpt = 0	-- Old Airport Location
local distance = 0	-- Distance Traveled (For Payment Purposes)
local delMarker		-- Delivery Marker
local delBlip		-- Delivery Blip
local delPed		-- Delivery Ped
local bindRender	-- Are render functions handled?
local dist			-- Distance (for dxStat)
local timerETA		-- ETA Timer

-- Pre-clearance
----------------->>

function isPilot(player)
	if (player ~= localPlayer) then return false end
	if (exports.GTIjobs:getPlayerJob(true) ~= "Pilot") then return false end
	if (not isPedInVehicle(player)) then return false end
	local vehicle = getPedOccupiedVehicle(player)
	if (not validVehicles[getElementModel(vehicle)] or not isVehicleOnGround(vehicle)) then return false end
	return true
end

-- Start Mission
----------------->>

function startMission(player, seat)
	if (seat ~= 0 or not isPilot(player) or isElement(delMarker)) then return end
	
	local arpt = getNearestAirport(player)
	local loc = math.random(#PilotGates[arpt])
	local x,y,z = PilotGates[arpt][loc][1], PilotGates[arpt][loc][2], PilotGates[arpt][loc][3]
	
	delMarker = createMarker(x, y, z, "checkpoint", 4.0, 255, 200, 0, 175)
	addEventHandler("onClientMarkerHit", delMarker, pickupPassanger)
	setElementData(delMarker, "creator", player)
	delBlip = createBlip(x, y, z, 41)
	repeat delPed = createPed(math.random(312), x, y, z+1) until delPed
	setElementFrozen(delPed, true)
	
	if (not bindRender) then
		addEventHandler("onClientRender", root, renderLookAt)
		addEventHandler("onClientRender", root, renderDistanceAndETA)
		timerETA = setTimer(updateETA, 1000, 0) updateETA()
		bindRender = true
	end
	
	local pX,pY,pZ = getElementPosition(player)
	distance = getDistanceBetweenPoints2D(pX, pY, x, y)
	
	exports.GTIhud:dm("Pilot: Someone has ordered a flight to another airport. Make your way to the appropriate hangar", 255, 200, 0)
	exports.GTIhud:drawStat("Pilot", "Passengers", "0", 255, 200, 0)
	oldArpt = arpt
end
addEventHandler("onClientVehicleEnter", root, startMission)

-- Pickup Passenger
-------------------->>

function pickupPassanger(player, dim)
	if (not dim or not isPilot(player)) then return end
	if (getElementData(source, "creator") ~= player) then return end
	
	repeat arpt = math.random(#PilotGates) until arpt ~= oldArpt
	local loc = math.random(#PilotGates[arpt])
	local x,y,z = PilotGates[arpt][loc][1], PilotGates[arpt][loc][2], PilotGates[arpt][loc][3]
	oldArpt = arpt
	
	removeEventHandler("onClientMarkerHit", delMarker, pickupPassanger)
	destroyElement(delMarker)
	destroyElement(delBlip)
	destroyElement(delPed)
	
	delMarker = createMarker(x, y, z, "checkpoint", 4.0, 255, 200, 0, 175)
	addEventHandler("onClientMarkerHit", delMarker, dropoffPassenger)
	setElementData(delMarker, "creator", player)
	delBlip = createBlip(x, y, z, 41)
	
	local pX,pY,pZ = getElementPosition(player)
	distance = distance + getDistanceBetweenPoints2D(pX, pY, x, y)
	
	local zone = getZoneName(x, y, z)
	local name = exports.GTIutil:getGenericName()
	local message = randomResponces[math.random(#randomResponces)]
	message = string.gsub(message, "%[airport%]", zone)
	outputChatBox("(Local) "..name..": #FFFFFF"..message, 255, 200, 0, true)
	
	exports.GTIhud:drawStat("Pilot", "Passengers", "1", 255, 200, 0)
end

-- Drop off Passenger
---------------------->>

function dropoffPassenger(player, dim)
	if (not dim or not isPilot(player)) then return false end
	if (getElementData(source, "creator") ~= player) then return end
	
	removeEventHandler("onClientMarkerHit", delMarker, dropoffPassenger)
	destroyElement(delMarker)
	destroyElement(delBlip)
	
	triggerServerEvent("GTIpilot.completeMission", resourceRoot, distance)
	setTimer(startMission, CONTINUE_TIMER, 1, player, 0)
	exports.GTIhud:drawStat("Pilot", "Passengers", "0", 255, 200, 0)
end

-- Terminate Mission
--------------------->>

function terminateJob(job)
	if (job ~= "Pilot") then return end
	
	oldArpt = 0
	distance = 0
	
	if (isElement(delMarker)) then
		destroyElement(delMarker)
		delMarker = nil
	end
	if (isElement(delBlip)) then
		destroyElement(delBlip)
		delBlip = nil
	end
	if (isElement(delPed)) then
		destroyElement(delPed)
		delPed = nil
	end
	
	if (bindRender) then
		removeEventHandler("onClientRender", root, renderLookAt)
		removeEventHandler("onClientRender", root, renderDistanceAndETA)
		killTimer(timerETA)
		bindRender = nil
	end
	
	exports.GTIhud:drawStat("Pilot", "", "", 255, 200, 0, 50)
	exports.GTIhud:drawStat("PilotDist", "", "", 25, 150, 255, 50)
	exports.GTIhud:drawStat("PilotETA", "", "", 25, 255, 25, 50)
end
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", root, terminateJob)	

-- Utilities
------------->>

function getNearestAirport(player)
	local x,y,z = getElementPosition(player)
	local zone = getZoneName(x,y,z, true)
	if (zone == "Los Santos" or zone == "Red County") then
		return 1
	elseif (zone == "Flint County" or zone == "Whetstone" or zone == "San Fierro") then
		return 2
	elseif (zone == "Las Venturas") then
		return 3
	elseif (zone == "Tierra Robada" or zone == "Bone County") then
		return 4
	end
	
	if (x > 0 and y <= 0) then
		return 1
	elseif (x <= 0) then
		return 2
	elseif (x > 0 and y > 0) then
		return 3
	end
end

function renderLookAt()
	if (not delPed or not isElement(delPed)) then return end
	
	local x,y = getElementPosition(localPlayer)
	local pX,pY = getElementPosition(delPed)
	local rot = exports.GTIutil:findRotation(pX,pY, x,y)
	setElementRotation(delPed, 0, 0, rot)
end

function renderDistanceAndETA()
		-- Render Distance
	if (delBlip and isElement(delBlip)) then
		local x,y,z = getElementPosition(localPlayer)
		local bX,bY,bZ = getElementPosition(delBlip)
		dist = getDistanceBetweenPoints3D(x,y,z, bX,bY,bZ)
		dist = dist / METERS_IN_MILE
	else
		dist = 0
	end
	dist = string.format("%.3f", dist)
	exports.GTIhud:drawStat("PilotDist", "Distance", dist.." miles", 25, 150, 255, 1000)
end

function updateETA()
	-- Render ETA
	local ETA
	if (isPedInVehicle(localPlayer) and delBlip and isElement(delBlip)) then
		local vehicle = getPedOccupiedVehicle(localPlayer)
		local vx,vy,vz = getElementVelocity(vehicle)
		local speed = math.sqrt( vx^2 + vy^2 + vz^2 ) * 50
		if (speed > 3) then
			ETA = (dist * METERS_IN_MILE) / speed
		end
	end
	if (not ETA) then
		exports.GTIhud:drawStat("PilotETA", "ETA", "?:??", 25, 255, 25, 1500)
	else
		local M = math.floor(ETA/60)
		local S = math.floor(ETA-(M*60))
		if (S < 10) then S = "0"..S end
		exports.GTIhud:drawStat("PilotETA", "ETA", M..":"..S, 25, 255, 25, 1500)
	end
end
