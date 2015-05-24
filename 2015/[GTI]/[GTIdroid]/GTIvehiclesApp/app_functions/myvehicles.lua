----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 26 Dec 2013
-- Resource: GTIvehiclesApp/panel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

vehRowInfo = {}		-- Vehicle ID by Gridlist Row

-- Toggle Panel
---------------->>

function showVehiclePanel(button, state)
	if (button ~= "left" or state ~= "up") then return end

	triggerServerEvent("GTIvehiclesApp.callVehicleInfo", resourceRoot)
	
	addEventHandler("onClientRender", root, renderVehicleStatsPanelRelativeToGTIDroid)
end

function returnVehicleInfo(vehTable, rentTable)
		-- Player Owned Vehicle System
	guiSetText(vehicleApp.label[3], "Select a Vehicle Below")
	guiSetText(vehicleApp.label[4], "")
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
	
	guiSetVisible(vehicleApp.window[1], true)
	exports.GTIdroid:showMainMenu(false)
	exports.GTIdroid:playTick()
end
addEvent("GTIvehiclesApp.returnVehicleInfo", true)
addEventHandler("GTIvehiclesApp.returnVehicleInfo", root, returnVehicleInfo)

function hideVehiclePanel()
	guiSetVisible(vehicleApp.window[1], false)
	guiSetVisible(vehStats.window[1], false)
	
	exports.GTIdroid:showMainMenu(true)
	
	vehRowInfo = {}
	lastSpawnedRow = {}
	
	removeEventHandler("onClientRender", root, renderVehicleStatsPanelRelativeToGTIDroid)
end
addEvent("onGTIDroidClickBack", true)
addEventHandler("onGTIDroidClickBack", root, hideVehiclePanel)
addEvent("onGTIDroidClose", true)
addEventHandler("onGTIDroidClose", root, hideVehiclePanel)
addEventHandler("onClientResourceStop", resourceRoot, hideVehiclePanel)

-- Vehicle Info Display
------------------------>>

function callVehicleStatInfo(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(source)
	
	if (not row or row == -1) then return end
	local vehID = vehRowInfo[row]
	exports.GTIdroid:playTick()
	triggerServerEvent("GTIvehiclesApp.callVehicleStatInfo", resourceRoot, vehID)
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
addEvent("GTIvehiclesApp.returnVehicleStatInfo", true)
addEventHandler("GTIvehiclesApp.returnVehicleStatInfo", root, returnVehicleStatInfo)
