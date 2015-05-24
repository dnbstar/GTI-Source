function dmgcontrol( attacker, wep, body, loss )
	if ( source ~= localPlayer and attacker ~= localPlayer ) then
		return
	end	
	if ( source == localPlayer ) then
	--Disable katana one hits
		if ( wep == 8 and loss > 50 ) then
			cancelEvent()
			return
		end
	end 
end
addEventHandler( "onClientPlayerDamage", root, dmgcontrol)

-- Disable stealth kill
addEventHandler( "onClientPlayerStealthKill", root, function()
	cancelEvent()
end )