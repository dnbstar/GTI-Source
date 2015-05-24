----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 03 Dec 2013
-- Resource: GTIjobs/JobsGUI.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Jobs GUI
------------>>

jobs = {scrollpane = {},label = {},button = {},window = {},gridlist = {},col = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 296, 491
local sX, sY = 10, (sY-wY)-10
-- sX, sY, wX, wY = 524, 154, 296, 491
jobs.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Employment Panel", false)
guiWindowSetSizable(jobs.window[1], false)
guiSetAlpha(jobs.window[1], 0.95)
-- Labels (Static)
jobs.label[3] = guiCreateLabel(11, 42, 34, 15, "Rank:", false, jobs.window[1])
guiSetFont(jobs.label[3], "default-bold-small")
guiLabelSetColor(jobs.label[3], 255, 25, 25)
jobs.label[5] = guiCreateLabel(11, 66, 54, 15, "Progress:", false, jobs.window[1])
guiSetFont(jobs.label[5], "default-bold-small")
guiLabelSetColor(jobs.label[5], 255, 25, 25)
jobs.label[7] = guiCreateLabel(11, 85, 275, 15, "____________________________________________________", false, jobs.window[1])
-- Labels (Dynamic)
jobs.label[1] = guiCreateLabel(8, 22, 278, 15, "XXX Job", false, jobs.window[1])
guiSetFont(jobs.label[1], "clear-normal")
guiLabelSetColor(jobs.label[1], 255, 200, 0)
guiLabelSetHorizontalAlign(jobs.label[1], "center", false)
jobs.label[2] = guiCreateLabel(238, 42, 48, 15, "Level XX", false, jobs.window[1])
guiSetFont(jobs.label[2], "default-bold-small")
guiLabelSetColor(jobs.label[2], 255, 25, 25)
guiLabelSetHorizontalAlign(jobs.label[2], "right", false)
jobs.label[4] = guiCreateLabel(51, 42, 181, 15, "Rank Name", false, jobs.window[1])
jobs.label[6] = guiCreateLabel(70, 66, 216, 15, "XXX,XXX Units of Unit", false, jobs.window[1])
jobs.label[8] = guiCreateLabel(262, 23, 24, 15, "Close", false, jobs.window[1])
guiSetFont(jobs.label[8], "default-small")
-- Scrollpane
jobs.scrollpane[1] = guiCreateScrollPane(10, 107, 277, 236, false, jobs.window[1])
jobs.label[9] = guiCreateLabel(3, 2, 254, 231, "", false, jobs.scrollpane[1])
guiLabelSetHorizontalAlign(jobs.label[9], "left", true)
-- Gridlist
jobs.gridlist[1] = guiCreateGridList(9, 349, 278, 98, false, jobs.window[1])
guiGridListSetSortingEnabled(jobs.gridlist[1], false)
jobs.col[1] = guiGridListAddColumn(jobs.gridlist[1], "Skin ID", 0.4)
jobs.col[2] = guiGridListAddColumn(jobs.gridlist[1], "Skin Name", 0.4)
-- Button
jobs.button[1] = guiCreateButton(99, 453, 97, 29, "Take Job", false, jobs.window[1])
-- Other
guiSetVisible(jobs.window[1], false)

-- Mobile Job Panel
-------------------->>

jobmobile = {button = {},window = {},label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 321, 199
local sX, sY = 10, (sY/2)-(wY/2)
-- sX, sY, wX, wY = 14, 262, 321, 199
jobmobile.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Employment Panel", false)
guiWindowSetSizable(jobmobile.window[1], false)
guiSetAlpha(jobmobile.window[1], 0.95)
-- Labels (Static)
jobmobile.label[1] = guiCreateLabel(11, 29, 59, 15, "Job Name:", false, jobmobile.window[1])
guiSetFont(jobmobile.label[1], "default-bold-small")
guiLabelSetColor(jobmobile.label[1], 255, 25, 25)
jobmobile.label[3] = guiCreateLabel(9, 44, 303, 15, "_________________________________________________", false, jobmobile.window[1])
jobmobile.label[4] = guiCreateLabel(11, 72, 79, 15, "Current Rank:", false, jobmobile.window[1])
guiSetFont(jobmobile.label[4], "default-bold-small")
guiLabelSetColor(jobmobile.label[4], 255, 25, 25)
jobmobile.label[5] = guiCreateLabel(11, 97, 100, 15, "Current Progress:", false, jobmobile.window[1])
guiSetFont(jobmobile.label[5], "default-bold-small")
guiLabelSetColor(jobmobile.label[5], 255, 25, 25)
jobmobile.label[6] = guiCreateLabel(11, 124, 113, 15, "Progress for Promo:", false, jobmobile.window[1])
guiSetFont(jobmobile.label[6], "default-bold-small")
guiLabelSetColor(jobmobile.label[6], 255, 25, 25)
jobmobile.label[10] = guiCreateLabel(9, 140, 303, 15, "_________________________________________________", false, jobmobile.window[1])
jobmobile.label[12] = guiCreateLabel(287, 21, 24, 18, "Close", false, jobmobile.window[1])
guiSetFont(jobmobile.label[12], "default-small")
-- Labels (Dynamic)
jobmobile.label[2] = guiCreateLabel(78, 29, 231, 15, "<Insert Job Name Here>", false, jobmobile.window[1])
jobmobile.label[7] = guiCreateLabel(99, 72, 213, 15, "<Rank>", false, jobmobile.window[1])
jobmobile.label[8] = guiCreateLabel(121, 97, 190, 15, "XXX,XXX Units of Unit", false, jobmobile.window[1])
jobmobile.label[9] = guiCreateLabel(134, 124, 177, 15, "XXX,XXX Units of Unit", false, jobmobile.window[1])
jobmobile.label[11] = guiCreateLabel(263, 65, 48, 15, "Level XX", false, jobmobile.window[1])
guiSetFont(jobmobile.label[11], "default-bold-small")
guiLabelSetColor(jobmobile.label[11], 255, 25, 25)
-- Buttons
jobmobile.button[1] = guiCreateButton(83, 160, 67, 30, "End Shift", false, jobmobile.window[1])
jobmobile.button[2] = guiCreateButton(166, 160, 67, 31, "Resign", false, jobmobile.window[1])
-- Other
guiSetVisible(jobmobile.window[1], false)