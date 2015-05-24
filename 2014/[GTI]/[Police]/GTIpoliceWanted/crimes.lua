----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 24 Dec 2013
-- Resource: GTIpoliceWanted/crimes.slua
-- Type: Server Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local battery = {}			-- Battery
local aggAssaultVeh = {}	-- Aggrivated Assault (Vehicle)
local aggAssault = {}		-- Aggrivated Assault
local dmg2Prop = {}			-- Criminal Damage to Property
local assault = {}			-- Assault
local destOfProperty = {}	-- Distruction of Property
local discharge				-- Discharge of a Firearm

local CLOSE_RANGE = 10

-- Attacking Crimes
-------------------->>

function chargePlayerForAttacking(attacker, weapon, bodypart, loss)
	if (attacker == source) then return end
	if (not attacker or not isElement(attacker)) then return end
	if (wasEventCancelled()) then return end
	if (getElementType(attacker) == "player" and attacker ~= localPlayer) then return end
		-- Ignore if Cop
	local team = getPlayerTeam(attacker)
	if (team) then
		local team = getTeamName(team)
		if (team == "Law Enforcement") then return end
	end
		
	-- Battery
	if (weapon and weapon <= 15) then
		if (battery[source]) then return end
		triggerServerEvent("GTIpoliceWanted.chargePlayer", attacker, attacker, 2)
		battery[source] = true
		return
	end
	
	-- Aggravated Assault
	if (getElementType(attacker) == "vehicle") then
		local owner = getElementData(attacker, "owner") or getVehicleOccupant(attacker)
		if (owner == source) then return end
		if (not isElement(owner) or owner ~= localPlayer) then return end
		if (aggAssaultVeh[source]) then return end
		triggerServerEvent("GTIpoliceWanted.chargePlayer", attacker, attacker, 24)
		aggAssaultVeh[source] = true
		return
	end
	if (weapon) then
		if (aggAssault[source]) then return end
		triggerServerEvent("GTIpoliceWanted.chargePlayer", attacker, attacker, 3)
		aggAssault[source] = true
		return
	end
end
addEventHandler("onClientPlayerDamage", root, chargePlayerForAttacking)

-- Shooting Crimes
------------------->>

function chargePlayerForShooting(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if (not hitElement or not isElement(hitElement)) then return end
		-- Ignore if Cop
	local team = getPlayerTeam(source)
	if (team) then
		local team = getTeamName(team)
		if (team == "Law Enforcement") then return end
	end
	
	-- Discharge of a firearm
	if (weapon >= 22 or weapon <= 34) then
		if (discharge) then return end
		for i,player in ipairs(getElementsByType("player", root, true)) do
			if (player ~= source) then
				local sx,sy,sz = getElementPosition(source)
				local tx,ty,tz = getElementPosition(player)
				local dist = getDistanceBetweenPoints3D(sx,sy,sz, tx,ty,tz)
				if (dist <= CLOSE_RANGE) then
					discharge = true
					setTimer(function() discharge = nil end, 60000, 1)
					triggerServerEvent("GTIpoliceWanted.chargePlayer", source, source, 1)
				end
			end
		end
	end
	
	-- Criminal Damage to Property
	if (getElementType(hitElement) == "vehicle") then
		local owner = getElementData(hitElement, "owner")
		if (owner == source) then return end
		if (dmg2Prop[hitElement]) then return end
		triggerServerEvent("GTIpoliceWanted.chargePlayer", source, source, 8)
		dmg2Prop[hitElement] = true
		return
	end
end
addEventHandler("onClientPlayerWeaponFire", localPlayer, chargePlayerForShooting)

-- Aiming Crimes
----------------->>

function chargePlayerWithAiming(target)
	if (not isElement(target) or getElementType(target) ~= "player") then return end
	if (not getControlState("aim_weapon")) then return end
		-- Ignore if Cop
	local team = getPlayerTeam(source)
	if (team) then
		local team = getTeamName(team)
		if (team == "Law Enforcement") then return end
	end
	
	-- Assault
	local weapon = getPedWeapon(source)
	local ammo = getPedTotalAmmo(source)
	if (weapon >= 22 and weapon <= 38 and ammo > 0) then
		local x1,y1 = getElementPosition(source)
		local x2,y2 = getElementPosition(target)
		local dist = getDistanceBetweenPoints2D(x1,y1, x2,y2)
		if (dist >= CLOSE_RANGE) then return end
		if (assault[target]) then return end
		triggerServerEvent("GTIpoliceWanted.chargePlayer", source, source, 10)
		assault[target] = true
		return
	end
end
addEventHandler("onClientPlayerTarget", localPlayer, chargePlayerWithAiming)

-- Vehicle Damage
------------------>>

function chargePlayerWithVehicleDamage(attacker)
	if (not attacker or getElementType(attacker) ~= "player" or attacker ~= localPlayer) then return end
	if (wasEventCancelled()) then return end
		-- Ignore if Cop
	local team = getPlayerTeam(attacker)
	if (team) then
		local team = getTeamName(team)
		if (team == "Law Enforcement") then return end
	end
	
	if (isVehicleBlown(source)) then return end
	local health = getElementHealth(source)
	if (health < 250) then
		local owner = getElementData(source, "owner")
		if (owner == attacker) then return end
		if (destOfProperty[source]) then return end
		
		if (getVehicleType(source) == "Plane" or getVehicleType(source) == "Helicopter") then
			-- Terrorism
			triggerServerEvent("GTIpoliceWanted.chargePlayer", attacker, attacker, 22)
		else
			-- Destruction of Property
			triggerServerEvent("GTIpoliceWanted.chargePlayer", attacker, attacker, 17)
		end
		destOfProperty[source] = true
	end
end
addEventHandler("onClientVehicleDamage", root, chargePlayerWithVehicleDamage)

-- Clear Cache
--------------->>

function clearCache()
	battery[source] = nil
	aggAssault[source] = nil
	assault[source] = nil
	discharge = nil
end
addEventHandler("onClientPlayerSpawn", root, clearCache)
addEventHandler("onClientPlayerQuit", root, clearCache)

function clearVehicleCache()
	aggAssaultVeh[source] = nil
	dmg2Prop[source] = nil
	destOfProperty[source] = nil
end
addEventHandler("onClientElementDestroy", root, clearVehicleCache)