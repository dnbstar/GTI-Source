----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 11 Apr 2014
-- Resource: GTIgroups/members/m_change_rank_gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

mChangeRank = {gridlist = {}, window = {}, button = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 328, 314
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 644, 229, 328, 314
mChangeRank.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Group Rank Change", false)
guiWindowSetSizable(mChangeRank.window[1], false)
-- Labels (Static)
mChangeRank.label[1] = guiCreateLabel(18, 36, 97, 15, "Selected Player:", false, mChangeRank.window[1])
guiSetFont(mChangeRank.label[1], "default-bold-small")
guiLabelSetColor(mChangeRank.label[1], 255, 100, 100)
guiLabelSetHorizontalAlign(mChangeRank.label[1], "right", false)
mChangeRank.label[2] = guiCreateLabel(18, 65, 97, 15, "Rank:", false, mChangeRank.window[1])
guiSetFont(mChangeRank.label[2], "default-bold-small")
guiLabelSetColor(mChangeRank.label[2], 255, 100, 100)
guiLabelSetHorizontalAlign(mChangeRank.label[2], "right", false)
-- Labels (Dynamic)
mChangeRank.label[3] = guiCreateLabel(125, 36, 166, 15, "[ABC]Player>123", false, mChangeRank.window[1])
mChangeRank.label[4] = guiCreateLabel(125, 65, 166, 15, "New Member", false, mChangeRank.window[1])
-- Gridlist
mChangeRank.gridlist[1] = guiCreateGridList(18, 95, 289, 157, false, mChangeRank.window[1])
guiGridListAddColumn(mChangeRank.gridlist[1], "Rank List", 0.9)
-- Button
mChangeRank.button[1] = guiCreateButton(72, 264, 81, 31, "Change", false, mChangeRank.window[1])
guiSetFont(mChangeRank.button[1], "default-bold-small")
guiSetProperty(mChangeRank.button[1], "NormalTextColour", "FFAAAAAA")
mChangeRank.button[2] = guiCreateButton(164, 264, 81, 31, "Cancel", false, mChangeRank.window[1])
guiSetProperty(mChangeRank.button[2], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(mChangeRank.window[1], false)