----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 26 Dec 2013
-- Resource: GTIvehiclesApp/manage.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local lastSpawnedRow = {}

MAX_ALLOWED_VEHICLES = 2

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
	triggerServerEvent("GTIvehiclesApp.spawnPlayerVehicle", localPlayer, vehID, row)
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
addEvent("GTIvehiclesApp.returnVehicleThatIsSpawned", true)
addEventHandler("GTIvehiclesApp.returnVehicleThatIsSpawned", root, returnVehicleThatIsSpawned)

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
	exports.GTIdroid:playTick()
	triggerServerEvent("GTIvehiclesApp.hideVehicle", localPlayer, vehID, row)
end

function returnVehicleThatIsHidden(row, grid)
	guiGridListSetItemColor(vehicleApp.gridlist[grid], row, 1, 255, 255, 255)
	guiSetText(vehicleApp.button[1], "Spawn")
end
addEvent("GTIvehiclesApp.returnVehicleThatIsHidden", true)
addEventHandler("GTIvehiclesApp.returnVehicleThatIsHidden", root, returnVehicleThatIsHidden)

function resetSpawnedVehicles()
	for i=0,guiGridListGetRowCount(vehicleApp.gridlist[2])-1 do
		guiGridListSetItemColor(vehicleApp.gridlist[2], i, 1, 255, 255, 255)
	end
	guiSetText(vehicleApp.button[1], "Spawn")
end
addEvent("GTIvehiclesApp.resetSpawnedVehicles", true)
addEventHandler("GTIvehiclesApp.resetSpawnedVehicles", root, resetSpawnedVehicles)

-- Blip Vehicle
---------------->>

function blipVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	exports.GTIdroid:playTick()
	triggerServerEvent("GTIvehiclesApp.blipVehicle", localPlayer, vehID)
end

function returnVehicleThatIsBlipped(bool)
	if (bool) then
		guiSetText(vehicleApp.button[3], "Unmark")
	else
		guiSetText(vehicleApp.button[3], "Mark")
	end
end
addEvent("GTIvehiclesApp.returnVehicleThatIsBlipped", true)
addEventHandler("GTIvehiclesApp.returnVehicleThatIsBlipped", root, returnVehicleThatIsBlipped)

-- Recover Vehicle
------------------->>

function recoverVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	exports.GTIdroid:playTick()
	triggerServerEvent("GTIvehiclesApp.recoverVehicle", localPlayer, vehID)
end

-- Vehicle Stats Panel
----------------------->>

function callAdvancedVehicleStats(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[2])
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	exports.GTIdroid:playTick()
	triggerServerEvent("GTIvehiclesApp.callAdvancedVehicleStats", localPlayer, vehID)
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
addEvent("GTIvehiclesApp.showAdvancedVehicleStats", true)
addEventHandler("GTIvehiclesApp.showAdvancedVehicleStats", root, showAdvancedVehicleStats)

function closeVehicleStatsPanel()
	if (source == vehicleApp.button[4]) then return end
	guiSetVisible(vehStats.window[1], false)
	exports.GTIdroid:playTick()
end
addEventHandler("onClientGUIClick", vehStats.window[1], closeVehicleStatsPanel)

function renderVehicleStatsPanelRelativeToGTIDroid()
	if (not isElement(GTIPhone)) then return end
	if (not guiGetVisible(vehStats.window[1])) then return end
	
	local gX,gY = guiGetPosition(GTIPhone, false)
	local offX, offY = 15+17, 108+88
	guiSetPosition(vehStats.window[1], gX+offX, gY+offY, false)
end
