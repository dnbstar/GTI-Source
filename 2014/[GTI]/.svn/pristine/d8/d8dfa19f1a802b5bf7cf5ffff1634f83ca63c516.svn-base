local screenW, screenH = guiGetScreenSize()
--showCursor( true)

GTIres = {
    tab = {},
    edit = {},
    tabpanel = {},
    label = {},
    button = {},
    window = {},
    gridlist = {},
    memo = {}
}

--GTIres.window[1] = guiCreateWindow((screenW - 521) / 2, (screenH - 518) / 2, 521, 518, "GTI - Resource/ACL Management", false)
GTIres.window[1] = guiCreateWindow((screenW - 521) / 2, (screenH - 518) / 2, 521, 518, "GTI - Executive Management Panel", false)

guiWindowSetSizable(GTIres.window[1], false)
guiSetVisible( GTIres.window[1], false)

GTIres.tabpanel[1] = guiCreateTabPanel(9, 34, 502, 474, false, GTIres.window[1])

GTIres.tab[1] = guiCreateTab("Resource Management", GTIres.tabpanel[1])

GTIres.gridlist[1] = guiCreateGridList(10, 33, 248, 407, false, GTIres.tab[1])
nameColumn = guiGridListAddColumn(GTIres.gridlist[1], "Resource", 0.6)
stateColum = guiGridListAddColumn(GTIres.gridlist[1], "State", 0.2)
GTIres.edit[4] = guiCreateEdit( 10, 5, 248, 24, "Search...", false, GTIres.tab[1])

GTIres.label[1] = guiCreateLabel(277, 6, 214, 17, "Resource Information", false, GTIres.tab[1])
guiSetFont(GTIres.label[1], "default-bold-small")
guiLabelSetColor(GTIres.label[1], 236, 151, 18)
guiLabelSetHorizontalAlign(GTIres.label[1], "center", false)
guiLabelSetVerticalAlign(GTIres.label[1], "center")
GTIres.label[2] = guiCreateLabel(277, 43, 214, 15, "Name: ", false, GTIres.tab[1])
GTIres.label[3] = guiCreateLabel(277, 68, 214, 15, "Author: ", false, GTIres.tab[1])
GTIres.label[4] = guiCreateLabel(277, 93, 214, 15, "Version: ", false, GTIres.tab[1])
GTIres.button[1] = guiCreateButton(277, 335, 215, 28, "Start Resource", false, GTIres.tab[1])
guiSetEnabled( GTIres.button[1], false)

GTIres.button[2] = guiCreateButton(277, 373, 215, 28, "Restart Resource", false, GTIres.tab[1])
guiSetEnabled( GTIres.button[2], false)

GTIres.button[3] = guiCreateButton(277, 411, 215, 28, "Stop Resource", false, GTIres.tab[1])
guiSetEnabled( GTIres.button[3], false)

GTIres.label[5] = guiCreateLabel(277, 168, 214, 15, "Resource Description", false, GTIres.tab[1])
guiLabelSetHorizontalAlign(GTIres.label[5], "center", false)
guiLabelSetVerticalAlign(GTIres.label[5], "center")
GTIres.memo[1] = guiCreateMemo(277, 193, 215, 93, "", false, GTIres.tab[1])
guiMemoSetReadOnly(GTIres.memo[1], true)
GTIres.label[6] = guiCreateLabel(277, 118, 214, 15, "Resource Type:", false, GTIres.tab[1])
GTIres.label[7] = guiCreateLabel(277, 143, 214, 15, "Resource State: ", false, GTIres.tab[1])

GTIres.label[9] = guiCreateLabel(365, 23, 37, 15, "Refresh", false, GTIres.tab[1])
guiSetFont(GTIres.label[9], "default-small")
guiLabelSetHorizontalAlign(GTIres.label[9], "center", false)

GTIres.tab[2] = guiCreateTab("Access List Management", GTIres.tabpanel[1])
--GTIres.tab[3] = guiCreateTab("Executive Management", GTIres.tabpanel[1])
--> ACL User Interface

