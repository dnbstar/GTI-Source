----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 02 Feb 2014
-- Resource: GTIpolice/policeGUI.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Police Job GUI
------------------>>

policeJob = {scrollpane = {}, label = {}, button = {}, window = {}, gridlist = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 472, 408
local sX, sY = (sX/2)-(wX/2), (sY/2)-(wY/2)
-- sX, sY, wX, wY = 448, 161, 472, 408
policeJob.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Law Enforcement Jobs System", false)
guiWindowSetSizable(policeJob.window[1], false)
guiSetAlpha(policeJob.window[1], 0.95)
-- Labels (Static)
policeJob.label[1] = guiCreateLabel(10, 28, 84, 15, "Police Division:", false, policeJob.window[1])
guiSetFont(policeJob.label[1], "default-bold-small")
guiLabelSetColor(policeJob.label[1], 30, 150, 255)
policeJob.label[3] = guiCreateLabel(255, 28, 49, 15, "Uniform:", false, policeJob.window[1])
guiSetFont(policeJob.label[3], "default-bold-small")
guiLabelSetColor(policeJob.label[3], 30, 150, 255)
policeJob.label[5] = guiCreateLabel(11, 41, 452, 15, "_______________________________________________________________________", false, policeJob.window[1])
policeJob.label[7] = guiCreateLabel(273, 63, 189, 15, "Select a Police Division", false, policeJob.window[1])
guiSetFont(policeJob.label[7], "default-bold-small")
guiLabelSetColor(policeJob.label[7], 30, 150, 255)
guiLabelSetHorizontalAlign(policeJob.label[7], "center", false)
policeJob.label[8] = guiCreateLabel(273, 170, 189, 15, "Select a Uniform", false, policeJob.window[1])
guiSetFont(policeJob.label[8], "default-bold-small")
guiLabelSetColor(policeJob.label[8], 30, 150, 255)
guiLabelSetHorizontalAlign(policeJob.label[8], "center", false)
policeJob.label[9] = guiCreateLabel(11, 269, 452, 15, "_______________________________________________________________________", false, policeJob.window[1])
policeJob.label[10] = guiCreateLabel(10, 292, 116, 15, "Police Bank Account:", false, policeJob.window[1])
guiSetFont(policeJob.label[10], "default-bold-small")
guiLabelSetColor(policeJob.label[10], 30, 150, 255)
policeJob.label[11] = guiCreateLabel(10, 323, 70, 15, "Police Rank:", false, policeJob.window[1])
guiSetFont(policeJob.label[11], "default-bold-small")
guiLabelSetColor(policeJob.label[11], 30, 150, 255)
policeJob.label[14] = guiCreateLabel(236, 292, 78, 15, "Arrest Points:", false, policeJob.window[1])
guiSetFont(policeJob.label[14], "default-bold-small")
guiLabelSetColor(policeJob.label[14], 30, 150, 255)
policeJob.label[15] = guiCreateLabel(236, 323, 78, 15, "Police Level:", false, policeJob.window[1])
guiSetFont(policeJob.label[15], "default-bold-small")
guiLabelSetColor(policeJob.label[15], 30, 150, 255)
guiLabelSetHorizontalAlign(policeJob.label[15], "right", false)
policeJob.label[18] = guiCreateLabel(11, 336, 452, 15, "_______________________________________________________________________", false, policeJob.window[1])
policeJob.label[19] = guiCreateLabel(164, 387, 144, 15, "Right-Click on Window to Close", false, policeJob.window[1])
guiSetFont(policeJob.label[19], "default-small")
guiLabelSetHorizontalAlign(policeJob.label[19], "center", false)
-- Labels (Dynamic)
policeJob.label[2] = guiCreateLabel(101, 28, 143, 15, "Select a Police Division", false, policeJob.window[1])
guiSetFont(policeJob.label[2], "clear-normal")
policeJob.label[4] = guiCreateLabel(307, 28, 155, 15, "Select a Uniform", false, policeJob.window[1])
guiSetFont(policeJob.label[4], "clear-normal")
policeJob.label[12] = guiCreateLabel(133, 292, 95, 15, "$...", false, policeJob.window[1])
guiSetFont(policeJob.label[12], "clear-normal")
guiLabelSetColor(policeJob.label[12], 25, 255, 25)
policeJob.label[13] = guiCreateLabel(87, 323, 143, 15, "Loading Police Rank...", false, policeJob.window[1])
guiSetFont(policeJob.label[13], "clear-normal")
policeJob.label[16] = guiCreateLabel(323, 292, 140, 15, "Loading AP...", false, policeJob.window[1])
guiSetFont(policeJob.label[16], "clear-normal")
policeJob.label[17] = guiCreateLabel(323, 323, 140, 15, "Loading Police Level...", false, policeJob.window[1])
guiSetFont(policeJob.label[17], "clear-normal")
-- Gridlists
policeJob.gridlist[1] = guiCreateGridList(12, 62, 256, 213, false, policeJob.window[1])
policeJob.gridlist[2] = guiCreateGridList(274, 81, 186, 85, false, policeJob.window[1])
guiGridListAddColumn(policeJob.gridlist[2], "Division", 0.9)
guiGridListSetSortingEnabled(policeJob.gridlist[2], false)
policeJob.gridlist[3] = guiCreateGridList(274, 189, 186, 85, false, policeJob.window[1])
guiGridListAddColumn(policeJob.gridlist[3], "Skin ID", 0.3)
guiGridListAddColumn(policeJob.gridlist[3], "Uniform Name", 0.55)
guiGridListSetSortingEnabled(policeJob.gridlist[3], false)
-- Buttons
policeJob.button[1] = guiCreateButton(167, 357, 133, 27, "Apply for Job", false, policeJob.window[1])
guiSetFont(policeJob.button[1], "default-bold-small")
guiSetProperty(policeJob.button[1], "NormalTextColour", "FFAAAAAA")
-- Scrollpane
policeJob.scrollpane[1] = guiCreateScrollPane(5, 5, 255, 212, false, policeJob.gridlist[1])
	-- Labels
	policeJob.label[6] = guiCreateLabel(0, 0, 226, 15, "", false, policeJob.scrollpane[1])
	guiLabelSetHorizontalAlign(policeJob.label[6], "left", true)
-- Visible
guiSetVisible(policeJob.window[1], false)

