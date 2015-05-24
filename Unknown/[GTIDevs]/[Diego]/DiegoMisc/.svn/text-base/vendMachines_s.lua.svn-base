----------------------------------------------->>
-- What		: vendingMachines.lua
-- Type		: Server
-- For		: Grand Theft International
-- Author	: Diego aka diegonese
-- All rights reserved to GTI 2014/2015 (C)
----------------------------------------------->>

local vendingMarkers = {}
local isEating = {}

 function getPedMaxHealth(ped)
    if (isElement(ped) and (getElementType(ped) == "ped" or getElementType(ped) == "player")) then
 	local stat = getPedStat(ped, 24)
    local maxhealth = 100 + (stat - 569) / 4.31
    return math.max(1, maxhealth)
	end
end

function createVendMarkers()
        for index,v in ipairs (getVendTable()) do
                marker = createMarker(v[1], v[2], v[3], "cylinder", 1.3, 7, 4, 79, 96)
                vendingMarkers[marker] = true
                addEventHandler("onMarkerHit", marker, function(hitEl) handleMarkerHit(hitEl,true) end)
                --addEventHandler("onMarkerLeave",marker, function(hitEl) handleMarkerHit(hitEl,false) end)

        end
end
addEventHandler("onResourceStart", resourceRoot, createVendMarkers)

function handleMarkerHit(hitElement,state)
        if (hitElement) and (isElement(hitElement)) and(getElementType(hitElement) == "player") and not (isPedInVehicle(hitElement))then
			if not (isPedInVehicle(hitElement)) then
                if (vendingMarkers[source]) then
                        if (state == true) then
							triggerClientEvent(hitElement, "vendMach.onToggleGUI", hitElement)
								end
                        end
                end
        end
end

-- Pepsi
function onDrinkPepsi()
		local health = getElementHealth(client)
		local maxhealth = getPedMaxHealth(client)
		local hp = 10
		  if isEating[client] == nil then
			if (health == maxhealth) then
				exports.GTIhud:dm("You already have got full health.", client, 255, 0, 0)
				return
			end
			if (health + hp > maxhealth) then
				setElementHealth(client, maxhealth)
			else
				setElementHealth(client, health+hp)
			end
			local cash = getPlayerMoney(client)
			local price = 20
			if (cash < price) then
				exports.GTIhud:dm("You can't afford this.", client, 255, 0, 0)
				return
			end
			exports.GTIbank:TPM(client, price, "Vending Machines: Bought an item. Cost: $"..tostring(price))
			exports.GTIhud:dm("You have bought a Pepsi can which costs $"..price..".", client, 255, 255, 0)
			exports.GTIhud:drawNote("vendMach.pepsi", "-$"..price.."", client, 255, 0, 0, 5000)
			exports.GTIhud:drawNote("vendMach.pepsiHP", "+"..hp.." HP", client, 0, 255, 0, 5000)
			setPedAnimation (client, "VENDING", "VEND_use", 1000, false, false, false)
			setTimer(setPedAnimation, 2700, 1, client, "VENDING", "VEND_use_pt2", 1000, false, false, false)
			setTimer(setPedAnimation, 3400, 1, client, "VENDING", "VEND_drink_p", 1000, false, false, false)
			setTimer(setPedAnimation, 4000, 1, client)
			isEating[client] = true
			setTimer(function(client) isEating[client] = nil end, 4000, 1, client)
		else
			exports.GTIhud:dm("You are already eating.", client, 255, 255, 255)
		  end
	 end
addEvent("vendMach.onDrinkPepsi", true)
addEventHandler("vendMach.onDrinkPepsi", root, onDrinkPepsi)


-- Coca
function onDrinkCoca()
		local health = getElementHealth(client)
		local maxhealth = getPedMaxHealth(client)
		local hp = 20
		  if isEating[client] == nil then
			if (health == maxhealth) then
				exports.GTIhud:dm("You already have got full health.", client, 255, 0, 0)
				return
			end
			if (health + hp > maxhealth) then
				setElementHealth(client, maxhealth)
			else
				setElementHealth(client, health+hp)
			end
			local cash = getPlayerMoney(client)
			local price = 40
			if (cash < price) then
				exports.GTIhud:dm("You can't afford this.", client, 255, 0, 0)
				return
			end
			exports.GTIbank:TPM(client, price, "Vending Machines: Bought an item. Cost: $"..tostring(price))
			exports.GTIhud:dm("You have bought a Cocacola can which costs $"..price..".", client, 255, 255, 0)
			exports.GTIhud:drawNote("vendMach.pepsi", "-$"..price.."", client, 255, 0, 0, 5000)
			exports.GTIhud:drawNote("vendMach.pepsiHP", "+"..hp.." HP", client, 0, 255, 0, 5000)
			setPedAnimation (client, "VENDING", "VEND_use", 1000, false, false, false)
			setTimer(setPedAnimation, 2700, 1, client, "VENDING", "VEND_use_pt2", 1000, false, false, false)
			setTimer(setPedAnimation, 3400, 1, client, "VENDING", "VEND_drink_p", 1000, false, false, false)
			setTimer(setPedAnimation, 4000, 1, client)
			isEating[client] = true
			setTimer(function(client) isEating[client] = nil end, 4000, 1, client)
		else
			exports.GTIhud:dm("You are already eating.", client, 255, 255, 255)
		  end
	 end
