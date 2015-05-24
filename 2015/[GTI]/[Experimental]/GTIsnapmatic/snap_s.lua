local pc_dir = "file:///C:/MTA/server/mods/deathmatch/resources/[GTI]/[Experimental]/GTIsnapmatic/temp/"
local path = "temp/"
local x, y = 800, 600

function webResult( result)
	outputChatBox( tostring( result), getPlayerFromName( "LilDolla"), 255, 255, 0)
end

addEventHandler( "onPlayerScreenShot", root,
	function( resource, status, imageData, timestamp, tag)
		--if resource == resourceRoot then
			if getElementType(source) == "player" and getPlayerName(source) == "LilDolla" then
				--outputChatBox( "Image Data: "..tostring( imageData), source, 255, 255, 255)
				local wf = getPlayerName(source).."-"..timestamp
				local ff = path..getPlayerName(source).."-"..timestamp
				if not fileExists( path..getPlayerName(source).."-"..timestamp) then
					local decoded = base64Decode( imageData)
					outputChatBox( "B64 Decode: "..decoded, source, 255, 255, 0)
					--outputChatBox( "File Name Format: '"..ff.."' being made", source, 255, 255, 255)
					--[[
					local file = fileCreate( ff..".jpg")
					fileWrite( file, imageData)
					outputChatBox( "Snap created. Uploading Snap.", source, 0, 255, 0)
					--callRemote("http://gtirpg.net/MTA/gallery/upload.php", webResult, file, getPlayerName(source), timestamp)
					callRemote("http://gtirpg.net/MTA/snapload.php", webResult, imageData, wf)
					--restart GTIsnapmatic
					fileClose( file)
					--]]
				end
			end
		--end
	end
)

addCommandHandler( "spic",
	function( source)
		outputChatBox( "Creating Snap.", source, 0, 255, 0)
		takePlayerScreenShot( source, x, y)
	end
)
