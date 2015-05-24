resState = {}
resAuthor = {}
resDecription = {}
resVersion = {}
resType = {}
resName = {}
resLastStart = {}
playerAccess = {}

events = {
	["Resource Management"] = "GTIres.getAllResources",
	["Access List Management"] = "GTIres.getAllACLs",
	["Executive Management"] = "GTIresLocal.getPlayers",
}

tabEdit = {
	["Resource Management"] = 502,
	["Access List Management"] = 561,
	["Executive Management"] = 662,
}

windowEdit = {
	["Resource Management"] = 521,
	["Access List Management"] = 580,
	["Executive Management"] = 681,
}

closeEdit = {
	["Resource Management"] = 474,
	["Access List Management"] = 543,
	["Executive Management"] = 644,
}

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		triggerServerEvent( "GTIres.getAllResources", localPlayer)
	end
)

addEventHandler( "onClientGUITabSwitched", resourceRoot,
	function( theElement)
		local tabName = guiGetText( theElement)
		local theEvent = events[tabName]
		local tabSize = tabEdit[tabName]
		local windowSize = windowEdit[tabName]
		local closeBSize = closeEdit[tabName]
		local wSX, wSY = guiGetSize( GTIres.window[1], false)
		local tSX, tSY = guiGetSize( GTIres.tabpanel[1], false)
		local cSX, cSY = guiGetPosition( GTIres.label[8], false)
		if theEvent ~= nil then
			if theEvent ~= "none" then
				if string.find( theEvent, "GTIresLocal") then
					triggerEvent( theEvent, localPlayer)
				else
					triggerServerEvent( theEvent, localPlayer)
				end
			end
			local search = GTIres.edit[4]
			if tabName ~= "Resource Management" then
				if search ~= "" then
					if search ~= "Search..." then
						guiSetText( GTIres.edit[4], "")
					end
				end
			end
			guiSetText( GTIres.window[1], "GTI - "..tabName.." Panel")
			guiSetSize( GTIres.window[1], windowSize, wSY, false)
			guiSetSize( GTIres.tabpanel[1], tabSize, tSY, false)
			guiSetPosition( GTIres.label[8], closeBSize, cSY, false)
		end
	end
)

addEventHandler( "onClientMouseEnter", root,
	function()
		if source == GTIres.label[8] then
			guiLabelSetColor(GTIres.label[8], 236, 151, 18)
		elseif source == GTIres.label[9] then
			guiLabelSetColor(GTIres.label[9], 236, 151, 18)
		elseif source == GTIres.label[16] then
			guiLabelSetColor(GTIres.label[16], 236, 151, 18)
		end
	end
)

addEventHandler( "onClientMouseLeave", root,
	function()
		if source == GTIres.label[8] then
			guiLabelSetColor(GTIres.label[8], 255, 255, 255)
		elseif source == GTIres.label[9] then
			guiLabelSetColor(GTIres.label[9], 255, 255, 255)
		elseif source == GTIres.label[16] then
			guiLabelSetColor(GTIres.label[16], 255, 255, 255)
		end
	end
)

translation = {
	['loaded'] = "Loaded",
	['running'] = "Running",
	['start'] = "Started",
	['stopping'] = "Stopped",
	['failed to load'] = "Unloadable",
}

anti = {
	spam = {},
}

