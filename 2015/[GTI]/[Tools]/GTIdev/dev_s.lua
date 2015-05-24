function returned_val( val)
	if val and val ~= "ERROR" then
		local val = tostring( val)
		outputDebugString( "Message sent to main server ["..val.."].")
	else
		outputDebugString( "Failed to send message to main server.")
	end
end

function outputMainIRC( channel, message)
	if not channel and message then return end
	callRemote("http://gtirpg.net/MTA/multichat.php", returned_val, channel, message)
	return outputDebugString( "Attempting to send message.")
end
