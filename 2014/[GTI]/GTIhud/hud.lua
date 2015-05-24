----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 08 Dec 2013
-- Resource: GTIhud/hud.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local sX,sY = guiGetScreenSize()
local xMulti = 1
local yMulti = 1
--[[
if (sY > 720) then
	xMulti = sY/720
	yMulti = sX/1080
end
--]]

local hudEnabled	-- Is the Hud Enabled?

-- Toggle HUD
-------------->>

local disabledHUD = {"health", "armour", "breath", "clock", "money", "weapon", "ammo", "vehicle_name", "area_name"}

function toggleCustomHUD()
	if (not hudEnabled) then
		for i,hud in ipairs(disabledHUD) do
			showPlayerHudComponent(hud, false)
		end
		hudEnabled = true
	else
		for i,hud in ipairs(disabledHUD) do
			showPlayerHudComponent(hud, true)
		end
		hudEnabled = nil
	end
end
addCommandHandler("hud", toggleCustomHUD)

-- Health
---------->>

local oxyOff = 0
local healthTimer = setTimer(function() end, 1000, 0)
function renderHealth()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	local health = getElementHealth(localPlayer)
	local maxHealth = getPedStat(localPlayer, 24)
	local maxHealth = (((maxHealth-569)/(1000-569))*100)+100
	local healthStat = health/maxHealth
	
	local r1,g1,b1, r2,g2,b2, a
	if (healthStat > 0.25) then
		r1,g1,b1 = 85,125,85
		r2,g2,b2 = 25,60,37
		a = 200
	else
		r1,g1,b1 = 200,100,105
		r2,g2,b2 = 80,40,40
		local aT = getTimerDetails(healthTimer)
		if (aT > 500) then
			a = (aT-500)/500*200
		else
			a = (500-aT)/500*200
		end
	end
	
	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-155,5,150,15
	local dX,dY,dW,dH = sX-155*xMulti, dY*yMulti, dW*xMulti, dH*yMulti
	dxDrawRectangle( dX,dY,dW,dH, tocolor(0,0,0,200) )
	local dX,dY,dW,dH = sX-152,8,144,9
	local dX,dY,dW,dH = sX-152*xMulti, dY*yMulti, dW*xMulti, dH*yMulti
	dxDrawRectangle( dX,dY,dW,dH, tocolor(r2,g2,b2,200) )
	dxDrawRectangle( dX+dW-(healthStat*dW),dY,healthStat*dW,dH, tocolor(r1,g1,b1,a) )
end
addEventHandler("onClientRender", root, renderHealth)

-- Armor
--------->>

function renderArmor()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	local armor = getPedArmor(localPlayer)
	local oxygen = getPedOxygenLevel(localPlayer)
	if (oxygen < 1000) then return end
	local armorStat = armor/100
	
	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-227,5,72,15
	local dX,dY,dW,dH = sX-227*xMulti, dY*yMulti, dW*xMulti, dH*yMulti
	dxDrawRectangle( dX,dY,dW,dH, tocolor(0,0,0,200) )
	local dX,dY,dW,dH = sX-224,8,69,9
	local dX,dY,dW,dH = sX-224*xMulti, dY*yMulti, dW*xMulti, dH*yMulti
	dxDrawRectangle( dX,dY,dW,dH, tocolor(20,60,80,200) )
	dxDrawRectangle( dX+dW-(armorStat*dW),dY,armorStat*dW,dH, tocolor(90,165,200,200) )
end
addEventHandler("onClientRender", root, renderArmor)

-- Oxygen
---------->>

function renderOxygenLevel()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	local oxygen = getPedOxygenLevel(localPlayer)
	if (oxygen >= 1000) then return end
	local oxygenStat = oxygen/1000
	
	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-227,5,72,15
	local dX,dY,dW,dH = sX-227*xMulti, dY*yMulti, dW*xMulti, dH*yMulti
	dxDrawRectangle( dX,dY,dW,dH, tocolor(0,0,0,200) )
	local dX,dY,dW,dH = sX-224,8,69,9
	local dX,dY,dW,dH = sX-224*xMulti, dY*yMulti, dW*xMulti, dH*yMulti
	dxDrawRectangle( dX,dY,dW,dH, tocolor(58,100,128,200) )
	dxDrawRectangle( dX+dW-(oxygenStat*dW),dY,oxygenStat*dW,dH, tocolor(145,205,240,200) )
end
addEventHandler("onClientRender", root, renderOxygenLevel)

