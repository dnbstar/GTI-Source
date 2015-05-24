----------------------------------------->>
-- GTI: Grand Theft International
-- Author: JT Pennington (JTPenn)
-- Date: 21 Nov 2014
-- Resource: GTIammu/ammu_gui.lua
-- Version: 1.0
----------------------------------------->>

-- Main Panel
-------------->>

ammuGUI = {image = {}, staticimage = {}, label = {}, button = {}, window = {}, scrollpane = {}, combobox = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 590, 180-19
local sX, sY, wX, wY = (sX/2)-(wX/2),sY-wY-15,wX,wY
-- sX, sY, wX, wY = 528, 711, 590, 180
--ammuGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Ammu-Nation Weapons Store", false)
--guiWindowSetSizable(ammuGUI.window[1], false)
ammuGUI.window[1] = guiCreateStaticImage(sX, sY, wX, wY, "files/window.png", false)
guiSetVisible(ammuGUI.window[1], false)
-- Scrollpane
ammuGUI.scrollpane[1] = guiCreateScrollPane(190+2, 23-19+4, 392, 146, false, ammuGUI.window[1])
	-- Static Image
	ammuGUI.staticimage[1] = guiCreateStaticImage(31, 5, 64, 64, "weapons/22.png", false, ammuGUI.scrollpane[1])
	-- Labels
	ammuGUI.label[1] = guiCreateLabel(7, 71, 114, 15, "Pistol", false, ammuGUI.scrollpane[1])
	guiSetFont(ammuGUI.label[1], "default-bold-small")
	guiLabelSetColor(ammuGUI.label[1], 231, 237, 233)
	guiLabelSetHorizontalAlign(ammuGUI.label[1], "center", false)
	-- Buttons
	ammuGUI.button[1] = guiCreateButton(10, 88, 106, 39, "Buy Weapon\n$9,999,999", false, ammuGUI.scrollpane[1])
-- Combobox
ammuGUI.combobox[1] = guiCreateComboBox(9, 46-19, 173, 22, "", false, ammuGUI.window[1])
-- Labels
ammuGUI.label[3] = guiCreateLabel(12, 26-19, 168, 15, "Weapons Category", false, ammuGUI.window[1])
guiSetFont(ammuGUI.label[3], "default-bold-small")
guiLabelSetHorizontalAlign(ammuGUI.label[3], "center", false)
--[[ammuGUI.label[4] = guiCreateLabel(185, 23-19, 15, 142, "|  |  |  |  |  |  |  |  |  |  |  |  |  |  ", false, ammuGUI.window[1])
guiLabelSetHorizontalAlign(ammuGUI.label[4], "left", true)
ammuGUI.label[5] = guiCreateLabel(185, 30-19, 15, 142, "|  |  |  |  |  |  |  |  |  |  |  |  |  |  ", false, ammuGUI.window[1])
guiLabelSetHorizontalAlign(ammuGUI.label[5], "left", true)--]]
-- Static Images
--ammuGUI.image[1] = guiCreateStaticImage(31, 78, 128, 60, "files/Ammu-Nation.png", false, ammuGUI.window[1])
-- Buttons
ammuGUI.button[2] = guiCreateButton(47+2, 149-19, 95, 20, "Leave", false, ammuGUI.window[1])

-- Buy Weapon
-------------->>

ammuWeapGUI = {button = {}, window = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 277, 80
local sX, sY, wX, wY = (sX/2)-(wX/2),sY-wY-176,wX,wY
-- sX, sY, wX, wY = 663, 348, 277, 100
--ammuWeapGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Ammu-Nation — Buy Weapon", false)
ammuWeapGUI.window[1] = guiCreateStaticImage(sX, sY, wX, wY, "files/buy_weapon.png", false)
--guiWindowSetSizable(ammuWeapGUI.window[1], false)
--guiSetAlpha(ammuWeapGUI.window[1], 0.90)
guiSetVisible(ammuWeapGUI.window[1], false)
-- Label
ammuWeapGUI.label[1] = guiCreateLabel(16, 32-19, 244, 15, "Are you sure you want to buy this weapon?", false, ammuWeapGUI.window[1])
guiLabelSetHorizontalAlign(ammuWeapGUI.label[1], "center", false)
-- Buttons
ammuWeapGUI.button[1] = guiCreateButton(70, 57-19, 63, 24, "Yes", false, ammuWeapGUI.window[1])
ammuWeapGUI.button[2] = guiCreateButton(144, 57-19, 63, 24, "No", false, ammuWeapGUI.window[1])

-- Buy Ammunition
------------------>>

buyAmmoGUI = {button = {}, window = {}, edit = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 335, 145+30-19
local sX, sY, wX, wY = (sX/2)-(wX/2),sY-wY-176,wX,wY
-- sX, sY, wX, wY = 638, 321, 335, 145
--buyAmmoGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Ammu-Nation — Buy Ammunition", false)
buyAmmoGUI.window[1] = guiCreateStaticImage(sX, sY, wX, wY, "files/buy_ammo.png", false)
--guiWindowSetSizable(buyAmmoGUI.window[1], false)
--guiSetAlpha(buyAmmoGUI.window[1], 0.90)
guiSetVisible(buyAmmoGUI.window[1], false)
-- Labels
buyAmmoGUI.label[1] = guiCreateLabel(25, 30-19, 284, 16, "Enter the number of X you wish to purchase", false, buyAmmoGUI.window[1])
buyAmmoGUI.label[2] = guiCreateLabel(18, 82-19, 299, 15, "Total Cost: $1,000,000,000 | Bullets: 9999", false, buyAmmoGUI.window[1])
guiSetFont(buyAmmoGUI.label[2], "default-bold-small")
guiLabelSetColor(buyAmmoGUI.label[2], 25, 255, 25)
guiLabelSetHorizontalAlign(buyAmmoGUI.label[2], "center", false)
-- Edit
buyAmmoGUI.edit[1] = guiCreateEdit(100, 52-19, 135, 24, "", false, buyAmmoGUI.window[1])
-- Buttons
buyAmmoGUI.button[1] = guiCreateButton(81, 103-1-19, 79, 25, "Buy", false, buyAmmoGUI.window[1])
buyAmmoGUI.button[2] = guiCreateButton(174+1, 103-1-19, 79, 25, "Cancel", false, buyAmmoGUI.window[1])
buyAmmoGUI.button[3] = guiCreateButton(81, 133-19+1, 172+1, 25+1, "Switch to Weapon", false, buyAmmoGUI.window[1])
