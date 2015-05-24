function getModSize( modName, theFiles)
	local data = split( theFiles, ",")
	local txd = data[1]
	local txdf = fileOpen( "mods/"..txd)
	local dff = data[2]
	local dfff = fileOpen( "mods/"..dff)

	local stxd = fileGetSize( txdf)
	local sdff = fileGetSize( dfff)
	local mb = (stxd+sdff)/1024/1024
	local mb = string.format( "%.2f", mb)
	triggerClientEvent( source, "GTIemods.cacheFileSizes", source, modName, mb)
end
addEvent( "GTIemods.getAllFileSizes", true)
addEventHandler( "GTIemods.getAllFileSizes", root, getModSize)
