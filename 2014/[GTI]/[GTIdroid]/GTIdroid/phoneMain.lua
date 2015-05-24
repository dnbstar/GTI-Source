----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 11 Dec 2013
-- Resource: CITphone/phoneMain.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

TRANSITION_TIME = 250

-- Show Phone
-------------->>

local renderTimer
function togglePhone()
	if (renderTimer and isTimer(renderTimer)) then return end
	renderTimer = setTimer(function() renderTimer = nil end, TRANSITION_TIME, 1)
	addEventHandler("onClientRender", root, renderPhoneTranistion)
	if (isCursorShowing()) then
		showCursor(false) 
	else
		showCursor(true)
	end
end
bindKey("b", "up", togglePhone)

local isShowing
addEvent("onGTIDroidClose", true)
function renderPhoneTranistion()
	if (not renderTimer) then
		removeEventHandler("onClientRender", root, renderPhoneTranistion)
		local pX,pY = guiGetPosition(GTIPhone, false)
		local sX,sY = guiGetScreenSize()
		if (isShowing) then
			guiSetPosition(GTIPhone, pX, sY+30, false)
			isShowing = false 
			triggerEvent("onGTIDroidClose", GTIPhone)
		else
			guiSetPosition(GTIPhone, pX, sY-610, false)
			isShowing = true 
		end
		return
	end
	
	local timeLeft = getTimerDetails(renderTimer)
	local sX,sY = guiGetScreenSize()
	local pX,pY = guiGetPosition(GTIPhone, false)
	if (not isShowing) then
		guiSetPosition(GTIPhone, pX, sY-(((TRANSITION_TIME-timeLeft)/TRANSITION_TIME)*640), false)
	else
		guiSetPosition(GTIPhone, pX, sY-((timeLeft/TRANSITION_TIME)*610)+(((TRANSITION_TIME-timeLeft)/TRANSITION_TIME)*40), false)
	end
end

-- Exports and Events
---------------------->>

addEvent("onGTIDroidClickBack", true)
function goBack(button, state)
	if (button ~= "left" or state ~= "up") then return end
	triggerEvent("onGTIDroidClickBack", GTIMenuBar)
end

function getGTIDroid()
	if (not isElement(GTIPhone)) then return false end
	return GTIPhone
end

function getGTIDroidMainMenu()
	if (not isElement(GTIWallpaper)) then return false end
	return GTIWallpaper
end

function getGTIDroidAppButton(appName)
	if (not Apps[appName] or not isElement(Apps[appName])) then return false end
	return Apps[appName]
end

function showMainMenu(bool)
	if (not isElement(GTIWallpaper)) then return false end
	if (not bool) then
		guiSetVisible(GTIWallpaper, false)
	else
		guiSetVisible(GTIWallpaper, true)
	end
	return true
end