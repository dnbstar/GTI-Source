----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 01 Mar 2014
-- Resource: GTIcriminals/crimExpGUI.lua
-- Type: Server Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Criminal Reputation Panel
----------------------------->>

crimRep = {gridlist = {}, window = {}, scrollpane = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 580, 361
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 514, 274, 580, 361
crimRep.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Criminal Reputation System", false)
guiWindowSetSizable(crimRep.window[1], false)
guiSetAlpha(crimRep.window[1], 0.95)
-- Labels (Static)
crimRep.label[1] = guiCreateLabel(10, 39, 92, 15, "Criminal Level:", false, crimRep.window[1])
guiSetFont(crimRep.label[1], "clear-normal")
crimRep.label[2] = guiCreateLabel(193, 39, 75, 15, "Reputation:", false, crimRep.window[1])
guiSetFont(crimRep.label[2], "clear-normal")
crimRep.label[3] = guiCreateLabel(10, 65, 562, 15, "______________________________________________________________________________________________________________", false, crimRep.window[1])
crimRep.label[4] = guiCreateLabel(10, 110, 562, 15, "______________________________________________________________________________________________________________", false, crimRep.window[1])
crimRep.label[5] = guiCreateLabel(9, 130, 238, 15, "Criminal Task List", false, crimRep.window[1])
guiSetFont(crimRep.label[5], "default-bold-small")
guiLabelSetColor(crimRep.label[5], 255, 25, 25)
guiLabelSetHorizontalAlign(crimRep.label[5], "center", false)
crimRep.label[6] = guiCreateLabel(262, 132, 84, 15, "Selected Task:", false, crimRep.window[1])
guiSetFont(crimRep.label[6], "default-bold-small")
guiLabelSetColor(crimRep.label[6], 255, 25, 25)
crimRep.label[7] = guiCreateLabel(262, 159, 84, 15, "Rep. Earned:", false, crimRep.window[1])
guiSetFont(crimRep.label[7], "default-bold-small")
guiLabelSetColor(crimRep.label[7], 255, 25, 25)
crimRep.label[8] = guiCreateLabel(262, 186, 84, 15, "Cash Earned:", false, crimRep.window[1])
guiSetFont(crimRep.label[8], "default-bold-small")
guiLabelSetColor(crimRep.label[8], 255, 25, 25)
crimRep.label[12] = guiCreateLabel(253, 199, 314, 15, "______________________________________________________", false, crimRep.window[1])
crimRep.label[13] = guiCreateLabel(250, 121, 15, 227, "|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  ", false, crimRep.window[1])
guiLabelSetHorizontalAlign(crimRep.label[13], "left", true)
crimRep.label[14] = guiCreateLabel(250, 125, 15, 227, "|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  ", false, crimRep.window[1])
guiLabelSetHorizontalAlign(crimRep.label[14], "left", true)
-- Labels (Dynamic)
crimRep.label[9] = guiCreateLabel(353, 132, 213, 15, "Select a Task from the List", false, crimRep.window[1])
guiSetFont(crimRep.label[9], "clear-normal")
crimRep.label[10] = guiCreateLabel(341, 159, 213, 15, "1,234,567 RP", false, crimRep.window[1])
guiSetFont(crimRep.label[10], "clear-normal")
crimRep.label[11] = guiCreateLabel(341, 185, 213, 15, "$1,234,567", false, crimRep.window[1])
guiSetFont(crimRep.label[11], "clear-normal")
-- Gridlist
crimRep.gridlist[1] = guiCreateGridList(9, 149, 239, 201, false, crimRep.window[1])
guiGridListAddColumn(crimRep.gridlist[1], "Criminal Task", 0.9)
-- Scrollpane
crimRep.scrollpane[1] = guiCreateScrollPane(257, 219, 314, 133, false, crimRep.window[1])
	-- Labels (Dynamic)
	crimRep.label[15] = guiCreateLabel(4, 4, 289, 15, "", false, crimRep.scrollpane[1])
-- Button
crimRep.label[16] = guiCreateLabel(549, 21, 25, 15, "Close", false, crimRep.window[1])
guiSetFont(crimRep.label[16], "default-small")
-- Visible
guiSetVisible(crimRep.window[1], false)
