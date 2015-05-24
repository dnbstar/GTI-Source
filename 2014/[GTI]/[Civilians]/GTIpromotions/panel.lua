----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 19 Dec 2013
-- Resource: GTIpromotions/panel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local RADIOBUTTON_FREEZE = 1000

local pInfo = {}
function showPanel(ranks)
	-- Current Job
	guiSetText(promoGUI.label[2], ranks["job"])
	guiSetText(promoGUI.label[7], "Level "..ranks["level"])
	guiSetText(promoGUI.label[9], ranks["rank"])
	guiSetText(promoGUI.label[13], exports.GTIutil:tocomma(ranks["prog"]).." "..ranks["unit"])
	guiSetText(promoGUI.label[12], exports.GTIutil:tocomma(ranks["req"]).." "..ranks["unit"])
	guiSetText(promoGUI.label[17], exports.GTIutil:tocomma(ranks["jobexp"]).." Exp. Points")
	guiSetText(promoGUI.label[18], "$"..exports.GTIutil:tocomma(ranks["money"]))
		-- Job Description Scroll Length
	local desc = ranks["desc"].."\n\n-- Job Ranks:"
	desc = desc.."\nLevel 0: "..ranks["ranks"][0].name
	for lvl,tbl in ipairs(ranks["ranks"]) do
		desc = desc.."\nLevel "..lvl..": "..tbl.name
	end
	local sx,sy = guiGetSize(promoGUI.label[38], false)
	local len = math.ceil(#ranks["desc"]/(sy/7))
	local pos = 0
	while true do
		local sPos,ePos = string.find(desc,"\n",pos)
		if (not sPos) then break end
		pos,len = sPos+1, len+1
	end
	local sx,sy = guiGetSize(promoGUI.label[38], false)
	guiSetSize(promoGUI.label[38], sx, len*15, false)
	guiSetText(promoGUI.label[38], desc)
		-- Payment Method
	if (ranks["payMeth"] ~= 1) then
		guiRadioButtonSetSelected(promoGUI.radiobutton[1], true)
	else
		guiRadioButtonSetSelected(promoGUI.radiobutton[2], true)
	end
	
	-- All Jobs
	pInfo[1] = ranks["civlvl"]
	pInfo[2] = ranks["civexp"]
	pInfo[3] = (ranks["civexp"]-ranks["lvlxpcur"])/(ranks["lvlxpnxt"]-ranks["lvlxpcur"])
	pInfo[4] = exports.GTIutil:tocomma(ranks["lvlxpnxt"])
	pInfo[5] = exports.GTIutil:tocomma(ranks["civexp"])
	guiGridListClear(promoGUI.gridlist[1])
	for i,job in ipairs(ranks["jobList"]) do
		local row = guiGridListAddRow(promoGUI.gridlist[1])
		guiGridListSetItemText(promoGUI.gridlist[1], row, 1, job, false, false)
		if (job == ranks["job"]) then
			guiGridListSetSelectedItem(promoGUI.gridlist[1], row, 1)
		end
	end
	guiSetText(promoGUI.label[29], "Level "..ranks["level"])
	guiSetText(promoGUI.label[34], ranks["rank"])
	guiSetText(promoGUI.label[36], exports.GTIutil:tocomma(ranks["prog"]).." "..ranks["unit"])
	guiSetText(promoGUI.label[35], exports.GTIutil:tocomma(ranks["req"]).." "..ranks["unit"])
	guiSetText(promoGUI.memo[1], desc)
		
	guiSetVisible(promoGUI.window[1], true)
	showCursor(true)
end
addEvent("GTIpromotions.showPanel", true)
addEventHandler("GTIpromotions.showPanel", root, showPanel)

function togglePanel()
	if (not guiGetVisible(promoGUI.window[1])) then
		triggerServerEvent("GTIpromotions.callPanelInfo", localPlayer)
	else
		guiSetVisible(promoGUI.window[1], false)
		showCursor(false)
	end
end
bindKey("F5", "up", togglePanel)

-- Render Functions
-------------------->>

function renderDisplays()
	if (not guiGetVisible(promoGUI.window[1])) then return end
	
	if (guiGetSelectedTab(promoGUI.tabpanel[1]) == promoGUI.tab[1]) then
		local wX,wY = guiGetPosition(promoGUI.window[1], false)
		dxDrawLine(wX+315,wY+58,wX+315,wY+385,tocolor(255,255,255,255),1,true)
	elseif (guiGetSelectedTab(promoGUI.tabpanel[1]) == promoGUI.tab[2]) then
		-- Level
		local wX,wY = guiGetPosition(promoGUI.window[1], false)
		dxDrawText(pInfo[1], wX+96, wY+46, wX+96, wY+46, tocolor(255,200,0,255), 2, "bankgothic", "left", "top", false, false, true)
		-- Experience
		local exper = exports.GTIutil:tocomma(pInfo[2])
		dxDrawText(exper, wX+280, wY+52, wX+280, wY+52, tocolor(255,200,0,255), 3.25, "clear", "left", "top", false, false, true)
		dxDrawLine(wX+247,wY+158,wX+247,wY+385,tocolor(255,255,255,255),1,true)
		-- Progress Bar
		local dX,dY,dW,dH = wX+20,wY+115,525,30
		dxDrawRectangle(dX, dY, dW, dH, tocolor(0,0,0,200), true)
		local dX,dY,dW,dH = wX+25,wY+120,515,20
		dxDrawRectangle(dX, dY, dW, dH, tocolor(85,67,0,200), true)
		dxDrawRectangle(dX, dY, pInfo[3]*dW, dH, tocolor(255,200,0,255), true)
		
		local dX,dY,dW,dH = wX+283,wY+130,wX+283,wY+130
		local textDisplay = pInfo[5].."/"..pInfo[4]
		dxDrawText(textDisplay, dX+1, dY, dW+1, dH, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
		dxDrawText(textDisplay, dX, dY+1, dW, dH+1, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
		dxDrawText(textDisplay, dX-1, dY, dW-1, dH, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
		dxDrawText(textDisplay, dX, dY-1, dW, dH-1, tocolor(0,0,0,255), 1, "default", "center", "center", false, false, true)
		dxDrawText(textDisplay, dX, dY, dW, dH, tocolor(255,255,255,255), 1, "default", "center", "center", false, false, true)
	end
end
addEventHandler("onClientRender", root, renderDisplays)

-- Toggle Shift and Resign
--------------------------->>

function toggleShiftAndResign(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (source == promoGUI.button[1]) then
		triggerServerEvent("GTIjobs.togglePlayerShift", localPlayer)
	elseif (source == promoGUI.button[2]) then
		triggerServerEvent("GTIjobs.resign", localPlayer)
	end
end
addEventHandler("onClientGUIClick", promoGUI.button[1], toggleShiftAndResign, false)
addEventHandler("onClientGUIClick", promoGUI.button[2], toggleShiftAndResign, false)

function modShiftText(text)
	guiSetText(promoGUI.button[1], text)
	guiSetVisible(promoGUI.window[1], false)
	showCursor(false)
end
addEvent("GTIpromotions.modShiftText", true)
addEventHandler("GTIpromotions.modShiftText", root, modShiftText)

-- Update Preferred Payment Method
----------------------------------->>

function updatePaymentMethod(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local toBank = guiRadioButtonGetSelected(promoGUI.radiobutton[1])
	local method = 1
	if (toBank) then method = 2 end
	triggerServerEvent("GTIpromotions.updatePaymentMethod", localPlayer, method)
	guiSetEnabled(promoGUI.radiobutton[1], false)
	setTimer(guiSetEnabled, RADIOBUTTON_FREEZE, 1, promoGUI.radiobutton[1], true)
	guiSetEnabled(promoGUI.radiobutton[2], false)
	setTimer(guiSetEnabled, RADIOBUTTON_FREEZE, 1, promoGUI.radiobutton[2], true)
end
addEventHandler("onClientGUIClick", promoGUI.radiobutton[1], updatePaymentMethod, false)
addEventHandler("onClientGUIClick", promoGUI.radiobutton[2], updatePaymentMethod, false)
