----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 02 Dec 2013
-- Resource: GTIsettings/accSettingsGUI.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Account Settings GUI
------------------------>>

accSettings = {button = {},window = {},edit = {},label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 287, 365
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 549, 200, 287, 365
accSettings.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Account Settings", false)
guiWindowSetSizable(accSettings.window[1], false)
guiSetAlpha(accSettings.window[1], 0.95)
-- Labels (Static)
accSettings.label[1] = guiCreateLabel(76, 23, 134, 15, "Change E-mail Address:", false, accSettings.window[1])
guiSetFont(accSettings.label[1], "default-bold-small")
guiLabelSetColor(accSettings.label[1], 255, 25, 25)
guiLabelSetHorizontalAlign(accSettings.label[1], "center", false)
accSettings.label[2] = guiCreateLabel(10, 41, 152, 15, "New E-mail Address:", false, accSettings.window[1])
accSettings.label[3] = guiCreateLabel(6, 79, 275, 15, "_________________________________________________", false, accSettings.window[1])
accSettings.label[4] = guiCreateLabel(76, 98, 134, 15, "Change Password:", false, accSettings.window[1])
guiSetFont(accSettings.label[4], "default-bold-small")
guiLabelSetColor(accSettings.label[4], 255, 25, 25)
guiLabelSetHorizontalAlign(accSettings.label[4], "center", false)
accSettings.label[5] = guiCreateLabel(11, 159, 152, 15, "Confirm Password:", false, accSettings.window[1])
accSettings.label[6] = guiCreateLabel(11, 116, 152, 15, "New Password:", false, accSettings.window[1])
accSettings.label[7] = guiCreateLabel(11, 278, 152, 15, "Current Password:", false, accSettings.window[1])
accSettings.label[9] = guiCreateLabel(6, 215, 275, 15, "_________________________________________________", false, accSettings.window[1])
accSettings.label[10] = guiCreateLabel(7, 232, 273, 43, "For security reasons, you must enter you current password before changing any of your account settings.", false, accSettings.window[1])
guiSetFont(accSettings.label[10], "default-bold-small")
guiLabelSetColor(accSettings.label[10], 255, 25, 25)
guiLabelSetHorizontalAlign(accSettings.label[10], "center", true)
guiLabelSetVerticalAlign(accSettings.label[10], "center")
-- Labels (Dynamic)
accSettings.label[8] = guiCreateLabel(253, 23, 24, 15, "Close", false, accSettings.window[1])
guiSetFont(accSettings.label[8], "default-small")
accSettings.label[11] = guiCreateLabel(9, 204, 268, 20, "Enter a Password", false, accSettings.window[1])
guiSetFont(accSettings.label[11], "clear-normal")
guiLabelSetHorizontalAlign(accSettings.label[11], "center", false)
-- Edits
accSettings.edit[1] = guiCreateEdit(9, 59, 268, 23, "", false, accSettings.window[1]) -- Email Address
accSettings.edit[2] = guiCreateEdit(9, 176, 268, 23, "", false, accSettings.window[1]) -- Confirm Password
guiEditSetMaxLength(accSettings.edit[2], 25)
guiEditSetMasked(accSettings.edit[2], true)
accSettings.edit[3] = guiCreateEdit(9, 134, 268, 23, "", false, accSettings.window[1]) -- New Password
guiEditSetMaxLength(accSettings.edit[3], 25)
guiEditSetMasked(accSettings.edit[3], true)
accSettings.edit[4] = guiCreateEdit(9, 296, 268, 23, "", false, accSettings.window[1]) -- Current Password
guiEditSetMaxLength(accSettings.edit[4], 25)
guiEditSetMasked(accSettings.edit[4], true)
-- Buttons
accSettings.button[1] = guiCreateButton(104, 324, 75, 32, "Update Settings", false, accSettings.window[1])
guiSetFont(accSettings.button[1], "default-bold-small")
-- Other
guiSetVisible(accSettings.window[1], false)

-- Error Message GUI
--------------------->>

errormsg = {button = {},window = {},label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 200, 114
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 582, 295, 200, 114
errormsg.window[1] = guiCreateWindow(sX, sY, wX, wY, "Error", false)
guiWindowSetSizable(errormsg.window[1], false)
guiSetAlpha(errormsg.window[1], 0.95)
-- Label
errormsg.label[1] = guiCreateLabel(8, 25, 183, 46, "Something went wrong because you failed to properly do something.", false, errormsg.window[1])
guiLabelSetHorizontalAlign(errormsg.label[1], "center", true)
guiLabelSetVerticalAlign(errormsg.label[1], "center")
-- Button
errormsg.button[1] = guiCreateButton(62, 76, 76, 29, "OK", false, errormsg.window[1])
-- Other
guiSetVisible(errormsg.window[1], false)

-- Show Account Settings
------------------------->>

function showAccountSettings(email)
	guiSetText(accSettings.edit[1], email)
	
	if (not guiGetVisible(accSettings.window[1])) then
		guiSetVisible(accSettings.window[1], true)
		showCursor(true)
	else
		guiSetVisible(accSettings.window[1], false)
		showCursor(false)
	end
end
addEvent("GTIsettings.showAccountSettings", true)
addEventHandler("GTIsettings.showAccountSettings", root, showAccountSettings)

-- Password Strength Modifier
------------------------------>>

function getPasswordStrength(password)
	local letters = string.find(password, "%a")
	local numbers = string.find(password, "%d")
	local symbols = string.find(password, "%W")
	if (letters and numbers and symbols) then
		return "Strong"
	elseif ((letters and numbers) or (letters and symbols) or (numbers and symbols)) then
		return "Medium"
	elseif (letters or numbers or symbols) then
		return "Weak"
	end
end

function showPasswordStrength()
	local password = guiGetText(accSettings.edit[3])
	if (#password == 0) then
		guiSetText(accSettings.label[11], "Enter a Password")
		guiLabelSetColor(accSettings.label[11], 255, 255, 255)
	elseif (#password < 5 or #password > 25) then
		guiSetText(accSettings.label[11], "Password Must be 5-25 Characters Long")
		guiLabelSetColor(accSettings.label[11], 255, 125, 25)
	else 
		local strength = getPasswordStrength(password)
		local r,g,b = 255, 255, 255
		if (strength == "Weak") then r,g,b = 255, 25, 25
		elseif (strength == "Medium") then r,g,b = 255, 125, 25
		elseif (strength == "Strong") then r,g,b = 25, 255, 25
		end
		guiSetText(accSettings.label[11], "Password Strength: "..strength)
		guiLabelSetColor(accSettings.label[11], r, g, b)
	end
end
addEventHandler("onClientGUIChanged", accSettings.edit[3], showPasswordStrength, false)

function seeIfPasswordsMatch()
	local password = guiGetText(accSettings.edit[2])
	if (password ~= guiGetText(accSettings.edit[3])) then
		guiSetText(accSettings.label[11], "Passwords do not match!")
		guiLabelSetColor(accSettings.label[11], 255, 25, 25)
	else
		showPasswordStrength()
	end
end
addEventHandler("onClientGUIBlur", accSettings.edit[2], seeIfPasswordsMatch)

-- Update Account Settings
--------------------------->>

function updateAccountSettings(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	local email = guiGetText(accSettings.edit[1])
	if (email ~= "" and (not string.find(email, "@") or not string.find(email, "."))) then
		outputError("Error: This e-mail address is not valid. Enter a valid e-mail.")
		return
	end
	
	local newPassword = guiGetText(accSettings.edit[3])
	if ((#newPassword ~= 0) and (#newPassword < 5 or #newPassword > 25)) then
		outputError("Password Must be 5-25 Characters Long")
		return
	end
	
	local newPassword2 = guiGetText(accSettings.edit[2])
	if (newPassword ~= newPassword2) then
		outputError("Error: The passwords you entered to do not match!")
		return 
	end
	
	local password = guiGetText(accSettings.edit[4])
	if (password == "") then
		outputError("Notice: You must enter your current password to change your account settings!", "Notice")
		return
	end
	triggerServerEvent("GTIsettings.updateAccountSettings", root, password, email, newPassword)
end
addEventHandler("onClientGUIClick", accSettings.button[1], updateAccountSettings, false)

addEventHandler("onClientGUIAccepted", resourceRoot, function()
	updateAccountSettings("left", "up")
end)

-- Close Account Settings
-------------------------->>

function confirmAccountUpdated(message)
	closeAccountSettings("left", "up")
	outputChatBox(message, 25, 255, 25)
end
addEvent("GTIsettings.confirmAccountUpdated", true)
addEventHandler("GTIsettings.confirmAccountUpdated", root, confirmAccountUpdated)

function closeAccountSettings(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetText(errormsg.window[1], "Error")
	guiSetVisible(errormsg.window[1], false)
	guiSetVisible(accSettings.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", accSettings.label[8], closeAccountSettings, false)

addEventHandler("onClientMouseEnter", accSettings.label[8], function()
	guiLabelSetColor(source, 255, 100, 100)
end, false)

addEventHandler("onClientMouseLeave", accSettings.label[8], function()
	guiLabelSetColor(source, 255, 255, 255)
end, false)

-- Output Error Message
------------------------>>

function outputError(message, newtitle)
	guiSetText(errormsg.label[1], message)
	if (newtitle) then
		guiSetText(errormsg.window[1], newtitle)
	end
	
	guiBringToFront(errormsg.window[1])
	guiSetVisible(errormsg.window[1], true)
end
addEvent("GTIsettings.outputError", true)
addEventHandler("GTIsettings.outputError", root, outputError)

function closeError(button, state)
	if (button ~= "left" and state ~= "up") then return end
	guiSetText(errormsg.window[1], "Error")
	guiSetVisible(errormsg.window[1], false)
end
addEventHandler("onClientGUIClick", errormsg.button[1], closeError, false)
