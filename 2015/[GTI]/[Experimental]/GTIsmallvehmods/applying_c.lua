function applyMods()
	-- Police Maverick
	local skin = engineLoadTXD("land/polmav.txd", true)
	engineImportTXD(skin, 497)
	local skin = engineLoadDFF("land/polmav.dff", 497)
	engineReplaceModel(skin, 497)
end
addEventHandler( "onClientResourceStart", resourceRoot, applyMods, false)