-- Ping/FPS Meter
------------------>>

local FPScount = 0
local ping = 0
local fps = 0
function updatePingAndFPS()
	ping = getPlayerPing(localPlayer)
	fps = FPScount
	FPScount = 0
end
setTimer(updatePingAndFPS, 1000, 0)

function renderFPSandPing()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	FPScount = FPScount + 1
	
	if (not ping or not fps) then return end
	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-5,20,sX-5,20
	local dX,dY,dW,dH = sX-5*xMulti, dY*yMulti, dW-5*xMulti, dH*yMulti
	local ix, iy = 1*xMulti, 1*yMulti
	dxDrawText("Ping: "..ping.." | FPS: "..fps, dX+ix,dY,dW+ix,dH, tocolor(0,0,0,100), 1*xMulti, "clear", "right", "top")
	dxDrawText("Ping: "..ping.." | FPS: "..fps, dX,dY+iy,dW,dH+iy, tocolor(0,0,0,100), 1*xMulti, "clear", "right", "top")
	dxDrawText("Ping: "..ping.." | FPS: "..fps, dX,dY,dW,dH, tocolor(255,255,255,255), 1*xMulti, "clear", "right", "top")
end
addEventHandler("onClientRender", root, renderFPSandPing)

-- Game Time
------------->>

function renderGameTime()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	local hrs,mins = getTime()
	local ampm = "am"
	if (hrs >= 12) then ampm = "pm" end
	if (hrs == 0) then hrs = 12 end
	if (hrs > 12) then hrs = hrs - 12 end
	if (hrs < 10) then hrs = "0"..hrs end
	if (mins < 10) then mins = "0"..mins end
	
	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-227,20,sX-227+75,20
	dxDrawText(hrs..":"..mins.." "..ampm, dX+1,dY,dW+1,dH, tocolor(0,0,0,100), 1, "clear", "center")
	dxDrawText(hrs..":"..mins.." "..ampm, dX,dY+1,dW,dH+1, tocolor(0,0,0,100), 1, "clear", "center")
	dxDrawText(hrs..":"..mins.." "..ampm, dX,dY,dW,dH, tocolor(255,255,255,255), 1, "clear", "center")
end
addEventHandler("onClientRender", root, renderGameTime)

-- Money
--------->>

local moneyY = 0
function renderMoney()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	local cash = getPlayerMoney()
	cash = exports.GTIutil:tocomma(cash)
	
	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-6,35+moneyY,sX-6,30
	dxDrawText("$"..cash, dX+2,dY,dW+2,dH, tocolor(0,0,0,255), 1.35, "pricedown", "right")
	dxDrawText("$"..cash, dX,dY+2,dW,dH+2, tocolor(0,0,0,255), 1.35, "pricedown", "right")
	dxDrawText("$"..cash, dX-2,dY,dW-2,dH, tocolor(0,0,0,255), 1.35, "pricedown", "right")
	dxDrawText("$"..cash, dX,dY-2,dW,dH-2, tocolor(0,0,0,255), 1.35, "pricedown", "right")
	dxDrawText("$"..cash, dX,dY,dW,dH, tocolor(220,220,220,255), 1.35, "pricedown", "right")
end
addEventHandler("onClientRender", root, renderMoney)

-- Show +/- Money
------------------>>

local cashAmt = 0
local r,g,b = 0,0,0
local pmTimer
local pm = ""
function showPlusMoney(amount)
	cashAmt = cashAmt + amount
	mr,mg,mb = 110,150,125
	pm = "+"
	if (isTimer(pmTimer)) then killTimer(pmTimer) pmTimer = nil end
	pmTimer = setTimer(function() cashAmt = 0 pmTimer = nil end, 5000, 1)
end
addEventHandler("onClientPlayerGiveMoney", localPlayer, showPlusMoney)

function showMinusMoney(amount)
	cashAmt = cashAmt + amount
	mr,mg,mb = 180,80,90
	pm = "-"
	if (isTimer(pmTimer)) then killTimer(pmTimer) pmTimer = nil end
	pmTimer = setTimer(function() cashAmt = 0 pmTimer = nil end, 5000, 1)
end
addEventHandler("onClientPlayerTakeMoney", localPlayer, showMinusMoney)

