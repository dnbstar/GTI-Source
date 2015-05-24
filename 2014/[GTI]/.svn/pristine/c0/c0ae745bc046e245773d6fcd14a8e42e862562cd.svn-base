----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 17 Mar 2014
-- Resource: GTIrentVehicle/gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

rentVehicle = {gridlist = {}, window = {}, button = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 487, 346
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 563, 272, 487, 346
rentVehicle.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Vehicle Rental", false)
guiWindowSetSizable(rentVehicle.window[1], false)
guiSetAlpha(rentVehicle.window[1], 0.95)
-- Gridlist
rentVehicle.gridlist[1] = guiCreateGridList(18, 33, 248, 293, false, rentVehicle.window[1])
guiGridListAddColumn(rentVehicle.gridlist[1], "ID", 0.2)
guiGridListAddColumn(rentVehicle.gridlist[1], "Vehicle Name", 0.7)
guiGridListSetSortingEnabled(rentVehicle.gridlist[1], false)
-- Label (Static)
rentVehicle.label[1] = guiCreateLabel(280, 33, 186, 110, "Select a vehicle that you would like to rent. Rented vehicles can be managed under the vehicles app on the GTIdroid.\n\nRenting a vehicle will replace any vehicle you currently have rented.", false, rentVehicle.window[1])
guiSetFont(rentVehicle.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(rentVehicle.label[1], "center", true)
-- Label (Dynamic)
rentVehicle.label[2] = guiCreateLabel(273, 160, 201, 89, "This vehicle is restricted to the following groups:\nGroup A, Group B, Group C", false, rentVehicle.window[1])
guiSetFont(rentVehicle.label[2], "clear-normal")
guiLabelSetHorizontalAlign(rentVehicle.label[2], "center", true)
-- Buttons
rentVehicle.button[1] = guiCreateButton(275, 258, 196, 40, "Rent Vehicle", false, rentVehicle.window[1])
guiSetFont(rentVehicle.button[1], "default-bold-small")
guiSetProperty(rentVehicle.button[1], "NormalTextColour", "FFAAAAAA")
rentVehicle.button[2] = guiCreateButton(275, 304, 196, 22, "Close Panel", false, rentVehicle.window[1])
guiSetProperty(rentVehicle.button[2], "NormalTextColour", "FFAAAAAA")
-- Visibility
guiSetVisible(rentVehicle.window[1], false)
