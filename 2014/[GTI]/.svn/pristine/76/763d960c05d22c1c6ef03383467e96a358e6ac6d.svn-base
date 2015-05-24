----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 10 Apr 2014
-- Resource: GTIgroups/g_invites.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local groupIDs = {}

-- Toggle Invite Panel
----------------------->>

local buttonSpam
function showGroupInvites()
	if (getElementData(localPlayer, "group")) then return end
		-- Toggle Invite Panel
	if (guiGetVisible(groupInvite.window[1]) or guiGetVisible(gcreate.window[1])) then
		guiSetVisible(groupInvite.window[1], false)
		guiSetVisible(gcreate.window[1], false)
		showCursor(false)
	else
		if (buttonSpam) then return end
		buttonSpam = true
		
		guiGridListClear(groupInvite.gridlist[1])
		guiSetVisible(groupInvite.window[1], true)
		showCursor(true)
		
		triggerServerEvent("GTIgroups.showGroupInvites", resourceRoot)
		
		setTimer(function() buttonSpam = nil end, 1000, 1)
	end
end
bindKey("F2", "up", showGroupInvites)

-- Display Invites if Exists
----------------------------->>

function updateGroupInvites(groupNames)
	groupIDs = {}
	guiGridListClear(groupInvite.gridlist[1])
	for i,groupName in ipairs(groupNames) do
		local row = guiGridListAddRow(groupInvite.gridlist[1])
		guiGridListSetItemText(groupInvite.gridlist[1], row, 1, groupName[1], false, false)
		groupIDs[row] = groupName[2]
	end
end
addEvent("GTIgroups.updateGroupInvites", true)
addEventHandler("GTIgroups.updateGroupInvites", root, updateGroupInvites)

-- Accept/Deny/Deny All
------------------------>>

function manageInvite(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(groupInvite.gridlist[1])
	if (not row or row == -1) then return end
	
	if (source == groupInvite.button[1]) then			-- Accept Invite
		triggerServerEvent("GTIgroups.manageInvite", resourceRoot, groupIDs[row], true)
	elseif (source == groupInvite.button[2]) then		-- Deny Invite
		triggerServerEvent("GTIgroups.manageInvite", resourceRoot, groupIDs[row], false)
	elseif (source == groupInvite.button[3]) then		-- Deny All Invites
		local groupNames = {}
		for row=1,guiGridListGetRowCount(groupInvite.gridlist[1]) do
			table.insert(groupNames, groupIDs[row-1])
		end
		triggerServerEvent("GTIgroups.manageInvite", resourceRoot, groupNames, false)
	end
end
addEventHandler("onClientGUIClick", groupInvite.button[1], manageInvite)
addEventHandler("onClientGUIClick", groupInvite.button[2], manageInvite)
addEventHandler("onClientGUIClick", groupInvite.button[3], manageInvite)

-- Show Create Group
--------------------->>

function showCreateGroup(button, state)
	if (button ~= "left" or state ~= "up") then return end
	triggerServerEvent("GTIgroups.showGroupCreatePanel", resourceRoot)
end
addEventHandler("onClientGUIClick", groupInvite.button[4], showCreateGroup)

-- Close
--------->>

function closeInvites()
	guiSetVisible(groupInvite.window[1], false)
	guiSetVisible(gcreate.window[1], false)
	showCursor(false)
	groupIDs = {}
end
addEvent("GTIgroups.closeInvites", true)
addEventHandler("GTIgroups.closeInvites", root, closeInvites)