local monA = 0
function renderPlusMinusMoney()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	if (cashAmt == 0 or not pmTimer) then return end
	local cash = exports.GTIutil:tocomma(cashAmt)
	
	local timeLeft = getTimerDetails(pmTimer)
	if (timeLeft > 4750) then
		monA = ((5000-timeLeft)/250) * 255
	elseif (timeLeft < 250) then
		monA = (timeLeft/250) * 255
	end
	
	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-6,70+moneyY,sX-6,30
	dxDrawText(pm.."$"..cash, dX+2,dY,dW+2,dH, tocolor(0,0,0,monA), 1.25, "pricedown", "right")
	dxDrawText(pm.."$"..cash, dX,dY+2,dW,dH+2, tocolor(0,0,0,monA), 1.25, "pricedown", "right")
	dxDrawText(pm.."$"..cash, dX-2,dY,dW-2,dH, tocolor(0,0,0,monA), 1.25, "pricedown", "right")
	dxDrawText(pm.."$"..cash, dX,dY-2,dW,dH-2, tocolor(0,0,0,monA), 1.25, "pricedown", "right")
	dxDrawText(pm.."$"..cash, dX,dY,dW,dH, tocolor(mr,mg,mb,monA), 1.25, "pricedown", "right")
end
addEventHandler("onClientRender", root, renderPlusMinusMoney)

-- Weapons
----------->>

