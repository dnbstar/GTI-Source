----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 01 Apr 2014
-- Resource: GTIgroups/group-panel/panel_members.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

DEFAULT_PLR_NAME = "None Selected"		-- Default Text that appears if no player selected

-- Member Tab Info
------------------->>

function getMembersTabInfo()
	if (guiGridListGetRowCount(groupPanel.gridlist[1]) > 0) then return end
		-- Clear Default Data
	guiSetText(groupPanel.label[8], "...")
	guiSetText(groupPanel.label[10], "...")
	guiSetText(groupPanel.label[12], "...")
		-- Disable All Admin Buttons
	for i=2,6 do
		guiSetEnabled(groupPanel.button[i], false)
	end
	
	triggerServerEvent("GTIgroups.getMembersTabInfo", resourceRoot)
end
addEventHandler("onClientGUITabSwitched", groupPanel.tab[2], getMembersTabInfo)

function setMemberTabInfo(member_count, last_active, my_rank, member_data, perm_data)
		-- Set Label Data
	guiSetText(groupPanel.label[8], member_count)
	guiSetText(groupPanel.label[10], my_rank)
	local day,mon,year = exports.GTIutil:todate(last_active)
	local mon = exports.GTIutil:getMonthName(mon)
	guiSetText(groupPanel.label[12], day.." "..mon.." "..year)
		-- Render Gridlist
	for i,v in ipairs(member_data) do
		local row = guiGridListAddRow(groupPanel.gridlist[1])
		guiGridListSetItemText(groupPanel.gridlist[1], row, 1, v["country"], false, false)
		guiGridListSetItemText(groupPanel.gridlist[1], row, 2, v["name"], false, false)
		guiGridListSetItemText(groupPanel.gridlist[1], row, 3, v["account_name"], false, false)
		guiGridListSetItemText(groupPanel.gridlist[1], row, 4, v["rank"], false, false)
		local day,mon,year = exports.GTIutil:todate(v["last_active"])
		local mon = exports.GTIutil:getMonthName(mon)
		guiGridListSetItemText(groupPanel.gridlist[1], row, 5, day.." "..mon.." "..year, false, false)
		guiGridListSetItemText(groupPanel.gridlist[1], row, 6, v["warning"].."%", false, false)
	end
		-- Modify Buttons based on Permissions
	if (perm_data["add_member"]) then
		guiSetEnabled(groupPanel.button[2], true)
	else
		guiSetEnabled(groupPanel.button[2], false)
	end
	if (perm_data["change_member_rank"]) then
		guiSetEnabled(groupPanel.button[6], true)
	else
		guiSetEnabled(groupPanel.button[6], false)
	end
	
end
addEvent("GTIgroups.setMemberTabInfo", true)
addEventHandler("GTIgroups.setMemberTabInfo", root, setMemberTabInfo)

-- Add Member...
----------------->>

	-- Show/Hide GUI -->>

local memberList = {}
function addMemberToGroup(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	guiGridListClear(groupInviteTo.gridlist[1])
	for i,player in ipairs(getElementsByType("player")) do
		if (player ~= localPlayer) then
			local row = guiGridListAddRow(groupInviteTo.gridlist[1])
			guiGridListSetItemText(groupInviteTo.gridlist[1], row, 1, getPlayerName(player), false, false)
			table.insert(memberList, getPlayerName(player))
		end
	end
	
	guiBringToFront(groupInviteTo.window[1])
	guiSetText(groupInviteTo.label[3], DEFAULT_PLR_NAME)
	guiSetVisible(groupInviteTo.window[1], true)
end
addEventHandler("onClientGUIClick", groupPanel.button[2], addMemberToGroup, false)

function cancelAddMember(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(groupInviteTo.window[1], false)
end
addEventHandler("onClientGUIClick", groupInviteTo.button[2], cancelAddMember, false)

	-- GUI Functions -->>

function selectMemberForInvite(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(groupInviteTo.gridlist[1])
	if (not row or row == -1) then return end
	
	local plrName = guiGridListGetItemText(groupInviteTo.gridlist[1], row, 1)
	guiSetText(groupInviteTo.label[3], plrName)
end

function invitePlayer(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local plrName = guiGetText(groupInviteTo.label[3])
	
	if (plrName == DEFAULT_PLR_NAME) then
		exports.GTIhud:dm("Select a player that you wish to invite.", 255, 100, 100)
		return
	end
	if (not getPlayerFromName(plrName)) then
		exports.GTIhud:dm("A player with this name no longer exists. Refresh the panel by closing/reopening it.", 255, 100, 100)
		return
	end
	
	triggerServerEvent("GTIgroups.invitePlayer", resourceRoot, plrName)
end
