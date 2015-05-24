----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 18 Dec 2013
-- Resource: GTIpromotions/promoGUI.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

promoGUI = {tab = {}, scrollpane = {}, tabpanel = {}, label = {}, button = {}, window = {}, gridlist = {}, memo = {}, radiobutton = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 564, 405
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 396, 195, 564, 405
promoGUI.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Civilian Experience System Panel", false)
guiWindowSetSizable(promoGUI.window[1], false)
guiSetAlpha(promoGUI.window[1], 0.95)
-- Tab Panel
promoGUI.tabpanel[1] = guiCreateTabPanel(9, 24, 546, 372, false, promoGUI.window[1])

-- Current Job Tab
------------------->>

-- Tab
promoGUI.tab[1] = guiCreateTab("Current Job", promoGUI.tabpanel[1])
-- Scrollpane
promoGUI.scrollpane[1] = guiCreateScrollPane(314, 30, 226, 270, false, promoGUI.tab[1])
promoGUI.label[38] = guiCreateLabel(3, 2, 211, 15, "Test Test Test", false, promoGUI.scrollpane[1])
guiLabelSetHorizontalAlign(promoGUI.label[38], "left", true)
-- Labels (Static)
promoGUI.label[1] = guiCreateLabel(15, 17, 68, 15, "Current Job:", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[1], "default-bold-small")
guiLabelSetColor(promoGUI.label[1], 255, 200, 0)
promoGUI.label[3] = guiCreateLabel(381, 9, 88, 15, "Job Description", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[3], "default-bold-small")
guiLabelSetColor(promoGUI.label[3], 255, 200, 0)
promoGUI.label[5] = guiCreateLabel(314, 291, 226, 15, "____________________________________", false, promoGUI.tab[1])
promoGUI.label[6] = guiCreateLabel(7, 36, 287+6, 15, "_____________________________________________", false, promoGUI.tab[1])
promoGUI.label[8] = guiCreateLabel(10, 81, 80, 15, "Current Rank:", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[8], "default-bold-small")
guiLabelSetColor(promoGUI.label[8], 255, 200, 0)
promoGUI.label[10] = guiCreateLabel(10, 151, 108, 15, "Progress to Promo:", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[10], "default-bold-small")
guiLabelSetColor(promoGUI.label[10], 255, 200, 0)
promoGUI.label[11] = guiCreateLabel(10, 115, 80, 15, "Job Progress:", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[11], "default-bold-small")
guiLabelSetColor(promoGUI.label[11], 255, 200, 0)
promoGUI.label[14] = guiCreateLabel(7, 168, 287+6, 15, "_____________________________________________", false, promoGUI.tab[1])
promoGUI.label[15] = guiCreateLabel(10, 198, 102, 15, "Total Exp. Earned:", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[15], "default-bold-small")
guiLabelSetColor(promoGUI.label[15], 255, 200, 0)
promoGUI.label[16] = guiCreateLabel(10, 230, 102, 15, "Total Cash Earned:", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[16], "default-bold-small")
guiLabelSetColor(promoGUI.label[16], 255, 200, 0)
promoGUI.label[19] = guiCreateLabel(7, 250, 287+6, 15, "_____________________________________________", false, promoGUI.tab[1])
promoGUI.label[20] = guiCreateLabel(87, 272, 122, 15, "Send Cash Earned To:", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[20], "default-bold-small")
guiLabelSetColor(promoGUI.label[20], 255, 200, 0)
-- Labels (Dynamic)
promoGUI.label[2] = guiCreateLabel(92, 17, 203, 15, "<Job Name>", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[2], "clear-normal")
promoGUI.label[7] = guiCreateLabel(244+6, 56, 50, 15, "Level XX", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[7], "default-bold-small")
guiLabelSetColor(promoGUI.label[7], 255, 200, 0)
guiLabelSetHorizontalAlign(promoGUI.label[7], "right", true)
promoGUI.label[9] = guiCreateLabel(99, 81, 191+6, 15, "<Rank Name>", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[9], "clear-normal")
promoGUI.label[12] = guiCreateLabel(126, 151, 164+6, 15, "XXX,XXX Units of Unit", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[12], "clear-normal")
promoGUI.label[13] = guiCreateLabel(99, 115, 191+6, 15, "XXX,XXX Units of Unit", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[13], "clear-normal")
promoGUI.label[17] = guiCreateLabel(120, 198, 172+6, 15, "XXX,XXX Exp. Points", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[17], "clear-normal")
promoGUI.label[18] = guiCreateLabel(120, 231, 172+6, 15, "$XXX,XXX", false, promoGUI.tab[1])
guiSetFont(promoGUI.label[18], "clear-normal")
-- Buttons
promoGUI.button[1] = guiCreateButton(316, 313, 106, 25, "End Shift", false, promoGUI.tab[1])
guiSetProperty(promoGUI.button[1], "NormalTextColour", "FFAAAAAA")
promoGUI.button[2] = guiCreateButton(431, 313, 106, 25, "Resign", false, promoGUI.tab[1])
guiSetProperty(promoGUI.button[2], "NormalTextColour", "FFAAAAAA")
-- Radio Buttons
promoGUI.radiobutton[1] = guiCreateRadioButton(15, 299, 122, 19, " Bank Account", false, promoGUI.tab[1])
promoGUI.radiobutton[2] = guiCreateRadioButton(158, 299, 122, 19, " Pocket", false, promoGUI.tab[1])
guiRadioButtonSetSelected(promoGUI.radiobutton[2], true)

-- All Jobs Tab
---------------->>

-- Tab
promoGUI.tab[2] = guiCreateTab("All Jobs", promoGUI.tabpanel[1])
-- Labels (Static)
promoGUI.label[21] = guiCreateLabel(10, 23, 70, 15, "Civilian Level:", false, promoGUI.tab[2])
promoGUI.label[23] = guiCreateLabel(198, 23, 64, 15, "Experience:", false, promoGUI.tab[2])
promoGUI.label[25] = guiCreateLabel(7, 46, 534, 15, "_______________________________________________________________________________________", false, promoGUI.tab[2])
promoGUI.label[26] = guiCreateLabel(70, 115, 104, 15, "Civilian Jobs List", false, promoGUI.tab[2])
guiSetFont(promoGUI.label[26], "clear-normal")
promoGUI.label[27] = guiCreateLabel(7, 93, 534, 15, "_______________________________________________________________________________________", false, promoGUI.tab[2])
promoGUI.label[31] = guiCreateLabel(251, 139, 79, 15, "Current Rank:", false, promoGUI.tab[2])
guiSetFont(promoGUI.label[31], "default-bold-small")
guiLabelSetColor(promoGUI.label[31], 255, 200, 0)
promoGUI.label[32] = guiCreateLabel(251, 170, 99, 15, "Current Progress:", false, promoGUI.tab[2])
guiSetFont(promoGUI.label[32], "default-bold-small")
guiLabelSetColor(promoGUI.label[32], 255, 200, 0)
promoGUI.label[33] = guiCreateLabel(251, 201, 114, 15, "Progress for Promo:", false, promoGUI.tab[2])
guiSetFont(promoGUI.label[33], "default-bold-small")
guiLabelSetColor(promoGUI.label[33], 255, 200, 0)
promoGUI.label[37] = guiCreateLabel(348, 231, 89, 15, "Job Description", false, promoGUI.tab[2])
guiSetFont(promoGUI.label[37], "default-bold-small")
guiLabelSetColor(promoGUI.label[37], 255, 200, 0)
-- Labels (Dynamic)
promoGUI.label[29] = guiCreateLabel(488, 115, 50, 15, "Level XX", false, promoGUI.tab[2])
guiSetFont(promoGUI.label[29], "default-bold-small")
guiLabelSetColor(promoGUI.label[29], 255, 200, 0)
promoGUI.label[34] = guiCreateLabel(340, 139, 196, 15, "<Insert Rank Name Here>", false, promoGUI.tab[2])
promoGUI.label[35] = guiCreateLabel(378, 201, 160, 15, "<Insert Prog. 4 Promo Here>", false, promoGUI.tab[2])
promoGUI.label[36] = guiCreateLabel(362, 170, 177, 15, "<Insert Current Progress Here>", false, promoGUI.tab[2])
-- Gridlist
promoGUI.gridlist[1] = guiCreateGridList(7, 135, 220, 205, false, promoGUI.tab[2])
guiGridListAddColumn(promoGUI.gridlist[1], "Civilian Jobs List", 0.9)
guiGridListSetSortingEnabled(promoGUI.gridlist[1], false)
-- Memo
promoGUI.memo[1] = guiCreateMemo(251, 250, 289, 90, "", false, promoGUI.tab[2])

-- Other Settings
guiSetVisible(promoGUI.window[1], false)