function queryAssistantSound( text, player, voice)
	if (type(text) ~= "string") then return false end
	if (not player or not isElement(player)) then player = root end
	if not tostring(voice) then
		triggerClientEvent(player, "GTIassistant.querySound", resourceRoot, text)
	else
		triggerClientEvent(player, "GTIassistant.querySound", resourceRoot, text, voice)
	end
	return true
end
