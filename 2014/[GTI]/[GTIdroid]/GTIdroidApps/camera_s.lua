addEvent( "onCameraPictureTaken", true)
addEventHandler( "onCameraPictureTaken", root,
	function()
		takePlayerScreenShot( source, 278, 402, "GTIdroidScreenshot", 25)
	end
)

addEventHandler( "onPlayerScreenShot", root,
	function( theResource, status, data, timestamp, tag)
		triggerClientEvent( source, "saveMobilePicture", resourceRoot, data, tag, timestamp)
	end
)
