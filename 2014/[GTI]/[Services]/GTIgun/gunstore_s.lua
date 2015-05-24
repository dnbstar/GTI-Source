function getPlayerWeapons(player, slot)
	local playerWeapons = {}
	if player and isElement(player) and getElementType(player) == "player" then
		if slot then
			for i=slot,slot do
				local wep = getPedWeapon(player,i)
				if wep and wep ~= 0 then
					table.insert(playerWeapons,wep)
				else
					playerWeapons = nil
				end
			end
		else
			for i=1,12 do
				local wep = getPedWeapon(player,i)
				if wep and wep ~= 0 then
					table.insert(playerWeapons,wep)
				else
					playerWeapons = nil
				end
			end
		end
	else
		return false
	end
	return playerWeapons
end

local classifications = {
	[0] = 'Fist',
	[1] = 'Melee',
	[2] = 'Handgun',
	[3] = 'Shotgun',
	[4] = 'Sub-Machine Gun',
	[5] = 'Assault Rifle',
	[6] = 'Rifle',
	[7] = 'Heavy',
	[8] = 'Projectile',
	[9] = 'Special',
	[10] = 'Special',
	[11] = 'Special',
	[12] = 'Special',
}

function purchaseWeapon( player, weaponSlot, weaponID, weaponPrice, weaponAmmo)
	local acc = getPlayerAccount( player)
	local playerMoney = getPlayerMoney(player)
	local class = classifications[weaponSlot]
	local weapons = getPlayerWeapons( player, weaponSlot)
	if weapons ~= nil then
		local gunAccount, gunAmmoAccount = getGunAccountData( acc, getWeaponNameFromID(weaponID))
		if playerMoney >= weaponPrice then
			if not gunAccount then
				setGunAccountData( acc, getWeaponNameFromID(weaponID), weaponID, weaponAmmo)
				outputChatBox( "You bought a "..getWeaponNameFromID( weaponID).." for $"..weaponPrice, player, 0, 255, 0)
				outputChatBox( "Weapon:'"..getWeaponNameFromID(weaponID).."' Classified:'"..class.."' Cost:'$"..weaponPrice.."'", player, 255, 255, 0)
				takePlayerMoney( player, weaponPrice)
				giveWeapon( player, weaponID, 1000, true)
			else
				if gunAccount == weaponID then
					takeWeapon( player, weaponID)
					outputChatBox( "You have swapped Weapon Slot "..weaponSlot.." with an "..getWeaponNameFromID(weaponID), player, 255, 255, 0)
					giveWeapon( player, weaponID, gunAmmoAccount, true)
				end
			end
		else
			return outputChatBox( "You don't have enough funds to purchase a "..getWeaponNameFromID(weaponID), player, 255, 0, 0)
		end
		--[[
		else
				return outputChatBox( "You already own the "..getWeaponNameFromID(weaponID), player, 255, 0, 0)
			end
		end
		--]]
	else
		local gunAccount, gunAmmoAccount = getGunAccountData( acc, getWeaponNameFromID(weaponID))
		if playerMoney >= weaponPrice then
			if not gunAccount then
				setGunAccountData( acc, getWeaponNameFromID(weaponID), weaponID, weaponAmmo)
				outputChatBox( "You bought a "..getWeaponNameFromID( weaponID).." for $"..weaponPrice, player, 0, 255, 0)
				outputChatBox( "Weapon:'"..getWeaponNameFromID(weaponID).."' Classified:'"..class.."' Cost:'$"..weaponPrice.."'", player, 255, 255, 0)
				takePlayerMoney( player, weaponPrice)
				giveWeapon( player, weaponID, weaponAmmo, true)
			else
				if gunAmmoAccount then
					giveWeapon( player, weaponID, gunAmmoAccount, true)
				else
					giveWeapon( player, weaponID, 50, true)
				end
			end
		else
			return outputChatBox( "You don't have enough funds to purchase a "..getWeaponNameFromID(weaponID), player, 255, 0, 0)
		end
	end
end
addEvent("purchaseWeapon", true)
addEventHandler("purchaseWeapon", root, purchaseWeapon)

--[[Ammo Types:
	magazine
	rounds
--]]

function purchaseAmmo( player, weaponSlot, weaponID, ammoPrice, theAmount, weaponAmmo, ammoType)
	local acc = getPlayerAccount( player)
	local playerMoney = getPlayerMoney(player)
	local class = classifications[weaponSlot]
	local weapons = getPlayerWeapons( player, weaponSlot)
	if weapons ~= nil then
		local gunAccount, gunAmmoAccount = getGunAccountData( acc, getWeaponNameFromID(weaponID))
		if playerMoney >= ammoPrice then
			if gunAccount then
				for _, weapons in ipairs (getPlayerWeapons( player)) do
					if weapons == weaponID then
						local currentWeaponAmmo = getPedTotalAmmo( player, getSlotFromWeapon(weaponID))
						local totalAmmo = currentWeaponAmmo+weaponAmmo
						if ammoType == "magazine" then
							if currentWeaponAmmo then
								setWeaponAmmo( player, weaponID, currentWeaponAmmo+weaponAmmo)
							end
							outputChatBox( "You bought "..theAmount.." "..getWeaponNameFromID(weaponID).." magazine(s) for $"..ammoPrice, player, 0, 255, 0)
						else
							if currentWeaponAmmo then
								setWeaponAmmo( player, weaponID, currentWeaponAmmo+weaponAmmo)
							end
							outputChatBox( "You bought "..theAmount.." "..getWeaponNameFromID(weaponID).." round(s) for $"..ammoPrice, player, 0, 255, 0)
						end
						takePlayerMoney( player, ammoPrice)
						setGunAccountData( acc, getWeaponNameFromID(weaponID), weaponID, currentWeaponAmmo+weaponAmmo)
					end
				end
			else
				return outputChatBox( "You don't own a "..getWeaponNameFromID(weaponID), player, 255, 0, 0)
			end
		else
			return outputChatBox( "You don't have enough funds to purchase a "..getWeaponNameFromID(weaponID), player, 255, 0, 0)
		end
	end
end
addEvent("purchaseAmmo", true)
addEventHandler("purchaseAmmo", root, purchaseAmmo)
