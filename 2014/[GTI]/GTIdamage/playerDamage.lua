----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 20 Jan 2014
-- Resource: GTIdamage/playerDamage.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Stealth Kills
----------------->>

function stealthKills(target)
	cancelEvent()
end
addEventHandler("onClientPlayerStealthKill", localPlayer, stealthKills)

-- Damage Modifications
------------------------>>

function onClientPlayerDamage(attacker, weapon, bodypart, loss)
	if (attacker and isElement(attacker) and getElementType(attacker) == "player") then
		
		-- Police Related Damage
		------------------------->>
		
		local teamName = getTeamName(getPlayerTeam(attacker))
		if (teamName == "Law Enforcement") then
			
			-- Stop Nightstick Damage
			if (weapon == 3) then
				cancelEvent()
			end
			
			-- Stop Player Damage from Cop if Player is Unwanted
			local wanted = getElementData(source, "wanted") or 0
			if (wanted == 0) then
				cancelEvent()
			end
		end
		
		-- Disable Katana 1-Hit Kill
		if (weapon == 8 and loss > 50) then
			cancelEvent()
		end
		
	end
end
addEventHandler("onClientPlayerDamage", root, onClientPlayerDamage)