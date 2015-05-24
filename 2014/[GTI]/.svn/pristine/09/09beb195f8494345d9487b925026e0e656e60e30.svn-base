----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 16 Jan 2014
-- Resource: GTImech/mech.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Is Mechanic?
---------------->>

function isMechanic()
	if (exports.GTIjobs:getPlayerJob(true) == "Mechanic") then return true end
	return false
end

-- Ask for Vehicle Repair
-------------------------->>

-- Start Repairing Cars
function triggerVehicleRepair(button, state, _, _, _, _, _, vehicle)
	if (button ~= "left" or state ~= "up") then return end
	if (not isMechanic()) then return end
	if (not isElement(vehicle) or getElementType(vehicle) ~= "vehicle") then return end
	
	local x1,y1 = getElementPosition(localPlayer)
	local x2,y2 = getElementPosition(vehicle)
	if (getDistanceBetweenPoints2D(x1,y1, x2,y2) > 3) then
		exports.GTIhud:dm("Get closer to the vehicle if you want to repair it.", 255, 200, 0)
		return
	end
	
	local owner = getElementData(vehicle, "owner")
	if (not isElement(owner)) then
		owner = getVehicleOccupant(vehicle)
		if (not owner) then
			exports.GTIhud:dm("This vehicle has no owner. You cannot repair this vehicle.", 255, 200, 0)
		return end
	end
	
	triggerServerEvent("GTImech.notifyPlayerOfRepair", owner, vehicle)
end
addEventHandler("onClientClick", root, triggerVehicleRepair)

-- Player Notification GUI
--------------------------->>

repairNotice = {button = {}, window = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 6395, 113
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 485, 308, 395, 113
repairNotice.window[1] = guiCreateWindow(sX, sY, wX, wY, "Mechanic Repair", false)
guiWindowSetSizable(repairNotice.window[1], false)
guiSetAlpha(repairNotice.window[1], 0.95)
-- Labels
repairNotice.label[1] = guiCreateLabel(10, 22, 376, 15, "[ABC]Player>123 wants to repair your CarName", false, repairNotice.window[1])
guiSetFont(repairNotice.label[1], "clear-normal")
guiLabelSetHorizontalAlign(repairNotice.label[1], "center", false)
repairNotice.label[2] = guiCreateLabel(136, 42, 123, 15, "Repair Cost: $2,500", false, repairNotice.window[1])
guiSetFont(repairNotice.label[2], "default-bold-small")
guiLabelSetColor(repairNotice.label[2], 75, 255, 75)
guiLabelSetHorizontalAlign(repairNotice.label[2], "center", false)
repairNotice.label[3] = guiCreateLabel(147, 92, 99, 15, "The repair will auto-decline after 10 seconds.", false, repairNotice.window[1])
guiSetFont(repairNotice.label[3], "default-small")
guiLabelSetHorizontalAlign(repairNotice.label[3], "center", false)
-- Buttons
repairNotice.button[1] = guiCreateButton(9, 62, 183, 27, "Repair Vehicle", false, repairNotice.window[1])
guiSetFont(repairNotice.button[1], "default-bold-small")
guiSetProperty(repairNotice.button[1], "NormalTextColour", "FFAAAAAA")
repairNotice.button[2] = guiCreateButton(199, 62, 187, 27, "Decline Repair", false, repairNotice.window[1])
guiSetFont(repairNotice.button[2], "default-bold-small")
guiSetProperty(repairNotice.button[2], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(repairNotice.window[1], false)

-- Notify Player of Repair
--------------------------->>

local mechanic
local autoDecline
-- Notification of Vehicle Repair from Mech
function notifyPlayerOfRepair(vehicle, cost)
	mechanic = source
	playSoundFrontEnd(11)
	guiSetText(repairNotice.label[1], getPlayerName(source).." wants to repair your "..getVehicleName(vehicle))
	guiSetText(repairNotice.label[2], "Repair Cost: $"..exports.GTIutil:tocomma(cost))
	guiSetVisible(repairNotice.window[1], true)
	showCursor(true, false)
	autoDecline = setTimer(cancelRepair, 10000, 1, "left", "up")
	addEventHandler("onClientRender", root, updateTime)
end	
addEvent("GTImech.notifyPlayerOfRepair", true)
addEventHandler("GTImech.notifyPlayerOfRepair", root, notifyPlayerOfRepair)

-- Render Auto Decline Update
function updateTime()
	if (not autoDecline or not isTimer(autoDecline)) then return end
	local timeLeft = getTimerDetails(autoDecline)
	local sec = math.ceil(timeLeft/1000)
	if (sec > 1) then
		sec = sec.." seconds"
	else
		sec = sec.." second"
	end
	guiSetText(repairNotice.label[3], "The repair will auto-decline after "..sec)
end

-- Cancel Vehicle Repair
function cancelRepair(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(repairNotice.window[1], false)
	exports.GTIhud:dm("You have declined the vehicle repair.", 255, 200, 0)
	if (isElement(mechanic)) then
		triggerServerEvent("GTImech.cancelRepair", localPlayer, mechanic)
	end
	mechanic = nil
	if (autoDecline and isTimer(autoDecline)) then
		removeEventHandler("onClientRender", root, updateTime)
		killTimer(autoDecline)
		autoDecline = nil
	end
	showCursor(false)
end
addEventHandler("onClientGUIClick", repairNotice.button[2], cancelRepair, false)

-- Repair Vehicle
------------------>>

-- Accept Vehicle Repair
function acceptRepair(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(repairNotice.window[1], false)
	if (not isElement(mechanic)) then
		exports.GTIhud:dm("Your mechanic is no longer online. Vehicle repair canceled.", 255, 200, 0)
		mechanic = nil
		return
	end
	
	exports.GTIhud:dm("Your vehicle is being repaired by "..getPlayerName(mechanic)..". You will be notified when it is fixed.", 255, 200, 0)
	triggerServerEvent("GTImech.acceptRepair", mechanic)
	
	mechanic = nil
	if (autoDecline and isTimer(autoDecline)) then
		removeEventHandler("onClientRender", root, updateTime)
		killTimer(autoDecline)
		autoDecline = nil
	end
	showCursor(false)
end
addEventHandler("onClientGUIClick", repairNotice.button[1], acceptRepair, false)
