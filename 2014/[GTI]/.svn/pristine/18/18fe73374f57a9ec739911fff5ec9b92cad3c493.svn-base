local screenW, screenH = guiGetScreenSize()
local localPlayer = getLocalPlayer()

gun = {
	window = {},
	button = {},
	gridlist = {},
	label = {},
	image = {},
}

	gun.window[1] = guiCreateStaticImage((screenW - 715) / 2, (screenH - 540) / 2, 715, 540, "images/panel.png", false)
	guiSetVisible(gun.window[1], false)

	gun.gridlist[1] = guiCreateGridList(197, 126, 479, 364, false, gun.window[1])
	nameRow = guiGridListAddColumn(gun.gridlist[1], "Name", 0.35)
	priceRow = guiGridListAddColumn(gun.gridlist[1], "Price", 0.25)
	numRow = guiGridListAddColumn(gun.gridlist[1], "Quantity", 0.1)
	saleRow = guiGridListAddColumn(gun.gridlist[1], "Sale Status", 0.25)
	gun.gridlist[2] = guiCreateGridList(23, 128, 153, 166, false, gun.window[1])
	guiGridListAddColumn(gun.gridlist[2], "Categories", 0.7)
	gun.gridlist[3] = guiCreateGridList(23, 403, 153, 86, false, gun.window[1])
	guiGridListAddColumn(gun.gridlist[3], "Guns", 0.7)
	gun.button[1] = guiCreateStaticImage(572, 495, 110, 35, "images/button.png", false, gun.window[1])
	gun.label[1] = guiCreateLabel(5, 5, 99, 24, "Buy", false, gun.button[1])
	gun.button[2] = guiCreateStaticImage(458, 495, 110, 35, "images/button.png", false, gun.window[1])
	gun.label[2] = guiCreateLabel(5, 5, 99, 24, "Close", false, gun.button[2])
	gun.button[3] = guiCreateStaticImage(543, 33, 110, 35, "images/button.png", false, gun.window[1])
	gun.label[3] = guiCreateLabel(5, 5, 101, 24, "Guns", false, gun.button[3])
	gun.button[4] = guiCreateStaticImage(543, 70, 110, 35, "images/button.png", false, gun.window[1])
	gun.label[4] = guiCreateLabel(5, 5, 99, 24, "Ammo", false, gun.button[4])

gun1 = {
	window = {},
    button = {},
    label = {},
    edit = {}
}

gun1.window[1] = guiCreateStaticImage((screenW - 285) / 2, (screenH - 170) / 2, 285, 170, "images/question.png", false)
guiSetVisible(gun1.window[1], false)

gun1.edit[1] = guiCreateEdit(20, 47, 245, 36, "", false, gun1.window[1])
guiSetAlpha(gun1.edit[1], 0.50)
guiEditSetMaxLength( gun1.edit[1], 3)
gun1.label[1] = guiCreateLabel(21, 10, 244, 31, "", false, gun1.window[1])
gun1.button[1] = guiCreateStaticImage(20, 108, 111, 38, "images/button.png", false, gun1.window[1])
gun1.label[2] = guiCreateLabel(5, 5, 99, 24, "Close", false, gun1.button[1])
gun1.button[2] = guiCreateStaticImage(154, 108, 111, 38, "images/button.png", false, gun1.window[1])
gun1.label[3] = guiCreateLabel(5, 5, 99, 24, "Buy", false, gun1.button[2])

local font = guiCreateFont("font.ttf")
	for _, v in ipairs (gun.label) do
		guiSetAlpha( v, 0.75)
		guiSetFont( v, font)
		guiLabelSetColor( v, 0, 0, 0)
		guiLabelSetHorizontalAlign( v, "center", true)
		guiLabelSetVerticalAlign( v, "center")
	end

	for _, v in ipairs (gun1.label) do
		guiSetAlpha( v, 0.75)
		guiSetFont( v, font)
		guiLabelSetColor( v, 0, 0, 0)
		guiLabelSetHorizontalAlign( v, "center", true)
		guiLabelSetVerticalAlign( v, "center")
	end

