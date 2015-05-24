----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: JT Pennington (JTPenn)
-- Date: 29 Nov 2014
-- Resource: GTIpoliceArrest/taser.lua
-- Version: 1.0
----------------------------------------->>

local rechargeTime	-- Recharge Timer

-- Operate Taser
----------------->>

function tasePlayer(police, weapon)
	if (not exports.GTIutil:isPlayerInTeam(police, "Law Enforcement")) then return end
	if (getElementData(police, "job") ~= "Police Officer") then return end
	if (weapon ~= 23) then return end
	
	if ((getElementData(source, "wanted") or 0) == 0 or getElementData(source, "arrested")) then 
		cancelEvent()
	return end

	cancelEvent()
	triggerServerEvent("GTIpoliceArrest.tasePlayer", resourceRoot, source)
end
addEventHandler("onClientPlayerDamage", root, tasePlayer)

-- Recharge Taser
------------------>>

addEvent("GTIpoliceArrest.rechargeTaser", true)
addEventHandler("GTIpoliceArrest.rechargeTaser", root, function(recharge)
	rechargeTime = setTimer(function() toggleControl("fire", true) end, recharge*1000, 1)
	addEventHandler("onClientRender", root, rechargeTaser)
end)

function rechargeTaser()
	if (not isTimer(rechargeTime)) then
		exports.GTIhud:drawStat("rechargeTaser", nil, nil)
		removeEventHandler("onClientRender", root, rechargeTaser)
		return
	end
	local timer = getTimerDetails(rechargeTime)
	exports.GTIhud:drawStat("rechargeTaser", "Recharging Taser (secs)...", string.format("%.3f", timer/1000), 255, 200, 0)
end

	-- Stop Shooting if Taser Slot
addEventHandler("onClientPlayerWeaponSwitch", localPlayer, function(_, slot)
	if (not isTimer(rechargeTime)) then return end
	if (slot == 2) then
		local weapon = getPedWeapon(localPlayer, 2)
		if (weapon ~= 23) then return end
		toggleControl("fire", false)
	else
		toggleControl("fire", true)
	end
end)

-- Taser Mod
------------->>

addEventHandler("onClientResourceStart", resourceRoot, function()
	local txd = engineLoadTXD("taser/taser.txd")
	engineImportTXD(txd, 347)
	local dff = engineLoadDFF("taser/taser.dff", 0)
	engineReplaceModel(dff, 347)
end)
