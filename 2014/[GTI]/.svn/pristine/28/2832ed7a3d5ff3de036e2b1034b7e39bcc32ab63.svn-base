----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 28 Mar 2014
-- Resource: GTIgroups/g_create.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Show Group Panel
-------------------->>

function showGroupCreatePanel(gTypes)
		-- Render Combobox
	local cbox_height = 20
	guiComboBoxClear(gcreate.combobox[1])
	for g_type in pairs(gTypes) do
		cbox_height = cbox_height + 20
		guiComboBoxAddItem(gcreate.combobox[1], g_type)
	end
	local sX = guiGetSize(gcreate.combobox[1], false)
	guiSetSize(gcreate.combobox[1], sX, cbox_height, false)
		-- Show Panel
	guiSetVisible(gcreate.window[1], true)
	showCursor(true)
end
addEvent("GTIgroups.showGroupCreatePanel", true)
addEventHandler("GTIgroups.showGroupCreatePanel", root, showGroupCreatePanel)

-- Create Group
---------------->>

function groupCreate(button, state)
	if (button ~= "left" or state ~= "up") then return end
		-- Get Group Category
	local item = guiComboBoxGetSelected(gcreate.combobox[1])
	if (item == -1) then 
		exports.GTIhud:dm("You must select a group category.", 255, 100, 100)
	return end
	local category = guiComboBoxGetItemText(gcreate.combobox[1], item)
	
		-- Get Group Name
	local group_name = guiGetText(gcreate.edit[1])
	if (#group_name == 0) then 
		exports.GTIhud:dm("Enter a group name before trying to create a group.", 255, 100, 100)
		return 
	elseif (#group_name < 2 or #group_name > 40) then
		exports.GTIhud:dm("Your group name must be between 2 and 40 characters long.", 255, 100, 100)
		return 
	end
	
		-- Get Group Account Password
	local password = guiGetText(gcreate.edit[2])
	if (#password == 0) then 
		exports.GTIhud:dm("You must enter a group account password.", 255, 100, 100)
		return 
	elseif (#password < 5 or #password > 25) then
		exports.GTIhud:dm("Your group account password must be between 5 and 25 characters long.", 255, 100, 100)
		return 
	elseif (string.find(password, "%s")) then
		exports.GTIhud:dm("Your group name cannot contain a space.", 255, 100, 100)
		return
	end
	
		-- Create Group
	triggerServerEvent("GTIgroups.groupCreate", resourceRoot, group_name, password, category)
	
		-- Close the Panel
	guiSetVisible(gcreate.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", gcreate.button[1], groupCreate, false)

-- Hide Group Panel
-------------------->>

function hideGroupCreatePanel(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	guiSetVisible(gcreate.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", gcreate.label[11], hideGroupCreatePanel, false)

addEventHandler("onClientMouseEnter", gcreate.label[11], function()
	guiLabelSetColor(source, 255, 100, 100)
end, false)

addEventHandler("onClientMouseLeave", gcreate.label[11], function()
	guiLabelSetColor(source, 255, 255, 255)
end, false)
