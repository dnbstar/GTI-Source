----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 13 Dec 2013
-- Resource: CITphone/phoneGUI.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Images
---------->>

addEventHandler("onClientResourceStart", resourceRoot, function()

-- Phone Main
local sX,sY = guiGetScreenSize()
GTIPhone = guiCreateStaticImage(sX-321, sY+25, 311, 600, "images/GTIPhone.png", false)
GTIWallpaper = guiCreateStaticImage(17, 88, 278, 401, "images/bkgr_gold.png", false, GTIPhone)

-- Main Android Label
labelDroidVersion2 = guiCreateLabel(9+1, 8+1, 265, 25, "GTIdroid Version 0.1 Alpha", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelDroidVersion2, "center")
guiLabelSetVerticalAlign(labelDroidVersion2, "center")
guiLabelSetColor(labelDroidVersion2, 0, 0, 0)
guiSetAlpha(labelDroidVersion2, 0.5)
guiSetFont(labelDroidVersion2, "clear-normal")
labelDroidVersion = guiCreateLabel(9, 8, 265, 25, "GTIdroid Version 0.1 Alpha", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelDroidVersion, "center")
guiLabelSetVerticalAlign(labelDroidVersion, "center")
guiSetFont(labelDroidVersion, "clear-normal")

-- Menu Bar
GTIMenuBar = guiCreateStaticImage(18, 489, 276, 38, "images/MenuBar.png", false, GTIPhone)
--
addEventHandler("onClientGUIClick", GTIMenuBar, goBack, false)

-- Main Apps
------------->>

local x1, x2, x3, x4 = 0, 71, 142, 215
local y1, y2, y3, y4 = 48, 128, 203, 280
Apps = {}

-- Calculator
Apps["Calculator"] = guiCreateStaticImage(x1+12, y1+8, 40, 40, "images/Calculator.png", false, GTIWallpaper)
labelCalculator2 = guiCreateLabel(x1-1, y1+51, 67, 15, "Calculator", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelCalculator2, "center")
guiLabelSetColor(labelCalculator2, 0, 0, 0)
guiSetAlpha(labelCalculator2, 0.5)
labelCalculator = guiCreateLabel(x1-2, y1+50, 67, 15, "Calculator", false, GTIWallpaper)
guiLabelSetColor(labelCalculator, 255, 25, 25)
guiLabelSetHorizontalAlign(labelCalculator, "center")

-- Camera
Apps["Camera"] = guiCreateStaticImage(x2+12, y1+8, 40, 40, "images/Camera.png", false, GTIWallpaper)
labelCamera2 = guiCreateLabel(x2-1, y1+51, 67, 15, "Camera", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelCamera2, "center")
guiLabelSetColor(labelCamera2, 0, 0, 0)
guiSetAlpha(labelCamera2, 0.5)
labelCamera = guiCreateLabel(x2-2, y1+50, 67, 15, "Camera", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelCamera, "center")

-- Clock
Apps["Clock"] = guiCreateStaticImage(x3+12, y1+8, 40, 40, "images/Clock.png", false, GTIWallpaper)
labelClock2 = guiCreateLabel(x3-1, y1+51, 67, 15, "Clock", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelClock2, "center")
guiLabelSetColor(labelClock2, 0, 0, 0)
guiSetAlpha(labelClock2, 0.5)
labelClock = guiCreateLabel(x3-2, y1+50, 67, 15, "Clock", false, GTIWallpaper)
guiLabelSetColor(labelClock, 255, 25, 25)
guiLabelSetHorizontalAlign(labelClock, "center")

-- Gallery
Apps["Gallery"] = guiCreateStaticImage(x4+12, y1+8, 40, 40, "images/Gallery.png", false, GTIWallpaper)
labelGallery2 = guiCreateLabel(x4-1, y1+51, 67, 15, "Gallery", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelGallery2, "center")
guiLabelSetColor(labelGallery2, 0, 0, 0)
guiSetAlpha(labelGallery2, 0.5)
labelGallery = guiCreateLabel(x4-2, y1+50, 67, 15, "Gallery", false, GTIWallpaper)
guiLabelSetColor(labelGallery, 255, 25, 25)
guiLabelSetHorizontalAlign(labelGallery, "center")

-- Mail
Apps["Mail"] = guiCreateStaticImage(x1+12, y2+8, 40, 40, "images/Mail.png", false, GTIWallpaper)
labelMail2 = guiCreateLabel(x1-1, y2+51, 67, 15, "Mail", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelMail2, "center")
guiLabelSetColor(labelMail2, 0, 0, 0)
guiSetAlpha(labelMail2, 0.5)
labelMail = guiCreateLabel(x1-2, y2+50, 67, 15, "Mail", false, GTIWallpaper)
guiLabelSetColor(labelMail, 255, 25, 25)
guiLabelSetHorizontalAlign(labelMail, "center")

-- Maps
Apps["Maps"] = guiCreateStaticImage(x2+12, y2+8, 40, 40, "images/Maps.png", false, GTIWallpaper)
labelMaps2 = guiCreateLabel(x2-1, y2+51, 67, 15, "Maps", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelMaps2, "center")
guiLabelSetColor(labelMaps2, 0, 0, 0)
guiSetAlpha(labelMaps2, 0.5)
labelMaps = guiCreateLabel(x2-2, y2+50, 67, 15, "Maps", false, GTIWallpaper)
guiLabelSetColor(labelMaps, 255, 25, 25)
guiLabelSetHorizontalAlign(labelMaps, "center")

-- Music
Apps["Music"] = guiCreateStaticImage(x3+12, y2+8, 40, 40, "images/Music.png", false, GTIWallpaper)
labelMusic2 = guiCreateLabel(x3-1, y2+51, 67, 15, "Music", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelMusic2, "center")
guiLabelSetColor(labelMusic2, 0, 0, 0)
guiSetAlpha(labelMusic2, 0.5)
labelMusic = guiCreateLabel(x3-2, y2+50, 67, 15, "Music", false, GTIWallpaper)
guiLabelSetColor(labelMusic, 255, 25, 25)
guiLabelSetHorizontalAlign(labelMusic, "center")

-- Notes
Apps["Notes"] = guiCreateStaticImage(x4+12, y2+8, 40, 40, "images/Notes.png", false, GTIWallpaper)
labelNotes2 = guiCreateLabel(x4-1, y2+51, 67, 15, "Notes", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelNotes2, "center")
guiLabelSetColor(labelNotes2, 0, 0, 0)
guiSetAlpha(labelNotes2, 0.5)
labelNotes = guiCreateLabel(x4-2, y2+50, 67, 15, "Notes", false, GTIWallpaper)
guiLabelSetColor(labelNotes, 255, 25, 25)
guiLabelSetHorizontalAlign(labelNotes, "center")

-- Vehicles
Apps["Vehicles"] = guiCreateStaticImage(x1+12, y3+8, 40, 40, "images/Vehicles.png", false, GTIWallpaper)
labelVehicles2 = guiCreateLabel(x1-1, y3+51, 67, 15, "Vehicles", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelVehicles2, "center")
guiLabelSetColor(labelVehicles2, 0, 0, 0)
guiSetAlpha(labelVehicles2, 0.5)
labelVehicles = guiCreateLabel(x1-2, y3+50, 67, 15, "Vehicles", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelVehicles, "center")

-- Wallet
Apps["Wallet"] = guiCreateStaticImage(x2+12, y3+8, 40, 40, "images/Wallet.png", false, GTIWallpaper)
labelWallet2 = guiCreateLabel(x2-1, y3+51, 67, 15, "Wallet", false, GTIWallpaper)
guiLabelSetHorizontalAlign(labelWallet2, "center")
guiLabelSetColor(labelWallet2, 0, 0, 0)
guiSetAlpha(labelWallet2, 0.5)
labelWallet = guiCreateLabel(x2-2, y3+50, 67, 15, "Wallet", false, GTIWallpaper)
guiLabelSetColor(labelWallet, 255, 25, 25)
guiLabelSetHorizontalAlign(labelWallet, "center")

-- Dock Apps
------------->>

local y5 = 355

-- Phone
Apps["Phone"] = guiCreateStaticImage(x1+12, y5+2, 40, 40, "images/Phone.png", false, GTIWallpaper)

-- People
Apps["People"] = guiCreateStaticImage(x2+12, y5+2, 40, 40, "images/People.png", false, GTIWallpaper)

-- Messages
Apps["Messages"] = guiCreateStaticImage(x3+12, y5+2, 40, 40, "images/Messages.png", false, GTIWallpaper)

-- Settings
Apps["Settings"] = guiCreateStaticImage(x4+12, y5+2, 40, 40, "images/Settings.png", false, GTIWallpaper)

-- Trigger Update All Event
---------------------------->>

addEvent("onGTIPhoneCreate", true)
triggerEvent("onGTIPhoneCreate", root)

end)
