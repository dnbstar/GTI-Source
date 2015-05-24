----------------------------------------->>
-- GTI: Grand Theft International Network
-- Date: 23 July 2013
-- Resource: GTIclothing/clothes.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local previewPed	-- Ped for skin Preview
local oldInt		-- Player's Current Interior
local store			-- Store the player bought the skin from

-- Clothing Store GUI
---------------------->>

-- Window
local sX,sY = guiGetScreenSize()
local wX,wY = 310,379+75
local sX,sY,wX,wY = sX-wX-10,(sY/2)-(wY/2),wX,wY
-- sX,sY,wX,wY = 1049,214,310,379
windowSkinSel = guiCreateWindow(sX,sY,wX,wY,"GTI Skin Selection Panel",false)
guiSetAlpha(windowSkinSel,0.95)
guiWindowSetSizable(windowSkinSel,false)
-- Gridlist
gridSkinSel = guiCreateGridList(9,25,292,306+75,false,windowSkinSel)
guiGridListSetSelectionMode(gridSkinSel,0)
guiGridListSetSortingEnabled(gridSkinSel,false)
col2 = guiGridListAddColumn(gridSkinSel,"Skin Name",0.55)
col1 = guiGridListAddColumn(gridSkinSel,"Skin ID",0.15)
col3 = guiGridListAddColumn(gridSkinSel,"Cost",0.2)
-- Button
btnClose = guiCreateButton(215,337+75,86,33,"Close",false,windowSkinSel)
btnPurchase = guiCreateButton(120,337+75,86,33,"Purchase",false,windowSkinSel)
guiSetEnabled(btnPurchase, false)
guiSetFont(btnPurchase,"default-bold-small")
-- Other
guiSetVisible(windowSkinSel,false)

-- Kendl Skin Fix
------------------>>

txd = engineLoadTXD("mods/kendl.txd")
engineImportTXD(txd, 304)
dff = engineLoadDFF("mods/kendl.dff", 304)
engineReplaceModel(dff, 304)

-- Render GUI
-------------->>

function selectSkinFromStore(store_, skin_list, skin_pos, camera, money, skinInv, skin_order)
	if (not store_) then
		guiSetText(windowSkinSel, "GTI Skin Selection Panel")
		guiSetVisible(btnClose, false)
		guiSetPosition(btnPurchase, 215, 337+75, false)
	else
		guiSetText(windowSkinSel, "GTI "..store_.." Clothing Store")
		guiSetVisible(btnClose, true)
		guiSetPosition(btnPurchase, 120, 337+75, false)
	end
	store = store_	
	
	guiGridListClear(gridSkinSel)
	for i,category in pairs(skin_order) do
		if (skin_list[category]) then
			local row = guiGridListAddRow(gridSkinSel)
			guiGridListSetItemText(gridSkinSel, row, col2, category, true, false)
			guiGridListSetItemColor(gridSkinSel, row, col2, 255, 0, 255)
			for _,tbl in ipairs(skin_list[category]) do
				local row = guiGridListAddRow(gridSkinSel)
				guiGridListSetItemText(gridSkinSel, row, col1, tbl[1], false, false)
				guiGridListSetItemText(gridSkinSel, row, col2, tbl[2], false, false)
				guiGridListSetItemText(gridSkinSel, row, col3, "$"..exports.GTIutil:tocomma(tbl[3]), false, false)
				if (tbl[3] > money) then
					guiGridListSetItemColor(gridSkinSel, row, col1, 255, 0, 0)
					guiGridListSetItemColor(gridSkinSel, row, col2, 255, 0, 0)
					guiGridListSetItemColor(gridSkinSel, row, col3, 255, 0, 0)
				end
				if (skinInv) then
					for i,v3 in ipairs(skinInv) do
						if (v3 == tbl[1]) then
							guiGridListSetItemColor(gridSkinSel, row, col1, 0, 150, 0)
							guiGridListSetItemColor(gridSkinSel, row, col2, 0, 150, 0)
							guiGridListSetItemColor(gridSkinSel, row, col3, 0, 150, 0)
						end
					end
				end
			end
		end
	end
	toggleAllControls(false, true, false)
	fadeCamera(false)
	setTimer(function(skin_pos, camera)
		setCameraMatrix(camera[1], camera[2], camera[3], camera[4], camera[5], camera[6])
		
		if (isElement(previewPed)) then destroyElement(previewPed) end
		previewPed = createPed(getElementModel(localPlayer), skin_pos.sPos[1], skin_pos.sPos[2], skin_pos.sPos[3])
		setElementFrozen(localPlayer, true)
		setElementFrozen(previewPed, true)
		setElementRotation(previewPed, 0, 0, skin_pos.sPos[4] or 135)
		setElementInterior(previewPed, skin_pos.int)
		setElementDimension(previewPed, getElementDimension(localPlayer))
		
		local plr_int = getElementInterior(localPlayer)
		if (plr_int ~= skin_pos.int) then
			oldInt = plr_int
			setElementInterior(localPlayer, skin_pos.int)
		end
		
		toggleAllControls(false, true, false)
		setTimer(fadeCamera, 900, 1, true)
		setTimer(guiSetVisible, 1900, 1, windowSkinSel, true)
		setTimer(showCursor, 1900, 1, true)
	end, 1100, 1, skin_pos, camera)
