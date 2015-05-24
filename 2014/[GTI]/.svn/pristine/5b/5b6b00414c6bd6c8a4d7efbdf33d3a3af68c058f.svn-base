----------------------------------------->>
-- GTI: Grand Theft International Network
-- Date: 15 Dec 2013
-- Resource: GTIdebug/debugPanel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

debugGUI = {tab = {}, window = {}, tabpanel = {}, label = {}, grid = {}}

-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 682, 496
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 352, 132, 682, 496
debugGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Debug Log", false)
guiWindowSetSizable(debugGUI.window[1], false)
guiSetAlpha(debugGUI.window[1], 0.95)
-- Labels
debugGUI.label[1] = guiCreateLabel(8, 25, 666, 31, "This panel contains all debug strings that have been triggered on this server. Debugs can and should be used to detect cheaters, which we can see here. Please fix your debugs. Right click anywhere on the window to close.", false, debugGUI.window[1])
guiLabelSetHorizontalAlign(debugGUI.label[1], "center", true)
-- Tabs
debugGUI.tabpanel[1] = guiCreateTabPanel(9, 59, 664, 428, false, debugGUI.window[1])
debugGUI.tab[1] = guiCreateTab("Server Debugs", debugGUI.tabpanel[1])
debugGUI.tab[2] = guiCreateTab("Client Debugs", debugGUI.tabpanel[1])
-- Gridlists
debugGUI.grid[1] = guiCreateGridList(5, 5, 654, 390, false, debugGUI.tab[1])
guiGridListAddColumn(debugGUI.grid[1], "Server Debug Messages", 2)
guiGridListSetSortingEnabled(debugGUI.grid[1], false)
debugGUI.grid[2] = guiCreateGridList(5, 5, 654, 390, false, debugGUI.tab[2])
guiGridListAddColumn(debugGUI.grid[2], "Client Debug Messages", 2)
guiGridListSetSortingEnabled(debugGUI.grid[2], false)
-- Other
guiSetVisible(debugGUI.window[1], false)

-- Store Client Debugs
----------------------->>

local lastDebug
function sendDebugInformationToServer(message, level, file, line)
	if (message == lastDebug) then return end
	triggerServerEvent("GTIdebug.sendDebugInformationToServer", localPlayer, message, level, file, line)
	lastDebug = message
end
addEventHandler("onClientDebugMessage", root, sendDebugInformationToServer)

-- Display Debugs
------------------>>

function displayDebugs(client, server)
	guiGridListClear(debugGUI.grid[1])
	for i,v in ipairs(server) do
		local row = guiGridListAddRow(debugGUI.grid[1])
		guiGridListSetItemText(debugGUI.grid[1], row, 1, v[1], false, false)
		local r,g,b = 255,255,255
		if (v[2] == 1) then r,g,b = 255,25,25
		elseif (v[2] == 2) then r,g,b = 255,125,25
		elseif (v[2] == 3) then r,g,b = 25,255,25
		end			
		guiGridListSetItemColor(debugGUI.grid[1], row, 1, r, g, b)
	end
	guiGridListClear(debugGUI.grid[2])
	for i,v in ipairs(client) do
		local row = guiGridListAddRow(debugGUI.grid[2])
		guiGridListSetItemText(debugGUI.grid[2], row, 1, v[1], false, false)
		local r,g,b = 255,255,255
		if (v[2] == 1) then r,g,b = 255,25,25
		elseif (v[2] == 2) then r,g,b = 255,125,25
		elseif (v[2] == 3) then r,g,b = 25,255,25
		end			
		guiGridListSetItemColor(debugGUI.grid[2], row, 1, r, g, b)
	end
	guiSetVisible(debugGUI.window[1], true)
	showCursor(true)
end
addEvent("GTIdebug.displayDebugs", true)
addEventHandler("GTIdebug.displayDebugs", root, displayDebugs)

-- Close Panel
--------------->>

function closeDebugWindow(button, state)
	if (button ~= "right" or state ~= "up") then return end
	guiSetVisible(debugGUI.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", debugGUI.window[1], closeDebugWindow)
	