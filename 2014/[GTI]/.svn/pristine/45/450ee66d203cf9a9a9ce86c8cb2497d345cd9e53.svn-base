----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 28 Mar 2014
-- Resource: GTIgroups/create_gui.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

gcreate = {edit = {}, button = {}, window = {}, label = {}, combobox = {}}
-- Window
local sX, sY = guiGetScreenSize()
local wX, wY = 449, 341
local sX, sY, wX, wY = (sX/2)-(wX/2),(sY/2)-(wY/2),wX,wY
-- sX, sY, wX, wY = 584, 268, 449, 341
gcreate.window[1] = guiCreateWindow(sX, sY, wX, wY, "GTI Group Creation Panel", false)
guiWindowSetSizable(gcreate.window[1], false)
guiSetAlpha(gcreate.window[1], 0.90)
-- Labels
gcreate.label[1] = guiCreateLabel(18, 32, 186, 15, "Group Name:", false, gcreate.window[1])
guiSetFont(gcreate.label[1], "default-bold-small")
guiLabelSetColor(gcreate.label[1], 255, 100, 100)
guiLabelSetHorizontalAlign(gcreate.label[1], "center", false)
gcreate.label[2] = guiCreateLabel(224, 53, 201, 15, "The Display Name of your group.", false, gcreate.window[1])
guiLabelSetHorizontalAlign(gcreate.label[2], "center", false)
gcreate.label[3] = guiCreateLabel(226, 98, 197, 56, "When your group is created, a group account will also be created. The password here will be that group account's password, which you'll need in order to access critical group account settings.", false, gcreate.window[1])
guiSetFont(gcreate.label[3], "default-small")
guiLabelSetHorizontalAlign(gcreate.label[3], "center", true)
gcreate.label[4] = guiCreateLabel(17, 103, 187, 15, "Group Account Password:", false, gcreate.window[1])
guiSetFont(gcreate.label[4], "default-bold-small")
guiLabelSetColor(gcreate.label[4], 255, 100, 100)
guiLabelSetHorizontalAlign(gcreate.label[4], "center", false)
gcreate.label[5] = guiCreateLabel(8, 74, 433, 15, "____________________________________________________________________", false, gcreate.window[1])
gcreate.label[6] = guiCreateLabel(8, 152, 433, 15, "____________________________________________________________________", false, gcreate.window[1])
gcreate.label[7] = guiCreateLabel(17, 177, 187, 15, "Group Type", false, gcreate.window[1])
guiSetFont(gcreate.label[7], "default-bold-small")
guiLabelSetColor(gcreate.label[7], 255, 100, 100)
guiLabelSetHorizontalAlign(gcreate.label[7], "center", false)
gcreate.label[8] = guiCreateLabel(224, 177, 201, 45, "Your group type, which will determine what your group can and can't do (e.g.—turf).", false, gcreate.window[1])
guiLabelSetHorizontalAlign(gcreate.label[8], "center", true)
gcreate.label[9] = guiCreateLabel(8, 223, 433, 15, "____________________________________________________________________", false, gcreate.window[1])
gcreate.label[10] = guiCreateLabel(12, 245, 424, 28, "You will be set as the group owner will full access permissions when you create your group.", false, gcreate.window[1])
guiSetFont(gcreate.label[10], "default-bold-small")
guiLabelSetColor(gcreate.label[10], 255, 100, 100)
guiLabelSetHorizontalAlign(gcreate.label[10], "center", true)
-- Label-Button
gcreate.label[11] = guiCreateLabel(406, 314, 32, 15, "Close", false, gcreate.window[1])
guiSetFont(gcreate.label[11], "default-small")
guiLabelSetHorizontalAlign(gcreate.label[11], "center", false)
-- Editboxes
gcreate.edit[1] = guiCreateEdit(17, 51, 188, 24, "", false, gcreate.window[1])
guiEditSetMaxLength(gcreate.edit[1], 40)
gcreate.edit[2] = guiCreateEdit(17, 123, 188, 24, "", false, gcreate.window[1])
guiEditSetMaxLength(gcreate.edit[2], 25)
guiEditSetMasked(gcreate.edit[2], true)
-- Combobox
gcreate.combobox[1] = guiCreateComboBox(17, 197, 188, 24, "", false, gcreate.window[1])
-- Button
gcreate.button[1] = guiCreateButton(126, 285, 203, 41, "Create Group", false, gcreate.window[1])
guiSetFont(gcreate.button[1], "default-bold-small")
guiSetProperty(gcreate.button[1], "NormalTextColour", "FFAAAAAA")
-- Visible
guiSetVisible(gcreate.window[1], false)
