----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 05 Jan 2014
-- Resource: GTIvehicles/sellVehicle.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

vehSellRowInfo = {}

-- Show Vehicle Panel
---------------------->>

function returnSellVehicleInfo(vehTable, pendingSale)
	guiGridListClear(vehicleApp.gridlist[3])
	preset = false
	for k,v in pairs(vehTable) do
		local row = guiGridListAddRow(vehicleApp.gridlist[3])
		local vehName = getVehicleNameFromModel(v[1])
		local vehName = k..".) "..vehName
		guiGridListSetItemText(vehicleApp.gridlist[3], row, 1, vehName, false, false)
		
		local vehValue = math.floor( v[2] * ( ( (v[5]-300) /1400)+0.5 ) )
		local vehValue = "$"..exports.GTIutil:tocomma(vehValue)
		guiGridListSetItemText(vehicleApp.gridlist[3], row, 2, vehValue, false, false)
		guiGridListSetItemColor(vehicleApp.gridlist[3], row, 2, 25, 255, 25)
		
		if (v[5] < 950) then
			guiGridListSetItemColor(vehicleApp.gridlist[3], row, 1, 255, 25, 25)
		end
		
		vehSellRowInfo[row] = k
		if (not preset) then
			preset = true
			guiSetText(vehicleApp.label[13], getVehicleNameFromModel(v[1]))
			guiSetText(vehicleApp.label[16], vehValue)
			guiSetText(vehicleApp.edit[1], string.gsub(vehValue, "%D", ""))
			guiSetText(vehicleApp.label[20], "Max Sell Price: $"..exports.GTIutil:tocomma( math.floor(v[2]*1.2) ))
		end
	end
	guiSetText(vehicleApp.label[11], "Select a Player")
	guiGridListSetSelectedItem(vehicleApp.gridlist[3], 0, 1)
	
	if (pendingSale) then
		guiSetProperty(vehicleApp.button[7], "NormalTextColour", "FF19FF19")
		guiSetEnabled(vehicleApp.button[7], true)
	else
		guiSetProperty(vehicleApp.button[7], "NormalTextColour", "FFFF1919")
		guiSetEnabled(vehicleApp.button[7], false)
	end
	
	guiSetVisible(vehicleApp.window[1], false)
	guiSetVisible(vehicleApp.window[2], true)
end
addEvent("GTIvehicle.returnSellVehicleInfo", true)
addEventHandler("GTIvehicle.returnSellVehicleInfo", root, returnSellVehicleInfo)

-- Select Vehicle For Sale
--------------------------->>

function selectVehicleForSale(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[3])
	if (not row or row == -1) then return end
	local slot = vehSellRowInfo[row]
	triggerServerEvent("GTIvehicles.selectVehicleForSale", localPlayer, slot)
end

function returnVehicleSaleInfo(vehInfo)
	guiSetText(vehicleApp.label[13], vehInfo["name"])
	local vehValue = math.floor( vehInfo["value"] * ( ( (vehInfo["health"]-300) /1400)+0.5 ) )
	guiSetText(vehicleApp.label[16], "$"..exports.GTIutil:tocomma(vehValue))
	guiSetText(vehicleApp.edit[1], string.gsub(vehValue, "%D", ""))
	guiSetText(vehicleApp.label[20], "Max Sell Price: $"..exports.GTIutil:tocomma( math.floor(vehInfo["value"]*1.2) ))
end
addEvent("GTIvehicles.returnVehicleSaleInfo", true)
addEventHandler("GTIvehicles.returnVehicleSaleInfo", root, returnVehicleSaleInfo)
	
-- Select Player
----------------->>

