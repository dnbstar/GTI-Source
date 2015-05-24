local players = {}
local rcvehs = {
[564] = true,
[594] = true,
[501] = true,
[465] = true,
[464] = true,
[441] = true
}
function start(player,cmd,id)
	if player then--rcvehs[id] then
		local x,y,z = getElementPosition(player)
		players[player] = {}
		players[player][1] = createVehicle(id, x, y, z)
		players[player][2] = createPed(180, x, y, z)
		setElementAlpha(players[player][2] ,0)
		warpPedIntoVehicle(players[player][2] ,players[player][1])
		giveWeapon(player,40,1,true)
		triggerClientEvent(player, "GTIRCvehicle.start", resourceRoot, players[player][1], players[player][2])
		exports.GTIanims:setJobAnimation( player, "ped", "GunCrouchBwd",-1,false,false,false,true)
	end
end
addCommandHandler("rcveh",start)

addEvent("GTIRCvehicle.destroy", true) 
addEventHandler("GTIRCvehicle.destroy", resourceRoot, function() 
	if players[client] then
		exports.GTIanims:setJobAnimation(client)
		destroyElement(players[client][1])
		destroyElement(players[client][2])
		players[client] = nil
	end
end)

addEvent("GTIRCvehicle.anim", true) 
addEventHandler("GTIRCvehicle.anim", resourceRoot, function(anim) 
	if anim == 0 then
		exports.GTIanims:setJobAnimation(client)
		giveWeapon(client,40,1,true) 
	elseif anim == 1 then
		exports.GTIanims:setJobAnimation(client, "ped", "GunCrouchBwd",-1,false,false,false,true)
		giveWeapon(client,40,1,true)
	elseif anim == 2 then
		exports.GTIanims:setJobAnimation(client)
	end
end)