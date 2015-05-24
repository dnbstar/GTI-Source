----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 27 Dec 2013
-- Resource: GTIcardealer/dealerships.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

TOTAL_ROT_TIME = 5000 	-- Time it takes for one full rotation of a vehicle

local carCustomTable	-- Table of Player-Owned Cars for resale to Dealer
local pickupInfo = {}	-- Table of pickup data
local carSpawn			-- Table of Vehicle Preview Spawn Point
local vehiclePreview	-- Client-Side Vehicle Preview Element
local rotation = 		-- Infinity Running Rotation Timer
	setTimer(function() end, TOTAL_ROT_TIME, 0)

-- Render Text Above Markers
---------------------------->>

addEventHandler("onClientResourceStart", resourceRoot, function()
	triggerServerEvent("GTIcardealer.callPickupInfo", root)
end)

function setMarkerInfoTable(pTable)
	pickupInfo = pTable
end
addEvent("GTIcardealer.setPickupInfoTable", true)
addEventHandler("GTIcardealer.setPickupInfoTable", root, setMarkerInfoTable)

addEventHandler("onClientRender", root, function()
	local px, py, pz = getCameraMatrix()
    for i,v in ipairs(pickupInfo) do
		local tx, ty, tz = v.pos[1], v.pos[2], v.pos[3]+0.55
		local dist = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
		if (dist < 25) then
			if (isLineOfSightClear(px, py, pz, tx, ty, tz, true, true, false, true, true, false, false, localPlayer)) then
				local x,y = getScreenFromWorldPosition(tx, ty, tz)
				if (x) then
					local tick = getTickCount()/350
					local hover = math.sin(tick) * 10
					dxDrawText(v.friendlyName, x+1, y+1+hover, x+1, y+1+hover, tocolor(0,0,0), 1, "clear", "center", "center")
					dxDrawText(v.friendlyName, x, y+hover, x, y+hover, tocolor(200,0,250), 1, "clear", "center", "center")
				end
			end
		end
	end
end)

-- Shop For Personal Vehicle
----------------------------->>

function shopForPersonalVehicle(locTable, carTable)
	setCameraMatrix(locTable.camMatrix[1], locTable.camMatrix[2], locTable.camMatrix[3], 
		locTable.camMatrix[4], locTable.camMatrix[5], locTable.camMatrix[6])

	guiGridListClear(carDealer.gridlist[1])
	for category,v in pairs(carTable) do
		local row = guiGridListAddRow(carDealer.gridlist[1])
		guiGridListSetItemText(carDealer.gridlist[1], row, 1, category, true, false)
		for i,v in ipairs(carTable[category]) do
			local row = guiGridListAddRow(carDealer.gridlist[1])
			local carName = getVehicleNameFromModel(v.id)
			guiGridListSetItemText(carDealer.gridlist[1], row, 1, carName, false, false)
			local cost = "$"..exports.GTIutil:tocomma(v.cost)
			guiGridListSetItemText(carDealer.gridlist[1], row, 2, cost, false, false)
			if (not v.afford) then
				guiGridListSetItemColor(carDealer.gridlist[1], row, 1, 255, 25, 25)
				guiGridListSetItemColor(carDealer.gridlist[1], row, 2, 255, 25, 25)
			end
		end
	end
	
	carSpawn = locTable.spawnPoint
	
	guiSetVisible(carDealer.window[1], true)
	showCursor(true)
end
addEvent("GTIcardealer.shopForPersonalVehicle", true)
addEventHandler("GTIcardealer.shopForPersonalVehicle", root, shopForPersonalVehicle)

-- Preview Vehicle
------------------->>

function previewVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(source)
	if (not row or row == -1) then return end
	
	local vehName = guiGridListGetItemText(source, row, 1)
	local vehID = getVehicleModelFromName(vehName)
	if (not isElement(vehiclePreview)) then
		vehiclePreview = createVehicle(vehID, carSpawn[1], carSpawn[2], carSpawn[3]+2)
		setElementCollisionsEnabled(vehiclePreview, false)
		setElementFrozen(vehiclePreview, true)
	else
		setElementModel(vehiclePreview, vehID)
	end
	
	local zoff = getElementDistanceFromCentreOfMassToBaseOfModel(vehiclePreview)
	if (zoff == 0) then zoff = 0.75 end
	setElementPosition(vehiclePreview, carSpawn[1], carSpawn[2], carSpawn[3]+zoff+1)
	--[[
	MTA Bug:
		- getElementDistanceFromCentreOfMassToBaseOfModel returns 0 when vehicle is created
	--]]
	if (not carCustomTable) then return end
	local v = carCustomTable[row+1]
	local col = v[3]
	setVehicleColor(vehiclePreview, col[1], col[2], col[3], col[4], col[5], col[6], col[7], col[8], col[9], col[10], col[11], col[12])
end
addEventHandler("onClientGUIClick", carDealer.gridlist[1], previewVehicle, false)
addEventHandler("onClientGUIClick", vehicleSell.gridlist[1], previewVehicle, false)

function rotateVehicle()
	if (not vehiclePreview or not isElement(vehiclePreview)) then return end

	local timeLeft = getTimerDetails(rotation)
	local angle = ((TOTAL_ROT_TIME-timeLeft)/TOTAL_ROT_TIME)*360
	setElementRotation(vehiclePreview, 0, 0, angle)
end
addEventHandler("onClientRender", root, rotateVehicle)