--GTIres.gridlist[2] = guiCreateGridList(6, 4, 182, 436, false, GTIres.tab[2])
GTIres.gridlist[2] = guiCreateGridList(6, 224, 182, 218, false, GTIres.tab[2])
aclColumn = guiGridListAddColumn(GTIres.gridlist[2], "ACLs", 0.8)

GTIres.gridlist[3] = guiCreateGridList(6, 4, 182, 218, false, GTIres.tab[2])
groupColumn = guiGridListAddColumn(GTIres.gridlist[3], "Groups", 0.8)

GTIres.gridlist[4] = guiCreateGridList(197, 54, 144, 116, false, GTIres.tab[2])
objectColumn = guiGridListAddColumn(GTIres.gridlist[4], "Object", 0.7)

GTIres.gridlist[5] = guiCreateGridList(348, 54, 203, 146, false, GTIres.tab[2])
rightColumn = guiGridListAddColumn(GTIres.gridlist[5], "Right", 0.85)

GTIres.gridlist[6] = guiCreateGridList(198, 200, 143, 82, false, GTIres.tab[2])
groupACLColumn = guiGridListAddColumn(GTIres.gridlist[6], "ACLs", 0.8)

GTIres.label[10] = guiCreateLabel(198, 14, 353, 15, "ACL Management", false, GTIres.tab[2])
guiSetFont(GTIres.label[10], "default-bold-small")
guiLabelSetColor(GTIres.label[10], 236, 151, 18)
guiLabelSetHorizontalAlign(GTIres.label[10], "center", false)

--GTIres.button[4] = guiCreateButton(378, 417, 146, 18, "Create Group", false, GTIres.tab[2])
GTIres.button[4] = guiCreateButton(378, 389, 146, 18, "Create Group", false, GTIres.tab[2])

GTIres.button[5] = guiCreateButton(378, 363, 146, 18, "Create ACL", false, GTIres.tab[2])

GTIres.button[14] = guiCreateButton(378, 413, 146, 18, "Destroy ACL", false, GTIres.tab[2])

--GTIres.edit[1] = guiCreateEdit(378, 341, 146, 18, "", false, GTIres.tab[2])

--GTIres.edit[2] = guiCreateEdit(378, 391, 146, 21, "", false, GTIres.tab[2])

--GTIres.label[11] = guiCreateLabel(198, 369, 353, 15, "ACL Creation Utility", false, GTIres.tab[2])
--guiSetFont(GTIres.label[11], "default-bold-small")
--guiLabelSetColor(GTIres.label[11], 236, 151, 18)
--guiLabelSetHorizontalAlign(GTIres.label[11], "center", false)

GTIres.label[12] = guiCreateLabel(198, 29, 143, 15, "ACL Objects", false, GTIres.tab[2])
guiSetFont(GTIres.label[12], "default-small")
guiLabelSetColor(GTIres.label[12], 236, 151, 18)
guiLabelSetHorizontalAlign(GTIres.label[12], "center", false)

GTIres.label[13] = guiCreateLabel(348, 29, 203, 15, "ACL Rights", false, GTIres.tab[2])
guiSetFont(GTIres.label[13], "default-small")
guiLabelSetColor(GTIres.label[13], 236, 151, 18)
guiLabelSetHorizontalAlign(GTIres.label[13], "center", false)

GTIres.label[14] = guiCreateLabel(198, 282, 140, 15, "Group Options", false, GTIres.tab[2])
guiSetFont(GTIres.label[14], "default-small")
guiLabelSetColor(GTIres.label[14], 236, 151, 18)
guiLabelSetHorizontalAlign(GTIres.label[14], "center", false)

GTIres.button[6] = guiCreateButton(198, 303, 140, 18, "Destroy Group", false, GTIres.tab[2])

GTIres.button[7] = guiCreateButton(198, 331, 140, 18, "Add Object", false, GTIres.tab[2])

GTIres.button[8] = guiCreateButton(198, 389, 140, 18, "Add ACL", false, GTIres.tab[2])