markers = {
	{ pos = {312.744, -133.907, 998.601}, world = {7, 100}}, --Market, LS
	{ pos = {295.614, -79.758, 1000.515}, world = {4, 101}}, --Ocean Flats, SF
	{ pos = {296.531, -37.434, 1000.515}, world = {1, 102}}, --Willowfield, LS
	{ pos = {295.614, -79.758, 1000.515}, world = {4, 103}}, --Angel Pine, SF
	{ pos = {295.614, -79.758, 1000.515}, world = {4, 104}}, --El Quebrados, LV
	{ pos = {296.531, -37.434, 1000.515}, world = {1, 105}}, --Fort Carson, LV
	{ pos = {295.614, -79.758, 1000.515}, world = {4, 106}}, --Bone County, LV
	{ pos = {296.531, -37.434, 1000.515}, world = {1, 107}}, --Come-A-Lot, LV
	{ pos = {296.531, -37.434, 1000.515}, world = {1, 108}}, --Old Venturas Strip, LV
	{ pos = {295.614, -79.758, 1000.515}, world = {4, 109}}, --Blueberry, LS
	{ pos = {311.984, -164.589, 998.601}, world = {6, 110}}, --Palimino Creek, LS
}

	--[[
    setTimer (
        function()
            for i,v in pairs ( markers) do
                local x, y, z, int, dim = v[1], v[2], v[3], v[4], v[5]
                local market = createMarker ( x, y, z, "cylinder", 1, 91, 204, 255, 255 )
				local marker = createColTube ( x, y, z+0.5, 0.5, 1)
                setElementDimension ( market, dim)
				setElementDimension( marker, dim)
                setElementInterior( market, int)
				setElementInterior( marker, int)
                addEventHandler ( "onClientColShapeHit", marker, openGunStore, false)
            end
        end, 1000, 1
    )
	--]]

    setTimer (
        function()
            for i,v in pairs ( markers) do
                local x, y, z, int, dim = v.pos[1], v.pos[2], v.pos[3], v.world[1], v.world[2]
                local market = createMarker ( x, y, z, "cylinder", 1, 91, 204, 255, 255 )
				local marker = createColTube ( x, y, z+0.5, 0.5, 1)
                setElementDimension ( market, dim)
				setElementDimension( marker, dim)
                setElementInterior( market, int)
				setElementInterior( marker, int)
                addEventHandler ( "onClientColShapeHit", marker, openGunStore, false)
            end
        end, 1000, 1
    )

    function openGunStore( hitElement, matchingDimension)
        if getElementType(hitElement) == "player" then
			if hitElement == localPlayer then
				if matchingDimension then
					if guiGetVisible(gun.window[1]) ~= true then
						guiSetVisible( gun.window[1], true)
						showCursor( true)
						placeWeapons()
					end
				end
			end
        end
    end

local types = {
	{ name = "Melee", 1},
	{ name = "Handguns", 2},
	{ name = "Shotguns", 3},
	{ name = "Sub-Machine", 4},
	{ name = "Assault", 5},
	{ name = "Rifles", 6},
	{ name = "Heavy", 7},
	{ name = "Projectiles", 8},
	{ name = "Special", 9},
	{ name = "Everything", 10},
}

