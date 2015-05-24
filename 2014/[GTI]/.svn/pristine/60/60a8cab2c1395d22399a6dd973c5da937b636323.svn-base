----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 01 Mar 2014
-- Resource: GTIcriminals/panel.lua
-- Type: Server Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Show Panel
-------------->>

local pInfo = {}
function showPanel(ranks)
	guiSetText(crimRep.label[10], "...")
	guiSetText(crimRep.label[11], "...")

	pInfo[1] = ranks["level"]
	pInfo[2] = ranks["rep"]
	pInfo[3] = (ranks["rep"]-ranks["repReqCur"])/(ranks["repReq"]-ranks["repReqCur"])
	pInfo[4] = exports.GTIutil:tocomma(ranks["repReq"])
	pInfo[5] = exports.GTIutil:tocomma(ranks["rep"])
	
	guiSetVisible(crimRep.window[1], true)
	showCursor(true)
end
addEvent("GTIcriminals.showPanel", true)
addEventHandler("GTIcriminals.showPanel", root, showPanel)

function togglePanel()
	if (getTeamName(getPlayerTeam(localPlayer)) ~= "Criminals") then return end
	if (not guiGetVisible(crimRep.window[1])) then
		triggerServerEvent("GTIcriminals.callPanelInfo", localPlayer)
	else
		guiSetVisible(crimRep.window[1], false)
		showCursor(false)
	end
end
bindKey("F5", "up", togglePanel)

-- Render Functions
-------------------->>

function renderDisplays()
	if (not guiGetVisible(crimRep.window[1])) then return end
	
	-- Level
	local wX,wY = guiGetPosition(crimRep.window[1], false)
	dxDrawText(pInfo[1], wX+96+10, wY+46-30, wX+96+10, wY+46-30, tocolor(255,25,25,255), 2, "bankgothic", "left", "top", false, false, true)
	-- Experience
	local exper = exports.GTIutil:tocomma(pInfo[2])
	dxDrawText(exper, wX+280, wY+52-30, wX+280, wY+52-30, tocolor(255,25,25,255), 3.25, "clear", "left", "top", false, false, true)
	-- Progress Bar
	local dX,dY,dW,dH = wX+20,wY+115-30,525+17,30
	dxDrawRectangle(dX, dY, dW, dH, tocolor(0,0,0,200), true)
	local dX,dY,dW,dH = wX+25,wY+120-30,515+17,20
	dxDrawRectangle(dX, dY, dW, dH, tocolor(125,12,12,200), true)
	dxDrawRectangle(dX, dY, pInfo[3]*dW, dH, tocolor(255,25,25,255), true)
	
	local dX,dY,dW,dH = wX+283+9,wY+130-30,wX+283+9,wY+130-30
	local textDisplay = pInfo[5].."/"..pInfo[4]
	dxDrawText(textDisplay, dX+1, dY, dW+1, dH, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
	dxDrawText(textDisplay, dX, dY+1, dW, dH+1, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
	dxDrawText(textDisplay, dX-1, dY, dW-1, dH, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
	dxDrawText(textDisplay, dX, dY-1, dW, dH-1, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
	dxDrawText(textDisplay, dX, dY, dW, dH, tocolor(255,255,255,255), 1, "default", "center", "center", false, false, true)
end
addEventHandler("onClientRender", root, renderDisplays)

-- Close Panel
--------------->>

function closePanel(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(crimRep.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", crimRep.label[16], closePanel, false)

addEventHandler("onClientMouseEnter", crimRep.label[16], function()
	guiLabelSetColor(source, 255, 100, 100)
end, false)

addEventHandler("onClientMouseLeave", crimRep.label[16], function()
	guiLabelSetColor(source, 255, 255, 255)
end, false)