addEventHandler( "onClientGUIClick", root,
	function()
		--Close Panel
		if source == GTIres.label[8] then
			if guiGetVisible( GTIres.window[1]) == true then
				guiSetVisible( GTIres.window[1], false)
				showCursor( false)
			end
		elseif source == GTIres.label[16] then
			if not isTimer( fresh2Timer) then
				guiGridListClear( GTIres.gridlist[2])
				guiGridListClear( GTIres.gridlist[3])
				triggerServerEvent( "GTIres.getAllACLs", localPlayer)
				fresh2Timer = setTimer( function() end, 5000, 1)
			else
				if not isTimer( antiSpam2Timer) then
					outputChatBox( "You can only fetch the ACL list every 5 seconds", 255, 0, 0)
					antiSpam2Timer = setTimer( function() end, 2500, 1)
				end
			end
		--Group Addition
		elseif source == GTIres.button[4] then
			if playerAccess[localPlayer] ~= false then
				createPopup( "Create Group", "Create Group", "Enter Group Name: ", false, "GTIres.modifyACL", "none", "text", "add_group")
			else
				if not isTimer( anti.spam[8]) then
					outputChatBox( "You don't have access to do this.", 255, 0, 0)
					anti.spam[8] = setTimer( function() end, 2500, 1)
				end
			end
		--ACL Addition
		elseif source == GTIres.button[5] then
			if playerAccess[localPlayer] ~= false then
				createPopup( "Create ACL", "Create ACL", "Enter ACL Name: ", false, "GTIres.modifyACL", "none", "text", "add_acl")
			else
				if not isTimer( anti.spam[9]) then
					outputChatBox( "You don't have access to do this.", 255, 0, 0)
					anti.spam[9] = setTimer( function() end, 2500, 1)
				end
			end
		--Group Removal
		elseif source == GTIres.button[6] then
			local selectedRowG, selectedColG = guiGridListGetSelectedItem(GTIres.gridlist[3])
			local selectedGroup = guiGridListGetItemText( GTIres.gridlist[3], selectedRowG, selectedColG)
			if selectedGroup ~= "" then
				outputChatBox( "You destroyed the '#FFFF00"..selectedGroup.."#FFFFFF' group.", 255, 255, 255, true)
				triggerServerEvent( "GTIres.modifyACL", localPlayer, selectedGroup, selectedGroup, "remove_group")
			else
				if not isTimer( anti.spam[4]) then
					outputChatBox( "You must select a group to destroy.", 255, 0, 0)
					anti.spam[4] = setTimer( function() end, 2500, 1)
				end
			end
		--Group Object Addition
		elseif source == GTIres.button[7] then
			local selectedRowG, selectedColG = guiGridListGetSelectedItem(GTIres.gridlist[3])
			local selectedGroup = guiGridListGetItemText( GTIres.gridlist[3], selectedRowG, selectedColG)
			if selectedGroup then
				if selectedGroup ~= "" then
					createPopup( "Add Object", "Add Object", "Enter Group Object: ", true, "GTIres.modifyACL", selectedGroup, "text", "add_object")
				else
					if not isTimer( anti.spam[1]) then
						outputChatBox( "You must select a group to be able to add a object.", 255, 0, 0)
						anti.spam[1] = setTimer( function() end, 2500, 1)
					end
				end
			end
		--Group ACL Addition
		elseif source == GTIres.button[8] then
			local selectedRowG, selectedColG = guiGridListGetSelectedItem(GTIres.gridlist[3])
			local selectedGroup = guiGridListGetItemText( GTIres.gridlist[3], selectedRowG, selectedColG)
			if selectedGroup then
				if selectedGroup ~= "" then
					local selectedRowACL, selectedColACL = guiGridListGetSelectedItem(GTIres.gridlist[2])
					local selectedACL = guiGridListGetItemText( GTIres.gridlist[2], selectedRowACL, selectedColACL)
					if selectedACL then
						if selectedACL ~= "" then
							--createPopup( "Remove Object", "Enter Group Object: ", true, "none")
							triggerServerEvent( "GTIres.modifyACL", localPlayer, selectedGroup, selectedACL, "add_group_acl")
						else
							if not isTimer( anti.spam[6]) then
								outputChatBox( "You must select an ACL to add to that group.", 255, 0, 0)
								anti.spam[6] = setTimer( function() end, 2500, 1)
							end
						end
					end
				else
					if not isTimer( anti.spam[5]) then
						outputChatBox( "You must select a group first to be able to add an ACL to that group.", 255, 0, 0)
						anti.spam[5] = setTimer( function() end, 2500, 1)
					end
				end
			end
		--Group Object Removal
		elseif source == GTIres.button[9] then
			local selectedRowG, selectedColG = guiGridListGetSelectedItem(GTIres.gridlist[3])
			local selectedGroup = guiGridListGetItemText( GTIres.gridlist[3], selectedRowG, selectedColG)
			if selectedGroup then
				if selectedGroup ~= "" then
					local selectedRowGO, selectedColGO = guiGridListGetSelectedItem(GTIres.gridlist[4])
					local selectedObject = guiGridListGetItemText( GTIres.gridlist[4], selectedRowGO, selectedColGO)
					if selectedObject then
						if selectedObject ~= "" then
							--createPopup( "Remove Object", "Enter Group Object: ", true, "none")
							triggerServerEvent( "GTIres.modifyACL", localPlayer, selectedGroup, selectedObject, "remove_object")
						else
							if not isTimer( anti.spam[3]) then
								outputChatBox( "You must select a object to remove from that channel.", 255, 0, 0)
								anti.spam[3] = setTimer( function() end, 2500, 1)
							end
						end
					end
				else
					if not isTimer( anti.spam[2]) then
						outputChatBox( "You must select a group to be able to remove that object.", 255, 0, 0)
						anti.spam[2] = setTimer( function() end, 2500, 1)
					end
				end
			end
		--Group ACL Removal
		elseif source == GTIres.button[10] then
			local selectedRowG, selectedColG = guiGridListGetSelectedItem(GTIres.gridlist[3])
			local selectedGroup = guiGridListGetItemText( GTIres.gridlist[3], selectedRowG, selectedColG)
			if selectedGroup then
				if selectedGroup ~= "" then
					local selectedRowACL, selectedColACL = guiGridListGetSelectedItem(GTIres.gridlist[6])
					local selectedACL = guiGridListGetItemText( GTIres.gridlist[6], selectedRowACL, selectedColACL)
					if selectedACL then
						if selectedACL ~= "" then
							--createPopup( "Remove Object", "Enter Group Object: ", true, "none")
							triggerServerEvent( "GTIres.modifyACL", localPlayer, selectedGroup, selectedACL, "remove_group_acl")
						else
							if not isTimer( anti.spam[6]) then
								outputChatBox( "You must select an ACL that the group is added to, for removal.", 255, 0, 0)
								anti.spam[6] = setTimer( function() end, 2500, 1)
							end
						end
					end
				else
					if not isTimer( anti.spam[5]) then
						outputChatBox( "You must select a group first to be able to add an ACL to that group.", 255, 0, 0)
						anti.spam[5] = setTimer( function() end, 2500, 1)
					end
				end
			end
		--ACL Right Addition
		elseif source == GTIres.button[11] then
			local selectedRowACL, selectedColACL = guiGridListGetSelectedItem(GTIres.gridlist[2])
			local selectedACL = guiGridListGetItemText( GTIres.gridlist[2], selectedRowACL, selectedColACL)
			if selectedACL then
				if selectedACL ~= "" then
					createPopup( "Add ACL Right", "Add Right", "Enter ACL Right: ", false, "GTIres.modifyACL", selectedACL, "text", "add_right")
				else
					if not isTimer( anti.spam[1]) then
						outputChatBox( "You must select an ACL to be able to add a right.", 255, 0, 0)
						anti.spam[1] = setTimer( function() end, 2500, 1)
					end
				end
			end
		--ACL Right Removal
		elseif source == GTIres.button[12] then
			local selectedRowACL, selectedColACL = guiGridListGetSelectedItem(GTIres.gridlist[2])
			local selectedACL = guiGridListGetItemText( GTIres.gridlist[2], selectedRowACL, selectedColACL)
			if selectedACL then
				if selectedACL ~= "" then
					local selectedRowR, selectedColR = guiGridListGetSelectedItem(GTIres.gridlist[5])
					local selectedRight = guiGridListGetItemText( GTIres.gridlist[5], selectedRowR, selectedColR)
					if selectedRight then
						if selectedRight ~= "" then
							--createPopup( "Remove Object", "Enter Group Object: ", true, "none")
							triggerServerEvent( "GTIres.modifyACL", localPlayer, selectedACL, selectedRight, "remove_right")
						else
							if not isTimer( anti.spam[3]) then
								outputChatBox( "You must select a object to remove from that channel.", 255, 0, 0)
								anti.spam[3] = setTimer( function() end, 2500, 1)
							end
						end
					end
				else
					if not isTimer( anti.spam[2]) then
						outputChatBox( "You must select a group to be able to remove that object.", 255, 0, 0)
						anti.spam[2] = setTimer( function() end, 2500, 1)
					end
				end
			end
		--ACL Destroy
		elseif source == GTIres.button[14] then
			local selectedRowACL, selectedColACL = guiGridListGetSelectedItem(GTIres.gridlist[2])
			local selectedACL = guiGridListGetItemText( GTIres.gridlist[2], selectedRowACL, selectedColACL)
			if selectedACL ~= "" then
				outputChatBox( "You destroyed the '#FFFF00"..selectedACL.."#FFFFFF' ACL.", 255, 255, 255, true)
				triggerServerEvent( "GTIres.modifyACL", localPlayer, selectedACL, selectedACL, "remove_acl")
			else
				if not isTimer( anti.spam[7]) then
					outputChatBox( "You must select an ACL to destroy.", 255, 0, 0)
					anti.spam[7] = setTimer( function() end, 2500, 1)
				end
			end
		elseif source == GTIres.tabpanel[1] then
			guiBringToFront( GTIres.label[8])
		elseif source == GTIres.gridlist[2] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem(GTIres.gridlist[2])
			local selectedACL = guiGridListGetItemText( GTIres.gridlist[2], selectedRow, selectedCol)
			if not selectedACL then return end
			triggerServerEvent( "GTIres.getACLRights", localPlayer, selectedACL)
		elseif source == GTIres.gridlist[3] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem(GTIres.gridlist[3])
			local selectedGroup = guiGridListGetItemText( GTIres.gridlist[3], selectedRow, selectedCol)
			if not selectedGroup then return end
			triggerServerEvent( "GTIres.getGroupObjects", localPlayer, selectedGroup)
		end
	end
)

