----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Jack Johnson (Jack)
-- Date: 6 October 2014
-- Resource: GTIrefinery/server_pumps.lua
-- Version: 1.1
----------------------------------------->>

--System was rewrote because the previous version sucked.
local pumpTable = {} --We'll move this later...
local pumps = {}
local OIL_LIMIT = 2000 --Oil limit before the pump can't exceed.
local INCREMENT_TICK = 2 --In seconds

--OnStart: Handle pumps and data when the script starts so it's ready for the player.
function onStart()
	for k,v in ipairs(pumpTable.coordinates) do
		pump = createMarker(v[1],v[2],v[3]-2,"cylinder",3.2,0,0,0,255)
		table.insert(pumps,{
			_pump=pump, 
			_data={coordinates={x=v[1],y=v[2],z=v[3]}, units=100}
		)
		Timer(syncPumps,500,1,pumps) --Sync the new pumps to the client (but delay it for slow clients)
	end
end
addEventHandler("onResourceStart",resourceRoot,onStart)

--OnStop: Handle clients to prevent any issues and remove anything from the server to preserve memory.
function onStop()
	syncPumps({},true) --Remove all pumps from the client so we can safely remove the pumps without client errors.
	
	for k,v in ipairs(pumps) do
		pump = v["_pump"]
		if (isElement(pump)) then destroyElement(pump) end
		pumps[k] = nil --remove from memory.
	end
end
addEventHandler("onResourceStop",resourceRoot,onStop)

--IncrementPumpValue: Handles pump units and increments them every few seconds (Check INCREMENT_TICK for the timer info)
function incrementPumpValue()
	for k,v in ipairs(pumps) do
		local _oil = v["_data"].units
		--Check if the oil units has been set first (to prevent warnings / errors)
		if (type(_oil) ~= "number") then
			v["_data"].units = 100
		end
		
		--Check if the oil has hit it's limit and increment the oil value.
		if (_oil >= OIL_LIMIT) then
			v["_data"].units = OIL_LIMIT
		else
			v["_data"].units = _oil + math.random(1,50)
		end
	end
	
	--Now sync to the client
	syncPumps(pumps)
	return true
end
Timer(incrementPumpValue,INCREMENT_TICK*1000,0)

--OnPumpMarkerHit: Handle pump marker hits and trigger the client to do the processing (easier and less usage on the server.)
function onPumpMarkerHit(hitElement,md)
	if not (hitElement) or not (isElement(hitElement)) or (getElementType(hitElement) ~= "player") then return false end
	
	--Figure out if the player is a refinery worker
	if (exports.GTIemployment:getPlayerJob(hitElement) == JOB_REFINERY) then
		--Now figure out which pump he hit
		if (pumps[source]) then
			local data = {}
			local pump = pumps[source]["_data"]
			data["pump"] = source
			data["units"] = pump["_data"].units
			--Maybe add something about occupants? idk...
			
			triggerClientEvent(hitElement,"GTIrefinery:playerCollectOil",hitElement,data)
			data = nil
			return true
		else
			outputChatBox("[REFINERY] You've found a problem! report this to Jack (Issue: #79)",hitElement,255,0,0)
			return false
		end
	end
	return false
end
addEventHandler("onMarkerHit",root,onPumpMarkerHit)

--ReserveUnitsInPump: A small little system to prevent the pump units going minus (do to sync units). This should fix that little issue from before ;)
function reserveUnitsInPump(data)
	if not (client) or not (isElement(client)) or (type(data) ~= "table") then return false end
	if (type(data) ~= "table") then return false end
	
	--Let's reserve the amount in the pump so that we don't have any sync issues (as we did before...)
	local pump = data["pump"]
	if (pumps[pump]) then
		--Get the core pump data
		local pump = pumps[pump]
		local reservedUnits = pump["_data"].reserved
		local pUnits = pump["_data"].units
		
		--Get the client data
		local units = data["units"]
		
		--Make sure we have the required amount, otherwise we'll deal with it.
		if (units >= pUnits) then
			pUnits = 0
		else
			pUnits = pUnits - units
		end
		
		--Add the reserved amount
		reservedUnits = reservedUnits + units
		--Sync to clients
		syncPumps(pumps)
	else
		error("Pump not found?")
	end
end
addEvent("GTIrefinery:reserveUnitsInPump",true)
addEventHandler("GTIrefinery:reserveUnitsInPump",root,reserveUnitsInPump)

function onPlayerPumpedOil(data)
	if not (client) or not (isElement(client)) or (type(data) ~= "table") then return false end
	if (type(data) ~= "table") then return false end
	
	local pump = data["pump"]
	if (pumps[pump]) then
		--Get the core pump data
		local pump = pumps[pump]
		local reserved = pump["_data"].reserved
		
		--Get the client data
		local units = data["units"]
		
		--Since we don't give a crap about reserved units (it's just to prevent sync issues), we'll just remove the amount
		reserved = reserved - units
		--Sync to clients
		sendSync("pumps",pumps)
		return true
	else
		error("Pump not found?")
	end
end
addEvent("GTIrefinery:onPlayerPumpedOil",true)
addEventHandler("GTIrefinery:onPlayerPumpedOil",root,onPlayerPumpedOil)

--SendSync: Sync handler for the client.
function sendSync(table)
	if not (table) or not (type(table) == "table") then error("[Refinery] No table to sync with") end
	
	players = {}
	for k,v in ipairs(getElementsByType("player")) do
		if (exports.GTIemployment:getPlayerJob(player) == JOB_REFINERY) then
			table.insert(players,v)
		end
	end
	
	triggerEvent("GTIrefinery:onServerPumpSync",players)
	triggerClientEvent(players,"GTIrefinery:syncPumpsToClient",resourceRoot,table)
	
	players = nil --empty the table to save memory.
	return true
end