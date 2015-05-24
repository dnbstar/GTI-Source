----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: JT Pennington (JTPenn)
-- Date: 02 Dec 2014
-- Resource: GTIpoliceArrest/fines/fine.lua
-- Version: 1.0
----------------------------------------->>

-- Fine GUI
------------>>

fineGUI = {button = {}, window = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 330, 112
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 634, 337, 330, 112
fineGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "Police Department — Pay Fine", false)
guiWindowSetSizable(fineGUI.window[1], false)
guiSetAlpha(fineGUI.window[1], 0.90)
guiSetVisible(fineGUI.window[1], false)
-- Label
fineGUI.label[1] = guiCreateLabel(21, 32, 289, 31, "Would you like to clear your wanted level by paying a $9,999 fine?", false, fineGUI.window[1])
guiLabelSetHorizontalAlign(fineGUI.label[1], "center", true)
-- Buttons
fineGUI.button[1] = guiCreateButton(94, 69, 63, 23, "Yes", false, fineGUI.window[1])
fineGUI.button[2] = guiCreateButton(173, 69, 63, 23, "No", false, fineGUI.window[1])

-- Pay Fine
------------>>

addEvent("GTIpoliceArrest.issueFine", true)
addEventHandler("GTIpoliceArrest.issueFine", root, function(cost)
	guiSetText(fineGUI.label[1], "Would you like to clear your wanted level by paying a $"..exports.GTIutil:tocomma(cost).." fine?")
	guiSetVisible(fineGUI.window[1], true)
	showCursor(true)
end)

addEventHandler("onClientGUIClick", fineGUI.button[2], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(fineGUI.window[1], false)
	showCursor(false)
end, false)

addEventHandler("onClientGUIClick", fineGUI.button[1], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	triggerServerEvent("GTIpoliceArrest.payFineAtPD", resourceRoot)
	guiSetVisible(fineGUI.window[1], false)
	showCursor(false)
end, false)
