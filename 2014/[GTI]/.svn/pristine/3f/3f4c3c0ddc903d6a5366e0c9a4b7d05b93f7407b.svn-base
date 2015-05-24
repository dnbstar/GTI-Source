----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 05 Feb 2013
-- Resource: GTIpolice/police.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local rowToSkins = {}	-- Skin Association by Row
local rowToDesc = {}	-- Division Descriptions

local orgSkin			-- Original Skin ID

local DESC_LEN = 32		-- Length of the Description Window (Char)
local DIVISION_DEFAULT = "Select a Police Division"
local UNIFORM_DEFUALT = "Select a Uniform"

addEvent("onClientPlayerGetJob", true)
addEvent("onClientPlayerQuitJob", true)

-- Show Police Job
------------------->>

function showPoliceJob(policeTable)
	guiGridListClear(policeJob.gridlist[2])
	for division,tbl in pairs(policeTable) do
		local row = guiGridListAddRow(policeJob.gridlist[2])
		guiGridListSetItemText(policeJob.gridlist[2], row, 1, division, false, false)
		rowToSkins[row] = tbl.skinID
		rowToDesc[row] = tbl.desc
	end
	
	guiGridListSetSelectedItem(policeJob.gridlist[2], 0, 1)
	-- Description
	local desc = rowToDesc[0]
	local len = math.ceil(#desc/DESC_LEN)
	local pos = 0
	while true do
		local sPos,ePos = string.find(desc,"\n",pos)
		if (sPos) then
			pos,len = sPos+1, len+1
		else break end
	end
	local sx,sy = guiGetSize(policeJob.label[6], false)
	guiSetSize(policeJob.label[6], sx, len*15, false)
	guiSetText(policeJob.label[6], desc)
	
	-- Skins List
	guiGridListClear(policeJob.gridlist[3])
	for i,v in ipairs(rowToSkins[0]) do
		local row = guiGridListAddRow(policeJob.gridlist[3])
		guiGridListSetItemText(policeJob.gridlist[3], row, 1, v[1], false, true)
		guiGridListSetItemText(policeJob.gridlist[3], row, 2, v[2], false, false)
	end
	
	-- Division
	local division = guiGridListGetItemText(policeJob.gridlist[2], 0, 1)
	guiSetText(policeJob.label[2], division)
	guiSetText(policeJob.label[4], UNIFORM_DEFUALT)
	
	guiSetVisible(policeJob.window[1], true)
	toggleAllControls(false)
	showCursor(true)
end
addEvent("GTIpolice.showPoliceJob", true)
addEventHandler("GTIpolice.showPoliceJob", root, showPoliceJob)

-- Update Grid Data
-------------------->>

function updatePoliceGridData(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(policeJob.gridlist[2])
	if (not row or row == -1) then return end
	
	-- Description
	local desc = rowToDesc[row]
	local len = math.ceil(#desc/DESC_LEN)
	local pos = 0
	while true do
		local sPos,ePos = string.find(desc,"\n",pos)
		if (sPos) then
			pos,len = sPos+1, len+1
		else break end
	end
	local sx,sy = guiGetSize(policeJob.label[6], false)
	guiSetSize(policeJob.label[6], sx, len*15, false)
	guiSetText(policeJob.label[6], desc)
	
	-- Skins List
	guiGridListClear(policeJob.gridlist[3])
	for i,v in ipairs(rowToSkins[row]) do
		local row = guiGridListAddRow(policeJob.gridlist[3])
		guiGridListSetItemText(policeJob.gridlist[3], row, 1, v[1], false, true)
		guiGridListSetItemText(policeJob.gridlist[3], row, 2, v[2], false, false)
	end
	
	-- Division
	local division = guiGridListGetItemText(policeJob.gridlist[2], row, 1)
	guiSetText(policeJob.label[2], division)
	-- Reset Skin
	if (orgSkin) then
		setElementModel(localPlayer, orgSkin)
		orgSkin = nil
		guiSetText(policeJob.label[4], UNIFORM_DEFUALT)
	end
end
addEventHandler("onClientGUIClick", policeJob.gridlist[2], updatePoliceGridData, false)

-- Update Skin Selection
------------------------->>

function updateSkinSelection(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(policeJob.gridlist[3])
	if (not row or row == -1) then return end
	local skinID = guiGridListGetItemText(policeJob.gridlist[3], row, 1)
	local skinName = guiGridListGetItemText(policeJob.gridlist[3], row, 2)
	
	if (not orgSkin) then
		orgSkin = getElementModel(localPlayer)
	end
	setElementModel(localPlayer, skinID)
	guiSetText(policeJob.label[4], skinName.." (ID: "..skinID..")")
end
addEventHandler("onClientGUIClick", policeJob.gridlist[3], updateSkinSelection, false)

function takePoliceJob(button, state)
	if (button ~= "left" or state ~= "up") then return end
	-- Division
	local division = guiGetText(policeJob.label[2])
	if (division == DIVISION_DEFAULT) then
		exports.GTIhud:dm("* Select a Police Division", 30, 155, 255)
		return
	end
	-- Skin ID
	if (not orgSkin) then
		exports.GTIhud:dm("* Select a Uniform for this Police Division", 30, 155, 255)
		return
	end
	orgSkin = nil
	local skinID = getElementModel(localPlayer)
	triggerServerEvent("GTIpolice.takePoliceJob", resourceRoot, division, skinID)
end
addEventHandler("onClientGUIClick", policeJob.button[1], takePoliceJob, false)

-- Hide Panel
-------------->>

function hidePolicePanel(button, state)
	if (button ~= "right" or state ~= "up") then return end
	-- Reset Skin
	if (orgSkin) then
		setElementModel(localPlayer, orgSkin)
		orgSkin = nil
	end
	guiSetVisible(policeJob.window[1], false)
	toggleAllControls(true)
	showCursor(false)
end
addEventHandler("onClientGUIClick", policeJob.window[1], hidePolicePanel)
addEvent("GTIpolice.hidePolicePanel", true)
addEventHandler("GTIpolice.hidePolicePanel", root, hidePolicePanel)