local guns = {
	{ name = "Brass Knuckles", id = 1, type = "weapon", price = 5000, gunID = 1, ammo = 50, sale = true},
	{ name = "Golf Club", id = 1, type = "weapon", price = 1000, gunID = 2, ammo = 50, sale = true},
	{ name = "Nightstick", id = 1, type = "weapon", price = 1500, gunID = 3, ammo = 50, sale = true},
	{ name = "Knife", id = 1, type = "weapon", price = 5000, gunID = 4, ammo = 50, sale = true},
	{ name = "Baseball Bat", id = 1, type = "weapon", price = 1000, gunID = 5, ammo = 50, sale = true},
	{ name = "Shovel", id = 1, type = "weapon", price = 2000, gunID = 6, ammo = 50, sale = true},
	{ name = "Pool Cue", id = 1, type = "weapon", price = 2500, gunID = 7, ammo = 50, sale = true},
	{ name = "Katana", id = 1, type = "weapon", price = 5000, gunID = 8, ammo = 50, sale = true},
	{ name = "Chainsaw", id = 1, type = "weapon", price = 7600, gunID = 9, ammo = 50, sale = true},
	{ name = "Colt .45", id = 2, type = "weapon", price = 12000, gunID = 22, ammo = 50, sale = true},
	{ name = "Silenced 9mm", id = 2, type = "weapon", price = 18000, gunID = 23, ammo = 50, sale = true},
	{ name = "Desert Eagle", id = 2, type = "weapon", price = 24000, gunID = 24, ammo = 50, sale = true},
	{ name = "Shotgun", id = 3, type = "weapon", price = 36000, gunID = 25, ammo = 50, sale = true},
	{ name = "Sawn-off Shotgun", id = 3, type = "weapon", price = 51000, gunID = 26, ammo = 50, sale = true},
	{ name = "SPAS-12", id = 3, type = "weapon", price = 57000, gunID = 27, ammo = 50, sale = true},
	{ name = "Uzi", id = 4, type = "weapon", price = 42000, gunID = 28, ammo = 50, sale = true},
	{ name = "MP5", id = 4, type = "weapon", price = 60000, gunID = 29, ammo = 50, sale = true},
	{ name = "Tec-9", id = 4, type = "weapon", price = 36000, gunID = 32, ammo = 50, sale = true},
	{ name = "AK-47", id = 5, type = "weapon", price = 60000, gunID = 30, ammo = 50, sale = true},
	{ name = "M4", id = 5, type = "weapon", price = 75000, gunID = 31, ammo = 50, sale = true},
	{ name = "Country Rifle", id = 6, type = "weapon", price = 36000, gunID = 33, ammo = 50, sale = true},
	{ name = "Sniper Rifle", id = 6, type = "weapon", price = 105000, gunID = 34, ammo = 50, sale = true},
	{ name = "Rocket Launcher", id = 7, type = "weapon", price = 5000000, gunID = 35, ammo = 50, sale = false},
	{ name = "Heat-Seeking RPG", id = 7, type = "weapon", price = 5000000, gunID = 36, ammo = 50, sale = false},
	{ name = "Flamethrower", id = 7, type = "weapon", price = 5000000, gunID = 37, ammo = 50, sale = false},
	{ name = "MG-42", id = 7, type = "weapon", price = 5000000, gunID = 38, ammo = 50, sale = true},
	{ name = "Grenade", id = 8, type = "weapon", price = 3000, gunID = 16, ammo = 50, sale = true},
	{ name = "Tear Gas", id = 8, type = "weapon", price = 3000, gunID = 17, ammo = 50, sale = true},
	{ name = "Molotov Cocktail", id = 8, type = "weapon", price = 3000, gunID = 18, ammo = 50, sale = true},
	{ name = "Satchel Charges", id = 8, type = "weapon", price = 3000, gunID = 39, ammo = 50, sale = true},
	{ name = "Spraycan", id = 9, type = "weapon", price = 120, gunID = 41, ammo = 50, sale = true},
	{ name = "Fire Extinguisher", id = 9, type = "weapon", price = 120, gunID = 42, ammo = 50, sale = true},
	{ name = "Long Purple Didlo", id = 10, type = "weapon", price = 300, gunID = 10, ammo = 50, sale = true},
	{ name = "Cane", id = 10, type = "weapon", price = 150, gunID = 15, ammo = 50, sale = true},
	{ name = "Flowers", id = 10, type = "weapon", price = 200, gunID = 14, ammo = 50, sale = true},
	{ name = "Night-Vision Goggles", id = 11, type = "weapon", price = 1000, gunID = 44, ammo = 50, sale = true},
	{ name = "Infrared Goggles", id = 11, type = "weapon", price = 1000, gunID = 45, ammo = 50, sale = true},
	{ name = "Parachute", id = 11, type = "weapon", price = 500, gunID = 46, ammo = 50, sale = true},
}