GTIres.button[9] = guiCreateButton(198, 361, 140, 18, "Remove Object", false, GTIres.tab[2])

GTIres.button[10] = guiCreateButton(198, 417, 140, 18, "Remove ACL", false, GTIres.tab[2])

GTIres.button[11] = guiCreateButton(380, 231, 144, 18, "Add Right", false, GTIres.tab[2])

GTIres.button[12] = guiCreateButton(380, 259, 144, 18, "Remove Right", false, GTIres.tab[2])

GTIres.label[15] = guiCreateLabel(348, 210, 203, 15, "ACL Options", false, GTIres.tab[2])
guiSetFont(GTIres.label[15], "default-small")
guiLabelSetColor(GTIres.label[15], 236, 151, 18)
guiLabelSetHorizontalAlign(GTIres.label[15], "center", false)

--GTIres.button[11] = guiCreateButton(348, 287, 144, 18, "Add Right", false, GTIres.tab[2])

--GTIres.button[12] = guiCreateButton(348, 315, 144, 18, "Remove Right", false, GTIres.tab[2])

GTIres.label[16] = guiCreateLabel(319, 0, 52, 15, "Refresh", false, GTIres.tab[2])
guiSetFont(GTIres.label[16], "default-small")
guiLabelSetHorizontalAlign(GTIres.label[16], "center", false)

GTIres.label[17] = guiCreateLabel(380, 287, 144, 54, "To edit a right, double \nclick on the corrosponding\n row to toggle the \nopposite right setting.", false, GTIres.tab[2])
guiSetFont(GTIres.label[17], "default-small")
guiLabelSetHorizontalAlign(GTIres.label[17], "center", true)

GTIres.label[18] = guiCreateLabel(198, 180, 143, 15, "Group ACLs", false, GTIres.tab[2])
guiSetFont(GTIres.label[18], "default-small")
guiLabelSetColor(GTIres.label[18], 236, 151, 18)
guiLabelSetHorizontalAlign(GTIres.label[18], "center", true)

--> Executive Management Interface

