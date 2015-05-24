----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 02 Jan 2014
-- Resource: GTIbank/atms.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Login to ATM
---------------->>

function showATM(balance, limit)
	guiSetText(atmGUI.label[2], "$"..exports.GTIutil:tocomma(balance))
	guiSetText(atmGUI.label[8], "Limit: $"..exports.GTIutil:tocomma(limit))
	guiSetVisible(atmGUI.window[1], true)
	showCursor(true)
end
addEvent("GTIbank.showATM", true)
addEventHandler("GTIbank.showATM", root, showATM)

function withdrawCashATM(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local pin = guiGetText(atmGUI.edit[1])
	if (pin == "" or not tonumber(pin)) then
		exports.GTIhud:dm("Please enter a valid 4-10 digit pin number.", 255, 125, 0)
		return
	end
	local cash = guiGetText(atmGUI.edit[2])
	if (cash == "" or not tonumber(cash) or tonumber(cash) <= 0) then
		exports.GTIhud:dm("Please enter a valid cash amount.", 255, 125, 0)
		return
	end
	triggerServerEvent("GTIbank.withdrawCashATM", localPlayer, pin, math.floor( tonumber(cash) ))
end
addEventHandler("onClientGUIClick", atmGUI.button[1], withdrawCashATM, false)

function withdrawATMCashOnEnter()
	withdrawCash("left", "up")
end
addEventHandler("onClientGUIAccepted", atmGUI.edit[1], withdrawATMCashOnEnter)
addEventHandler("onClientGUIAccepted", atmGUI.edit[2], withdrawATMCashOnEnter)

-- Update/Close ATM
-------------------->>

function updateATMCash(balance, limit)
	guiSetText(atmGUI.label[2], "$"..exports.GTIutil:tocomma(balance))
	guiSetText(atmGUI.label[8], "Limit: $"..exports.GTIutil:tocomma(limit))
	guiSetText(atmGUI.edit[1], "")
	guiSetText(atmGUI.edit[2], "")
end
addEvent("GTIbank.updateATMCash", true)
addEventHandler("GTIbank.updateATMCash", root, updateATMCash)

function closeATM(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(atmGUI.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", atmGUI.button[2], closeATM, false)

-- Exports and Events
---------------------->>

addEvent("onClientPlayerGiveMoney", true)
addEvent("onClientPlayerTakeMoney", true)
