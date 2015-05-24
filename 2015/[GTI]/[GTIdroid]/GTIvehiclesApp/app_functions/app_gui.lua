----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 30 Dec 2013
-- Resource: GTIvehicles/app_gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

addEvent("onVehicleAppButtonClick", true)

-- Vehicle App GUI
------------------->>

function createVehicleGUIOnStart()
	vehicleApp = {tab = {}, tabpanel = {}, edit = {}, button = {}, window = {}, label = {}, gridlist = {}}
	
	if (not getResourceFromName("GTIdroid") or getResourceState(getResourceFromName("GTIdroid")) ~= "running") then return end
	GTIPhone = exports.GTIdroid:getGTIDroid()
	if (not GTIPhone) then return end
	GTIVehicleApp = exports.GTIdroid:getGTIDroidAppButton("Vehicles")
	addEventHandler("onClientGUIClick", GTIVehicleApp, showVehiclePanel, false)

	-- Static Image
	vehicleApp.window[1] = guiCreateStaticImage(17, 67, 270, 429, ":GTIdroid/wallpapers/bkgr_black.png", false, GTIPhone)
	--
	addEventHandler("onClientGUIClick", vehicleApp.window[1], closeVehicleStatsPanel)
	
	local font = guiCreateFont(":GTIdroid/fonts/Roboto.ttf")
	local font_bold = guiCreateFont(":GTIdroid/fonts/Roboto-Bold.ttf")
	local titlebar = guiCreateStaticImage(0, 0, 270, 35, "images/titlebar.png", false, vehicleApp.window[1])
	vehicleApp.label[5] = guiCreateLabel(50, 10, 220, 15, "Vehicles", false, titlebar)
	guiSetFont(vehicleApp.label[5], font_bold)
	
	local xOff = 21
	local yOff = 38
	-- Labels (Static)
	vehicleApp.label[1] = guiCreateLabel(7, 5+yOff, 36, 15, "Name:", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[1], font_bold)
	guiLabelSetColor(vehicleApp.label[1], 200, 0, 255)
	vehicleApp.label[2] = guiCreateLabel(7, 29+yOff, 57, 15, "Location:", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[2], font_bold)
	guiLabelSetColor(vehicleApp.label[2], 200, 0, 255)
	vehicleApp.label[7] = guiCreateLabel(0, 36+yOff, 270, 15, "_________________________________________", false, vehicleApp.window[1])
	-- Labels (Dynamic)
	vehicleApp.label[3] = guiCreateLabel(50, 5+yOff, 202+xOff, 15, "Select a Vehicle Below", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[3], font)
	vehicleApp.label[4] = guiCreateLabel(70, 29+yOff, 187+xOff, 15, "", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[4], font)
	-- Buttons
	vehicleApp.button[1] = guiCreateButton(0, 399, 68, 30, "Spawn", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[1], "NormalTextColour", "FFAAAAAA")
	guiSetFont(vehicleApp.button[1], font_bold)
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[1], spawnPlayerVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.button[1], hideVehicle, false)
	--
	vehicleApp.button[2] = guiCreateButton(68, 399, 67, 30, "Recover", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[2], "NormalTextColour", "FFAAAAAA")
	guiSetFont(vehicleApp.button[2], font_bold)
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[2], recoverVehicle, false)
	--
	vehicleApp.button[3] = guiCreateButton(68+67, 399, 68, 30, "Mark", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[3], "NormalTextColour", "FFAAAAAA")
	guiSetFont(vehicleApp.button[3], font_bold)
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[3], blipVehicle, false)
	--
	vehicleApp.button[4] = guiCreateButton(68+67+68, 399, 67, 30, "Stats", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[4], "NormalTextColour", "FFAAAAAA")
	guiSetFont(vehicleApp.button[4], font_bold)
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[4], callAdvancedVehicleStats, false)
	--
	-- Gridlist
	--vehicleApp.gridlist[2] = guiCreateGridList(7, 57+yOff, 245+xOff, 175, false, vehicleApp.window[1])
	vehicleApp.gridlist[2] = guiCreateGridList(0, 57+yOff, 249+xOff, 299, false, vehicleApp.window[1])
	guiGridListAddColumn(vehicleApp.gridlist[2], "Vehicle Name", 0.5)
	guiGridListAddColumn(vehicleApp.gridlist[2], "Health", 0.2)
	guiGridListAddColumn(vehicleApp.gridlist[2], "Fuel", 0.2)
	guiGridListSetSortingEnabled(vehicleApp.gridlist[2], false)
	--
	addEventHandler("onClientGUIClick", vehicleApp.gridlist[2], callVehicleStatInfo, false)
	addEventHandler("onClientGUIDoubleClick", vehicleApp.gridlist[2], spawnPlayerVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.gridlist[2], hideVehicle, false)
	--
	-- Other
	guiSetVisible(vehicleApp.window[1], false)
