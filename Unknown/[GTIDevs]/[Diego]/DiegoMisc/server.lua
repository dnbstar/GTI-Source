----------------------------------------------->>
-- What		: server.lua
-- Type		: Server
-- For		: Grand Theft International
-- Author	: Diego aka diegonese
-- All rights reserved to GTI 2014/2015 (C)
----------------------------------------------->>

-- Farm trailer detach bug
--------------------------->>
addEventHandler("onTrailerDetach", root, 
	function (theTractor)
		if (getElementModel(theTractor) == 531) and (getElementModel(source) == 610) then
			attachTrailerToVehicle(theTractor, source) 
		end
end)