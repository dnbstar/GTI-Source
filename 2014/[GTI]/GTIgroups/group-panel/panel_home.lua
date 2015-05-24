----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 31 Mar 2014
-- Resource: GTIgroups/group-panel/gPanel_home.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Show Group Panel
-------------------->>

local buttonSpam
function toggleGroupPanelHome()
	if (not getElementData(localPlayer, "group")) then return end
		-- Toggle Group Panel
	if (guiGetVisible(groupPanel.window[1])) then
		guiSetVisible(groupPanel.window[1], false)
		guiSetVisible(groupInviteTo.window[1], false)
		guiSetVisible(mChangeRank.window[1], false)
		showCursor(false)
	else
		if (buttonSpam) then return end
		buttonSpam = true
	
		guiSetText(groupPanel.window[1], "Loading...")
		guiSetText(groupPanel.label[1], "Group Name:")
		guiSetText(groupPanel.label[3], "...")
		guiSetText(groupPanel.label[4], "...")
		local sx,sy = guiGetSize(groupPanel.label[5], false)
		guiSetSize(groupPanel.label[5], sx, 15, false)
		guiSetText(groupPanel.label[5], "")
	
		guiSetVisible(groupPanel.button[1], false)
	
		guiSetSelectedTab(groupPanel.tabpanel[1], groupPanel.tab[1])
		guiSetVisible(groupPanel.window[1], true)
		showCursor(true)
		triggerServerEvent("GTIgroups.showGroupPanelHome", resourceRoot)
		
		setTimer(function() buttonSpam = nil end, 1000, 1)
	end
end
bindKey("F2", "up", toggleGroupPanelHome)

function showGroupPanelHome(group, perm)
		-- Group Info Data
	guiSetText(groupPanel.window[1], group["name"].." — GTI "..group["typeWhole"].." Panel")
	guiSetText(groupPanel.label[1], group["type"].." Name:")
	
	guiSetText(groupPanel.label[3], group["name"])
	
	local day,mon,year = exports.GTIutil:todate(group["date"])
	local mon = exports.GTIutil:getMonthName(mon)
	guiSetText(groupPanel.label[4], day.." "..mon.." "..year)
	
	local len = math.ceil(#group["info"]/90)
	local pos = 0
	while true do
		local sPos,ePos = string.find(group["info"],"\n",pos)
		if (not sPos) then break end
		pos,len = sPos+1, len+1
	end
	local sx,sy = guiGetSize(groupPanel.label[5], false)
	guiSetSize(groupPanel.label[5], sx, len*15, false)
	guiSetText(groupPanel.label[5], group["info"])
	
		-- Group Permissions
	if (perm["mod_info"]) then
		guiSetVisible(groupPanel.button[1], true)
	else
		guiSetVisible(groupPanel.button[1], false)
	end
end
addEvent("GTIgroups.showGroupPanelHome", true)
addEventHandler("GTIgroups.showGroupPanelHome", root, showGroupPanelHome)

-- Modify Group Info
--------------------->>

function modifyGroupInfo(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (guiGetText(source) == "Modify") then
			-- Switch to Group Info Modification
		guiSetVisible(groupPanel.scrollpane[1], false)
		local info = guiGetText(groupPanel.label[5])
		guiSetText(groupPanel.memo[1], info)
		guiSetVisible(groupPanel.memo[1], true)
		
		guiSetText(source, "Update")	
		exports.GTIhud:dm("You are now editing the group information. Click 'Update' when you are done to save it.", 255, 100, 100)
	else
			-- Update the Group Information
		local info = guiGetText(groupPanel.memo[1])
		local len = math.ceil(#info/90)
		local pos = 0
		while true do
			local sPos,ePos = string.find(info,"\n",pos)
			if (not sPos) then break end
			pos,len = sPos+1, len+1
		end
		local sx,sy = guiGetSize(groupPanel.label[5], false)
		guiSetSize(groupPanel.label[5], sx, len*15, false)
		guiSetText(groupPanel.label[5], info)
		
		guiSetText(source, "Modify")
		guiSetEnabled(source, false)
		setTimer(guiSetEnabled, 500, 1, source, true)
		
		guiSetVisible(groupPanel.scrollpane[1], true)
		guiSetVisible(groupPanel.memo[1], false)
		
		
		triggerServerEvent("GTIgroups.modifyGroupInfo", resourceRoot, info)
	end
end
addEventHandler("onClientGUIClick", groupPanel.button[1], modifyGroupInfo, false)