local ammoSelects = {
	['No Ammo In Category'] = 0,
	['Colt .45'] = 100,
	['Silenced 9mm'] = 100,
	['Desert Eagle'] = 100,
	['Shotgun'] = 50,
	['Sawn-off Shotgun'] = 50,
	['SPAS-12'] = 50,
	['Uzi'] = 100,
	['MP5'] = 100,
	['Tec-9'] = 100,
	['AK-47'] = 100,
	['M4'] = 100,
	['Country Rifle'] = 50,
	['Sniper Rifle'] = 50,
	['Rocket Launcher'] = 50,
	['Heat-Seeking RPG'] = 50,
	['Flamethrower'] = 200,
	['MG-42'] = 200,
	['Grenade'] = 50,
	['Tear Gas'] = 50,
	['Molotov Cocktail'] = 50,
	['Satchel Charges'] = 50,
	['Spraycan'] = 200,
	['Fire Extinguisher'] = 200,
}

local ammo = {
	{ name = "No Ammo In Category", id = 1, type = "ammo", price = 0, gunID = "none", ammo = 0, sale = false},
	{ name = "Colt .45", id = 2, type = "ammo", price = 60, gunID = 22, ammo = 100, sale = true},
	{ name = "Silenced 9mm", id = 2, type = "ammo", price = 60, gunID = 23, ammo = 100, sale = true},
	{ name = "Desert Eagle", id = 2, type = "ammo", price = 150, gunID = 24, ammo = 100, sale = true},
	{ name = "Shotgun", id = 3, type = "ammo", price = 40, gunID = 25, ammo = 50, sale = true},
	{ name = "Sawn-off Shotgun", id = 3, type = "ammo", price = 40, gunID = 26, ammo = 50, sale = true},
	{ name = "SPAS-12", id = 3, type = "ammo", price = 40, gunID = 27, ammo = 50, sale = true},
	{ name = "Uzi", id = 4, type = "ammo", price = 400, gunID = 28, ammo = 100, sale = true},
	{ name = "MP5", id = 4, type = "ammo", price = 400, gunID = 29, ammo = 100, sale = true},
	{ name = "Tec-9", id = 4, type = "ammo", price = 400, gunID = 32, ammo = 100, sale = true},
	{ name = "AK-47", id = 5, type = "ammo", price = 350, gunID = 30, ammo = 100, sale = true},
	{ name = "M4", id = 5, type = "ammo", price = 500, gunID = 31, ammo = 100, sale = true},
	{ name = "Country Rifle", id = 6, type = "ammo", price = 25, gunID = 33, ammo = 50, sale = true},
	{ name = "Sniper Rifle", id = 6, type = "ammo", price = 100, gunID = 34, ammo = 50, sale = true},
	{ name = "Rocket Launcher", id = 7, type = "weapon", price = 100, gunID = 35, ammo = 50, sale = false},
	{ name = "Heat-Seeking RPG", id = 7, type = "weapon", price = 100, gunID = 36, ammo = 50, sale = false},
	{ name = "Flamethrower", id = 7, type = "weapon", price = 300, gunID = 37, ammo = 200, sale = false},
	{ name = "MG-42", id = 7, type = "ammo", price = 10, gunID = 38, ammo = 200, sale = true},
	{ name = "Grenade", id = 8, type = "ammo", price = 3000, gunID = 16, ammo = 50, sale = true},
	{ name = "Tear Gas", id = 8, type = "ammo", price = 3000, gunID = 17, ammo = 50, sale = true},
	{ name = "Molotov Cocktail", id = 8, type = "ammo", price = 3000, gunID = 18, ammo = 50, sale = true},
	{ name = "Satchel Charges", id = 8, type = "ammo", price = 3000, gunID = 39, ammo = 50, sale = true},
	{ name = "Spraycan", id = 9, type = "ammo", price = 120, gunID = 41, ammo = 200, sale = true},
	{ name = "Fire Extinguisher", id = 9, type = "ammo", price = 120, gunID = 42, ammo = 200, sale = true},
}

