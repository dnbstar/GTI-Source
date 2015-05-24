local loc = {
	{1976.107, -1456.336, 12.054},
}
local peds = {}
local drivers = {}
function warp(bo,ped,veh)
	if bo then
		warpPedIntoVehicle(ped,veh,1)
		setVehicleTaxiLightOn(veh,true)
	else
		removePedFromVehicle(ped)
		setVehicleTaxiLightOn(veh,false)
	end
end
addEvent("GTItaxi.warpVehicle", true)
addEventHandler("GTItaxi.warpVehicle", root, warp)

function createNewPed()
	local x1, y1, z1 = unpack( loc [math.random (#loc)] )
	local marker = createMarker ( x1, y1, z1, "cylinder", 6, 255, 255, 50, 170 )
	setElementVisibleTo(marker,root,false)
	local ids = getValidPedModels()
	local ped = createPed(ids[math.random(#ids)],x1,y1,z1)
	setElementVisibleTo(ped,root,false)
	local blip = createBlipAttachedTo(ped, 41)
	setElementVisibleTo(blip,root,false)
	peds[marker] = {marker,ped,blip}
	showPed(marker)
	addEventHandler("onMarkerHit",marker,pickUp)
	local loc = getZoneName(x1,y1,z1,false)
	local city = getZoneName(x1,y1,z1,true)
	sendMsg("Someone needs a lift in "..loc..", "..city)
end
setTimer(createNewPed,500,1)
function sendMsg(message)
    for k, player in ipairs(getElementsByType("player")) do
        if (exports.GTIemployment:getPlayerJob(player) == "Taxi Driver") then
            exports.GTIhud:dm(message, player, getPlayerNametagColor( player ) )
        end
    end
end

function showPed(marker)
    for k, player in ipairs(getElementsByType("player")) do
        if marker then--(exports.GTIemployment:getPlayerJob(player,true) == "Taxi Driver") then
            setElementVisibleTo( peds[marker][1], player, true )
            setElementVisibleTo( peds[marker][2], player, true )
            setElementVisibleTo( peds[marker][3], player, true )
			triggerClientEvent(player,"GTItaxi.canceldmg",resourceRoot,peds[marker][2])
        end
    end
end

function pickUp(thePlayer)
	if peds[source] and getElementType(thePlayer) == "player" and isPedInVehicle(thePlayer) and getVehicleController(getPedOccupiedVehicle(thePlayer)) == thePlayer then
		local theVeh = getPedOccupiedVehicle(thePlayer)
		if getElementModel(theVeh) ~= 420 then return end
		
		local ped = peds[source][2]
		drivers[thePlayer] = ped
		triggerClientEvent(thePlayer,"GTItaxi.getPed",resourceRoot,ped)
		destroyElement(peds[source][1])
		destroyElement(peds[source][3])
		peds[source] = nil
	end
end

function pay()
	if isElement(drivers[client]) then 
		destroyElement(drivers[client]) 
		drivers[client] = nil
		--pay
	end
end
addEvent("GTItaxi.pay", true)
addEventHandler("GTItaxi.pay", root, pay)

function destroyPed()
	if isElement(drivers[client]) then 
		destroyElement(drivers[client]) 
		drivers[client] = nil
	end
end
addEvent("GTItaxi.destroyPed", true)
addEventHandler("GTItaxi.destroyPed", root, destroyPed)

function delelem(thePlayer)
	local plr = thePlayer or source
	if (exports.GTIemployment:getPlayerJob(plr,true) == "Taxi Driver") then
		if isElement(drivers[plr]) then 
			destroyElement(drivers[plr])
			drivers[plr] = nil
		end
	end
end
addEvent("onRentalVehicleHide", true)
addEventHandler ("onRentalVehicleHide", root, delelem)
addEventHandler ("onPlayerWasted", root, delelem)
function onQuitJob(job)
	local plr = source
	if (job == "Taxi Driver") then
		if isElement(drivers[plr]) then 
			destroyElement(drivers[plr])
			drivers[plr] = nil
		end
	end
end
addEventHandler ("onPlayerQuitJob", root, onQuitJob)
function onGetJob(job)
	if (job == "Taxi Driver") then
		for k, ped in ipairs(peds) do
            setElementVisibleTo( ped[1], source, true )
            setElementVisibleTo( ped[2], source, true )
            setElementVisibleTo( ped[3], source, true )
			triggerClientEvent(source,"GTItaxi.canceldmg",resourceRoot,ped[2])
        end
	end
end
addEventHandler ("onPlayerGetJob", root, onGetJob)