----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Jack Johnson (Jack)
-- Date: 6 October 2014
-- Resource: GTIrefinery/client_player.lua
-- Version: 1.1
----------------------------------------->>

_error = error
function error(message)
	if (message) and type(message) == "string" and (#message >= 1) then
		_error("[Refinery] "..message)
	end
end