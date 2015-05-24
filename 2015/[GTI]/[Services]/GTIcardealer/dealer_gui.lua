----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 30 Dec 2013
-- Resource: GTIcardealer/dealer_gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Car Dealership GUI
---------------------->>

carDealer = {gridlist = {}, window = {}, button = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 290, 419
local sX, sY, wX, wY = 10,sY-wY-10,wX,wY
-- sX, sY, wX, wY = 1065, 334, 290, 419
carDealer.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Car Dealership", false)
guiWindowSetSizable(carDealer.window[1], false)
guiSetAlpha(carDealer.window[1], 0.95)
-- Label
carDealer.label[1] = guiCreateLabel(6, 23, 276, 31, "Select a Vehicle from the list below. Cars you cannot afford are in red. Right click to close.", false, carDealer.window[1])
guiLabelSetHorizontalAlign(carDealer.label[1], "center", true)
-- Gridlist
carDealer.gridlist[1] = guiCreateGridList(9, 59, 272, 322, false, carDealer.window[1])
guiGridListAddColumn(carDealer.gridlist[1], "Vehicle Name", 0.6)
guiGridListAddColumn(carDealer.gridlist[1], "Cost", 0.25)
guiGridListSetSortingEnabled(carDealer.gridlist[1], false)
-- Button
carDealer.button[1] = guiCreateButton(108, 385, 73, 25, "Purchase", false, carDealer.window[1])
guiSetProperty(carDealer.button[1], "NormalTextColour", "FFAAAAAA")
-- Other
guiSetVisible(carDealer.window[1], false)

-- Sell Vehicle GUI
-------------------->>

vehicleSell = {gridlist = {}, window = {}, button = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 290, 379
local sX, sY, wX, wY = 10,sY-wY-10,wX,wY
-- sX, sY, wX, wY = 541, 234, 290, 379
vehicleSell.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Car Dealership — Sell Vehicle", false)
guiWindowSetSizable(vehicleSell.window[1], false)
guiSetAlpha(vehicleSell.window[1], 0.95)
-- Label
vehicleSell.label[1] = guiCreateLabel(7, 23, 275, 45, "Select a Vehicle Below that you wish to sell. Vehicle value decreases with damage, so make sure your car is fully repaired before selling", false, vehicleSell.window[1])
guiSetFont(vehicleSell.label[1], "default-bold-small")
guiLabelSetColor(vehicleSell.label[1], 200, 0, 255)
guiLabelSetHorizontalAlign(vehicleSell.label[1], "center", true)
-- Gridlist
vehicleSell.gridlist[1] = guiCreateGridList(9, 75, 272, 265, false, vehicleSell.window[1])
guiGridListAddColumn(vehicleSell.gridlist[1], "Vehicle Name", 0.45)
guiGridListAddColumn(vehicleSell.gridlist[1], "Value", 0.30)
guiGridListAddColumn(vehicleSell.gridlist[1], "Health", 0.15)
-- Buttons
vehicleSell.button[1] = guiCreateButton(51, 345, 89, 26, "Sell Vehicle", false, vehicleSell.window[1])
guiSetProperty(vehicleSell.button[1], "NormalTextColour", "FFAAAAAA")
vehicleSell.button[2] = guiCreateButton(146, 345, 89, 26, "Cancel Sell", false, vehicleSell.window[1])
guiSetProperty(vehicleSell.button[2], "NormalTextColour", "FFAAAAAA")
-- Other
guiSetVisible(vehicleSell.window[1], false)