-- Purchase Vehicle
-------------------->>

function purchaseVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (not isElement(vehiclePreview)) then
		exports.GTIhud:dm("Please select a vehicle for purchase.", 255, 128, 0)
		return
	end
	local row = guiGridListGetSelectedItem(carDealer.gridlist[1])
	if (not row or row == -1) then return end
	local vehName = guiGridListGetItemText(carDealer.gridlist[1], row, 1)
	local vehID = getVehicleModelFromName(vehName)
	local r1,g1,b1, r2,g2,b2, r3,g3,b3, r4,g4,b4 = getVehicleColor(vehiclePreview, true)
	local vehColTable = {r1,g1,b1, r2,g2,b2, r3,g3,b3, r4,g4,b4}
	local var1,var2 = getVehicleVariant(vehiclePreview)
	local variant = {var1, var2}
	local zoff = getElementDistanceFromCentreOfMassToBaseOfModel(vehiclePreview)
	triggerServerEvent("GTIcardealer.purchaseVehicle", localPlayer, vehID, vehColTable, variant, zoff)
end
addEventHandler("onClientGUIClick", carDealer.button[1], purchaseVehicle, false)	

-- Hide Panel
-------------->>

function hideCarDealershipPanel(button, state)
	if (button ~= "right" or state ~= "up") then return end
	
	if (isElement(vehiclePreview)) then
		destroyElement(vehiclePreview)
		vehiclePreview = nil
	end
	
	guiSetVisible(carDealer.window[1], false)
	showCursor(false)
	setCameraTarget(localPlayer)
	carSpawn = nil
end
addEvent("GTIcardealer.hideCarDealershipPanel", true)
addEventHandler("GTIcardealer.hideCarDealershipPanel", root, hideCarDealershipPanel)
addEventHandler("onClientGUIClick", carDealer.window[1], hideCarDealershipPanel)

-- Sell Vehicle to Dealer
-------------------------->>

function sellVehicleToDealer(locTable, carTable)
	setElementFrozen(localPlayer, true)
	setCameraMatrix(locTable.camMatrix[1], locTable.camMatrix[2], locTable.camMatrix[3], 
		locTable.camMatrix[4], locTable.camMatrix[5], locTable.camMatrix[6])

	guiGridListClear(vehicleSell.gridlist[1])
	for i,v in pairs(carTable) do
		local row = guiGridListAddRow(vehicleSell.gridlist[1])
		local carName = getVehicleNameFromModel(carTable[i][2])
		guiGridListSetItemText(vehicleSell.gridlist[1], row, 1, carName, false, false)
		if (carTable[i][7]) then
			guiGridListSetItemColor(vehicleSell.gridlist[1], row, 1, 255, 25, 25)
		end
		
		local cost = "$"..exports.GTIutil:tocomma(carTable[i][5])
		guiGridListSetItemText(vehicleSell.gridlist[1], row, 2, cost, false, false)
		guiGridListSetItemColor(vehicleSell.gridlist[1], row, 2, 25, 255, 25)
		
		local health = carTable[i][6]
		local vehHealth = math.floor(health/10).."%"
		guiGridListSetItemText(vehicleSell.gridlist[1], row, 3, vehHealth, false, false)
		local r = 255 - ((math.floor(health/10) - 30) * 3.64)
		local g = (math.floor(health/10) - 30) * 3.64
		if (r > 255) then r = 255 end	if (r < 0) then r = 0 end
		if (g > 255) then g = 255 end	if (g < 0) then g = 0 end
		guiGridListSetItemColor(vehicleSell.gridlist[1], row, 3, r, g, 0)
	end
	
	carCustomTable = carTable
	carSpawn = locTable.spawnPoint
	
	guiSetVisible(vehicleSell.window[1], true)
	showCursor(true)
end
addEvent("GTIcardealer.sellVehicleToDealer", true)
addEventHandler("GTIcardealer.sellVehicleToDealer", root, sellVehicleToDealer)

-- Sell Vehicle
---------------->>

function sellVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (not isElement(vehiclePreview)) then
		exports.GTIhud:dm("Please select a vehicle to sell.", 255, 128, 0)
		return
	end
	local row = guiGridListGetSelectedItem(vehicleSell.gridlist[1])
	if (not row or row == -1) then return end
	local vehID = carCustomTable[row+1][1]
	triggerServerEvent("GTIcardealer.sellVehicle", localPlayer, vehID)
end
addEventHandler("onClientGUIClick", vehicleSell.button[1], sellVehicle, false)

-- Hide Sell Panel
------------------->>

function hideCarDealershipSalePanel(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	setElementFrozen(localPlayer, false)
	if (isElement(vehiclePreview)) then
		destroyElement(vehiclePreview)
		vehiclePreview = nil
	end
	
	guiSetVisible(vehicleSell.window[1], false)
	showCursor(false)
	setCameraTarget(localPlayer)
	carSpawn = nil
	carCustomTable = nil
end
addEvent("GTIcardealer.hideCarDealershipSalePanel", true)
addEventHandler("GTIcardealer.hideCarDealershipSalePanel", root, hideCarDealershipSalePanel)
addEventHandler("onClientGUIClick", vehicleSell.button[2], hideCarDealershipSalePanel)

-- Hide panels on death
-------->>

function onDeath()
	hideCarDealershipPanel("right","up")
	hideCarDealershipSalePanel("left","up")
end
addEventHandler("onClientPlayerWasted",localPlayer,onDeath)