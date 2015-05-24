----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 26 Dec 2013
-- Resource: GTIvehicles/vehiclePanel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Vehicle Info Display
------------------------>>

function callVehicleRentStatInfo(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[1])
	if (not row or row == -1) then return end
	
	guiGridListSetSelectedItem(vehicleApp.gridlist[2], 0, 0)
	triggerServerEvent("GTIvehicles.callVehicleRentStatInfo", localPlayer)
end

-- Spawn Vehicle
----------------->>

function spawnPlayerRentVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[1])
	if (not row or row == -1) then return end
	
		-- If Vehicle is Spawned, do nothing
	if (source == vehicleApp.button[1]) then
		local text = guiGetText(source)
		if (text ~= "Spawn") then return end
	end
	
	triggerServerEvent("GTIvehicles.spawnPlayerRentVehicle", localPlayer)
end

-- Hide Vehicle
---------------->>

function hideRentVehicle(button, state)
	if ((source == vehicleApp.button[1] and button ~= "left" or state ~= "up") or
		(source == vehicleApp.gridlist[1] and button ~= "right" or state ~= "up")) then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[1])
	if (not row or row == -1) then return end
	if (source == vehicleApp.button[1]) then
		local text = guiGetText(source)
		if (text ~= "Hide") then return end
	end
	triggerServerEvent("GTIvehicles.hideRentVehicle", localPlayer)
end

-- Blip Vehicle
---------------->>

function blipRentVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[1])
	if (not row or row == -1) then return end
	triggerServerEvent("GTIvehicles.blipRentVehicle", localPlayer)
end

-- Recover Vehicle
------------------->>

function recoverRentVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[1])
	if (not row or row == -1) then return end
	triggerServerEvent("GTIvehicles.recoverRentVehicle", localPlayer)
end

-- Vehicle Stats Panel
----------------------->>

function callAdvancedRentVehicleStats(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(vehicleApp.gridlist[1])
	if (not row or row == -1) then return end
	triggerServerEvent("GTIvehicles.callAdvancedRentVehicleStats", localPlayer)
end

-- Drop Rental Vehicle
----------------------->>

function dropRentalVehicle(button, state)
	if (button ~= "left" or state ~= "up") then return end
	triggerServerEvent("GTIvehicles.dropRentalVehicle", resourceRoot)
end