end
addEvent("GTIclothing.selectSkinFromStore", true)
addEventHandler("GTIclothing.selectSkinFromStore", root, selectSkinFromStore)

-- Select Skin
--------------->>

function previewSkin(button, state)
	local row, col = guiGridListGetSelectedItem(gridSkinSel)
	if (not row or row == -1) then return end
	local skinID = tonumber(guiGridListGetItemText(gridSkinSel, row, 2))
	local r,g,b = guiGridListGetItemColor(gridSkinSel, row, col1)
	if g == 0 then
		guiSetEnabled(btnPurchase, false)
	else
		guiSetEnabled(btnPurchase, true)
	end
	if not skinID then return end
	setElementModel(previewPed, skinID)
end
addEventHandler("onClientGUIClick", gridSkinSel, previewSkin, false)

function selectSkin(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row, col = guiGridListGetSelectedItem(gridSkinSel)
	if (not row or row == -1) then return end
	
	local skinID = tonumber(guiGridListGetItemText(gridSkinSel, row, 2))
	if not skinID then return end
	triggerServerEvent("GTIclothing.selectSkin", localPlayer, skinID, store)
end
addEventHandler("onClientGUIClick", btnPurchase, selectSkin, false)

-- End Skin Selection
---------------------->>

function stopSkinSelection(button, state)
	if (source == btnClose) then
		if (button ~= "left" or state ~= "up") then return end
	else
		if (source ~= localPlayer) then return end
	end
	fadeCamera(false)
	guiSetVisible(windowSkinSel, false)
	showCursor(false)
	store = nil
	
	setTimer(setCameraTarget, 1100, 1, localPlayer, localPlayer)
	if (oldInt) then
		setTimer(setElementInterior, 1100, 1, localPlayer, oldInt)
		oldInt = nil
	end
	setTimer(toggleAllControls, 2000, 1, true)
	setTimer(setElementFrozen, 2000, 1, localPlayer, false)
	setTimer(destroyElement, 1100, 1, previewPed)
	setTimer(fadeCamera, 2000, 1, true)
end
addEventHandler("onClientGUIClick", btnClose, stopSkinSelection, false)
addEvent("GTIclothing.stopSkinSelection", true)
addEventHandler("GTIclothing.stopSkinSelection", root, stopSkinSelection)

function killSkinSelection(showPlayer)
	guiSetVisible(windowSkinSel, false)
	showCursor(false)
	store = nil
	
	if (previewPed and isElement(previewPed)) then
		destroyElement(previewPed)
		previewPed = nil
	end
	
	toggleAllControls(true)
	if (not showPlayer or showPlayer == resource) then
		setCameraTarget(localPlayer, localPlayer)
		setElementFrozen(localPlayer, false)
		if (oldInt) then
			setElementInterior(localPlayer, oldInt)
			oldInt = nil
		end
	end
end
addEvent("GTIclothes.killSkinSelection", true)
addEventHandler("GTIclothes.killSkinSelection", root, killSkinSelection)
addEventHandler("onClientPlayerWasted", localPlayer, killSkinSelection)
addEventHandler("onClientResourceStop", resourceRoot, killSkinSelection)