function getPlayerWeapons(player) -- https://wiki.multitheftauto.com/wiki/GetPedWeapons
	local playerWeapons = {}
	if player and isElement(player) and getElementType(player) == "player" then
		for i=0,9 do
			local wep = getPedWeapon(player,i)
			if wep and wep ~= 0 then
				table.insert(playerWeapons,wep)
			end
		end
	else
		return false
	end
	return playerWeapons
end

function placeWeapons()
	guiGridListClear(gun.gridlist[3])
	for _,weapon in ipairs(getPlayerWeapons(localPlayer)) do
		local row = guiGridListAddRow(gun.gridlist[3])
		guiGridListSetItemText(gun.gridlist[3],row,1,getWeaponNameFromID(weapon),false,false)
		guiGridListSetItemData(gun.gridlist[3],row,1,weapon,false,false)
		--guiGridListSetItemText(gun.gridlist[3],row,2,getPedTotalAmmo(localPlayer,getSlotFromWeapon(weapon)),false,false)
	end
end

function outputTop( theText, theType, timed)
	if theText then
		if theType then
			if theType == "good" then
				if not timed then
					if not isTimer( antispamTimer) then
						exports.GTIhelp:dm( theText, 0, 255, 0)
						antispamTimer = setTimer( function() end, 5000, 1)
					end
				else
					exports.GTIhelp:dm( theText, 255, 0, 0)
				end
			elseif theType == "bad" then
				if not timed then
					if not isTimer( antispamTimer) then
						exports.GTIhelp:dm( theText, 255, 0, 0)
						antispamTimer = setTimer( function() end, 5000, 1)
					end
				else
					exports.GTIhelp:dm( theText, 255, 0, 0)
				end
			elseif theType == "none" then
				if not timed then
					if not isTimer( antispamTimer) then
						exports.GTIhelp:dm( theText, 255, 255, 0)
						antispamTimer = setTimer( function() end, 5000, 1)
					end
				else
					exports.GTIhelp:dm( theText, 255, 0, 0)
				end
			end
		end
	end
end

local currentType = guns

local specialComb = { [9]=true, [10]=true, [11]=true}

