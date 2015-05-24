----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 26 Dec 2013
-- Resource: GTIvehicles/vehiclePanel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local vehRowInfo = {}
local lastSpawnedRow = {}

MAX_ALLOWED_VEHICLES = 2

-- Toggle Panel
---------------->>

local showVehiclePanelInProgress
function showVehiclePanel(button, state)
	if (showVehiclePanelInProgress) then return end
	if (button ~= "left" or state ~= "up") then return end
	showVehiclePanelInProgress = true

	triggerServerEvent("GTIvehicle.callVehicleInfo", localPlayer)
	
	addEventHandler("onClientRender", root, renderVehicleStatsPanelRelativeToGTIDroid)
	addEventHandler("onClientRender", root, renderPlayerSelection)
	addEventHandler("onClientRender", root, renderPendingSales)
end

function returnVehicleInfo(vehTable, rentTable)
		-- Player Owned Vehicle System
	guiGridListClear(vehicleApp.gridlist[2])
	for k,v in pairs(vehTable) do
		local row = guiGridListAddRow(vehicleApp.gridlist[2])
		local vehName = getVehicleNameFromModel(v[1])
		local vehName = k..".) "..vehName
		guiGridListSetItemText(vehicleApp.gridlist[2], row, 1, vehName, false, false)
		
		local vehHealth = math.floor(v[2]/10).."%"
		guiGridListSetItemText(vehicleApp.gridlist[2], row, 2, vehHealth, false, false)
		
		local r = 255 - ((math.floor(v[2]/10) - 30) * 3.64)
		local g = (math.floor(v[2]/10) - 30) * 3.64
		if (r > 255) then r = 255 end	if (r < 0) then r = 0 end
		if (g > 255) then g = 255 end	if (g < 0) then g = 0 end
		guiGridListSetItemColor(vehicleApp.gridlist[2], row, 2, r, g, 0)

		local vehFuel = v[3].."%"
		guiGridListSetItemText(vehicleApp.gridlist[2], row, 3, vehFuel, false, false)
		
		if (v[4]) then
			guiGridListSetItemColor(vehicleApp.gridlist[2], row, 1, 200, 0, 255)
		end
		
		vehRowInfo[row] = k
	end
		-- Rented Vehicle System
	guiGridListClear(vehicleApp.gridlist[1])
	if (rentTable) then
		local row = guiGridListAddRow(vehicleApp.gridlist[1])
		local vehName = getVehicleNameFromModel(rentTable[1])
		local vehName = "R.) "..vehName
		guiGridListSetItemText(vehicleApp.gridlist[1], row, 1, vehName, false, false)
		
		local vehHealth = math.floor(rentTable[2]/10).."%"
		guiGridListSetItemText(vehicleApp.gridlist[1], row, 2, vehHealth, false, false)
		
		local r = 255 - ((math.floor(rentTable[2]/10) - 30) * 3.64)
		local g = (math.floor(rentTable[2]/10) - 30) * 3.64
		if (r > 255) then r = 255 end	if (r < 0) then r = 0 end
		if (g > 255) then g = 255 end	if (g < 0) then g = 0 end
		guiGridListSetItemColor(vehicleApp.gridlist[1], row, 2, r, g, 0)

		local vehFuel = rentTable[3].."%"
		guiGridListSetItemText(vehicleApp.gridlist[1], row, 3, vehFuel, false, false)
		
		if (rentTable[4]) then
			guiGridListSetItemColor(vehicleApp.gridlist[1], row, 1, 200, 0, 255)
		end
	end
	
	guiSetVisible(vehicleApp.window[1], true)
	exports.GTIdroid:showMainMenu(false)
	showVehiclePanelInProgress = nil
end
addEvent("GTIvehicle.returnVehicleInfo", true)
addEventHandler("GTIvehicle.returnVehicleInfo", root, returnVehicleInfo)

function hideVehiclePanel()
	guiSetVisible(vehicleApp.window[1], false)
	guiSetVisible(vehicleApp.window[2], false)
	guiSetVisible(vehStats.window[1], false)
	guiSetVisible(pendingSales.window[1], false)
	guiSetVisible(playerSelect.window[1], false)
	exports.GTIdroid:showMainMenu(true)
	vehInfoCahce = {}
	lastSpawnedRow = {}
	removeEventHandler("onClientRender", root, renderVehicleStatsPanelRelativeToGTIDroid)
	removeEventHandler("onClientRender", root, renderPlayerSelection)
	removeEventHandler("onClientRender", root, renderPendingSales)
end
addEvent("onGTIDroidClickBack", true)
addEventHandler("onGTIDroidClickBack", root, hideVehiclePanel)
addEvent("onGTIDroidClose", true)
addEventHandler("onGTIDroidClose", root, hideVehiclePanel)
addEventHandler("onClientResourceStop", resourceRoot, hideVehiclePanel)

