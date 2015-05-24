----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 01 Jan 2014
-- Resource: GTIbank/bankGUI.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Bank Account Login
---------------------->>

bankLogin = {button = {}, window = {}, edit = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 286, 142
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 543, 299, 286, 142
bankLogin.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Banking — Account Login", false)
guiWindowSetSizable(bankLogin.window[1], false)
guiSetAlpha(bankLogin.window[1], 0.95)
-- Labels
bankLogin.label[1] = guiCreateLabel(11, 26, 153, 15, "Your Account Password:", false, bankLogin.window[1])
guiSetFont(bankLogin.label[1], "clear-normal")
bankLogin.label[2] = guiCreateLabel(254, 22, 24, 15, "Close", false, bankLogin.window[1])
guiSetFont(bankLogin.label[2], "default-small")
bankLogin.label[3] = guiCreateLabel(10, 75, 265, 33, "Please enter your account password (the password that you use to login to the server)", false, bankLogin.window[1])
guiLabelSetColor(bankLogin.label[3], 75, 200, 75)
guiLabelSetHorizontalAlign(bankLogin.label[3], "center", true)
guiLabelSetVerticalAlign(bankLogin.label[3], "center")
-- Edit boxes
bankLogin.edit[1] = guiCreateEdit(9, 45, 268, 24, "", false, bankLogin.window[1])
guiEditSetMasked(bankLogin.edit[1], true)
-- Buttons
bankLogin.button[1] = guiCreateButton(87, 113, 114, 21, "Login", false, bankLogin.window[1])
guiSetProperty(bankLogin.button[1], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(bankLogin.window[1], false)

-- Bank Account Login with Pin
------------------------------->>

bankLoginPin = {button = {}, window = {}, edit = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 286, 187
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 545, 279, 286, 187
bankLoginPin.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Banking — Account Login", false)
guiWindowSetSizable(bankLoginPin.window[1], false)
guiSetAlpha(bankLoginPin.window[1], 0.95)
-- Labels
bankLoginPin.label[1] = guiCreateLabel(11, 26, 153, 15, "Your Account Password:", false, bankLoginPin.window[1])
guiSetFont(bankLoginPin.label[1], "clear-normal")
bankLoginPin.label[2] = guiCreateLabel(254, 22, 24, 15, "Close", false, bankLoginPin.window[1])
guiSetFont(bankLoginPin.label[2], "default-small")
bankLoginPin.label[3] = guiCreateLabel(10, 123, 265, 33, "Please enter your account password (the password that you use to login to the server)", false, bankLoginPin.window[1])
guiLabelSetColor(bankLoginPin.label[3], 75, 200, 75)
guiLabelSetHorizontalAlign(bankLoginPin.label[3], "center", true)
guiLabelSetVerticalAlign(bankLoginPin.label[3], "center")
bankLoginPin.label[4] = guiCreateLabel(100, 73, 79, 15, "Pin Number:", false, bankLoginPin.window[1])
guiSetFont(bankLoginPin.label[4], "clear-normal")
-- Edits
bankLoginPin.edit[1] = guiCreateEdit(9, 45, 268, 24, "", false, bankLoginPin.window[1])
guiEditSetMasked(bankLoginPin.edit[1], true)
bankLoginPin.edit[2] = guiCreateEdit(94, 91, 94, 24, "", false, bankLoginPin.window[1])
guiEditSetMasked(bankLoginPin.edit[2], true)
guiEditSetMaxLength(bankLoginPin.edit[2], 10)
-- Button
bankLoginPin.button[1] = guiCreateButton(87, 160, 114, 18, "Login", false, bankLoginPin.window[1])
guiSetProperty(bankLoginPin.button[1], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(bankLoginPin.window[1], false)

-- Bank Account
---------------->>

bankAccount = {tab = {}, tabpanel = {}, edit = {}, button = {}, window = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 382, 204
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 496, 238, 382, 204
bankAccount.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Banking — Account", false)
guiWindowSetSizable(bankAccount.window[1], false)
guiSetAlpha(bankAccount.window[1], 0.95)
-- Labels (Static)
bankAccount.label[1] = guiCreateLabel(79, 26, 230, 15, "Bank of San Fierro — Your Account", false, bankAccount.window[1])
guiSetFont(bankAccount.label[1], "clear-normal")
guiLabelSetHorizontalAlign(bankAccount.label[1], "center", false)
bankAccount.label[2] = guiCreateLabel(142, 48, 97, 15, "Account Balance:", false, bankAccount.window[1])
guiSetFont(bankAccount.label[2], "default-bold-small")
guiLabelSetColor(bankAccount.label[2], 75, 200, 75)
-- Labels (Dynamic)
bankAccount.label[3] = guiCreateLabel(86, 65, 205, 15, "$999,999,999", false, bankAccount.window[1])
guiSetFont(bankAccount.label[3], "clear-normal")
guiLabelSetColor(bankAccount.label[3], 25, 200, 25)
guiLabelSetHorizontalAlign(bankAccount.label[3], "center", false)
bankAccount.label[4] = guiCreateLabel(351, 22, 24, 15, "Close", false, bankAccount.window[1])
guiSetFont(bankAccount.label[4], "default-small")
bankAccount.tabpanel[1] = guiCreateTabPanel(13, 88, 360, 107, false, bankAccount.window[1])

-- Deposit Tab
bankAccount.tab[1] = guiCreateTab("Deposit", bankAccount.tabpanel[1])
-- Labels (Static)
bankAccount.label[5] = guiCreateLabel(105, 7, 73, 15, "Your Pocket:", false, bankAccount.tab[1])
guiSetFont(bankAccount.label[5], "default-bold-small")
guiLabelSetColor(bankAccount.label[5], 75, 200, 75)
bankAccount.label[7] = guiCreateLabel(32, 36, 48, 15, "Deposit:", false, bankAccount.tab[1])
guiSetFont(bankAccount.label[7], "default-bold-small")
guiLabelSetColor(bankAccount.label[7], 75, 200, 75)
-- Labels (Dynamic)
bankAccount.label[6] = guiCreateLabel(183, 6, 101, 15, "$99,999,999", false, bankAccount.tab[1])
guiSetFont(bankAccount.label[6], "clear-normal")
guiLabelSetColor(bankAccount.label[6], 25, 200, 25)
-- Editbox
bankAccount.edit[1] = guiCreateEdit(86, 32, 165, 23, "", false, bankAccount.tab[1])
-- Button
bankAccount.button[1] = guiCreateButton(255, 34, 70, 22, "Deposit", false, bankAccount.tab[1])
guiSetProperty(bankAccount.button[1], "NormalTextColour", "FFAAAAAA")

-- Withdraw Tab
bankAccount.tab[2] = guiCreateTab("Withdraw", bankAccount.tabpanel[1])
-- Labels
bankAccount.label[8] = guiCreateLabel(11, 30, 58, 15, "Withdraw:", false, bankAccount.tab[2])
guiSetFont(bankAccount.label[8], "default-bold-small")
guiLabelSetColor(bankAccount.label[8], 75, 200, 75)
-- Editbox
bankAccount.edit[2] = guiCreateEdit(74, 25, 209, 24, "", false, bankAccount.tab[2])
-- Button
bankAccount.button[2] = guiCreateButton(288, 25, 64, 24, "Withdraw", false, bankAccount.tab[2])
guiSetProperty(bankAccount.button[2], "NormalTextColour", "FFAAAAAA")

-- Transfer Tab
bankAccount.tab[3] = guiCreateTab("Transfer", bankAccount.tabpanel[1])
-- Labels
bankAccount.label[9] = guiCreateLabel(7, 13, 100, 15, "Account Name/#:", false, bankAccount.tab[3])
guiSetFont(bankAccount.label[9], "default-bold-small")
guiLabelSetColor(bankAccount.label[9], 75, 200, 75)
bankAccount.label[10] = guiCreateLabel(7, 46, 100, 15, "Transfer Amount:", false, bankAccount.tab[3])
guiSetFont(bankAccount.label[10], "default-bold-small")
guiLabelSetColor(bankAccount.label[10], 75, 200, 75)
guiLabelSetHorizontalAlign(bankAccount.label[10], "right", false)
-- Editboxes
bankAccount.edit[3] = guiCreateEdit(112, 10, 164, 21, "", false, bankAccount.tab[3])
bankAccount.edit[4] = guiCreateEdit(112, 43, 164, 21, "", false, bankAccount.tab[3])
-- Buttons
bankAccount.button[3] = guiCreateButton(282, 27, 67, 26, "Transfer", false, bankAccount.tab[3])
guiSetProperty(bankAccount.button[3], "NormalTextColour", "FFAAAAAA")

-- Account Tab
bankAccount.tab[4] = guiCreateTab("Account", bankAccount.tabpanel[1])
-- Buttons
bankAccount.button[4] = guiCreateButton(122, 7, 110, 30, "Account Settings", false, bankAccount.tab[4])
guiSetProperty(bankAccount.button[4], "NormalTextColour", "FFAAAAAA")
bankAccount.button[5] = guiCreateButton(122, 42, 110, 30, "Account Log", false, bankAccount.tab[4])
guiSetProperty(bankAccount.button[5], "NormalTextColour", "FFAAAAAA")

-- Other
guiSetVisible(bankAccount.window[1], false)

-- ATM Machine
--------------->>

atmGUI = {button = {}, window = {}, edit = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 218, 210
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 578, 263, 218, 210
atmGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "ATM", false)
guiWindowSetSizable(atmGUI.window[1], false)
guiSetAlpha(atmGUI.window[1], 0.95)
-- Labels (Static)
atmGUI.label[1] = guiCreateLabel(9, 24, 201, 15, "Account Balance:", false, atmGUI.window[1])
guiSetFont(atmGUI.label[1], "default-bold-small")
guiLabelSetColor(atmGUI.label[1], 75, 200, 75)
guiLabelSetHorizontalAlign(atmGUI.label[1], "center", false)
atmGUI.label[3] = guiCreateLabel(9, 68, 201, 15, "Pin Number:", false, atmGUI.window[1])
guiSetFont(atmGUI.label[3], "clear-normal")
guiLabelSetHorizontalAlign(atmGUI.label[3], "center", false)
atmGUI.label[4] = guiCreateLabel(9, 51, 201, 15, "_________________________________-", false, atmGUI.window[1])
guiSetFont(atmGUI.label[4], "clear-normal")
guiLabelSetHorizontalAlign(atmGUI.label[4], "center", false)
atmGUI.label[5] = guiCreateLabel(9, 97, 201, 15, "_________________________________-", false, atmGUI.window[1])
guiSetFont(atmGUI.label[5], "clear-normal")
guiLabelSetHorizontalAlign(atmGUI.label[5], "center", false)
atmGUI.label[6] = guiCreateLabel(9, 115, 201, 15, "Withdraw:", false, atmGUI.window[1])
guiSetFont(atmGUI.label[6], "clear-normal")
guiLabelSetHorizontalAlign(atmGUI.label[6], "center", false)
atmGUI.label[7] = guiCreateLabel(9, 163, 201, 15, "_________________________________-", false, atmGUI.window[1])
guiSetFont(atmGUI.label[7], "clear-normal")
guiLabelSetHorizontalAlign(atmGUI.label[7], "center", false)
-- Labels (Dynamic)
atmGUI.label[2] = guiCreateLabel(9, 41, 201, 15, "$999,999,999", false, atmGUI.window[1])
guiSetFont(atmGUI.label[2], "clear-normal")
guiLabelSetColor(atmGUI.label[2], 25, 255, 25)
guiLabelSetHorizontalAlign(atmGUI.label[2], "center", false)
atmGUI.label[8] = guiCreateLabel(9, 156, 201, 15, "Limit: $25,000", false, atmGUI.window[1])
guiSetFont(atmGUI.label[8], "default-bold-small")
guiLabelSetColor(atmGUI.label[8], 75, 200, 75)
guiLabelSetHorizontalAlign(atmGUI.label[8], "center", false)
-- Edits
atmGUI.edit[1] = guiCreateEdit(65, 85, 91, 20, "", false, atmGUI.window[1])
guiEditSetMasked(atmGUI.edit[1], true)
guiEditSetMaxLength(atmGUI.edit[1], 10)
atmGUI.edit[2] = guiCreateEdit(9, 132, 200, 20, "", false, atmGUI.window[1])
-- Buttons
atmGUI.button[1] = guiCreateButton(37, 182, 72, 21, "Withdraw", false, atmGUI.window[1])
guiSetProperty(atmGUI.button[1], "NormalTextColour", "FFAAAAAA")
atmGUI.button[2] = guiCreateButton(113, 182, 72, 21, "Cancel", false, atmGUI.window[1])
guiSetProperty(atmGUI.button[2], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(atmGUI.window[1], false)

-- Secure Account
------------------>>

secAccount = {checkbox = {}, edit = {}, button = {}, window = {}, label = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 375, 192
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 493, 275, 375, 192
secAccount.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Bank Account Settings", false)
guiWindowSetSizable(secAccount.window[1], false)
guiSetAlpha(secAccount.window[1], 0.95)
-- Labels
secAccount.label[1] = guiCreateLabel(10, 25, 356, 74, "In order to withdraw cash from your bank account on the go, you have to secure your account with a pin number. In the future, you will be asked for a pin number along with or instead of your account password. Check the box and type a 4-10 digit pin number in the box below", false, secAccount.window[1])
guiLabelSetHorizontalAlign(secAccount.label[1], "center", true)
secAccount.label[2] = guiCreateLabel(7, 92, 362, 16, "____________________________________________________", false, secAccount.window[1])
secAccount.label[3] = guiCreateLabel(84, 138, 67, 15, "Pin Number:", false, secAccount.window[1])
-- Checkbox
secAccount.checkbox[1] = guiCreateCheckBox(70, 113, 237, 15, "Secure Account with a Pin Number", false, false, secAccount.window[1])
guiSetFont(secAccount.checkbox[1], "clear-normal")
-- Edits
secAccount.edit[1] = guiCreateEdit(154, 134, 133, 21, "", false, secAccount.window[1])
guiEditSetMasked(secAccount.edit[1], true)
-- Buttons
secAccount.button[1] = guiCreateButton(59, 161, 127, 22, "Secure", false, secAccount.window[1])
guiSetProperty(secAccount.button[1], "NormalTextColour", "FFAAAAAA")
secAccount.button[2] = guiCreateButton(194, 161, 127, 22, "Close", false, secAccount.window[1])
guiSetProperty(secAccount.button[2], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(secAccount.window[1], false)

-- Bank Log GUI
---------------->>

bankLog = {checkbox = {}, edit = {}, button = {}, window = {}, label = {}, gridlist = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 600, 500
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 381, 127, 600, 500
bankLog.window[1] = guiCreateWindow(381, 127, 600, 500, "GTI Bank and Money Log", false)
guiWindowSetSizable(bankLog.window[1], false)
guiSetAlpha(bankLog.window[1], 0.95)
-- Labels (Static)
bankLog.label[1] = guiCreateLabel(12, 423, 75, 15, "Player Name:", false, bankLog.window[1])
guiSetFont(bankLog.label[1], "default-bold-small")
guiLabelSetColor(bankLog.label[1], 75, 200, 75)
guiLabelSetHorizontalAlign(bankLog.label[1], "right", false)
bankLog.label[2] = guiCreateLabel(12, 448, 75, 15, "IP Address:", false, bankLog.window[1])
guiSetFont(bankLog.label[2], "default-bold-small")
guiLabelSetColor(bankLog.label[2], 75, 200, 75)
guiLabelSetHorizontalAlign(bankLog.label[2], "right", false)
bankLog.label[3] = guiCreateLabel(12, 472, 75, 15, "Serial:", false, bankLog.window[1])
guiSetFont(bankLog.label[3], "default-bold-small")
guiLabelSetColor(bankLog.label[3], 75, 200, 75)
guiLabelSetHorizontalAlign(bankLog.label[3], "right", false)
-- Labels (Dynamic)
bankLog.label[4] = guiCreateLabel(93, 423, 243, 15, "[ABC]Player>123", false, bankLog.window[1])
bankLog.label[5] = guiCreateLabel(93, 448, 243, 15, "12.34.567.890", false, bankLog.window[1])
bankLog.label[6] = guiCreateLabel(93, 472, 242, 15, "ABCDEF123456ABCDEF678901ABC123DE", false, bankLog.window[1])
bankLog.label[7] = guiCreateLabel(350, 423, 240, 15, "Server Time: 2013-01-01 12:00:00", false, bankLog.window[1])
guiSetFont(bankLog.label[7], "default-bold-small")
guiLabelSetColor(bankLog.label[7], 75, 200, 75)
guiLabelSetHorizontalAlign(bankLog.label[7], "center", false)
-- Editbox
bankLog.edit[1] = guiCreateEdit(12, 396, 579, 19, "", false, bankLog.window[1])
guiEditSetReadOnly(bankLog.edit[1], true)
-- Checkboxes
bankLog.checkbox[1] = guiCreateCheckBox(350, 447, 109, 15, "Show Bank Log", false, false, bankLog.window[1])
guiSetProperty(bankLog.checkbox[1], "NormalTextColour", "FF4BC84B")
bankLog.checkbox[2] = guiCreateCheckBox(474, 447, 116, 15, "Show Money Log", false, false, bankLog.window[1])
guiSetProperty(bankLog.checkbox[2], "NormalTextColour", "FF4BC84B")
-- Buttons
bankLog.button[1] = guiCreateButton(407, 470, 117, 21, "Close", false, bankLog.window[1])
guiSetProperty(bankLog.button[1], "NormalTextColour", "FFAAAAAA")
-- Gridlist
bankLog.gridlist[1] = guiCreateGridList(9, 25, 582, 363, false, bankLog.window[1])
guiGridListAddColumn(bankLog.gridlist[1], "Date", 0.3)
guiGridListAddColumn(bankLog.gridlist[1], "Time", 0.3)
guiGridListAddColumn(bankLog.gridlist[1], "Log Text", 0.3)
guiGridListSetSortingEnabled(bankLog.gridlist[1], false)
-- Visible
guiSetVisible(bankLog.window[1], false)