addEventHandler( "onClientGUIClick", root,
	function ( )
		if source == gun.label[1] then
			local Grow, Gcol = guiGridListGetSelectedItem(gun.gridlist[1])
			local sName = guiGridListGetItemText(gun.gridlist[1], Grow, Gcol)
			local ammoPerSelect = ammoSelects[sName]
			gunType = guiGridListGetItemData(gun.gridlist[1], Grow, 1)
			ammoType = guiGridListGetItemText(gun.gridlist[1], Grow, 2)
			slotType = guiGridListGetItemData(gun.gridlist[1], Grow, 2)
			priceType = guiGridListGetItemData(gun.gridlist[1], Grow, 3)
			saleType = guiGridListGetItemData(gun.gridlist[1], Grow, 4)
			--
			if currentType == guns then
				if saleType == true then
					local ammo = ammoSelects[sName]
					triggerServerEvent( "purchaseWeapon", getLocalPlayer(), localPlayer, slotType, gunType, priceType, ammoPerSelect)
				else
					outputTop( "This "..getWeaponNameFromID( gunType).." is currently not for sale", "bad")
				end
			elseif currentType == ammo then
				if saleType == true then
					if ammoPerSelect ~= 0 then
						if ammoPerSelect > 50 then
							setOption( "Enter how many magazines you want to purchase.", gunType, slotType, ammoPerSelect, priceType, "number")
						else
							setOption( "Enter how many rounds you want to purchase.", gunType, slotType, ammoPerSelect, priceType, "number")
						end
					end
				else
					outputTop( "This "..getWeaponNameFromID( gunType).." is currently not for sale", "bad")
				end
			end
		elseif source == gun.label[2] then
			if localPlayer then
				if guiGetVisible( gun.window[1]) == true then
					guiSetVisible(gun.window[1], false)
					showCursor(false)
				end
			end
		elseif source == gun.label[3] then
			if guiGetVisible( gun.button[4]) == true then
				guiSetVisible( gun.button[3], false)
				guiGridListClear( gun.gridlist[1])
			else
				guiSetVisible( gun.button[3], false)
				guiSetVisible( gun.button[4], true)
				guiGridListClear( gun.gridlist[1])
			end
			currentType = guns
		elseif source == gun.label[4] then
			if guiGetVisible( gun.button[3]) == true then
				guiSetVisible( gun.button[4], false)
				guiGridListClear( gun.gridlist[1])
			else
				guiSetVisible( gun.button[4], false)
				guiSetVisible( gun.button[3], true)
				guiGridListClear( gun.gridlist[1])
			end
			currentType = ammo
		elseif source == gun.gridlist[2] then
			local Trow, Tcol = guiGridListGetSelectedItem(gun.gridlist[2])
			local sType = guiGridListGetItemText(gun.gridlist[2], Trow, Tcol)
			guiGridListClear( gun.gridlist[1])
			guiGridListSetSortingEnabled( gun.gridlist[1], false)
			guiGridListSetSortingEnabled( gun.gridlist[2], false)
			guiGridListSetSortingEnabled( gun.gridlist[3], false)
			if currentType ~= nil then
				if sType == "Melee" then
					for i,v in ipairs ( currentType ) do
						if v.id == 1 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Handguns" then
					for i,v in ipairs ( currentType ) do
						if v.id == 2 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Shotguns" then
					for i,v in ipairs ( currentType ) do
						if v.id == 3 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Sub-Machine" then
					for i,v in ipairs ( currentType ) do
						if v.id == 4 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Assault" then
					for i,v in ipairs ( currentType ) do
						if v.id == 5 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Rifles" then
					for i,v in ipairs ( currentType ) do
						if v.id == 6 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor(gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Heavy" then
					for i,v in ipairs ( currentType ) do
						if v.id == 7 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)

							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Projectiles" then
					for i,v in ipairs ( currentType ) do
						if v.id == 8 then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Special" then
					for i,v in ipairs ( currentType ) do
						if specialComb[v.id] then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				elseif sType == "Everything" then
					for i,v in ipairs ( currentType ) do
						if v.gunID ~= "none" then
							local price = exports.GTIhelp:formatNumber( v.price)
							local gRow = guiGridListAddRow(gun.gridlist[1])
							guiGridListSetItemText(gun.gridlist[1], gRow, 1, v.name, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 2, "$"..price, false, false)
							guiGridListSetItemText(gun.gridlist[1], gRow, 3, v.ammo, false, false)
							guiGridListSetItemData(gun.gridlist[1], gRow, 1, v.gunID)
							guiGridListSetItemData(gun.gridlist[1], gRow, 2, v.id)
							guiGridListSetItemData(gun.gridlist[1], gRow, 3, v.price)
							if getPlayerMoney( localPlayer) >= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 45, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 45, 123, 49)
							elseif getPlayerMoney( localPlayer) <= tonumber(v.price) then
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 123, 45, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 123, 45, 49)
							else
								guiGridListSetItemColor( gun.gridlist[1], gRow, nameRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, priceRow, 163, 123, 49)
								guiGridListSetItemColor( gun.gridlist[1], gRow, numRow, 163, 123, 49)
							end
							if v.sale == true then
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, true)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 163, 123, 49)
							else
								guiGridListSetItemText(gun.gridlist[1], gRow, 4, "Not For Sale", false, false)
								guiGridListSetItemData(gun.gridlist[1], gRow, 4, false)
								guiGridListSetItemColor( gun.gridlist[1], gRow, saleRow, 123, 45, 49)
							end
						end
					end
				end
			else
				outputTop( "You can't view any categories because you haven't selected your viewing option", "bad")
			end
		elseif source == gun.gridlist[1] then
			if currentType ~= nil then
				local Grow, Gcol = guiGridListGetSelectedItem(gun.gridlist[1])
				local sType = guiGridListGetItemText(gun.gridlist[1], Grow, Gcol)
				if Grow then
					local gID = guiGridListGetItemData(gun.gridlist[1], Grow, 1)
					if gID then
						if gun.image[1] then
							if guiGetVisible( gun.image[1]) == false then
								guiSetVisible( gun.image[1], true)
							end
							guiStaticImageLoadImage(gun.image[1], "guns/"..gID..".png")
						else
							--gun.image[1] = guiCreateStaticImage(42, 320, 98, 68, "guns/"..gID..".png", false, gun.window[1])
							gun.image[1] = guiCreateStaticImage(24, 309, 150, 61, "guns/"..gID..".png", false, gun.window[1])
						end
					end
				end
			else
				outputTop( "You can't view any categories because you haven't selected your viewing option", "bad")
			end
		end
	end
)

