--[[
function downloadCustomSkin( source, file)
	if file then
		if fileExists( file) then
			local fileContents = fileOpen( file)
			local buffer = ""
			if fileContents then
				local fileInfo = fileRead( fileContents, 512000)
				if fileInfo then
					triggerClientEvent( source, "addCustomSkin", root, file, fileInfo)
				end
			end
		end
	end
end
addEvent( "downloadSkin", true)
addEventHandler( "downloadSkin", root, downloadCustomSkin)
--]]

function cacheFile()
end

function downloadCustomSkin( source, file, shaderID)
	if file then
		--local dlfile = string.gsub( file, "@/", "")
		--outputDebugString( "Attempting to download clothing '"..dlfile.."'.")
		if fileExists( file) then
			local fileContents = fileOpen( file, true)
			if not fileContents then return end
			local buffer = ""
			while ( not fileIsEOF( fileContents)) do
				buffer = buffer .. fileRead( fileContents, 5000)
			end
			triggerClientEvent( source, "addCustomSkin", root, file, buffer, shaderID)
			fileClose( fileContents)
		end
	end
end
addEvent( "downloadSkin", true)
addEventHandler( "downloadSkin", root, downloadCustomSkin)
