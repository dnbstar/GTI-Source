----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Jack Johnson (Jack)
-- Date: 6 October 2014
-- Resource: GTIrefinery/server_core.lua
-- Version: 1.1
----------------------------------------->>

local ALLOWED_PUMP_AMOUNT = 50
local timers = {} --All oil pump timers head into this

--playerCollectOil: Force the player to collect oil from a specific pump
function playerCollectOil(data)
	if not (data) or not (type(data) == "table") then return false end
	
	--First, define everything in the data
	local units = data["units"]
	local pump = data["pump"]
	local data = nil --clear this since we don't need it now.
	
	--Calculate how much we're taking from the pump
	local reserved = math.random(ALLOWED_PUMP_AMOUNT)
	
	--Check if we have enough oil
	if not (units >= ALLOWED_PUMP_AMOUNT) then
		error("This pump doesn't have enough oil.")
	else
		--We'll update the amount
		units = units - reserved
	end
	
	--repack the data
	local data = {pump=pump,units=units} --create a new one
	
	--More checks before we begin process
	if (timers[pump] == nil) then
		timers[pump] = {}
	end
	
	if (#timers >= 2) then
		error("You can only fill 2 barrels at a time!")
		return
	end
	
	if (#barrels["oil"] >= 5) then
		error("You can only carry 5 barrels at a time! refine these to collect more!")
		return
	end
	
	--Reserve the units on the server
	reservedData = {pump=pump,units=reserved}
	triggerServerEvent("GTIrefinery:reserveUnitsInPump",localPlayer,reservedData)
	
	--Sort data out for barrels
	local x,y,z = getElementPosition(pump)
	barrelData = {coordinates={x=x,y=y,z=z}}
	triggerServerEvent("GTIrefinery:createBarrel",localPlayer,barrelData)
	
	--Now we begin the process
	setElementFrozen(localPlayer,true)
	setPedAnimation(localPlayer,"BOMBER","BOM_Plant",-1,false,false,false)
	Timer(setElementFrozen,3000,1,localPlayer,false)
	triggerServerEvent("GTIrefinery:createNewPumpInstance",localPlayer) --Create a new pump instance on the server (to prevent speed cheats)
end
addEvent("GTIrefinery:playerCollectOil",true)
addEventHandler("GTIrefinery:playerCollectOil",root,onPlayerCollectOil)