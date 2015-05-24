medicOccuption = {
	["Paramedic"] = true,
}

validWeapons = {
	[41] = true,
}

lastattacker = {}

addEventHandler( "onClientPlayerDamage", localPlayer,
	function( attacker, weapon, bodypart, loss)
		if attacker then
			if (attacker ~= localPlayer and getElementType( attacker) == "player" and medicOccuption[getElementData( attacker, "job")]) then
				cancelEvent(true)
				if (validWeapons[weapon]) then
					if (not isTimer( pause)) then
						local health = getElementHealth( localPlayer)
						if (health < 100 or health < 200) then
							triggerServerEvent( "onPlayerMedicHeal", localPlayer, attacker)
							pause = setTimer( function() end, 500, 1)
						end
					end
				end
			end
		end
	end
)
