----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 17 Mar 2014
-- Resource: GTIrentVehicle/rentPanel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local LABEL_OFFSET = 0.75	-- Label Offset from Disk Pickup
local restrictions = {}		-- Restriction Table for Gridlist
local sourcePickup			-- The current associated pickup

-- Location Data
----------------->>

function renderPickupNames()
	for i,pickup in ipairs(getElementsByType("pickup", resourceRoot, true)) do
		local px, py, pz = getCameraMatrix()
		local name = getElementData(pickup, "name")
		local color = split(getElementData(pickup, "color"), ",")
		if (name and color) then			
			local tx, ty, tz = getElementPosition(pickup)
			tz = tz + LABEL_OFFSET
			local dist = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
			if (dist < 40) then
				if (isLineOfSightClear(px, py, pz, tx, ty, tz, true, true, false, true, true, false, false)) then
					local x,y = getScreenFromWorldPosition(tx, ty, tz)
					if (x) then
						dxDrawText(name, x+1, y+1, x+1, y+1, tocolor(0,0,0), 1, "clear", "center", "center")
						dxDrawText(name, x, y, x, y, tocolor(color[1],color[2],color[3]), 1, "clear", "center", "center")
					end
				end
			end
		end
	end
end
addEventHandler("onClientRender", root, renderPickupNames)

-- Display Rental Panel
------------------------>>

function displayRentPanel(rentTbl, pickup)
	sourcePickup = pickup
	-- Compile Gridlist
	guiGridListClear(rentVehicle.gridlist[1])
	for i,v in ipairs(rentTbl) do
		local vehicleID = v[1]
		local row = guiGridListAddRow(rentVehicle.gridlist[1])
		guiGridListSetItemText(rentVehicle.gridlist[1], row, 1, vehicleID, false, true)
		local vehicleName = getVehicleNameFromID(tonumber(vehicleID))
		guiGridListSetItemText(rentVehicle.gridlist[1], row, 2, vehicleName, false, false)
		-- Turn non-selectable items red
		if (not v[2]) then
			guiGridListSetItemColor(rentVehicle.gridlist[1], i-1, 1, 255, 25, 25)
			guiGridListSetItemColor(rentVehicle.gridlist[1], i-1, 2, 255, 25, 25)
		end
		
		restrictions[row] = v[3]
	end
	guiSetText(rentVehicle.label[2], "")
	guiSetVisible(rentVehicle.window[1], true)
	showCursor(true)
end
addEvent("GTIrentVehicle.displayRentPanel", true)
addEventHandler("GTIrentVehicle.displayRentPanel", root, displayRentPanel)

function hideRentPanel(button, state)
	if (button ~= "left" or state ~= "up") then return end
	restrictions = {}
	guiSetVisible(rentVehicle.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", rentVehicle.button[2], hideRentPanel, false)

addEvent("onClientVehicleRent", true)
addEventHandler("onClientVehicleRent", root, function()
	hideRentPanel("left", "up")
end)

-- Update Permissions
---------------------->>

function updateVehicleRentPermissions(button)
	if (button ~= "left") then return end
	
	local row,col = guiGridListGetSelectedItem(rentVehicle.gridlist[1])
	if (not row or row == -1) then return end
	
	local rstn = restrictions[row]
	local rString = ""
	if (rstn) then
		for i,v in ipairs(restrictions[row]) do
			local rstns = split(v, ";")
			if (rString == "") then
				rString = "L"..rstns[2].." "..rstns[1].."s"
			else
				rString = rString..", L"..rstns[2].." "..rstns[1].."s"
			end
		end
		guiSetText(rentVehicle.label[2], "This vehicle is restricted to the following groups:\n"..rString)
	else
		guiSetText(rentVehicle.label[2], "")
	end	
end
addEventHandler("onClientGUIClick", rentVehicle.gridlist[1], updateVehicleRentPermissions, false)

-- Rent Vehicle
---------------->>

function rentVehicleToPlayer(button)
	if (button ~= "left") then return end
	local row,col = guiGridListGetSelectedItem(rentVehicle.gridlist[1])
	if (not row or row == -1) then return end
	local id = guiGridListGetItemText(rentVehicle.gridlist[1], row, 1)
	id = tonumber(id)
	triggerServerEvent("GTIrentVehicle.rentVehicleToPlayer", resourceRoot, id, sourcePickup)
end
addEventHandler("onClientGUIClick", rentVehicle.button[1], rentVehicleToPlayer, false)