opposites = {
	[true] = true,
	[false] = false,
}

function modifyACLRight( theACL, theRight, theModification)
	if theACL then
		if theRight then
			local theSetting = opposites[theModification]
			if theModification == true then
				outputChatBox( "You set the right '#FFFF00"..theRight.."#FFFFFF' (ACL:'"..theACL.."' ) from '#00FF00"..tostring(theSetting).."#FFFFFF' to '#FF0000false#FFFFFF'", 255, 255, 255, true)
				triggerServerEvent( "GTIres.modifyACLRights", localPlayer, theACL, theRight, false)
			elseif theModification == false then
				outputChatBox( "You set the right '#FFFF00"..theRight.."#FFFFFF' (ACL:'"..theACL.."' ) from '#FF0000"..tostring(theSetting).."#FFFFFF' to '#00FF00true#FFFFFF'", 255, 255, 255, true)
				triggerServerEvent( "GTIres.modifyACLRights", localPlayer, theACL, theRight, true)
			end
		end
	end
end

local eventBlocks = {
	['nil'] = true,
	['none'] = true,
}

local sEditsPos = {
	[true] = 121,
	[false] = 20,
}

local sEditsSize = {
	[true] = 191,
	[false] = 284,
}

function createPopup( theCaption, theButton, theText, theRadio, theEvent, data1, data2, data3)
	if theCaption then
		if theText then
			if theEvent then
				if guiGetVisible( GTIresMisc.window[1]) then
					guiSetVisible( GTIresMisc.window[1], false)
				end
				if theRadio ~= nil then
					local s1EX, s1EY = guiGetSize( GTIresMisc.edit[1], false)
					local s2EX, s2EY = guiGetPosition( GTIresMisc.edit[1], false)
					local sizeX, posX = sEditsSize[theRadio], sEditsPos[theRadio]
					if theRadio == true then
						guiSetVisible( GTIresMisc.radiobutton[1], true)
						guiSetVisible( GTIresMisc.radiobutton[2], true)
						guiSetEnabled( GTIresMisc.edit[1], false)
					else
						guiSetVisible( GTIresMisc.radiobutton[1], false)
						guiSetVisible( GTIresMisc.radiobutton[2], false)
					end
					guiSetPosition( GTIresMisc.edit[1], posX, s2EY, false)
					guiSetSize( GTIresMisc.edit[1], sizeX, s1EY, false)
				end
				guiSetVisible( GTIresMisc.window[1], true)
				guiSetVisible( GTIres.window[1], false)
				guiSetText( GTIresMisc.window[1], "GTI - "..theCaption)
				guiBringToFront( GTIresMisc.window[1])
				guiSetText( GTIresMisc.label[1], theText)
				if theButton then
					guiSetText( GTIresMisc.button[2], theButton)
				end
				function tempFunction()
					if source == GTIresMisc.button[1] then
						removeEventHandler( "onClientGUIClick", root, tempFunction)
						guiSetVisible( GTIresMisc.window[1], false)
						guiSetVisible( GTIres.window[1], true)
						guiSetText( GTIresMisc.edit[1], "")
						guiRadioButtonSetSelected( GTIresMisc.radiobutton[1], false)
						guiRadioButtonSetSelected( GTIresMisc.radiobutton[2], false)
						guiSetEnabled( GTIresMisc.edit[1], true)
					elseif source == GTIresMisc.button[2] then
						local entered = guiGetText( GTIresMisc.edit[1])
						local selection1 = guiRadioButtonGetSelected( GTIresMisc.radiobutton[1])
						local selection2 = guiRadioButtonGetSelected( GTIresMisc.radiobutton[2])
						if entered ~= "" then
							removeEventHandler( "onClientGUIClick", root, tempFunction)
							guiSetVisible( GTIresMisc.window[1], false)
							guiSetVisible( GTIres.window[1], true)
							guiSetText( GTIresMisc.edit[1], "")
							guiRadioButtonSetSelected( GTIresMisc.radiobutton[1], false)
							guiRadioButtonSetSelected( GTIresMisc.radiobutton[2], false)
							guiSetEnabled( GTIresMisc.edit[1], true)
							if data2 == "text" then
								data2 = entered
								if selection1 == true then
									data2 = "user."..data2
								end
								if selection2 == true then
									data2 = "resource."..data2
								end
							end
							if not eventBlocks[theEvent] then
								if not data2 then
									triggerServerEvent( theEvent, localPlayer, data1)
								elseif not data3 then
									triggerServerEvent( theEvent, localPlayer, data1, data2)
								else
									triggerServerEvent( theEvent, localPlayer, data1, data2, data3)
								end
							end
							--outputChatBox( "Event:'"..theEvent.."' Checked:'"..tostring(selection1).."' Arguments: D1:'"..data1.."' D2'"..data2.."' D3'"..data3.."'")
							data1, data2, data3 = nil, nil, nil
						else
							return
						end
					elseif source == GTIresMisc.radiobutton[1] then
						local enabled = guiGetEnabled( GTIresMisc.edit[1])
						if not enabled then
							guiSetEnabled( GTIresMisc.edit[1], true)
						end
					elseif source == GTIresMisc.radiobutton[2] then
						local enabled = guiGetEnabled( GTIresMisc.edit[1])
						if not enabled then
							guiSetEnabled( GTIresMisc.edit[1], true)
						end
					end
				end
				addEventHandler( "onClientGUIClick", root, tempFunction)
			end
		end
	end