function renderWeapons()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	local weapon = getPedWeapon(localPlayer)
	local clip = getPedAmmoInClip(localPlayer)
	local ammo = getPedTotalAmmo(localPlayer)
	if (weapon == 0 or weapon == 1 or ammo == 0) then moneyY = 0 return end
	moneyY = 35
		
	local len = #tostring(clip)
	if string.find(tostring(clip), 1) then len = len - 0.5 end
	local xoff = (len*17) + 10
	
	local len2 = #tostring(ammo-clip)
	if string.find(tostring(ammo-clip), 1) then len2 = len2 - 0.5 end
	local weapLen = ((len+len2)*17) + 20

	local sX,sY = guiGetScreenSize()
	local dX,dY,dW,dH = sX-6-xoff,35,sX-6-xoff,30
	dxDrawText(ammo-clip, dX+2-xoff,dY,dW+2,dH, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(ammo-clip, dX,dY+2,dW,dH+2, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(ammo-clip, dX-2,dY,dW-2,dH, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(ammo-clip, dX,dY-2,dW,dH-2, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(ammo-clip, dX,dY,dW,dH, tocolor(220,220,220,255), 1.25, "pricedown", "right")
	
	local dX,dY,dW,dH = sX-6,35,sX-6,30
	dxDrawText(clip, dX+2,dY,dW+2,dH, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(clip, dX,dY+2,dW,dH+2, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(clip, dX-2,dY,dW-2,dH, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(clip, dX,dY-2,dW,dH-2, tocolor(0,0,0,255), 1.25, "pricedown", "right")
	dxDrawText(clip, dX,dY,dW,dH, tocolor(110,110,110,255), 1.25, "pricedown", "right")
	--[[
	local weapName = getWeaponNameFromID(weapon)
	local dX,dY,dW,dH = sX-6,110,sX-6,125
	dxDrawText(weapName, dX+1,dY,dW+1,dH, tocolor(0,0,0,100), 1, "clear", "right")
	dxDrawText(weapName, dX,dY+1,dW,dH+1, tocolor(0,0,0,100), 1, "clear", "right")
	dxDrawText(weapName, dX,dY,dW,dH, tocolor(255,255,255,255), 1, "clear", "right")
	--]]
	if (weapon == 0 or weapon == 1) then return end
	local img = "weaps/"..weapon..".png"
	local dX,dY,dW,dH = sX-133-weapLen,35,128,40
	dxDrawImage(dX, dY, dW, dH, img)	
end
addEventHandler("onClientRender", root, renderWeapons)

-- Location Data
----------------->>

local locFont = "default"
local locFont = dxCreateFont("fonts/locfont.ttf", 20)

local zoneText
local transitionInProgress
local sA, mA = 0, 0
local vehY = 0
function renderNewLocation()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	local x,y,z = getElementPosition(localPlayer)
	local zone = getZoneName(x, y, z)
	if (zone == "Unknown") then zone = "San Andreas" end
	
	if (zoneText ~= zone and not transitionInProgress) then
		vehY = 60
		zoneText = zone
		timer = setTimer(function() sA, mA = 125, 255 end, 1000, 1)
		addEventHandler("onClientRender", root, renderLocationTransition)
		transitionInProgress = true
	end
	
	if (not transitionInProgress) then
		if (not zoneText) then zoneText = zone end
	end
	
	local sX, sY = guiGetScreenSize()
	local dX,dY = (185/1366)*sX, sY-((195/768)*sY)-12
	dxDrawText(zoneText, dX+2, dY, dX+2, dY, tocolor(0,0,0,sA), 1, locFont, "center", "center")
	dxDrawText(zoneText, dX, dY+2, dX, dY+2, tocolor(0,0,0,sA), 1, locFont, "center", "center")
	dxDrawText(zoneText, dX, dY, dX, dY, tocolor(255,255,255,mA), 1, locFont, "center", "center")
end
addEventHandler("onClientRender", root, renderNewLocation)

function renderLocationTransition()
	if (sA == 125 or mA == 255) then
		removeEventHandler("onClientRender", root, renderLocationTransition)
		setTimer(function()
			timer2 = setTimer(function() sA, mA = 0, 0 end, 1000, 1)
			addEventHandler("onClientRender", root, renderLocationTransition2)
		end, 3000, 1)
	end
	if isTimer(timer) then
		local timeLeft = getTimerDetails(timer)
		sA = ((1000-timeLeft)/1000)*125
		mA = ((1000-timeLeft)/1000)*255
	end
end

function renderLocationTransition2()
	if (sA == 0 or mA == 0) then
		removeEventHandler("onClientRender", root, renderLocationTransition2)
		transitionInProgress = false
		vehY = 0
	end
	if isTimer(timer2) then
		local timeLeft = getTimerDetails(timer2)
		sA = (timeLeft/1000)*125
		mA = (timeLeft/1000)*255
	end
end

-- Vehicle Data
---------------->>

local vehName = ""
local vehType = ""
local entered
local vehicleName = ""
local vehicleType = ""
addEventHandler("onClientPlayerVehicleEnter", localPlayer, function(vehicle)
	local vehicle = getPedOccupiedVehicle(localPlayer)
	vehName = getVehicleName(vehicle)
	vehType = getVehicleType(vehicle)
	vehicleName = vehName
	vehicleType = vehType
end)

addEventHandler("onClientPlayerVehicleExit", localPlayer, function()
	entered = false
	vehName = ""
	vehType = ""
end)	

local vehTransitionInProgress
local vsA, vmA = 0, 0
function renderVehicleName()
	if (not isPlayerHudComponentVisible("radar") or isPlayerMapVisible() or not hudEnabled) then return end
	
	if (not entered and vehicleName ~= "" and not vehTransitionInProgress) then
		entered = true
		vehTimer = setTimer(function() vsA, vmA = 125, 255 end, 1000, 1)
		addEventHandler("onClientRender", root, renderVehicleNameTransition)
		vehTransitionInProgress = true
	end
	
	local sX, sY = guiGetScreenSize()
	local dX,dY = (185/1366)*sX, sY-((195/768)*sY)-12
	if (vehicleName == "") then return end
	local vehNameText = vehicleName..", "..vehicleType.."s"
	dxDrawText(vehNameText, dX+2, dY-vehY, dX+2, dY, tocolor(0,0,0,vsA), 1, locFont, "center", "center")
	dxDrawText(vehNameText, dX, dY+2-vehY, dX, dY+2, tocolor(0,0,0,vsA), 1, locFont, "center", "center")
	dxDrawText(vehNameText, dX, dY-vehY, dX, dY, tocolor(255,255,255,vmA), 1, locFont, "center", "center")
end
addEventHandler("onClientRender", root, renderVehicleName)

function renderVehicleNameTransition()
	if (vsA == 125 or vmA == 255) then
		removeEventHandler("onClientRender", root, renderVehicleNameTransition)
		setTimer(function()
			vehTimer2 = setTimer(function() vsA, vmA = 0, 0 end, 1000, 1)
			addEventHandler("onClientRender", root, renderVehicleNameTransition2)
		end, 3000, 1)
	end
	if isTimer(vehTimer) then
		local timeLeft = getTimerDetails(vehTimer)
		vsA = ((1000-timeLeft)/1000)*125
		vmA = ((1000-timeLeft)/1000)*255
	end
end

function renderVehicleNameTransition2()
	if (vsA == 0 or vmA == 0) then
		removeEventHandler("onClientRender", root, renderVehicleNameTransition2)
		vehTransitionInProgress = false
		vehicleName = ""
		vehicleType = ""
	end
	if isTimer(vehTimer2) then
		local timeLeft = getTimerDetails(vehTimer2)
		vsA = (timeLeft/1000)*125
		vmA = (timeLeft/1000)*255
	end
end