addEvent("vendMach.onDrinkCoca", true)
addEventHandler("vendMach.onDrinkCoca", root, onDrinkCoca)

-- Lays
function onEatLays()
		local health = getElementHealth(client)
		local maxhealth = getPedMaxHealth(client)
		local hp = 25
		  if isEating[client] == nil then
			if (health == maxhealth) then
				exports.GTIhud:dm("You already have got full health.", client, 255, 0, 0)
				return
			end
			if (health + hp > maxhealth) then
				setElementHealth(client, maxhealth)
			else
				setElementHealth(client, health+hp)
			end
			local cash = getPlayerMoney(client)
			local price = 50
			if (cash < price) then
				exports.GTIhud:dm("You can't afford this.", client, 255, 0, 0)
				return
			end
			exports.GTIbank:TPM(client, price, "Vending Machines: Bought an item. Cost: $"..tostring(price))
			exports.GTIhud:dm("You have bought a Lays (Classic) which costs $"..price..".", client, 255, 255, 0)
			exports.GTIhud:drawNote("vendMach.pepsi", "-$"..price.."", client, 255, 0, 0, 5000)
			exports.GTIhud:drawNote("vendMach.pepsiHP", "+"..hp.." HP", client, 0, 255, 0, 5000)
			setPedAnimation (client, "VENDING", "VEND_use", 1000, false, false, false)
			setTimer(setPedAnimation, 2700, 1, client, "VENDING", "VEND_use_pt2", 1000, false, false, false)
			setTimer(setPedAnimation, 3400, 1, client, "VENDING", "VEND_drink_p", 1000, false, false, false)
			setTimer(setPedAnimation, 4000, 1, client)
			isEating[client] = true
			setTimer(function(client) isEating[client] = nil end, 4000, 1, client)
		else
			exports.GTIhud:dm("You are already eating.", client, 255, 255, 255)
		  end
	 end
addEvent("vendMach.onEatLays", true)
addEventHandler("vendMach.onEatLays", root, onEatLays)

-- Doritos
function onEatDoritos()
		local health = getElementHealth(client)
		local maxhealth = getPedMaxHealth(client)
		local hp = 50
		  if isEating[client] == nil then
			if (health == maxhealth) then
				exports.GTIhud:dm("You already have got full health.", client, 255, 0, 0)
				return
			end
			if (health + hp > maxhealth) then
				setElementHealth(client, maxhealth)
			else
				setElementHealth(client, health+hp)
			end
			local cash = getPlayerMoney(client)
			local price = 100
			if (cash < price) then
				exports.GTIhud:dm("You can't afford this.", client, 255, 0, 0)
				return
			end
			exports.GTIbank:TPM(client, price, "Vending Machines: Bought an item. Cost: $"..tostring(price))
			exports.GTIhud:dm("You have bought a Doritos (Nacho cheese) which costs $"..price..".", client, 255, 255, 0)
			exports.GTIhud:drawNote("vendMach.pepsi", "-$"..price.."", client, 255, 0, 0, 5000)
			exports.GTIhud:drawNote("vendMach.pepsiHP", "+"..hp.." HP", client, 0, 255, 0, 5000)
			setPedAnimation (client, "VENDING", "VEND_use", 1000, false, false, false)
			setTimer(setPedAnimation, 2700, 1, client, "VENDING", "VEND_use_pt2", 1000, false, false, false)
			setTimer(setPedAnimation, 3400, 1, client, "VENDING", "VEND_drink_p", 1000, false, false, false)
			setTimer(setPedAnimation, 4000, 1, client)
			isEating[client] = true
			setTimer(function(client) isEating[client] = nil end, 4000, 1, client)
		else
			exports.GTIhud:dm("You are already eating.", client, 255, 255, 255)
		  end
	 end
addEvent("vendMach.onEatDoritos", true)
addEventHandler("vendMach.onEatDoritos", root, onEatDoritos)
