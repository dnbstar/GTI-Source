----------------------------------------->>
-- GTI: Grand Theft International
-- Author: JT Pennington (JTPenn)
-- Date: 21 Nov 2014
-- Resource: GTIammu/ammu.lua
-- Version: 1.0
----------------------------------------->>

local weapon_cat = {}		-- Cache of Weapon Categories
local weapon_list = {}		-- Cache of Weapon Info
local plr_inventory = {}	-- Cache of Player's Weapons
local weaponLimits = {}		-- Cache of Weapon Limits
local isUrban				-- Are you at an urban shop?

-- Load Ammu-Nation
-------------------->>

addEvent("GTIammu.loadPanel", true)
addEventHandler("GTIammu.loadPanel", root, function(cat, list, inv, limits, urban)
	weapon_cat = cat
	weapon_list = list
	plr_inventory = inv
	weaponLimits = limits
	isUrban = urban
	
		-- Load Categories
	guiComboBoxClear(ammuGUI.combobox[1])
	for i,v in ipairs(cat) do
		if (isUrban and (v ~= "Heavy Weapons" and v ~= "Projectiles")) then
			guiComboBoxAddItem(ammuGUI.combobox[1], v)
		elseif (not isUrban) then
			guiComboBoxAddItem(ammuGUI.combobox[1], v)
		end
	end
	local x = guiGetSize(ammuGUI.combobox[1], false)
	guiSetSize(ammuGUI.combobox[1], x, 27 + 6 + (14*(isUrban and #cat-2 or #cat)), false)
	
	guiComboBoxSetSelected(ammuGUI.combobox[1], 0)
	renderWeaponsList()
	
	guiSetVisible(ammuGUI.window[1], true)
	showCursor(true)
end)

addEventHandler("onClientGUIClick", ammuGUI.button[2], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	for i,v in ipairs(getElementsByType("gui-staticimage", resourceRoot)) do
		guiSetVisible(v, false)
	end
	guiSetVisible(ammuGUI.window[1], false)
	showCursor(false)
end, false)

-- Render Weapons List
----------------------->>

function renderWeaponsList()
	local index = guiComboBoxGetSelected(ammuGUI.combobox[1]) + 1
	if (index == 6 and guiComboBoxGetItemText(ammuGUI.combobox[1], index-1) == "Armor") then index = index + 2 end
	
	if (isElement(ammuGUI.scrollpane[1])) then
		destroyElement(ammuGUI.scrollpane[1])
	end
	ammuGUI.scrollpane[1] = guiCreateScrollPane(190+2, 23-19+4, 392, 146, false, ammuGUI.window[1])
	if (#weapon_list[index] <= 3) then
		local WIDTH = 392
		local x,y = guiGetPosition(ammuGUI.scrollpane[1], false)
		guiSetPosition(ammuGUI.scrollpane[1], x+(WIDTH/2)-((115*#weapon_list[index])/2), y+10, false)
	end
	for i,v in ipairs(weapon_list[index]) do
		i = i - 1
		-- Static Image
		ammuGUI.staticimage[1] = guiCreateStaticImage(31+4+(i*115), 5, 64, 64, "weapons/"..v.id..".png", false, ammuGUI.scrollpane[1])
		-- Labels
		ammuGUI.label[1] = guiCreateLabel(7+4+(i*115), 71, 114, 15, v.name, false, ammuGUI.scrollpane[1])
		guiSetFont(ammuGUI.label[1], "default-bold-small")
		guiLabelSetColor(ammuGUI.label[1], 231, 237, 233)
		guiLabelSetHorizontalAlign(ammuGUI.label[1], "center", false)
		-- Buttons
		local text, weap
		if (plr_inventory[v.id]) then
			text = "Buy "..v.ammo_name.."\n$"..(math.floor(v.ammo_cost) == v.ammo_cost and exports.GTIutil:tocomma(v.ammo_cost) or string.format("%.2f", v.ammo_cost))
			weap = false
		elseif (v.id == 0) then	-- Armor
			text = "Buy Armor\n$"..exports.GTIutil:tocomma(v.weapon_cost)
			weap = true
		else
			text = "Buy Weapon\n$"..exports.GTIutil:tocomma(v.weapon_cost)
			weap = true
		end
		ammuGUI.button[1] = guiCreateButton(10+4+(i*115), 88, 106, 39, text, false, ammuGUI.scrollpane[1])		
		setElementData(ammuGUI.button[1], "table", {index, i+1, weap}, false)
		-- Disable Rural-Only Items
		if (isUrban and v.rural_only) then
			guiSetEnabled(ammuGUI.button[1], false)
		end
	end
end

addEventHandler("onClientGUIComboBoxAccepted", ammuGUI.combobox[1], function()
	renderWeaponsList()
end)

-- Update Cache
---------------->>

addEvent("GTIammu.updateCache", true)
addEventHandler("GTIammu.updateCache", root, function(inv)
	plr_inventory = inv
	renderWeaponsList()
end)

-- Buy Weapon
-------------->>

addEventHandler("onClientGUIClick", ammuGUI.window[1], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	local btn_data = getElementData(source, "table")
	if (not btn_data or not btn_data[3]) then return end
	setElementData(ammuWeapGUI.button[1], "table", btn_data, false)
	
	local weapon = weapon_list[btn_data[1]][btn_data[2]].id
	guiSetText(ammuWeapGUI.label[1], "Are you sure you want to buy "..(weapon ~= 0 and "this weapon" or "armor").."?")
	
	playSoundFrontEnd(5)
	guiSetVisible(ammuWeapGUI.window[1], true)
end)

addEventHandler("onClientGUIClick", ammuWeapGUI.button[1], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(ammuWeapGUI.window[1], false)
	local btn_data = getElementData(source, "table")
	triggerServerEvent("GTIammu.buyWeapon", resourceRoot, btn_data[1], btn_data[2])
end, false)

addEventHandler("onClientGUIClick", ammuWeapGUI.button[2], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(ammuWeapGUI.window[1], false)
end, false)

-- Buy Ammunition
------------------>>

addEventHandler("onClientGUIClick", ammuGUI.window[1], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	local btn_data = getElementData(source, "table")
	if (not btn_data or btn_data[3]) then return end
	setElementData(buyAmmoGUI.button[1], "table", btn_data, false)
	
	guiSetText(buyAmmoGUI.edit[1], "")
	guiSetText(buyAmmoGUI.label[1], "Enter the number of "..string.lower( weapon_list[btn_data[1]][btn_data[2]].ammo_name ).." you wish to purchase")
	renderCostEstimate()
	
	guiSetVisible(buyAmmoGUI.window[1], true)
end)

addEventHandler("onClientGUIClick", buyAmmoGUI.button[1], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	local amount = guiGetText(buyAmmoGUI.edit[1])
	amount = tonumber(amount)
	if (not amount) then
		outputChatBox("Enter a valid ammo amount.", 255, 125, 0)
		return
	end
	amount = math.floor(amount)
	guiSetVisible(buyAmmoGUI.window[1], false)
	
	local btn_data = getElementData(source, "table")
	triggerServerEvent("GTIammu.buyAmmo", resourceRoot, amount, btn_data[1], btn_data[2])
end, false)

addEventHandler("onClientGUIClick", buyAmmoGUI.button[2], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(buyAmmoGUI.window[1], false)
end, false)

function renderCostEstimate()
	local amount = guiGetText(buyAmmoGUI.edit[1])
	if (string.gsub(amount, "%D", "") ~= amount) then
		amount = string.gsub(amount, "%D", "")
		guiSetText(buyAmmoGUI.edit[1], amount)
		return
	end	
	
	amount = math.floor(tonumber(amount) or 0)
	
	local btn_data = getElementData(buyAmmoGUI.button[1], "table")
	local weap_table = weapon_list[btn_data[1]][btn_data[2]]
	local cost = math.floor(weap_table.ammo_cost * amount)
	guiSetText(buyAmmoGUI.label[2], "Total Cost: $"..exports.GTIutil:tocomma(cost))
end
addEventHandler("onClientGUIChanged", buyAmmoGUI.edit[1], renderCostEstimate)

-- Update Weapon Slot
---------------------->>

addEventHandler("onClientGUIClick", buyAmmoGUI.button[3], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	
	local btn_data = getElementData(buyAmmoGUI.button[1], "table")
	local weapon = weapon_list[btn_data[1]][btn_data[2]].id
	triggerServerEvent("GTIammu.switchToWeapon", resourceRoot, weapon)
end, false)

-- Ghostmode Markers
--------------------->>

addEventHandler("onClientColShapeHit", resourceRoot, function(player, dim)
	if (not isElement(player) or getElementType(player) ~= "player" or isPedInVehicle(player) or not dim) then return end
	for i,plr in ipairs(getElementsByType("player")) do
		setElementCollidableWith(player, plr, false)
	end
end)

addEventHandler("onClientColShapeLeave", resourceRoot, function(player, dim)
	if (not isElement(player) or getElementType(player) ~= "player" or isPedInVehicle(player) or not dim) then return end
	for i,plr in ipairs(getElementsByType("player")) do
		if (not isWithinColShape(plr)) then
			setElementCollidableWith(player, plr, true)
		end
	end
end)

function isWithinColShape(player)
	for i,col in ipairs(getElementsByType("colshape", resourceRoot)) do
		if (isElementWithinColShape(player, col)) then return true end
	end
	return false
end

-- Miscellaneous
----------------->>

addEventHandler("onClientPlayerWasted", localPlayer, function()
	for i,v in ipairs(getElementsByType("gui-staticimage", resourceRoot)) do
		guiSetVisible(v, false)
	end
	showCursor(false)
end)

addEvent("GTIammu.close", true)
addEventHandler("GTIammu.close", root, function()
	guiSetVisible(ammuWeapGUI.window[1], false)
	guiSetVisible(buyAmmoGUI.window[1], false)
end)
