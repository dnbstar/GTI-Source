----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Jack Johnson (Jack)
-- Date: 6 October 2014
-- Resource: GTIrefinery/server_core.lua
-- Version: 1.1
----------------------------------------->>

JOB_REFINERY = "Oil Refiner"

--onPlayerJoinJob
--onPlayerQuitJob
--onPlayerSellOil
--misc functions...

function isPlayerOilRefiner(player)
	if not (player) or not (isElement(player)) or (getElementType(player) ~= "player") then return false end
	if (exports.GTIemployment:getPlayerJob(player) == JOB_REFINERY) then return true else return false end
end

_error = error
function error(message)
	if (message) and type(message) == "string" and (#message >= 1) then
		_error("[Refinery] "..message)
	end
end