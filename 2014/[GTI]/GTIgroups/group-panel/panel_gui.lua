----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 11 Feb 2014
-- Resource: GTIgroups/group-panel/panel_gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Group Management Panel
-------------------------->>

groupPanel = {tab = {}, scrollpane = {}, memo = {}, tabpanel = {}, label = {}, button = {}, window = {}, gridlist = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 685, 452
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 458, 220, 685, 452
groupPanel.window[1] = guiCreateWindow(sX, sY, wX, wY, "J.T. Penn & Co. — Business Panel", false)
guiWindowSetSizable(groupPanel.window[1], false)
guiSetAlpha(groupPanel.window[1], 0.8)
-- Tab Panel
groupPanel.tabpanel[1] = guiCreateTabPanel(9, 24, 667, 418, false, groupPanel.window[1])

-- Home Screen
--------------->>

groupPanel.tab[1] = guiCreateTab("Home", groupPanel.tabpanel[1])
-- Labels (Static)
groupPanel.label[1] = guiCreateLabel(13, 10, 108, 15, "Business Name:", false, groupPanel.tab[1])
guiSetFont(groupPanel.label[1], "default-bold-small")
guiLabelSetColor(groupPanel.label[1], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[1], "right", false)
groupPanel.label[2] = guiCreateLabel(343, 10, 82, 15, "Creation Date:", false, groupPanel.tab[1])
guiSetFont(groupPanel.label[2], "default-bold-small")
guiLabelSetColor(groupPanel.label[2], 255, 100, 100)
groupPanel.label[6] = guiCreateLabel(5, 29, 653, 15, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", false, groupPanel.tab[1])
guiSetFont(groupPanel.label[6], "default-small")
-- Labels (Dynamic)
groupPanel.label[3] = guiCreateLabel(130, 10, 206, 15, "J.T. Penn & Company", false, groupPanel.tab[1])
groupPanel.label[4] = guiCreateLabel(434, 10, 216, 15, "31 May 2014 (1 yr, 2 mo, 13 days)", false, groupPanel.tab[1])
-- Scrollpane
groupPanel.scrollpane[1] = guiCreateScrollPane(7, 49, 652, 311, false, groupPanel.tab[1])
	-- Labels
	groupPanel.label[5] = guiCreateLabel(3, 3, 629, 15, "QWERTYUIOPASDFGHJKLZXCVBNM qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM qwertyuiopasdfghjklzxcvbnm QWERTYUIOPASDFGHJKLZXCVBNM qwertyuiopasdfghjklzxcvbnm ", false, groupPanel.scrollpane[1])
	guiLabelSetHorizontalAlign(groupPanel.label[5], "left", true)
-- Memo (Hidden)
groupPanel.memo[1] = guiCreateMemo(7, 49, 652, 311, "", false, groupPanel.tab[1])
guiSetVisible(groupPanel.memo[1], false)
-- Buttons
groupPanel.button[1] = guiCreateButton(278, 366, 124, 19, "Modify", false, groupPanel.tab[1])
guiSetProperty(groupPanel.button[1], "NormalTextColour", "FFAAAAAA")

-- Members Screen
------------------>>

groupPanel.tab[2] = guiCreateTab("Members", groupPanel.tabpanel[1])
-- Labels (Static)
groupPanel.label[7] = guiCreateLabel(13, 11, 90, 15, "Total Members:", false, groupPanel.tab[2])
guiSetFont(groupPanel.label[7], "default-bold-small")
guiLabelSetColor(groupPanel.label[7], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[7], "right", false)
groupPanel.label[9] = guiCreateLabel(17, 36, 87, 15, "Business Rank:", false, groupPanel.tab[2])
guiSetFont(groupPanel.label[9], "default-bold-small")
guiLabelSetColor(groupPanel.label[9], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[9], "right", false)
groupPanel.label[13] = guiCreateLabel(7, 54, 653, 15, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", false, groupPanel.tab[2])
guiSetFont(groupPanel.label[13], "default-small")
groupPanel.label[11] = guiCreateLabel(326, 11, 84, 15, "Member Since:", false, groupPanel.tab[2])
guiSetFont(groupPanel.label[11], "default-bold-small")
guiLabelSetColor(groupPanel.label[11], 255, 100, 100)
-- Labels (Dynamic)
groupPanel.label[8] = guiCreateLabel(109, 11, 37, 15, "123", false, groupPanel.tab[2])
guiSetFont(groupPanel.label[8], "clear-normal")
groupPanel.label[10] = guiCreateLabel(109, 36, 184, 15, "President and C.E.O.", false, groupPanel.tab[2])
guiSetFont(groupPanel.label[10], "clear-normal")
groupPanel.label[12] = guiCreateLabel(418, 10, 217, 15, "31 May 2014 (2 yrs, 13 mo, 32 d)", false, groupPanel.tab[2])
guiSetFont(groupPanel.label[12], "clear-normal")
-- Buttons
groupPanel.button[2] = guiCreateButton(7, 365, 125, 20, "Add Member...", false, groupPanel.tab[2])
guiSetProperty(groupPanel.button[2], "NormalTextColour", "FFAAAAAA")
groupPanel.button[3] = guiCreateButton(535, 365, 125, 20, "Issue Warning", false, groupPanel.tab[2])
guiSetProperty(groupPanel.button[3], "NormalTextColour", "FFAAAAAA")
groupPanel.button[4] = guiCreateButton(403, 365, 125, 20, "Remove Member", false, groupPanel.tab[2])
guiSetProperty(groupPanel.button[4], "NormalTextColour", "FFAAAAAA")
groupPanel.button[5] = guiCreateButton(271, 365, 125, 20, "View Stats", false, groupPanel.tab[2])
guiSetProperty(groupPanel.button[5], "NormalTextColour", "FFAAAAAA")
groupPanel.button[6] = guiCreateButton(139, 365, 125, 20, "Change Rank", false, groupPanel.tab[2])
guiSetProperty(groupPanel.button[6], "NormalTextColour", "FFAAAAAA")
groupPanel.button[7] = guiCreateButton(535, 34, 125, 20, "Resign From Business", false, groupPanel.tab[2])
guiSetProperty(groupPanel.button[7], "NormalTextColour", "FFAAAAAA")
-- Gridlist
groupPanel.gridlist[1] = guiCreateGridList(8, 70, 651, 289, false, groupPanel.tab[2])
guiGridListAddColumn(groupPanel.gridlist[1], "Country", 0.06)
guiGridListAddColumn(groupPanel.gridlist[1], "Member Name", 0.22)
guiGridListAddColumn(groupPanel.gridlist[1], "Account Name", 0.22)
guiGridListAddColumn(groupPanel.gridlist[1], "Rank", 0.22)
guiGridListAddColumn(groupPanel.gridlist[1], "Last Active", 0.15)
guiGridListAddColumn(groupPanel.gridlist[1], "Warn", 0.06)

-- Stats Screen
---------------->>

groupPanel.tab[3] = guiCreateTab("Stats", groupPanel.tabpanel[1])
-- Labels (Static)
groupPanel.label[14] = guiCreateLabel(6, 49, 653, 15, "_____________________________________________________________________________________________________", false, groupPanel.tab[3])
groupPanel.label[15] = guiCreateLabel(6, 100, 653, 15, "_____________________________________________________________________________________________________", false, groupPanel.tab[3])
groupPanel.label[16] = guiCreateLabel(9, 21, 98, 15, "Business Level:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[16], "clear-normal")
guiLabelSetHorizontalAlign(groupPanel.label[16], "right", false)
groupPanel.label[17] = guiCreateLabel(235, 21, 75, 15, "Experience:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[17], "clear-normal")
groupPanel.label[18] = guiCreateLabel(7, 130, 153, 15, "Founded:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[18], "default-bold-small")
guiLabelSetColor(groupPanel.label[18], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[18], "right", false)
groupPanel.label[20] = guiCreateLabel(7, 165, 153, 15, "Total Collective Playtime:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[20], "default-bold-small")
guiLabelSetColor(groupPanel.label[20], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[20], "right", false)
groupPanel.label[22] = guiCreateLabel(7, 200, 153, 15, "Lifetime Income:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[22], "default-bold-small")
guiLabelSetColor(groupPanel.label[22], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[22], "right", false)
groupPanel.label[24] = guiCreateLabel(7, 235, 153, 15, "Lifetime Expenses:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[24], "default-bold-small")
guiLabelSetColor(groupPanel.label[24], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[24], "right", false)
groupPanel.label[26] = guiCreateLabel(7, 270, 153, 15, "Lifetime Business Profit:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[26], "default-bold-small")
guiLabelSetColor(groupPanel.label[26], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[26], "right", false)
groupPanel.label[28] = guiCreateLabel(342, 130, 153, 15, "Bank Balance:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[28], "default-bold-small")
guiLabelSetColor(groupPanel.label[28], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[28], "right", false)
groupPanel.label[30] = guiCreateLabel(342, 165, 153, 15, "Total Value of Assets:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[30], "default-bold-small")
guiLabelSetColor(groupPanel.label[30], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[30], "right", false)
groupPanel.label[32] = guiCreateLabel(342, 200, 153, 15, "Net Worth of Business:", false, groupPanel.tab[3])
guiSetFont(groupPanel.label[32], "default-bold-small")
guiLabelSetColor(groupPanel.label[32], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[32], "right", false)
groupPanel.label[34] = guiCreateLabel(6, 294, 653, 15, "_____________________________________________________________________________________________________", false, groupPanel.tab[3])
groupPanel.label[35] = guiCreateLabel(332, 110, 15, 197, "|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  ", false, groupPanel.tab[3])
guiLabelSetHorizontalAlign(groupPanel.label[35], "left", true)
groupPanel.label[36] = guiCreateLabel(332, 118, 15, 190, "|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  ", false, groupPanel.tab[3])
guiLabelSetHorizontalAlign(groupPanel.label[36], "left", true)
-- Labels (Dynamic)
groupPanel.label[19] = guiCreateLabel(169, 130, 154, 15, "31 May 2014", false, groupPanel.tab[3])		-- Founded
guiSetFont(groupPanel.label[19], "clear-normal")
groupPanel.label[21] = guiCreateLabel(169, 165, 154, 15, "65,535 hours", false, groupPanel.tab[3])		-- Total Collective Playtime
guiSetFont(groupPanel.label[21], "clear-normal")
groupPanel.label[23] = guiCreateLabel(169, 200, 154, 15, "$17,000,000,000", false, groupPanel.tab[3])	-- Lifetime Income
guiSetFont(groupPanel.label[23], "clear-normal")
groupPanel.label[25] = guiCreateLabel(169, 235, 154, 15, "$17,000,000,000", false, groupPanel.tab[3])	-- Lifetime Expenses
guiSetFont(groupPanel.label[25], "clear-normal")
groupPanel.label[27] = guiCreateLabel(169, 270, 154, 15, "$17,000,000,000", false, groupPanel.tab[3])	-- Lifetime Profit
guiSetFont(groupPanel.label[27], "clear-normal")
groupPanel.label[29] = guiCreateLabel(504, 130, 154, 15, "$717,000,000,000", false, groupPanel.tab[3])	-- Bank Balance
guiSetFont(groupPanel.label[29], "clear-normal")
groupPanel.label[31] = guiCreateLabel(504, 165, 154, 15, "$717,000,000,000", false, groupPanel.tab[3])	-- Total Value of Assets
guiSetFont(groupPanel.label[31], "clear-normal")
groupPanel.label[33] = guiCreateLabel(504, 200, 154, 15, "$717,000,000,000", false, groupPanel.tab[3])	-- Net Worth of Group
guiSetFont(groupPanel.label[33], "clear-normal")

-- History Screen
------------------>>

groupPanel.tab[4] = guiCreateTab("History", groupPanel.tabpanel[1])
-- Labels (Static)
groupPanel.label[37] = guiCreateLabel(10, 366, 87, 15, "Account Name:", false, groupPanel.tab[4])
guiSetFont(groupPanel.label[37], "default-bold-small")
guiLabelSetColor(groupPanel.label[37], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[37], "right", false)
groupPanel.label[38] = guiCreateLabel(21, 340, 77, 15, "Player Name:", false, groupPanel.tab[4])
guiSetFont(groupPanel.label[38], "default-bold-small")
guiLabelSetColor(groupPanel.label[38], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[38], "right", false)
groupPanel.label[41] = guiCreateLabel(332, 366, 38, 15, "Serial:", false, groupPanel.tab[4])
guiSetFont(groupPanel.label[41], "default-bold-small")
guiLabelSetColor(groupPanel.label[41], 255, 100, 100)
-- Labels (Dynamic)
groupPanel.label[39] = guiCreateLabel(106, 340, 172, 15, "[ABC]Player>123", false, groupPanel.tab[4])
groupPanel.label[40] = guiCreateLabel(106, 366, 161, 15, "MeIsPro123", false, groupPanel.tab[4])
groupPanel.label[42] = guiCreateLabel(377, 366, 279, 15, "ABCDEF123456ABCDEF789012ABC123DE", false, groupPanel.tab[4])
groupPanel.label[43] = guiCreateLabel(382, 340, 219, 15, "Server Time: 31 May 2013 — 12:00:00", false, groupPanel.tab[4])
guiSetFont(groupPanel.label[43], "default-bold-small")
guiLabelSetColor(groupPanel.label[43], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[43], "center", false)
-- Gridlist
groupPanel.gridlist[2] = guiCreateGridList(7, 6, 653, 325, false, groupPanel.tab[4])
guiGridListAddColumn(groupPanel.gridlist[2], "Date", 0.3)
guiGridListAddColumn(groupPanel.gridlist[2], "Time", 0.3)
guiGridListAddColumn(groupPanel.gridlist[2], "Log Text", 0.3)

-- Admin Screen
---------------->>

groupPanel.tab[5] = guiCreateTab("Admin", groupPanel.tabpanel[1])
-- Labels (Static)
groupPanel.label[44] = guiCreateLabel(64, 11, 158, 16, "Rank Management", false, groupPanel.tab[5])
guiSetFont(groupPanel.label[44], "default-bold-small")
guiLabelSetColor(groupPanel.label[44], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[44], "center", false)
groupPanel.label[45] = guiCreateLabel(27, 79, 235, 52, "Manage player ranks, rank permission, rank levels, and percentage of pay bonus that is given to those ranks.", false, groupPanel.tab[5])
guiLabelSetHorizontalAlign(groupPanel.label[45], "center", true)
groupPanel.label[46] = guiCreateLabel(418, 11, 158, 16, "Ingame Application", false, groupPanel.tab[5])
guiSetFont(groupPanel.label[46], "default-bold-small")
guiLabelSetColor(groupPanel.label[46], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[46], "center", false)
groupPanel.label[47] = guiCreateLabel(379, 79, 235, 52, "Set up and manage your ingame business application format. Players can use this to apply for your business.", false, groupPanel.tab[5])
guiLabelSetHorizontalAlign(groupPanel.label[47], "center", true)
groupPanel.label[48] = guiCreateLabel(64, 148, 158, 16, "Business/Player Names", false, groupPanel.tab[5])
guiSetFont(groupPanel.label[48], "default-bold-small")
guiLabelSetColor(groupPanel.label[48], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[48], "center", false)
groupPanel.label[49] = guiCreateLabel(27, 214, 235, 52, "Change your overall business name, as well as manage automatic name tagging", false, groupPanel.tab[5])
guiLabelSetHorizontalAlign(groupPanel.label[49], "center", true)
groupPanel.label[50] = guiCreateLabel(417, 148, 158, 16, "Group Settings", false, groupPanel.tab[5])
guiSetFont(groupPanel.label[50], "default-bold-small")
guiLabelSetColor(groupPanel.label[50], 255, 100, 100)
guiLabelSetHorizontalAlign(groupPanel.label[50], "center", false)
groupPanel.label[51] = guiCreateLabel(378, 214, 235, 52, "Modify miscellaneous group settings, such as chat color, panel color, etc.", false, groupPanel.tab[5])
guiLabelSetHorizontalAlign(groupPanel.label[51], "center", true)
-- Buttons
groupPanel.button[8] = guiCreateButton(61, 31, 164, 40, "Open Rank Management", false, groupPanel.tab[5])
guiSetProperty(groupPanel.button[8], "NormalTextColour", "FFAAAAAA")
groupPanel.button[9] = guiCreateButton(416, 31, 164, 40, "Manage Applications", false, groupPanel.tab[5])
guiSetProperty(groupPanel.button[9], "NormalTextColour", "FFAAAAAA")
groupPanel.button[10] = guiCreateButton(61, 169, 164, 40, "Open Name Management", false, groupPanel.tab[5])
guiSetProperty(groupPanel.button[10], "NormalTextColour", "FFAAAAAA")
groupPanel.button[11] = guiCreateButton(416, 169, 164, 40, "Group Settings", false, groupPanel.tab[5])
guiSetProperty(groupPanel.button[11], "NormalTextColour", "FFAAAAAA")

-- Visible
----------->>

guiSetVisible(groupPanel.window[1], false)