----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 30 Dec 2013
-- Resource: GTIvehicles/vehicleGUIs.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

addEvent("onVehicleAppButtonClick", true)

-- Car Dealership GUI
---------------------->>

carDealer = {gridlist = {}, window = {}, button = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 290, 419
local sX, sY, wX, wY = 10,sY-wY-10,wX,wY
-- sX, sY, wX, wY = 1065, 334, 290, 419
carDealer.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Car Dealership", false)
guiWindowSetSizable(carDealer.window[1], false)
guiSetAlpha(carDealer.window[1], 0.95)
-- Label
carDealer.label[1] = guiCreateLabel(6, 23, 276, 31, "Select a Vehicle from the list below. Cars you cannot afford are in red. Right click to close.", false, carDealer.window[1])
guiLabelSetHorizontalAlign(carDealer.label[1], "center", true)
-- Gridlist
carDealer.gridlist[1] = guiCreateGridList(9, 59, 272, 322, false, carDealer.window[1])
guiGridListAddColumn(carDealer.gridlist[1], "Vehicle Name", 0.6)
guiGridListAddColumn(carDealer.gridlist[1], "Cost", 0.25)
guiGridListSetSortingEnabled(carDealer.gridlist[1], false)
-- Button
carDealer.button[1] = guiCreateButton(108, 385, 73, 25, "Purchase", false, carDealer.window[1])
guiSetProperty(carDealer.button[1], "NormalTextColour", "FFAAAAAA")
-- Other
guiSetVisible(carDealer.window[1], false)

-- Vehicle App GUI
------------------->>

function createVehicleGUIOnStart()
	vehicleApp = {tab = {}, tabpanel = {}, edit = {}, button = {}, window = {}, label = {}, gridlist = {}}

	GTIPhone = exports.GTIdroid:getGTIDroid()
	if (not GTIPhone) then return end
	GTIVehicleApp = exports.GTIdroid:getGTIDroidAppButton("Vehicles")
	addEventHandler("onClientGUIClick", GTIVehicleApp, showVehiclePanel, false)

	-- Static Image
	vehicleApp.window[1] = guiCreateStaticImage(17, 88, 278, 401, ":GTIdroid/images/bkgr_black.png", false, GTIPhone)
	--
	addEventHandler("onClientGUIClick", vehicleApp.window[1], closeVehicleStatsPanel)
	--
	local yOff = 20
	-- Tab Panel
	--vehicleApp.tabpanel[1] = guiCreateTabPanel(9, 23-yOff, 260, 389, false, vehicleApp.window[1])
	
	-- My Vehicles Tab
	------------------->>
	
	--vehicleApp.tab[1] = guiCreateTab("My Vehicles", vehicleApp.tabpanel[1])
	local xOff = 21
	local yOff = 38
	-- Labels (Static)
	vehicleApp.label[23] = guiCreateLabel(0, 22, 278, 15, "_________________________________________", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[23], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[23], 200, 0, 255)
	vehicleApp.label[24] = guiCreateLabel(0, 23, 278, 15, "_________________________________________", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[24], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[24], 200, 0, 255)
	vehicleApp.label[25] = guiCreateLabel(13, 10, 110, 15, "My Vehicles", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[25], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[25], 200, 0, 255)
	guiLabelSetHorizontalAlign(vehicleApp.label[25], "center", false)
	vehicleApp.label[26] = guiCreateLabel(138, -3, 5, 30, "| |", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[26], "clear-normal")
	guiLabelSetHorizontalAlign(vehicleApp.label[26], "left", true)
	vehicleApp.label[27] = guiCreateLabel(138, 5, 5, 30, "| |", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[27], "clear-normal")
	guiLabelSetHorizontalAlign(vehicleApp.label[27], "left", true)
	vehicleApp.label[28] = guiCreateLabel(152, 10, 110, 15, "Sell Vehicle", false, vehicleApp.window[1])
	guiLabelSetHorizontalAlign(vehicleApp.label[28], "center", false)
	--
	addEventHandler("onClientGUIClick", vehicleApp.label[28], switchPanels, false)
	--
	vehicleApp.label[1] = guiCreateLabel(8, 5+yOff, 36, 15, "Name:", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[1], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[1], 200, 0, 255)
	vehicleApp.label[2] = guiCreateLabel(8, 29+yOff, 52, 15, "Location:", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[2], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[2], 200, 0, 255)
	vehicleApp.label[5] = guiCreateLabel(94-20+(xOff/2), 236+yOff, 66+40, 15, "Rented Vehicle", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[5], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[5], 200, 0, 255)
	guiLabelSetHorizontalAlign(vehicleApp.label[5], "center", false)
	vehicleApp.label[6] = guiCreateLabel(6, 243+yOff, 245+xOff, 15, "______________________________________", false, vehicleApp.window[1])
	vehicleApp.label[7] = guiCreateLabel(7, 36+yOff, 245+xOff, 15, "______________________________________", false, vehicleApp.window[1])
	-- Labels (Dynamic)
	vehicleApp.label[3] = guiCreateLabel(50, 5+yOff, 202+xOff, 15, "Select a Vehicle Below", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[3], "clear-normal")
	vehicleApp.label[4] = guiCreateLabel(65, 29+yOff, 187+xOff, 15, "", false, vehicleApp.window[1])
	guiSetFont(vehicleApp.label[4], "clear-normal")
	-- Buttons
	vehicleApp.button[1] = guiCreateButton(6, 328+yOff, 58+(xOff/8), 30, "Spawn", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[1], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[1], spawnPlayerVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.button[1], hideVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.button[1], spawnPlayerRentVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.button[1], hideRentVehicle, false)
	--
	vehicleApp.button[2] = guiCreateButton(69+(xOff/4), 328+yOff, 58+(xOff/8), 30, "Recover", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[2], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[2], recoverVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.button[2], recoverRentVehicle, false)
	--
	vehicleApp.button[3] = guiCreateButton(133+2*(xOff/4), 328+yOff, 58+(xOff/8), 30, "Mark", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[3], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[3], blipVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.button[3], blipRentVehicle, false)
	--
	vehicleApp.button[4] = guiCreateButton(196+3*(xOff/4), 328+yOff, 58+(xOff/8), 30, "Stats", false, vehicleApp.window[1])
	guiSetProperty(vehicleApp.button[4], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[4], callAdvancedVehicleStats, false)
	addEventHandler("onClientGUIClick", vehicleApp.button[4], callAdvancedRentVehicleStats, false)
	--
	-- Gridlist
	vehicleApp.gridlist[2] = guiCreateGridList(7, 57+yOff, 245+xOff, 175, false, vehicleApp.window[1])
	guiGridListAddColumn(vehicleApp.gridlist[2], "Vehicle Name", 0.5)
	guiGridListAddColumn(vehicleApp.gridlist[2], "Health", 0.2)
	guiGridListAddColumn(vehicleApp.gridlist[2], "Fuel", 0.2)
	guiGridListSetSortingEnabled(vehicleApp.gridlist[2], false)
	--
	addEventHandler("onClientGUIClick", vehicleApp.gridlist[2], callVehicleStatInfo, false)
	addEventHandler("onClientGUIDoubleClick", vehicleApp.gridlist[2], spawnPlayerVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.gridlist[2], hideVehicle, false)
	--
	vehicleApp.gridlist[1] = guiCreateGridList(6, 262+yOff, 246+xOff, 60, false, vehicleApp.window[1])
	guiGridListAddColumn(vehicleApp.gridlist[1], "Vehicle Name", 0.5)
	guiGridListAddColumn(vehicleApp.gridlist[1], "Health", 0.2)
	guiGridListAddColumn(vehicleApp.gridlist[1], "Fuel", 0.2)
	guiGridListSetSortingEnabled(vehicleApp.gridlist[1], false)
	--
	addEventHandler("onClientGUIClick", vehicleApp.gridlist[1], callVehicleRentStatInfo, false)
	addEventHandler("onClientGUIDoubleClick", vehicleApp.gridlist[1], spawnPlayerRentVehicle, false)
	addEventHandler("onClientGUIClick", vehicleApp.gridlist[1], hideRentVehicle, false)
	
	-- Sell Vehicles Tab
	--------------------->>
	
	--vehicleApp.tab[2] = guiCreateTab("Sell Vehicle", vehicleApp.tabpanel[1])
	vehicleApp.window[2] = guiCreateStaticImage(17, 88, 278, 401, ":GTIdroid/images/bkgr_black.png", false, GTIPhone)
	--
	addEventHandler("onClientGUIClick", vehicleApp.window[2], closePlayerSelection)
	addEventHandler("onClientGUIClick", vehicleApp.window[2], cancelPendingSales)
	--
	-- Gridlists
	vehicleApp.gridlist[3] = guiCreateGridList(6, 163+yOff, 249+xOff, 113, false, vehicleApp.window[2])
	guiGridListAddColumn(vehicleApp.gridlist[3], "Vehicle Name", 0.42)
	guiGridListAddColumn(vehicleApp.gridlist[3], "Value", 0.42)
	guiGridListSetSortingEnabled(vehicleApp.gridlist[3], false)
	--
	addEventHandler("onClientGUIClick", vehicleApp.gridlist[3], selectVehicleForSale, false)
	--
	-- Labels (Static)
	vehicleApp.label[29] = guiCreateLabel(0, 22, 278, 15, "_________________________________________", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[29], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[29], 200, 0, 255)
	vehicleApp.label[30] = guiCreateLabel(0, 23, 278, 15, "_________________________________________", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[30], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[30], 200, 0, 255)
	vehicleApp.label[31] = guiCreateLabel(13, 10, 110, 15, "My Vehicles", false, vehicleApp.window[2])
	guiLabelSetHorizontalAlign(vehicleApp.label[31], "center", false)
	--
	addEventHandler("onClientGUIClick", vehicleApp.label[31], switchPanels, false)
	--
	vehicleApp.label[32] = guiCreateLabel(138, -3, 5, 30, "| |", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[32], "clear-normal")
	guiLabelSetHorizontalAlign(vehicleApp.label[32], "left", true)
	vehicleApp.label[33] = guiCreateLabel(138, 5, 5, 30, "| |", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[33], "clear-normal")
	guiLabelSetHorizontalAlign(vehicleApp.label[33], "left", true)
	vehicleApp.label[34] = guiCreateLabel(152, 10, 110, 15, "Sell Vehicle", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[34], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[34], 200, 0, 255)
	guiLabelSetHorizontalAlign(vehicleApp.label[34], "center", false)
	vehicleApp.label[8] = guiCreateLabel(67+(xOff/2), 5+yOff, 122, 15, "Sell Vehicle to Player", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[8], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[8], 200, 0, 255)
	guiLabelSetHorizontalAlign(vehicleApp.label[8], "center", false)
	vehicleApp.label[9] = guiCreateLabel(6, 11+yOff, 248+xOff, 15, "_______________________________________", false, vehicleApp.window[2])
	vehicleApp.label[10] = guiCreateLabel(7, 30+yOff, 94, 15, "Selected Player:", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[10], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[10], 200, 0, 255)
	vehicleApp.label[12] = guiCreateLabel(7, 68+yOff, 94, 15, "Selected Vehicle:", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[12], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[12], 200, 0, 255)
	vehicleApp.label[14] = guiCreateLabel(6, 314+yOff, 248+xOff, 15, "_______________________________________", false, vehicleApp.window[2])
	vehicleApp.label[15] = guiCreateLabel(139+(xOff/2), 68+yOff, 36, 15, "Value:", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[15], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[15], 200, 0, 255)
	vehicleApp.label[17] = guiCreateLabel(7, 114+yOff, 88, 15, "Sell Vehicle For:", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[17], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[17], 200, 0, 255)
	vehicleApp.label[18] = guiCreateLabel(6, 92+yOff, 248+xOff, 15, "_______________________________________", false, vehicleApp.window[2])
	vehicleApp.label[19] = guiCreateLabel(6, 144+yOff, 248+xOff, 15, "_______________________________________", false, vehicleApp.window[2])
	vehicleApp.label[22] = guiCreateLabel(87+(xOff/2), 308+yOff, 89, 15, "Other Functions", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[22], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[22], 200, 0, 255)
	-- Labels (Dynamic)
	vehicleApp.label[11] = guiCreateLabel(7, 47+yOff, 173, 15, "<Selected Player>", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[11], "clear-normal")
	vehicleApp.label[13] = guiCreateLabel(7, 85+yOff, 121, 15, "<Selected Vehicle>", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[13], "clear-normal")
	vehicleApp.label[16] = guiCreateLabel(139+(xOff/2), 84+yOff, 83, 15, "$99,999,999", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[16], "clear-normal")
	vehicleApp.label[20] = guiCreateLabel(6+(xOff/2), 137+yOff, 249, 15, "Max Sell Price: $99,999,999", false, vehicleApp.window[2])
	guiSetFont(vehicleApp.label[20], "default-bold-small")
	guiLabelSetColor(vehicleApp.label[20], 200, 0, 255)
	guiLabelSetHorizontalAlign(vehicleApp.label[20], "center", false)
	-- Editboxes
	vehicleApp.edit[1] = guiCreateEdit(100, 110+yOff, 151+xOff, 20, "", false, vehicleApp.window[2])
	-- Buttons
	vehicleApp.button[5] = guiCreateButton(185, 30+yOff, 69+xOff, 33, "Select Player", false, vehicleApp.window[2])
	guiSetProperty(vehicleApp.button[5], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[5], showPlayerSelection, false)
	--
	vehicleApp.button[6] = guiCreateButton(5, 333+yOff, 123+(xOff/4), 24, "Drop Rental Vehicle", false, vehicleApp.window[2])
	guiSetProperty(vehicleApp.button[6], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[6], dropRentalVehicle, false)
	--
	vehicleApp.button[7] = guiCreateButton(132+(xOff/2), 333+yOff, 123+(xOff/4), 24, "View Pending Sales", false, vehicleApp.window[2])
	guiSetProperty(vehicleApp.button[7], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[7], viewPendingSales, false)
	--
	vehicleApp.button[8] = guiCreateButton(75, 281+yOff, 123+(xOff/4), 24, "Sell Vehicle", false, vehicleApp.window[2])
	guiSetProperty(vehicleApp.button[8], "NormalTextColour", "FFAAAAAA")
	--
	addEventHandler("onClientGUIClick", vehicleApp.button[8], sellVehicleToPlayer, false)
	--
	-- Other
	guiSetVisible(vehicleApp.window[1], false)
	guiSetVisible(vehicleApp.window[2], false)
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

-- Sell Vehicle GUI
-------------------->>

vehicleSell = {gridlist = {}, window = {}, button = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 290, 379
local sX, sY, wX, wY = 10,sY-wY-10,wX,wY
-- sX, sY, wX, wY = 541, 234, 290, 379
vehicleSell.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Car Dealership — Sell Vehicle", false)
guiWindowSetSizable(vehicleSell.window[1], false)
guiSetAlpha(vehicleSell.window[1], 0.95)
-- Label
vehicleSell.label[1] = guiCreateLabel(7, 23, 275, 45, "Select a Vehicle Below that you wish to sell. Vehicle value decreases with damage, so make sure your car is fully repaired before selling", false, vehicleSell.window[1])
guiSetFont(vehicleSell.label[1], "default-bold-small")
guiLabelSetColor(vehicleSell.label[1], 200, 0, 255)
guiLabelSetHorizontalAlign(vehicleSell.label[1], "center", true)
-- Gridlist
vehicleSell.gridlist[1] = guiCreateGridList(9, 75, 272, 265, false, vehicleSell.window[1])
guiGridListAddColumn(vehicleSell.gridlist[1], "Vehicle Name", 0.45)
guiGridListAddColumn(vehicleSell.gridlist[1], "Value", 0.30)
guiGridListAddColumn(vehicleSell.gridlist[1], "Health", 0.15)
-- Buttons
vehicleSell.button[1] = guiCreateButton(51, 345, 89, 26, "Sell Vehicle", false, vehicleSell.window[1])
guiSetProperty(vehicleSell.button[1], "NormalTextColour", "FFAAAAAA")
vehicleSell.button[2] = guiCreateButton(146, 345, 89, 26, "Cancel Sell", false, vehicleSell.window[1])
guiSetProperty(vehicleSell.button[2], "NormalTextColour", "FFAAAAAA")
-- Other
guiSetVisible(vehicleSell.window[1], false)

-- Player Selection Menu
------------------------->>

playerSelect = {edit = {}, button = {}, window = {}, label = {}, gridlist = {}}
-- Window
playerSelect.window[1] = guiCreateWindow(0, 0, 250, 350, "Player Selection Menu", false)
guiWindowSetSizable(playerSelect.window[1], false)
guiWindowSetMovable(playerSelect.window[1], false)
guiSetAlpha(playerSelect.window[1], 1.00)
-- Edit
playerSelect.edit[1] = guiCreateEdit(9, 26, 197, 22, "", false, playerSelect.window[1])
-- Buttons
playerSelect.button[1] = guiCreateButton(31, 319, 138, 22, "Select Player", false, playerSelect.window[1])
guiSetProperty(playerSelect.button[1], "NormalTextColour", "FFAAAAAA")
playerSelect.button[2] = guiCreateButton(172, 319, 41, 22, "Close", false, playerSelect.window[1])
guiSetProperty(playerSelect.button[2], "NormalTextColour", "FFAAAAAA")
-- Labels
playerSelect.label[1] = guiCreateLabel(9, 297, 54, 15, "Selected:", false, playerSelect.window[1])
guiSetFont(playerSelect.label[1], "default-bold-small")
guiLabelSetColor(playerSelect.label[1], 200, 0, 255)
playerSelect.label[2] = guiCreateLabel(69, 296, 174, 15, "<Selected Player>", false, playerSelect.window[1])
guiSetFont(playerSelect.label[2], "clear-normal")
-- Gridlist
playerSelect.gridlist[1] = guiCreateGridList(9, 54, 232, 237, false, playerSelect.window[1])
guiGridListAddColumn(playerSelect.gridlist[1], "Player Name", 0.95)
-- Other
guiSetVisible(playerSelect.window[1], false)

-- View Pending Sales
---------------------->>

pendingSales = {gridlist = {}, window = {}, button = {}, label = {}}
-- Window
pendingSales.window[1] = guiCreateWindow(557, 250, 250, 350, "Pending Sales", false)
guiWindowSetSizable(pendingSales.window[1], false)
guiWindowSetMovable(pendingSales.window[1], false)
guiSetAlpha(pendingSales.window[1], 1.00)
-- Labels (Static)
pendingSales.label[1] = guiCreateLabel(10, 25, 78, 15, "Vehicle Name:", false, pendingSales.window[1])
guiSetFont(pendingSales.label[1], "default-bold-small")
guiLabelSetColor(pendingSales.label[1], 200, 0, 255)
pendingSales.label[2] = guiCreateLabel(10, 49, 73, 15, "Vehicle Cost:", false, pendingSales.window[1])
guiSetFont(pendingSales.label[2], "default-bold-small")
guiLabelSetColor(pendingSales.label[2], 200, 0, 255)
pendingSales.label[3] = guiCreateLabel(10, 74, 42, 15, "Health:", false, pendingSales.window[1])
guiSetFont(pendingSales.label[3], "default-bold-small")
guiLabelSetColor(pendingSales.label[3], 200, 0, 255)
pendingSales.label[4] = guiCreateLabel(10, 98, 35, 15, "Seller:", false, pendingSales.window[1])
guiSetFont(pendingSales.label[4], "default-bold-small")
guiLabelSetColor(pendingSales.label[4], 200, 0, 255)
pendingSales.label[9] = guiCreateLabel(9, 108, 234, 15, "_____________________________________", false, pendingSales.window[1])
-- Labels (Dynamic)
pendingSales.label[5] = guiCreateLabel(93, 24, 147, 15, "<Vehicle Name>", false, pendingSales.window[1])
guiSetFont(pendingSales.label[5], "clear-normal")
pendingSales.label[6] = guiCreateLabel(88, 48, 147, 15, "$9,999,999", false, pendingSales.window[1])
guiSetFont(pendingSales.label[6], "clear-normal")
pendingSales.label[7] = guiCreateLabel(58, 73, 147, 15, "100.0%", false, pendingSales.window[1])
guiSetFont(pendingSales.label[7], "clear-normal")
pendingSales.label[8] = guiCreateLabel(51, 97, 188, 15, "<Player Name>", false, pendingSales.window[1])
guiSetFont(pendingSales.label[8], "clear-normal")
-- Buttons
pendingSales.button[1] = guiCreateButton(36, 320, 87, 21, "Buy Vehicle", false, pendingSales.window[1])
guiSetProperty(pendingSales.button[1], "NormalTextColour", "FFAAAAAA")
pendingSales.button[2] = guiCreateButton(129, 320, 87, 21, "Cancel", false, pendingSales.window[1])
guiSetProperty(pendingSales.button[2], "NormalTextColour", "FFAAAAAA")
-- Gridlist
pendingSales.gridlist[1] = guiCreateGridList(9, 129, 232, 184, false, pendingSales.window[1])
guiGridListAddColumn(pendingSales.gridlist[1], "Vehicle Name", 0.9)
-- Visible
guiSetVisible(pendingSales.window[1], false)

-- Notification
---------------->>

notice = {button = {}, window = {}, label = {}}
-- Window
notice.window[1] = guiCreateWindow(562, 292, 250, 96, "Notice", false)
guiWindowSetSizable(notice.window[1], false)
guiWindowSetMovable(notice.window[1], false)
guiSetAlpha(notice.window[1], 1.00)
-- Label
notice.label[1] = guiCreateLabel(7, 24, 237, 35, "Are you sure you wish to sell this vehicle?", false, notice.window[1])
guiSetFont(notice.label[1], "clear-normal")
guiLabelSetHorizontalAlign(notice.label[1], "center", true)
guiLabelSetVerticalAlign(notice.label[1], "center")
-- Buttons
notice.button[1] = guiCreateButton(53, 67, 71, 21, "Yes", false, notice.window[1])
guiSetProperty(notice.button[1], "NormalTextColour", "FFAAAAAA")
notice.button[2] = guiCreateButton(129, 67, 71, 21, "No", false, notice.window[1])
guiSetProperty(notice.button[2], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(notice.window[1], false)