function switchPanels(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (guiGetVisible(vehicleApp.window[1])) then
		triggerServerEvent("GTIvehicles.callSellVehicleInfo", localPlayer)
	else
		guiSetVisible(vehicleApp.window[1], true)
		guiSetVisible(vehicleApp.window[2], false)
	end
end

-- Vehicle Info Display
------------------------>>

function callVehicleStatInfo(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(source)
	
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	guiGridListSetSelectedItem(vehicleApp.gridlist[1], 0, 0)

	triggerServerEvent("GTIvehicles.callVehicleStatInfo", localPlayer, vehID)
end

function returnVehicleStatInfo(vehInfo)
	guiSetText(vehicleApp.label[3], vehInfo["name"])
	guiSetText(vehicleApp.label[4], vehInfo["zone"])
	if (vehInfo["active"]) then
		guiSetText(vehicleApp.button[1], "Hide")
	else
		guiSetText(vehicleApp.button[1], "Spawn")
	end
	if (vehInfo["blipped"]) then
		guiSetText(vehicleApp.button[3], "Unmark")
	else
		guiSetText(vehicleApp.button[3], "Mark")
	end
end
addEvent("GTIvehicles.returnVehicleStatInfo", true)
addEventHandler("GTIvehicles.returnVehicleStatInfo", root, returnVehicleStatInfo)

-- Spawn Vehicle
----------------->>

function spawnPlayerVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	
		-- If Vehicle is Spawned, do nothing
	if (source == vehicleApp.button[2]) then
		local text = guiGetText(source)
		if (text ~= "Spawn") then return end
	end
		
	local vehID = vehRowInfo[row]
	triggerServerEvent("GTIvehicles.spawnPlayerVehicle", localPlayer, vehID, row)
end

function returnVehicleThatIsSpawned(row, grid)
	table.insert(lastSpawnedRow, {row, grid})
	if (#lastSpawnedRow > MAX_ALLOWED_VEHICLES) then
		guiGridListSetItemColor(vehicleApp.gridlist[lastSpawnedRow[1][2]], lastSpawnedRow[1][1], 1, 255, 255, 255)
		table.remove(lastSpawnedRow, 1)
	end
	guiGridListSetItemColor(vehicleApp.gridlist[grid], row, 1, 200, 0, 255)
	guiSetText(vehicleApp.button[1], "Hide")
end
addEvent("GTIvehicles.returnVehicleThatIsSpawned", true)
addEventHandler("GTIvehicles.returnVehicleThatIsSpawned", root, returnVehicleThatIsSpawned)

-- Hide Vehicle
---------------->>

function hideVehicle(button, state)
	if ((source == vehicleApp.button[1] and button ~= "left" or state ~= "up") or
		(source == vehicleApp.gridlist[2] and button ~= "right" or state ~= "up")) then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	if (source == vehicleApp.button[1]) then
		local text = guiGetText(source)
		if (text ~= "Hide") then return end
	end
	triggerServerEvent("GTIvehicles.hideVehicle", localPlayer, vehID, row)
end

function returnVehicleThatIsHidden(row, grid)
	guiGridListSetItemColor(vehicleApp.gridlist[grid], row, 1, 255, 255, 255)
	guiSetText(vehicleApp.button[1], "Spawn")
end
addEvent("GTIvehicles.returnVehicleThatIsHidden", true)
addEventHandler("GTIvehicles.returnVehicleThatIsHidden", root, returnVehicleThatIsHidden)

-- Blip Vehicle
---------------->>

function blipVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	triggerServerEvent("GTIvehicles.blipVehicle", localPlayer, vehID)
end

function returnVehicleThatIsBlipped(bool)
	if (bool) then
		guiSetText(vehicleApp.button[3], "Unmark")
	else
		guiSetText(vehicleApp.button[3], "Mark")
	end
end
addEvent("GTIvehicles.returnVehicleThatIsBlipped", true)
addEventHandler("GTIvehicles.returnVehicleThatIsBlipped", root, returnVehicleThatIsBlipped)

-- Recover Vehicle
------------------->>

function recoverVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	triggerServerEvent("GTIvehicles.recoverVehicle", localPlayer, vehID)
end

-- Vehicle Stats Panel
----------------------->>

function callAdvancedVehicleStats(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	triggerServerEvent("GTIvehicles.callAdvancedVehicleStats", localPlayer, vehID)
end

function showAdvancedVehicleStats(vehInfo)
	guiSetText(vehStats.label[2], vehInfo["name"])
	guiSetText(vehStats.label[4], vehInfo["zone"])
	guiSetText(vehStats.label[7], string.format("%.1f", vehInfo["health"]/10).."%")
	guiSetText(vehStats.label[8], vehInfo["fuel"].."%")
	guiSetText(vehStats.label[10], string.format("%.3f", vehInfo["mileage"]*0.000621371).." Miles")
	guiSetText(vehStats.label[12], "$"..exports.GTIutil:tocomma(vehInfo["value"]))
	local day, month, year = exports.GTIutil:todate(vehInfo["purchase"])
	month = exports.GTIutil:getMonthName(month, 3)
	guiSetText(vehStats.label[14], day.." "..month.." "..year)
	
	guiBringToFront(vehStats.window[1])
	guiSetVisible(vehStats.window[1], true)
end
addEvent("GTIvehicles.showAdvancedVehicleStats", true)
addEventHandler("GTIvehicles.showAdvancedVehicleStats", root, showAdvancedVehicleStats)

function closeVehicleStatsPanel()
	if (source == vehicleApp.button[4]) then return end
	guiSetVisible(vehStats.window[1], false)
end
addEventHandler("onClientGUIClick", vehStats.window[1], closeVehicleStatsPanel)

function renderVehicleStatsPanelRelativeToGTIDroid()
	if (not isElement(GTIPhone)) then return end
	if (not guiGetVisible(vehStats.window[1])) then return end
	
	local gX,gY = guiGetPosition(GTIPhone, false)
	local offX, offY = 15+17, 108+88
	guiSetPosition(vehStats.window[1], gX+offX, gY+offY, false)
end
