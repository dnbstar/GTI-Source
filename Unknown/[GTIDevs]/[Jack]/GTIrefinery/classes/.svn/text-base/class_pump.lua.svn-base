----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Jack Johnson (Jack)
-- Date: 8 October 2014
-- Resource: GTIrefinery/classes/server/barrel_class.lua
-- Version: 1.0
----------------------------------------->>

Pump = {} --Class table (DON'T TOUCH!)
Pump.__index = Pump --Some other crap that's needed.

--Pump:Create: Creates a pump and configures the values and sync.
--RETURN: TABLE if pump was successfully created, FALSE otherwise.
function Pump:create(x,y,z,data)
	if not (x) or not (y) or not (z) then return false end
	
	--Create the pump and set the required data 
	local pump = {}
	pump.marker = createMarker(x,y,z,"cylinder",3,255,0,0) --We'll alter this later.
	pump.data = data or {oil=100,max=2000,totalPumped=0} --We'll send this to the client for sync reasons
	
	setmetatable(pump,Pump) --Add it to our instance
	
	--If it's clientside, we'll also setup the HUD
	if (client) or (localPlayer) then --Clientsided
		pump.hud = pump:createHud() --Pull the details from the function itself.
	else --Serversided
		pump.sync = setTimer(function(pump) if (pump) then pump:sync() end end,5000,0,pump)
	end
	
	--set elementdata on the marker for later findings
	pump.marker:setData("pump",self)

	return pump
end

--Pump:Destroy: Destroys the pump safely and clears the memory
--RETURN: TRUE if the pump was successfully destroyed, FALSE otherwise.
function Pump:destroy()
	if not (localPlayer) then
		--Clientside
		if not (self) then return false end --Might need to tweak this later
	else
		if not (self) or not (isElement(self.marker)) then return false end
		self.marker:destroy()
	end
	
	self = nil --Clear memory
	return true
end

--Pump:GetPumpInfo: Get pump information such as oil, total pumped and so on.
--RETURN: ELEMENT/TIMER/NUMBER if successfully collected, FALSE otherwise.
function Pump:getPumpInfo(item)
	if not (item) or not (type(item) == "string") then return false end
	
	--Determine if we're server or client--
	if (localPlayer) then
		if not (self) then return false end
	else
		if not (self) or not (isElement(self.marker)) then return false end
	end
	
	item = string.lower(item)
	
	if (item == "marker" and not localPlayer) then return self.marker or false else return false
		elseif (item == "oil") then return self.oil or false
		elseif (item == "max") then return self.max or false
		elseif (item == "pumped") then return self.pumped or false
		elseif (item == "sync" and not localpLayer) then return self.marker or false else return false
	end
	
	return
end
	

--Pump:SetPumpInfo: Set pump information such as oil, total pumped and so on.
--RETURN: TRUE if successfully updated, FALSE otherwise.
function Pump:setPumpInfo(item,...)
	if not (item) or not (type(item) == "string") then return false end
	
	--Determine if we're client or server
	if (localPlayer) then
		if not (self) then return false end
	else
		if not (self) or not (isElement(self.marker)) then return false end
	end
	
	item = string.lower(item)
	args = {...}
	
	if (item == "oil") and (args[1] ~= nil) then self.oil = tonumber(args[1]) return true
		elseif (item == "max") and (args[1] ~= nil) then self.max = tonumber(args[1]) return true
		elseif (item == "sync") then
			if (localPlayer) then return false end --We don't sync clientside..
			if not (type(args[1] == "boolean") then return false end --args are wrong
			if not (args[2]) then return false end
			if (args[1]) then
				if (isTimer(self.sync)) then return true end
				self.sync = setTimer(function(pump) if pump then pump:sync() end end, 5000, 0, args[2])
				return true
			else
				if not (isTimer(self.sync)) then return true end
				killTimer(self.sync)
				return true
			end
		end
		return false
	end
	return false --invalid item
end

function getMetaData()
	return outputConsole(tostring(Pump))
end
addCommandHandler("output",getMetaData)

--Pump:Sync: Syncs data to the client (mainly for the hud and such.
--RETURN: TRUE if data is synced, false otherwise.
function Pump:sync()
	return true
end