end

addEventHandler( "onClientGUIDoubleClick", root,
	function()
		if source == GTIres.gridlist[5] then
			local selectedRowR, selectedColR = guiGridListGetSelectedItem(GTIres.gridlist[5])
			local selectedRowACL, selectedColACL = guiGridListGetSelectedItem(GTIres.gridlist[2])
			local selectedRight = guiGridListGetItemText( GTIres.gridlist[5], selectedRowR, selectedColR)
			local selectedACL = guiGridListGetItemText( GTIres.gridlist[2], selectedRowACL, selectedColACL)
			local selectedRightState = guiGridListGetItemData( GTIres.gridlist[5], selectedRowR, selectedColR)
			--if not selectedRight then return end
			modifyACLRight( selectedACL, selectedRight, selectedRightState)
		end
	end
)

addEvent( "GTIres.addACLs", true)
addEventHandler( "GTIres.addACLs", root,
	function( acls, groups)
		if acls ~= nil then
			guiGridListClear(GTIres.gridlist[2])
			guiGridListClear(GTIres.gridlist[3])
			addACLsToLost(acls, groups)
			playerAccess[source] = true
		else
			playerAccess[source] = false
		end
	end
)

addEvent( "GTIres.addACLGroupObjects", true)
addEventHandler( "GTIres.addACLGroupObjects", root,
	function( objects, acls)
		guiGridListClear( GTIres.gridlist[4])
		guiGridListClear( GTIres.gridlist[6])
		addGroupObjectsToList( objects, acls)
	end
)

