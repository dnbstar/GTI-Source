----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 02 Jan 2014
-- Resource: GTIbank/bankAccount.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Login to Bank Account
------------------------->>

function showBankAccountLogin(isSecure)
	if (isSecure) then
		guiSetVisible(bankLoginPin.window[1], true)
		guiSetText(bankLoginPin.edit[1], "")
		guiSetText(bankLoginPin.edit[2], "")
	else
		guiSetVisible(bankLogin.window[1], true)
		guiSetText(bankLogin.edit[1], "")
	end
	showCursor(true)
end
addEvent("GTIbank.showBankAccountLogin", true)
addEventHandler("GTIbank.showBankAccountLogin", root, showBankAccountLogin)

local label
function loginToBankAccount(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	local password
	local pin
	if (guiGetVisible(bankLogin.window[1])) then
		password = guiGetText(bankLogin.edit[1])
		label = bankLogin.label[3]
	else
		password = guiGetText(bankLoginPin.edit[1])
		pin = guiGetText(bankLoginPin.edit[2])
		label = bankLoginPin.label[3]
	end
	
	if (password == "") then
		guiSetText(label, "Please enter an account password")
		guiLabelSetColor(label, 255, 125, 0)
		return
	end
	
	if (pin and pin == "") then
		guiSetText(label, "This account is secured with a pin number. Please enter the pin number for this account.")
		guiLabelSetColor(label, 255, 125, 0)
		return
	elseif (pin and not tonumber(pin)) then
		guiSetText(label, "Please enter a valid 4-10 digit pin number")
		guiLabelSetColor(label, 255, 125, 0)
		return
	end
	
	triggerServerEvent("GTIbank.loginToBankAccount", localPlayer, password, pin)
end
addEventHandler("onClientGUIClick", bankLoginPin.button[1], loginToBankAccount, false)
addEventHandler("onClientGUIClick", bankLogin.button[1], loginToBankAccount, false)

function loginToAccountOnEnter()
	loginToBankAccount("left", "up")
end
addEventHandler("onClientGUIAccepted", bankLoginPin.edit[1], loginToAccountOnEnter)
addEventHandler("onClientGUIAccepted", bankLoginPin.edit[2], loginToAccountOnEnter)
addEventHandler("onClientGUIAccepted", bankLogin.edit[1], loginToAccountOnEnter)

function returnLoginInfo(success, output)
	if (not success) then
		guiSetText(label, output)
		guiLabelSetColor(label, 255, 25, 25)
	else
		guiSetVisible(bankLogin.window[1], false)
		guiSetVisible(bankLoginPin.window[1], false)
		guiSetText(label, "Please enter your account password (the password that you use to login to the server)")
		guiLabelSetColor(label, 75, 200, 75)
		
		guiSetText(bankAccount.label[3], "$"..exports.GTIutil:tocomma(output))
		guiSetText(bankAccount.label[6], "$"..exports.GTIutil:tocomma(getPlayerMoney()))
		guiSetVisible(bankAccount.window[1], true)
	end
end
addEvent("GTIbank.returnLoginInfo", true)
addEventHandler("GTIbank.returnLoginInfo", root, returnLoginInfo)

-- Deposit Cash
---------------->>

function depositCash(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local cash = guiGetText(bankAccount.edit[1])
	if (cash == "" or not tonumber(cash) or tonumber(cash) <= 0) then
		exports.GTIhud:dm("Please enter a valid cash amount.", 255, 125, 0)
		return
	end
	triggerServerEvent("GTIbank.depositCash", localPlayer, math.floor( tonumber(cash) ))
end
addEventHandler("onClientGUIClick", bankAccount.button[1], depositCash, false)

function depositCashOnEnter()
	depositCash("left", "up")
end
addEventHandler("onClientGUIAccepted", bankAccount.edit[1], depositCashOnEnter)

-- Withdraw Cash
----------------->>

function withdrawCash(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local cash = guiGetText(bankAccount.edit[2])
	if (cash == "" or not tonumber(cash) or tonumber(cash) <= 0) then
		exports.GTIhud:dm("Please enter a valid cash amount.", 255, 125, 0)
		return
	end
	triggerServerEvent("GTIbank.withdrawCash", localPlayer, math.floor( tonumber(cash) ))
end
addEventHandler("onClientGUIClick", bankAccount.button[2], withdrawCash, false)

function withdrawCashOnEnter()
	withdrawCash("left", "up")
end
addEventHandler("onClientGUIAccepted", bankAccount.edit[2], withdrawCashOnEnter)

-- Transfer Cash
----------------->>

function transferCash(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local account = guiGetText(bankAccount.edit[3])
	if (account == "") then
		exports.GTIhud:dm("Please enter a valid account name.", 255, 125, 0)
		return
	end
	local cash = guiGetText(bankAccount.edit[4])
	if (cash == "" or not tonumber(cash) or tonumber(cash) <= 0) then
		exports.GTIhud:dm("Please enter a valid cash amount.", 255, 125, 0)
		return
	end
	triggerServerEvent("GTIbank.transferCash", localPlayer, account, math.floor( tonumber(cash) ))
end
addEventHandler("onClientGUIClick", bankAccount.button[3], transferCash, false)

function transferCashOnEnter()
	transferCash("left", "up")
end
addEventHandler("onClientGUIAccepted", bankAccount.edit[3], transferCashOnEnter)
addEventHandler("onClientGUIAccepted", bankAccount.edit[4], transferCashOnEnter)

-- Update Cash
--------------->>

function updateCash(balance, cashOnHand)
	guiSetText(bankAccount.label[3], "$"..exports.GTIutil:tocomma(balance))
	guiSetText(bankAccount.label[6], "$"..exports.GTIutil:tocomma(cashOnHand))
	
	guiSetText(bankAccount.edit[1], "")
	guiSetText(bankAccount.edit[2], "")
	guiSetText(bankAccount.edit[3], "")
	guiSetText(bankAccount.edit[4], "")
end
addEvent("GTIbank.updateCash", true)
addEventHandler("GTIbank.updateCash", root, updateCash)

-- Secure Account
------------------>>

function showSecureAccountPanel(button, state)
	if (button ~= "left" or state ~= "up") then return end
	triggerServerEvent("GTIbank.showSecureAccountPanel", localPlayer)
end
addEventHandler("onClientGUIClick", bankAccount.button[4], showSecureAccountPanel, false)

function returnSecureAccount(isSecure, pin)
	if (isSecure) then
		guiCheckBoxSetSelected(secAccount.checkbox[1], true)
		guiSetEnabled(secAccount.edit[1], true)
	else
		guiCheckBoxSetSelected(secAccount.checkbox[1], false)
		guiSetEnabled(secAccount.edit[1], false)
	end
	guiSetVisible(bankAccount.window[1], false)
	guiSetVisible(secAccount.window[1], true)
end
addEvent("GTIbank.returnSecureAccount", true)
addEventHandler("GTIbank.returnSecureAccount", root, returnSecureAccount)

function secureAccount(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local isSecure = guiCheckBoxGetSelected(secAccount.checkbox[1])
	local pin
	if (isSecure) then
		pin = guiGetText(secAccount.edit[1])
		if (pin == "" or string.len(pin) < 4 or string.len(pin) > 10) then
			exports.GTIhud:dm("In order to secure your account, you must enter a 4-10 digit pin number. Enter a valid number.", 255, 125, 0)
			return
		end
		if (not tonumber(pin)) then
			exports.GTIhud:dm("Your pin number must be a number, please enter an actual number.", 255, 125, 0)
			return
		end
	end
	triggerServerEvent("GTIbank.secureAccount", localPlayer, isSecure, pin)
end
addEventHandler("onClientGUIClick", secAccount.button[1], secureAccount, false)

function secureAccountCashOnEnter()
	secureAccount("left", "up")
end
addEventHandler("onClientGUIAccepted", secAccount.edit[1], secureAccountCashOnEnter)

-- View Bank Log
----------------->> 

function viewBankLog(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
end
addEventHandler("onClientGUIClick", bankAccount.button[5], viewBankLog, false)

-- Close Bank Account Login
---------------------------->>

function closeAccountLogin(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(bankLogin.window[1], false)
	guiSetVisible(bankLoginPin.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", bankLoginPin.label[2], closeAccountLogin, false)
addEventHandler("onClientGUIClick", bankLogin.label[2], closeAccountLogin, false)
addEventHandler("onClientGUIClick", bankAccount.label[4], closeAccountLogin, false)

function setCloseColorEnter()
	guiLabelSetColor(source, 255, 100, 100)
end
addEventHandler("onClientMouseEnter", bankLoginPin.label[2], setCloseColorEnter, false)
addEventHandler("onClientMouseEnter", bankLogin.label[2], setCloseColorEnter, false)
addEventHandler("onClientMouseEnter", bankAccount.label[4], setCloseColorEnter, false)

function setCloseColorLeave()
	guiLabelSetColor(source, 255, 255, 255)
end
addEventHandler("onClientMouseLeave", bankLoginPin.label[2], setCloseColorLeave, false)
addEventHandler("onClientMouseLeave", bankLogin.label[2], setCloseColorLeave, false)
addEventHandler("onClientMouseLeave", bankAccount.label[4], setCloseColorLeave, false)

-- Close Bank Account
---------------------->>

function closeAccount(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(bankAccount.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", bankAccount.label[4], closeAccount, false)

-- Toggle/Close Secure Account
------------------------------->>

function togglePinBox(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (guiCheckBoxGetSelected(secAccount.checkbox[1])) then
		guiSetEnabled(secAccount.edit[1], true)
	else
		guiSetEnabled(secAccount.edit[1], false)
		guiSetText(secAccount.edit[1], "")
	end
end
addEventHandler("onClientGUIClick", secAccount.checkbox[1], togglePinBox, false)

function cancelSecure(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(secAccount.window[1], false)
	guiSetVisible(bankAccount.window[1], true)
end
addEventHandler("onClientGUIClick", secAccount.button[2], cancelSecure, false)
addEvent("GTIbank.cancelSecure", true)
addEventHandler("GTIbank.cancelSecure", root, cancelSecure)