setTimer(
	function ( )
		guiGridListClear( gun.gridlist[2])
		for i,k in ipairs ( types ) do
			local typeRow = guiGridListAddRow(gun.gridlist[2])
			guiGridListSetItemText(gun.gridlist[2], typeRow, 1, k.name, false, false)
			guiGridListSetItemData(gun.gridlist[2], typeRow, 1, k.id)
		end
	end, 100, 1
)

function setEditOption( theElement, theOption)
	if theElement then
		if theOption then
			if theOption == "number" then
				addEventHandler("onClientGUIChanged", theElement, function()
					guiSetText(source, guiGetText(source):gsub("[^0-9]",""))
					if not tonumber(guiGetText(source)) then
						guiSetText(source,"")
					end
				end)
			elseif theOption == "string" then
				addEventHandler("onClientGUIChanged", theElement, function()
					guiSetText(source, guiGetText(source):gsub("[^a-z]",""))
					if guiGetText(source) then
						guiSetText(source,"")
					end
				end)
			end
		end
	end
end

--function purchaseAmmo( player, weaponSlot, weaponID, ammoPrice, weaponAmmo)

function setOption( theText, theWeapon, theSlot, theAmmo, thePrice, theEditType)
	if theText then
		if theWeapon then
			if theSlot then
				if thePrice then
					if theEditType then
						guiSetVisible( gun1.window[1], true)
						guiSetVisible( gun.window[1], false)
						guiSetText( gun1.label[1], theText)
						setEditOption( gun1.edit[1], "number")
						function tempFunction()
							if source == gun1.label[2] then
								removeEventHandler( "onClientGUIClick", root, tempFunction)
								guiSetVisible( gun1.window[1], false)
								guiSetVisible( gun.window[1], true)
							elseif source == gun1.label[3] then
								local theAmount = guiGetText( gun1.edit[1])
								if tonumber( theAmount) then
									local theCost = thePrice*theAmount
									local name = getWeaponNameFromID( theWeapon)
									if theAmount == "" then theAmount = 1 end
									local totalAmmo = theAmount*theAmmo
									if theAmmo > 50 then
										--outputTop( "You bought "..theAmount.." "..name.."(ID:'"..theWeapon.."' Slot:'"..theSlot.."') magazines for $"..theCost, "good")
										triggerServerEvent( "purchaseAmmo", getLocalPlayer(), localPlayer, theSlot, theWeapon, theCost, theAmount, totalAmmo, "magazine")
									else
										--outputTop( "You bought "..theAmount.." "..name.."(ID:'"..theWeapon.."' Slot:'"..theSlot.."') magazines for $"..theCost, "good")
										triggerServerEvent( "purchaseAmmo", getLocalPlayer(), localPlayer, theSlot, theWeapon, theCost, theAmount, totalAmmo, "rounds")
									end
								end
								removeEventHandler( "onClientGUIClick", root, tempFunction)
								guiSetVisible( gun1.window[1], false)
								guiSetVisible( gun.window[1], true)
							end
						end
						addEventHandler( "onClientGUIClick", root, tempFunction)
					end
				end
			end
		end
	end
end
