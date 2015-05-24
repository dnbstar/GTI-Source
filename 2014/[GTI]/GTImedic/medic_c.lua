medicOccuption = {
	["Paramedic"] = true,
}

validWeapons = {
	[41] = true,
}

addEventHandler( "onClientPlayerDamage", localPlayer,
	function( attacker, weapon, bodypart, loss)
		if (attacker ~= localPlayer and getElementType( attacker) == "player" and medicOccuption[getElementData( attacker, "job")]) then
			if (validWeapons[weapon]) then
				cancelEvent()
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
)
