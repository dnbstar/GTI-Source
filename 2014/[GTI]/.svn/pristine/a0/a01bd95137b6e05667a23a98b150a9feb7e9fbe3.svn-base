addEvent( "onSafeZoneEnter", true)
addEventHandler( "onSafeZoneEnter", root,
function ( player, zoneName, status1, status2)
end
)

addEvent( "onSafeZoneExit", true)
addEventHandler( "onSafeZoneExit", root,
function ( player, zoneName, status1, status2)
end
)

addEvent( "onSafeZoneDamage", true)
addEventHandler( "onSafeZoneDamage", root,
function ( attkr, wep, bodypart, dmg)
end
)

function eventCancel()
	cancelEvent()
end

function safezoneDamage( attacker, weapon, bodypart, loss)
	triggerClientEvent( source, "cancelDamage", source)
	local victimHP = getElementHealth( source)
	local targetHP = getElementHealth( attacker)
	--setElementHealth( source, victimHP+loss)
	if tonumber(targetHP) <= 15 then
		setElementHealth( attacker, 0)
	else
		setElementHealth( attacker, targetHP-loss)
	end
	--outputChatBox( "DMG: "..loss, attacker)
end

addEventHandler( "onSafeZoneEnter", root,
	function( name, status1, status2)
		--addEventHandler( "onPlayerDamage", root, safezoneDamage)
		if status1 == true then
			if doesPedHaveJetPack( source) then
				removePedJetPack( source)
			end
		end
	end
)

addEventHandler( "onSafeZoneExit", root,
	function( source, name, status1, status2)
		--removeEventHandler( "onPlayerDamage", root, safezoneDamage)
	end
)

local instaKillWeps = {
	[33] = true, --Country Rifle
	[34] = true, --Sniper Rifle
}

--[[
addEventHandler( "onSafeZoneDamage", root,
	function( attkr, wep, bodypart, dmg)
		if attkr ~= source then
			local aHP = getElementHealth( attkr)
			if instaKillWeps[wep] then
				killPed( attkr)
			end
			if aHP <= 15 then
				killPed( attkr)
			else
				local dmg = math.floor( dmg)
				setElementHealth( attkr, aHP-dmg)
			end
			if not isTimer( antiShootTimer) then
				exports.GTIhud:dm( "DMing player's in a safezone is not allowed!", attkr, 255, 0, 0)
				antiShootTimer = setTimer( function() end, 5000, 1)
			end
		end
	end
)
--]]

--[[
local gunshotCount = {}
addEventHandler( "onSafeZoneDamage", root,
	function( attkr, wep, bodypart, dmg)
		if attkr ~= source then
			if (not gunshotCount[attkr]) then
				gunshotCount[attkr] = 1
			elseif gunshotCount[attkr] == 2 then
				killPed( attkr)
				gunshotCount[attkr] = 0
			else
				gunshotCount[attkr] = gunshotCount[attkr]+1
			end
			if not isTimer( countTimer) then
				exports.GTIhud:dm( "DMing player's in a safezone is not allowed!", attkr, 255, 0, 0)
				countTimer = setTimer( function() end, 5000, 1)
			end
			if not isTimer( antiShootTimer) then
				antiShootTimer = setTimer( function() end, 1000, 1)
			end
		end
	end
)
--]]
