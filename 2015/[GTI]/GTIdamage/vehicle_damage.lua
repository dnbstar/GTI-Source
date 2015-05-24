----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 05 Jul 2014
-- Resource: GTIdamage/veh_damage.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- General Vehicle Damage
-------------------------->>

function onClientVehicleDamage(attacker, weapon, loss, x, y, z, tire)

	-- Vehicle Damage from Attacker (Player) -->>

	if (isElement(attacker) and getElementType(attacker) == "player" and weapon) then

		-- Turfer Related Damage
		------------------------->>

			-- Make Turfers only able to harm turfers
		local turferA = exports.GTIgangTerritories:canPlayerTurf(attacker)
		if (turferA) then
			for seat,player in pairs(getVehicleOccupants(source)) do
				if (exports.GTIgangTerritories:canPlayerTurf(player)) then return end
			end
			cancelEvent()
		end
		
		-- Disable cops being able to damage non-crims vehicles and vise versa for crimsss.
		----------------------------------------------------->>
		--[[local job = exports.GTIemployment:getPlayerJob(attacker) --get the attacker's job for the if statement
		if (job == "Police Officer") then
			for seat,player in pairs(getVehicleOccupants(source)) do
				outputDebugString("Checking occupant...")
				if (getElementData(player,"wanted") >= 1) then 
					outputDebugString("Occupant is wanted. Stopping...")
					return 
				end
			end
			outputDebugString("No occupants are wanted. Cancelling damage...")
			cancelEvent()
		elseif (job == "Criminal") then
			for seat,player in pairs(getVehicleOccupants(source)) do
				outputDebugString("Checking occupant...")
				if (exports.GTIemployment:getPlayerJob(player) == "Police Officer") then 
					outputDebugString("Occupant is a cop. Stopping...")
					return 
				end
			end
			outputDebugString("No occupants are cops. Cancelling damage...")
			cancelEvent()
		end]]
	end
end
addEventHandler("onClientVehicleDamage", root, onClientVehicleDamage)

-- Player Damage on Bikes
-------------------------->>

function allowPlayerDamageOnBikes(attacker, weapon, loss, x, y, z, tire)
	if (getVehicleType(source) ~= "Bike" and getVehicleType(source) ~= "BMX") then return end
	if (not isElement(attacker) or getElementType(attacker) ~= "player" or loss <= 0) then return end
	if (wasEventCancelled()) then return end

	local loss = loss/10
	for seat,player in pairs(getVehicleOccupants(source)) do
		if (not exports.GTIsafezones:isElementWithinSafezone(player)) then
				-- Damage Player based on Vehicle Loss
			local health = getElementHealth(player)
			if (health-loss < 0) then
				triggerServerEvent("GTIdamage.killPed", resourceRoot, player, attacker, weapon)
			else
				setElementHealth(player, health-loss)
			end
		end
	end
end
addEventHandler("onClientVehicleDamage", root, allowPlayerDamageOnBikes)

-- Player Damage in Vehicles
----------------------------->>

function allowPlayerDamageinVehicle(attacker, weapon, loss, x, y, z, tire)
	if (getVehicleType(source) == "Bike" or getVehicleType(source) == "BMX") then return end
	if (not isElement(attacker) or getElementType(attacker) ~= "player" or loss <= 0) then return end
	if (not exports.GTIgangTerritories:isGangster(attacker) and not exports.GTIgangTerritories:isSWAT(attacker)) then return end
	if (wasEventCancelled()) then return end

	local loss = loss/10
	for seat,player in pairs(getVehicleOccupants(source)) do
		if (exports.GTIgangTerritories:isGangster(player) or exports.GTIgangTerritories:isSWAT(player)) then
				-- Damage Player based on Vehicle Loss
			local health = getElementHealth(player)
			if (health-loss < 0) then
				triggerServerEvent("GTIdamage.killPed", resourceRoot, player, attacker, weapon)
			else
				setElementHealth(player, health-loss)
			end
		end
	end
end
addEventHandler("onClientVehicleDamage", root, allowPlayerDamageinVehicle)
