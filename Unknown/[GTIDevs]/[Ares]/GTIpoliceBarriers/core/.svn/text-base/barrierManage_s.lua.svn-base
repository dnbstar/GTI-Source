------------------------------------------------------------------------------------
--  PROJECT:     Grand Theft International
--  RIGHTS:      All rights reserved by developers
--  FILE:        GTIpoliceBarriers/core/barrierManage_s.lua
--  PURPOSE:     Police Barriers, server part.
--  DEVELOPERS:  Tomas Caram (Ares)
------------------------------------------------------------------------------------
Barriers_IDs = {1228,1459,1423,1427}
Barriers_Mod = {[1228]=1,[1459]=2,[1423]=3,[1427]=4}

function onCommand (player,_,id)
	if exports.GTIemployment:getPlayerJobDivision(player) == "Highway Patrol" and exports.GTIemployment:getPlayerJob(player,true) == "Police Officer" or exports.GTIutil:isPlayerInTeam(player, "Government") then
		if id and tonumber(id) ~= nil and tonumber(id) >= 0 and tonumber(id) <= 4 then
			if not isPedOnGround(player) then
				exports.GTIhud:dm("You can't place barriers while flying.",player,255,0,0)
			return end
			if isPedInVehicle(player) then
				exports.GTIhud:dm("You can't place barriers while in a vehicle.",player,255,0,0)
			return end
			if getElementInterior(player) ~= 0 then
				exports.GTIhud:dm("You can't place barriers in a interior.",player,255,0,0)
			return end
			if getElementDimension(player) ~= 0 then
				exports.GTIhud:dm("You can't place barriers in another dimension.",player,255,0,0)
			return end
			if exports.GTIcnr:isPlayerInCnRArea( player) then
				exports.GTIhud:dm("You can't place barriers while in the CnR Area.", player, 255, 0, 0)
				return
			end
		if exports.GTIutil:isPlayerInTeam(player,"Government") or exports.GTIemployment:getPlayerJobLevel(player, "Police Officer") >= 8 then
			if getElementData(player,"GTIpoliceBarriers.barriers") >= 8  then
				exports.GTIhud:dm("You only can put 8 barriers.",player,255,0,0)
			return end
		else
			if getElementData(player,"GTIpoliceBarriers.barriers") >= 5  then
				exports.GTIhud:dm("You only can put 5 barriers.",player,255,0,0)
			return end
		end
			barrierSpawn(player,tonumber(id))
		else
			exports.GTIhud:dm("Syntax: /barrier <1-4>",player,255,0,0)
		end
	else
		exports.GTIhud:dm("Only Highway Patrols and Government Members can place barriers.",player,255,0,0)
	end
end
addCommandHandler("barrier",onCommand)

function barrierSpawn(player,id)
local x,y,z = getElementPosition(player)
local rx,ry,rz = getElementRotation(player)
local model = Barriers_IDs[id]
	if model == 1228 then z = z-0.5 elseif model == 1459 then z = z-0.5 elseif model == 1423 then z = z-0.3 elseif model == 1427 then z = z-0.3 end
		local barrier = createObject(model,x,y,z)
		local actbarriers = getElementData(player,"GTIpoliceBarriers.barriers") or 0
		setElementData(player,"GTIpoliceBarriers.barriers", actbarriers+1)
		setElementFrozen(barrier,true)
			if model == 1228 then
				setElementRotation(barrier,rx,ry,rz+90,"default",true)
			else
				setElementRotation(barrier,rx,ry,rz,"default",true)
			end
		--triggerClientEvent("GTIpoliceBarriers.setObjectBreakable",resourceRoot,barrier)
		setElementData(barrier,"GTIpoliceBarriers.isABarrier",true)
		setElementData(barrier,"GTIpoliceBarriers.owner",player)
		setElementPosition(player,x,y,z+2)
				if getElementData(player,"GTIpoliceBarriers.barriers") == 1 then
					exports.GTIhud:dm("To remove your barrier press X then click on it.",player,0,255,0)
				end
end
addEvent("GTIpoliceBarriers.spawnBarrier",true)
addEventHandler("GTIpoliceBarriers.spawnBarrier",resourceRoot,barrierSpawn)

function onPlayerQuit()
	for index,value in ipairs (getElementsByType("object")) do
		if getElementModel(value) == 1228 or getElementModel(value) == 1459 or getElementModel(value) == 1423 or getElementModel(value) == 1427 then
			if getElementData(value,"GTIpoliceBarriers.owner") == source then
			destroyElement(value)
			end
		end
	end
end
addEventHandler("onPlayerQuit",root,onPlayerQuit)

function onResignJob(jobName)
bool = false
	for index,value in ipairs (getElementsByType("object")) do
		if getElementModel(value) == 1228 or getElementModel(value) == 1459 or getElementModel(value) == 1423 or getElementModel(value) == 1427 then
			if getElementData(value,"GTIpoliceBarriers.owner") == source then
			destroyElement(value)
			bool = true
			end
		end
	end
	if bool then
		exports.GTIhud:dm("Your barriers were removed.",source,255,0,0)
	end
	setElementData(source,"GTIpoliceBarriers.barriers",0)
end
addEventHandler("onPlayerQuitJob",root,onResignJob)

function destroyBarrier(barrier)
	if isElement(barrier) then
		local owner = getElementData(barrier,"GTIpoliceBarriers.owner")
		exports.GTIhud:dm("You succesfully destroyed the barrier. (ID: "..Barriers_Mod[getElementModel(barrier)].." Owner: "..getPlayerName(owner)..")",client,0,255,0)
		if client ~= owner then
		exports.GTIhud:dm("Your barrier was succesfully destroyed by : "..getPlayerName(client).." (ID: "..Barriers_Mod[getElementModel(barrier)]..")",owner,0,0,255)
		end
		destroyElement(barrier)
		setElementData(owner,"GTIpoliceBarriers.barriers",getElementData(owner,"GTIpoliceBarriers.barriers")-1)
	end
end
addEvent("GTIpoliceBarriers.destroyElement",true)
addEventHandler("GTIpoliceBarriers.destroyElement",resourceRoot, destroyBarrier)

function removeAllBarriers(player)
	if getElementData(player,"GTIpoliceBarriers.barriers") >= 1 then
		for index,value in ipairs (getElementsByType("object")) do
			if getElementModel(value) == 1228 or getElementModel(value) == 1459 or getElementModel(value) == 1423 or getElementModel(value) == 1427 then
				if getElementData(value,"GTIpoliceBarriers.owner") == player then
					destroyElement(value)
					setElementData(player,"GTIpoliceBarriers.barriers",0)
				end
			end
		end
	exports.GTIhud:dm("Your barriers were succesfully removed",player,0,255,0)
	end
end
addCommandHandler("removebarriers",removeAllBarriers)

function onPlayerLoginPutData()
setElementData(source,"GTIpoliceBarriers.barriers",0)
end
addEventHandler("onPlayerLogin",root,onPlayerLoginPutData)

function onResourceStartPutData()
	for index,key in ipairs (getElementsByType("player")) do
		setElementData(key,"GTIpoliceBarriers.barriers",0)
	end
end
addEventHandler("onResourceStart",resourceRoot,onResourceStartPutData)
