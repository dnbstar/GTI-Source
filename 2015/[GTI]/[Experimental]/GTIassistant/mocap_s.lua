function moveCameraToPlayer( player, x, y, z, lx, ly, lz, time)
	if (not player or not isElement(player)) then return end
	if not x and lx then return false end
	local time = time or 5000
	triggerClientEvent(player, "GTIassistant.moveCameraToPlayer", resourceRoot, x, y, z, lx, ly, lz, time)
	return true
end