local players = {}
function showPlayerSelection(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiGridListClear(playerSelect.gridlist[1])
	for i,player in ipairs(getElementsByType("player")) do
		local row = guiGridListAddRow(playerSelect.gridlist[1])
		local name = getPlayerName(player)
		players[name] = player
		guiGridListSetItemText(playerSelect.gridlist[1], row, 1, name, false, false)
	end
	guiSetVisible(playerSelect.window[1], true)
	guiBringToFront(playerSelect.window[1])
	--guiSetEnabled(playerSelect.button[1], false)
	outputChatBox("Showing Player Selection")
end

function updateCurrentSelection(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(playerSelect.gridlist[1])
	if (not row or row == -1) then return end
	local player = guiGridListGetItemText(playerSelect.gridlist[1], row, 1)
	guiSetText(playerSelect.label[2], player)
	guiSetEnabled(playerSelect.button[1], true)
end
addEventHandler("onClientGUIClick", playerSelect.gridlist[1], updateCurrentSelection, false)

function selectPlayer(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(playerSelect.gridlist[1])
	if (not row or row == -1) then 
		exports.GTIhud:dm("Please select a player off of the list", 255, 125, 0)
	return end
	local player = guiGridListGetItemText(playerSelect.gridlist[1], row, 1)
	guiSetText(vehicleApp.label[11], player)
	guiSetVisible(playerSelect.window[1], false)
end
addEventHandler("onClientGUIClick", playerSelect.button[1], selectPlayer, false)

function closePlayerSelection(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(playerSelect.window[1], false)
end
addEventHandler("onClientGUIClick", playerSelect.button[2], closePlayerSelection, false)

function renderPlayerSelection()
	--[[if (not isElement(GTIPhone)) then return end
	if (not guiGetVisible(playerSelect.window[1])) then return end
	outputChatBox("Passed 1")
	
	local gX,gY = guiGetPosition(GTIPhone, false)
	local offX, offY = -100, -100 --14+17, 25+88
	guiSetPosition(playerSelect.window[1], gX+offX, gY+offY, false)]]--
end

-- Sell Vehicle
---------------->>

function sellVehicleToPlayer(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	local player = guiGetText(vehicleApp.label[11])
	local player = players[player]
	if (not player) then
		exports.GTIhud:dm("Please select a player that you wish to sell your car to.", 255, 125, 0)
		return
	end
	
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[3])
	if (not row or row == -1) then 
		exports.GTIhud:dm("Please select a vehicle that you'd like to sell off of the list before clicking that sell button.", 255, 125, 0)
	return end
	local vehSlot = vehSellRowInfo[row]
	local cost = guiGetText(vehicleApp.edit[1])
	if (cost == "" or not tonumber(cost)) then
		exports.GTIhud:dm("Enter a valid sell amount in the indicated box", 255, 125, 0)
		return
	end
	local cost = tonumber(cost)
	if (cost < 0) then
		exports.GTIhud:dm("You cannot sell your vehicle for a negative money amount", 255, 125, 0)
		return
	end
	
	triggerServerEvent("GTIvehicles.showSaleToPlayer", localPlayer, player, row, vehSlot, cost)
end

-- View Pending Sales
---------------------->>

local pendingSaleSlots = {}
function viewPendingSales(button, state)
	if (button ~= "left" or state ~= "up") then return end
	triggerServerEvent("GTIvehicles.getPendingSales", localPlayer)
end

function returnPendingSales(pendSales)
	guiGridListClear(pendingSales.gridlist[1])
	local preset
	for k,v in pairs(pendSales) do
		local row = guiGridListAddRow(pendingSales.gridlist[1])
		guiGridListSetItemText(pendingSales.gridlist[1], row, 1, v["name"], false, false)
		pendingSaleSlots[row] = v["seller"]
		if (not preset) then
			preset = true
			guiSetText(pendingSales.label[5], v["name"])
			guiSetText(pendingSales.label[6], "$"..exports.GTIutil:tocomma(v["value"]))
			guiSetText(pendingSales.label[7], string.format("%.1f", v["health"]).."%")
			guiSetText(pendingSales.label[8], getPlayerName(v["seller"]))
		end
	end
	guiBringToFront(pendingSales.window[1])
	guiSetVisible(pendingSales.window[1], true)
end
addEvent("GTIvehicles.returnPendingSales", true)
addEventHandler("GTIvehicles.returnPendingSales", root, returnPendingSales)

function cancelPendingSales(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(pendingSales.window[1], false)
end
addEventHandler("onClientGUIClick", pendingSales.button[2], cancelPendingSales, false)

function renderPendingSales()
	if (not isElement(GTIPhone)) then return end
	if (not guiGetVisible(pendingSales.window[1])) then return end
	
	local gX,gY = guiGetPosition(GTIPhone, false)
	local offX, offY = 14+17, 25+88
	guiSetPosition(pendingSales.window[1], gX+offX, gY+offY, false)
end

-- Update Pending Sales Stats
------------------------------>>

function selectPendingVehicleSale(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(pendingSales.gridlist[1])
	if (not row or row == -1) then return end
	local seller = pendingSaleSlots[row]
	triggerServerEvent("GTIvehicles.selectPendingVehicleSale", localPlayer, seller)
end
addEventHandler("onClientGUIClick", pendingSales.gridlist[1], selectPendingVehicleSale, false)

function returnPendingVehicleSale(vehTable)
	guiSetText(pendingSales.label[5], v["name"])
	guiSetText(pendingSales.label[6], "$"..exports.GTIutil:tocomma(v["value"]))
	guiSetText(pendingSales.label[7], string.format("%.1f", v["health"]).."%")
	guiSetText(pendingSales.label[8], getPlayerName(v["seller"]))
end
addEvent("GTIvehicles.returnPendingVehicleSale", true)
addEventHandler("GTIvehicles.returnPendingVehicleSale", root, returnPendingVehicleSale)

-- Sell Vehicle To Player
-------------------------->>

function buyVehicleFromPlayer(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(pendingSales.gridlist[1])
	if (not row or row == -1) then return end
	local seller = pendingSaleSlots[row]
	triggerServerEvent("GTIvehicles.buyVehicleFromPlayer", localPlayer, seller)
end
addEventHandler("onClientGUIClick", pendingSales.button[1], buyVehicleFromPlayer, false)

function returnVehicleFromPlayer()
	hideVehiclePanel()
end
addEvent("GTIvehicles.returnVehicleFromPlayer", true)
addEventHandler("GTIvehicles.returnVehicleFromPlayer", root, returnVehicleFromPlayer)