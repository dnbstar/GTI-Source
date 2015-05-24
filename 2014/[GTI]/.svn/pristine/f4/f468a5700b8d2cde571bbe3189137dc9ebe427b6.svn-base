----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 29 Jan 2014
-- Resource: GTIprison/prison.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

addEvent("onClientPlayerJailed", true)

local prisonMatrix = {3150.794, 822.043, 1663.263, 3148.907, 823.386, 1662.638}

local jailTime				-- Storage of Remaining Jail Time
local RENDER_TIME = 5000	-- Render Time (ms)
local SCALE = 4				-- dxText Scale
local renderState			-- Render Timer

-- Display Busted Text
----------------------->>

function jailPlayer(jailT, tickCount)
	if (client ~= localPlayer) then return end
	local x,y,z, lx,ly,lz = prisonMatrix[1], prisonMatrix[2], prisonMatrix[3], prisonMatrix[4], prisonMatrix[5], prisonMatrix[6]
	setCameraMatrix(x,y,z, lx,ly,lz)
	
	renderState = setTimer(function(player)
		removeEventHandler("onClientRender", root, renderBustedText)
		renderState = nil
		setCameraTarget(player)
		setElementFrozen(player, false)
		addEventHandler("onClientRender", root, renderTimer)
	end, RENDER_TIME, 1, localPlayer)
	addEventHandler("onClientRender", root, renderBustedText)
	local jailTm = jailT - (getTickCount()-tickCount)
	jailTime = setTimer(function() end, jailTm, 1)
end
addEvent("GTIprison.jailPlayer", true)
addEventHandler("GTIprison.jailPlayer", root, jailPlayer)

function renderBustedText()
	if (not renderState or not isTimer(renderState)) then return end
	local sX,sY = guiGetScreenSize()
		-- Busted Shadow
	dxDrawText("Busted", sX+SCALE, sY+SCALE, sX+SCALE, sY+SCALE, tocolor(0,0,0,255), SCALE, "pricedown", "center", "center")
	dxDrawText("Busted", sX+SCALE, sY-SCALE, sX+SCALE, sY-SCALE, tocolor(0,0,0,255), SCALE, "pricedown", "center", "center")
	dxDrawText("Busted", sX-SCALE, sY+SCALE, sX-SCALE, sY+SCALE, tocolor(0,0,0,255), SCALE, "pricedown", "center", "center")
	dxDrawText("Busted", sX-SCALE, sY-SCALE, sX-SCALE, sY-SCALE, tocolor(0,0,0,255), SCALE, "pricedown", "center", "center")
		-- Busted Text
	dxDrawText("Busted", sX, sY, sX, sY, tocolor(50,200,255,255), SCALE, "pricedown", "center", "center")
end

function renderTimer()
	if (not jailTime or not isTimer(jailTime)) then 
		removeEventHandler("onClientRender", root, renderTimer)
	return end
	local timeLeft = getTimerDetails(jailTime)
	
	local hr = math.floor( timeLeft / (3600*1000) )
	timeLeft = timeLeft - (hr*3600*1000)
	local mt = math.floor( timeLeft / 60000 )
	timeLeft = timeLeft - (mt*60000)
	local sc = math.floor( timeLeft / 1000 )
	
	if (hr < 10) then hr = "0"..hr end
	if (mt < 10) then mt = "0"..mt end
	if (sc < 10) then sc = "0"..sc end
	
	local jTime = ""
	if (tonumber(hr) > 0) then
		jTime = hr..":"..mt..":"..sc
	else
		jTime = mt..":"..sc
	end
	
	exports.GTIhud:drawStat("jail", "Sentence", jTime, 50, 200, 255)
end
