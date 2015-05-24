----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 08 May 2014
-- Resource: GTIrentalUI/rental_gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

rentalGUI = {tab = {}, tabpanel = {}, label = {}, button = {}, window = {}, gridlist = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 492, 389
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 551, 242, 492, 389
rentalGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Employment Rental Kiosk", false)
guiWindowSetSizable(rentalGUI.window[1], false)
guiSetAlpha(rentalGUI.window[1], 0.90)
-- Visibility
guiSetVisible(rentalGUI.window[1], false)
-- Tab Panel
rentalGUI.tabpanel[1] = guiCreateTabPanel(9, 21, 472, 359, false, rentalGUI.window[1])

-- Vehicles Tab
---------------->>

-- Tab
rentalGUI.tab[1] = guiCreateTab("Vehicles", rentalGUI.tabpanel[1])
-- Gridlist
rentalGUI.gridlist[1] = guiCreateGridList(23, 20, 210, 292, false, rentalGUI.tab[1])
guiGridListAddColumn(rentalGUI.gridlist[1], "ID", 0.25)
guiGridListAddColumn(rentalGUI.gridlist[1], "Vehicle Name", 0.4)
guiGridListAddColumn(rentalGUI.gridlist[1], "Cost", 0.25)
guiGridListSetSortingEnabled(rentalGUI.gridlist[1], false)
-- Label (Static)
rentalGUI.label[1] = guiCreateLabel(250, 20, 202, 113, "Select a vehicle from the list that you would like to rent. Return your rented vehicle here when you are done with it.\n\n(Note: You will be charged for any damage that the vehicle has when you return it.)", false, rentalGUI.tab[1])
guiSetFont(rentalGUI.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[1], "center", true)
-- Label (Dynamic)
rentalGUI.label[2] = guiCreateLabel(251, 145, 199, 82, "This vehicle is restricted to the following groups:\nGroup A, Group B, Group C", false, rentalGUI.tab[1])
guiLabelSetHorizontalAlign(rentalGUI.label[2], "center", true)
-- Buttons
rentalGUI.button[1] = guiCreateButton(250, 238, 201, 45, "Rent Vehicle", false, rentalGUI.tab[1])
guiSetFont(rentalGUI.button[1], "default-bold-small")
guiSetProperty(rentalGUI.button[1], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[2] = guiCreateButton(250, 289, 99, 22, "Return Vehicle", false, rentalGUI.tab[1])
guiSetProperty(rentalGUI.button[2], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[3] = guiCreateButton(353, 289, 99, 22, "Cancel", false, rentalGUI.tab[1])
guiSetProperty(rentalGUI.button[3], "NormalTextColour", "FFAAAAAA")

-- Weapons Tab
--------------->>

-- Tab
rentalGUI.tab[2] = guiCreateTab("Weapons", rentalGUI.tabpanel[1])
-- Labels
rentalGUI.label[3] = guiCreateLabel(37, 18, 174, 15, "Weapons for Rent", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.label[3], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[3], "center", false)
rentalGUI.label[4] = guiCreateLabel(26, 223, 420, 85, "Select any Weapons or Tools that you would like to rent.\nWhen you check out a weapon, any current weapon that you have in that slot will be automatically deposited in this weapons safe.\n\nYour weapons will remain stored until you take them out.\nWeapons can be taken back at any rental kiosk.", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.label[4], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[4], "center", true)
rentalGUI.label[5] = guiCreateLabel(258, 18, 174, 15, "My Stored Weapons", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.label[5], "default-bold-small")
guiLabelSetHorizontalAlign(rentalGUI.label[5], "center", false)
-- Gridlist
rentalGUI.gridlist[2] = guiCreateGridList(25, 40, 200, 111, false, rentalGUI.tab[2])
guiGridListAddColumn(rentalGUI.gridlist[2], "Weapon Name", 0.4)
guiGridListAddColumn(rentalGUI.gridlist[2], "Ammo", 0.4)
guiGridListSetSortingEnabled(rentalGUI.gridlist[2], false)
rentalGUI.gridlist[3] = guiCreateGridList(245, 40, 200, 111, false, rentalGUI.tab[2])
guiGridListAddColumn(rentalGUI.gridlist[3], "Weapon Name", 0.4)
guiGridListAddColumn(rentalGUI.gridlist[3], "Ammo", 0.4)
guiGridListSetSortingEnabled(rentalGUI.gridlist[3], false)
-- Buttons
rentalGUI.button[4] = guiCreateButton(57, 159, 138, 31, "Exchange Weapon", false, rentalGUI.tab[2])
guiSetFont(rentalGUI.button[4], "default-bold-small")
guiSetProperty(rentalGUI.button[4], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[5] = guiCreateButton(277, 159, 138, 31, "Take Back Weapon", false, rentalGUI.tab[2])
guiSetProperty(rentalGUI.button[5], "NormalTextColour", "FFAAAAAA")
rentalGUI.button[6] = guiCreateButton(215, 166, 41, 18, "Close", false, rentalGUI.tab[2])
guiSetProperty(rentalGUI.button[6], "NormalTextColour", "FFAAAAAA")

-- Rental Mods
--------------->>

addEventHandler("onClientResourceStart", resourceRoot, function()
	local txd = engineLoadTXD("mods/icons4.txd")
	engineImportTXD(txd, 1277)
	local dff = engineLoadDFF("mods/pickupsave.dff")
	engineReplaceModel(dff, 1277)
end)