end
addEventHandler("onClientResourceStart", resourceRoot, createVehicleGUIOnStart)
-- Prevent Bugs when GTIdroid is restarted
addEvent("onGTIPhoneCreate", true)
addEventHandler("onGTIPhoneCreate", root, createVehicleGUIOnStart)

-- Advanced Vehicle Stats
-------------------------->>

vehStats = {button = {}, window = {}, label = {}}
-- Window
vehStats.window[1] = guiCreateWindow(562, 287, 250, 198, "Advanced Vehicle Stats", false)
guiWindowSetSizable(vehStats.window[1], false)
guiSetAlpha(vehStats.window[1], 1)
-- Labels (Static)
vehStats.label[1] = guiCreateLabel(10, 24, 80, 15, "Vehicle Name:", false, vehStats.window[1])
guiSetFont(vehStats.label[1], "default-bold-small")
guiLabelSetColor(vehStats.label[1], 200, 0, 255)
vehStats.label[3] = guiCreateLabel(10, 46, 53, 15, "Location:", false, vehStats.window[1])
guiSetFont(vehStats.label[3], "default-bold-small")
guiLabelSetColor(vehStats.label[3], 200, 0, 255)
vehStats.label[5] = guiCreateLabel(10, 68, 41, 15, "Health:", false, vehStats.window[1])
guiSetFont(vehStats.label[5], "default-bold-small")
guiLabelSetColor(vehStats.label[5], 200, 0, 255)
vehStats.label[6] = guiCreateLabel(128, 68, 27, 15, "Fuel:", false, vehStats.window[1])
guiSetFont(vehStats.label[6], "default-bold-small")
guiLabelSetColor(vehStats.label[6], 200, 0, 255)
vehStats.label[9] = guiCreateLabel(10, 90, 48, 15, "Mileage:", false, vehStats.window[1])
guiSetFont(vehStats.label[9], "default-bold-small")
guiLabelSetColor(vehStats.label[9], 200, 0, 255)
vehStats.label[11] = guiCreateLabel(10, 114, 35, 15, "Value:", false, vehStats.window[1])
guiSetFont(vehStats.label[11], "default-bold-small")
guiLabelSetColor(vehStats.label[11], 200, 0, 255)
vehStats.label[13] = guiCreateLabel(10, 138, 87, 15, "Purchase Date:", false, vehStats.window[1])
guiSetFont(vehStats.label[13], "default-bold-small")
guiLabelSetColor(vehStats.label[13], 200, 0, 255)
-- Labels (Dynamic)
vehStats.label[2] = guiCreateLabel(94, 24, 147, 15, "<Vehicle Name>", false, vehStats.window[1])
guiSetFont(vehStats.label[2], "clear-normal")
vehStats.label[4] = guiCreateLabel(67, 46, 175, 15, "<District>, <City>", false, vehStats.window[1])
guiSetFont(vehStats.label[4], "clear-normal")
vehStats.label[7] = guiCreateLabel(56, 68, 66, 15, "47.0%", false, vehStats.window[1])
guiSetFont(vehStats.label[7], "clear-normal")
vehStats.label[8] = guiCreateLabel(161, 68, 66, 15, "47%", false, vehStats.window[1])
guiSetFont(vehStats.label[8], "clear-normal")
vehStats.label[10] = guiCreateLabel(63, 90, 175, 15, "50,000.000 Miles", false, vehStats.window[1])
guiSetFont(vehStats.label[10], "clear-normal")
vehStats.label[12] = guiCreateLabel(51, 114, 175, 15, "$99,999,999", false, vehStats.window[1])
guiSetFont(vehStats.label[12], "clear-normal")
vehStats.label[14] = guiCreateLabel(104, 137, 134, 15, "DD Mon YYYY", false, vehStats.window[1])
guiSetFont(vehStats.label[14], "clear-normal")
-- Button
vehStats.button[1] = guiCreateButton(88, 161, 77, 28, "Close", false, vehStats.window[1])
guiSetProperty(vehStats.button[1], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(vehStats.window[1], false)