addEvent( "GTIres.addACLRights", true)
addEventHandler( "GTIres.addACLRights", root,
	function( rights)
		guiGridListClear( GTIres.gridlist[5])
		addACLRightsToList( rights)
	end
)

function addGroupObjectsToList(objects, acls)
	for index, object in pairs(objects) do
		local objectRow = guiGridListAddRow( GTIres.gridlist[4])
		guiGridListSetItemText(GTIres.gridlist[4], objectRow, objectColumn, object[1], false, false)
	end
	for index, gacl in pairs(acls) do
		local groupACLRow = guiGridListAddRow( GTIres.gridlist[6])
		guiGridListSetItemText(GTIres.gridlist[6], groupACLRow, groupACLColumn, gacl[1], false, false)
	end
end

function addACLRightsToList(rights)
	for index, right in pairs(rights) do
		local rightRow = guiGridListAddRow( GTIres.gridlist[5])
		local r, g, b, state = right[2], right[3], right[4], right[5]
		guiGridListSetItemText(GTIres.gridlist[5], rightRow, rightColumn, right[1], false, false)
		guiGridListSetItemData(GTIres.gridlist[5], rightRow, rightColumn, right[5])
		guiGridListSetItemColor( GTIres.gridlist[5], rightRow, rightColumn, r, g, b)
	end
end

function addACLsToLost(acls, groups)
	for index, acl in pairs(acls) do
		local aclRow = guiGridListAddRow( GTIres.gridlist[2])
		guiGridListSetItemText(GTIres.gridlist[2], aclRow, aclColumn, acl[1], false, false)
	end
	for index, group in pairs (groups) do
		local groupRow = guiGridListAddRow( GTIres.gridlist[3])
		guiGridListSetItemText(GTIres.gridlist[3], groupRow, groupColumn, group[1], false, false)
	end
end