--[[
GTIres.edit[5] = guiCreateEdit(6, 5, 183, 25, "", false, GTIres.tab[3])

GTIres.gridlist[7] = guiCreateGridList(6, 35, 183, 404, false, GTIres.tab[3])
playerColumn = guiGridListAddColumn(GTIres.gridlist[7], "Players", 0.8)

GTIres.label[19] = guiCreateLabel(199, 5, 269, 15, "Name: ", false, GTIres.tab[3])

GTIres.label[20] = guiCreateLabel(199, 30, 269, 15, "Account: ", false, GTIres.tab[3])

GTIres.label[21] = guiCreateLabel(199, 55, 134, 15, "IP: ", false, GTIres.tab[3])

GTIres.label[22] = guiCreateLabel(199, 80, 269, 15, "Serial: ", false, GTIres.tab[3])

GTIres.label[23] = guiCreateLabel(333, 55, 135, 15, "Version: ", false, GTIres.tab[3])

GTIres.label[24] = guiCreateLabel(199, 105, 269, 15, "Country: ", false, GTIres.tab[3])

GTIres.label[25] = guiCreateLabel(199, 120, 269, 15, "_______________________________________________", false, GTIres.tab[3])
guiLabelSetColor(GTIres.label[25], 251, 0, 0)
guiLabelSetHorizontalAlign(GTIres.label[25], "center", false)

GTIres.label[26] = guiCreateLabel(199, 140, 134, 15, "Health: ", false, GTIres.tab[3])

GTIres.label[27] = guiCreateLabel(333, 140, 135, 15, "Armor: ", false, GTIres.tab[3])

GTIres.label[28] = guiCreateLabel(199, 165, 134, 15, "Skin: ", false, GTIres.tab[3])

GTIres.label[29] = guiCreateLabel(333, 165, 135, 15, "Team: ", false, GTIres.tab[3])

GTIres.label[30] = guiCreateLabel(199, 190, 269, 15, "Money: ", false, GTIres.tab[3])

GTIres.label[31] = guiCreateLabel(199, 215, 269, 15, "Weapon: ", false, GTIres.tab[3])

GTIres.label[32] = guiCreateLabel(199, 240, 269, 15, "Location: ", false, GTIres.tab[3])

GTIres.label[33] = guiCreateLabel(199, 265, 134, 15, "X: ", false, GTIres.tab[3])

GTIres.label[34] = guiCreateLabel(199, 315, 134, 15, "Z: ", false, GTIres.tab[3])

GTIres.label[35] = guiCreateLabel(199, 290, 134, 15, "Y: ", false, GTIres.tab[3])

GTIres.label[36] = guiCreateLabel(334, 265, 134, 15, "Interior: ", false, GTIres.tab[3])

GTIres.label[37] = guiCreateLabel(334, 290, 134, 15, "Dimension: ", false, GTIres.tab[3])

GTIres.label[38] = guiCreateLabel(199, 340, 269, 15, "_______________________________________________", false, GTIres.tab[3])
guiLabelSetColor(GTIres.label[38], 251, 0, 0)
guiLabelSetHorizontalAlign(GTIres.label[38], "center", false)

GTIres.label[39] = guiCreateLabel(199, 365, 269, 15, "Vehicle: ", false, GTIres.tab[3])

GTIres.label[40] = guiCreateLabel(199, 390, 134, 15, "Vehicle Health: ", false, GTIres.tab[3])

GTIres.button[13] = guiCreateButton(478, 5, 174, 26, "Punish", false, GTIres.tab[3])

GTIres.button[14] = guiCreateButton(478, 39, 85, 26, "Kick", false, GTIres.tab[3])

GTIres.button[15] = guiCreateButton(567, 39, 85, 26, "Ban", false, GTIres.tab[3])

GTIres.button[16] = guiCreateButton(478, 70, 85, 26, "Slap", false, GTIres.tab[3])

GTIres.button[17] = guiCreateButton(567, 70, 85, 26, "Spectate", false, GTIres.tab[3])

GTIres.button[18] = guiCreateButton(478, 101, 174, 24, "Warp to Player", false, GTIres.tab[3])

GTIres.button[19] = guiCreateButton(478, 132, 174, 24, "Warp Player To...", false, GTIres.tab[3])

GTIres.button[20] = guiCreateButton(478, 160, 85, 24, "Set Skin", false, GTIres.tab[3])

GTIres.button[21] = guiCreateButton(478, 250, 85, 24, "Set Money", false, GTIres.tab[3])

GTIres.button[22] = guiCreateButton(567, 190, 85, 24, "Give Weapon", false, GTIres.tab[3])

GTIres.button[23] = guiCreateButton(567, 220, 85, 24, "Give Vehicle", false, GTIres.tab[3])

GTIres.button[12] = guiCreateButton(567, 160, 85, 24, "Set Armor", false, GTIres.tab[3])

GTIres.button[13] = guiCreateButton(567, 250, 85, 24, "Set Nick", false, GTIres.tab[3])

GTIres.edit[2] = guiCreateEdit(478, 190, 85, 24, "", false, GTIres.tab[3])

GTIres.edit[3] = guiCreateEdit(478, 220, 85, 24, "", false, GTIres.tab[3])
--]]

GTIres.label[8] = guiCreateLabel(474, 22, 27, 12, "Close", false, GTIres.window[1])
guiSetFont(GTIres.label[8], "default-small")
guiLabelSetHorizontalAlign(GTIres.label[8], "center", false)
guiLabelSetVerticalAlign(GTIres.label[8], "center")

function accessPanel()
	if guiGetVisible( GTIres.window[1]) ~= true then
		guiSetVisible( GTIres.window[1], true)
		showCursor( true)
	else
		guiSetVisible( GTIres.window[1], false)
		showCursor( false)
	end
end
addEvent( "GTIres.accessManagementPanel", true)
addEventHandler( "GTIres.accessManagementPanel", root, accessPanel)
