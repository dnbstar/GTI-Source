----------------------------------------->>
-- Grand Theft International (GTI)
-- Author: LilDolla, JTPenn
-- Date: December 2013
-- Resource: GTIsafezones/safezone_c.lua
-- Version: 1.0
----------------------------------------->>

local safezone = {}		-- Table of Safezones by Col
local safezoneArea = {}	-- Table of Safezone Radar Areas by Col
local plr_timers = {}	-- Table of Safezone Timers by Player
local zone_ele = {}		-- Table of Elements in the Safezone by Element

local disabled_keys = {"fire", "next_weapon", "previous_weapon", "aim_weapon", "vehicle_fire", "vehicle_secondary_fire", "horn"}
	-- Keys Disabled in the safezone

-- Create Safezones
-------------------->>

local safezones = {
	--{fX, fY, fZ, fWidth, fHeight, fDepth}

	-- Los Santos Safezones
	{1149.697, -1385.308, 12.826, 40.182, 98.948, 49.794	}, -- All Saints General Hospital
	{1996.958, -1450.887, 12.561, 47.570, 49.159, 56.663	}, -- Jefferson Hospital
	{1210.718, 294.443, 18.554, 41.054, 42.309, 20.891, 	}, -- Crippen Memorial, Montgomery - Los Santos
	{2247.202, -88.334, 25.484, 35.657, 25.493, 33.318, 	}, -- Palomino Creek
	-- San Fierro Safezones
	{-2231.469, -2328.802, 29.625, 47.928, 30.128, 1.9, 	}, -- Angel Pine
	{-2711.034, 579.111, 14.815, 92.999, 58.840, 53.286, 	}, -- San Fierro
	-- Las Venturas Safezones
	{-1534.687, 2505.533, 54.958, 38.885, 32.1188, 20.0187, }, -- El Quebrados
	{-286.438, 2583.445, 61.603, 44.413, 29.234, 10.954, 	}, -- Las Payasadas
	{1577.103, 1723.035, 9.820, 60.545, 140.0616, 31.038, 	}, -- Las Venturas
	{-326.545, 1049.331, 19.340, 25.014, 10.777, 1.150, 	}, -- Fort Carson
}

addEventHandler("onClientResourceStart", resourceRoot, function()
	for _,zones in ipairs(safezones) do
		local zone = createColCuboid(zones[1], zones[2], zones[3], zones[4], zones[5], zones[6])
		safezone[zone] = true
		safezoneArea[zone] = createRadarArea(zones[1], zones[2], zones[4], zones[5], 50, 50, 50, 200)
	end
end)

-- Safezone Enter/Exit
----------------------->>

function enterSafezone(player, dim, zone)
	if (player ~= localPlayer or not dim or not safezone[(source or zone)]) then return end

	-- Disable Weapons
	for i,key in ipairs(disabled_keys) do
		toggleControl(key, false)
	end
	setPedWeaponSlot(player, 0)

	-- Law Enforcement Exception
	if (exports.GTIutil:isPlayerInTeam(player, "Law Enforcement", "National Guard") and getPedWeapon(player, 1) == 3) then
		setPedWeaponSlot(player, 1)
		toggleControl("fire", true)
	end

	-- EMS Exception
	if (exports.GTIutil:isPlayerInTeam(player, "Emergency Services") and getPedWeapon(player, 9) == 41 or getPedWeapon(player, 9) == 42) then
		setPedWeaponSlot(player, 9)
		toggleControl("fire", true)
	end

	-- Turn off Sirens
	if (isPedInVehicle(player)) then
		local vehicle = getPedOccupiedVehicle(player)
		setVehicleSirensOn(vehicle, false)
	end

	if (not plr_timers[player]) then
		-- Make Damage Proof
		if (isTurfer(player)) then
			addEventHandler("onClientPlayerDamage", player, cancelEvent)
		end
		-- Set Safezone Timer
		plr_timers[player] = setTimer(reenterSafezone, 1000, 0, player)
	end
end
addEventHandler("onClientColShapeHit", resourceRoot, enterSafezone)

function exitSafezone(player, dim)
	if (player ~= localPlayer or not dim or not safezone[source]) then return end

	-- Enable Weapons
	for i,key in ipairs(disabled_keys) do
		toggleControl(key, true)
	end

	-- Enable Damage
	removeEventHandler("onClientPlayerDamage", player, cancelEvent)

	-- Kill Safezone Timer
	if (isTimer(plr_timers[player])) then
		killTimer(plr_timers[player])
		plr_timers[player] = nil
	end
end
addEventHandler("onClientColShapeLeave", resourceRoot, exitSafezone)

-- Ghostmode Safezones
----------------------->>

addEventHandler("onClientColShapeHit", resourceRoot, function(element, dim)
	if (not isElement(element) or not dim) then return end
	if (getElementType(element) ~= "player" and getElementType(element) ~= "vehicle") then return end
	-- Enable Ghostmode
	for _,plr in ipairs(getElementsByType("player")) do
		setElementCollidableWith(element, plr, false)
	end
	for _,veh in ipairs(getElementsByType("vehicle")) do
		setElementCollidableWith(element, veh, false)
	end
	zone_ele[element] = true
end)

addEventHandler("onClientColShapeLeave", resourceRoot, function(element, dim)
	if (not isElement(element) or not dim) then return end
	if (getElementType(element) ~= "player" and getElementType(element) ~= "vehicle") then return end
	-- Disable Ghostmode
	for _,plr in ipairs(getElementsByType("player")) do
		setElementCollidableWith(element, plr, true)
	end
	for _,veh in ipairs(getElementsByType("vehicle")) do
		setElementCollidableWith(element, veh, true)
	end
	zone_ele[element] = nil
end)

-- Enter Safezone On...
------------------------>>

function reenterSafezone(player)
	if (not isControlEnabled("fire")) then return end
	for i,zone in ipairs(getElementsByType("colshape", resourceRoot)) do
		if (isElementWithinColShape(player, zone)) then
			enterSafezone(player, true, zone)
			return true
		end
	end
	return false
end

addEventHandler("onClientPlayerSpawn", localPlayer, function()
	reenterSafezone(source)
end)

-- Exports
----------->>

function isElementWithinSafezone(element)
	if (not isElement(element)) then return false end
	return zone_ele[element] or false
end

-- Other Utilities
------------------->>

addEventHandler("onClientPlayerVehicleExit", localPlayer, function()
	if (not exports.GTIutil:isPlayerInTeam(source, "Law Enforcement", "National Guard")) then return end
	for i,zone in ipairs(getElementsByType("colshape", resourceRoot)) do
		if (isElementWithinColShape(source, zone)) then
			setPedWeaponSlot(source, 1)
			toggleControl("fire", true)
			return
		end
	end
end)

function isTurfer(player)
	if (exports.GTIgangTerritories:isGangster(player)) then return true end
	if (exports.GTIgangTerritories:isSWAT(player)) then return true end
	return false
end
