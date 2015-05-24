--[[
    Grand Theft International
    Author: MagicMayhem
--]]

local tolls = {}

function spawnMarkersObjectsCols(res)
    for i=1, #markers do -- Run a loop on all of the markers
        marker[i] = createMarker(markers[i][1], markers[i][2], markers[i][3], "cylinder", markers[i][4], 255, 255, 255, 0)
        markers[marker[i]] = markers[i][7] -- Store the barrier object id here
        
        addEventHandler("onMarkerHit", marker[i], TollMarkerTouched)
        addEventHandler("onMarkerLeave",marker[i],tollMarkerLeave)
    end
    
    for i=1, #objects do -- Run a loop to spawn all of tehh objects :)
        object[i] = createObject(objects[i][1], objects[i][2], objects[i][3], objects[i][4], objects[i][5], objects[i][6], objects[i][7])
        
        moving[i] = false
    end
    
    for i=1, #colshapes do -- Run a loop to spawn collision shapes
    --colshape[i] = createColRectangle(colshapes[i][1], colshapes[i][2], colshapes[i][3], colshapes[i][4])
        colshape[i] = createColTube(colshapes[i][1], colshapes[i][2], colshapes[i][3], colshapes[i][4], colshapes[i][5])
        addEventHandler("onColShapeHit", colshape[i], TollWarning)
    end
end
addEventHandler("onResourceStart", resourceRoot, spawnMarkersObjectsCols)

function TollWarning(hitEle)
    if (getElementType(hitEle) == "vehicle") and getVehicleOccupant(hitEle,0) then
        local driver = getVehicleOccupant(hitEle,0)
        if (getVehicleSirensOn ( hitEle)) then
            OpenBarrier(driver, colshape[source], true)
        end    
        
        if (warnings[driver] == false or warnings[driver] == nil) then
            exports.GTIhud:dm("REMEMBER: Stay below 35mph when approaching a toll, you can break the barrier if you do not wish to pay.", driver, 255, 255, 255)
            
            warnings[driver] = true
            setTimer(function(driver) warnings[driver] = false end, 300000, 1, driver)
        end
    end
end

function TollNotPaid(driver)
        if (driver == client) and not tolls[driver] then
            exports.GTIpoliceWanted:chargePlayer(driver, 21)
            exports.GTIhud:dm("You didn't pay the toll!", driver, 255, 255, 255)
            tolls[driver] = true
            setTimer(function(driver) tolls[driver] = false end, 40000, 1, driver)
        end
end
addEvent("GTItollgate.barrierbroken", true)
addEventHandler("GTItollgate.barrierbroken", root, TollNotPaid)

function TollMarkerTouched(hitEle)
    if (getElementType(hitEle) == "vehicle") then
        local driver = getVehicleOccupant(hitEle)
        local speed = exports.GTIutil:getElementSpeed(driver, "mph")
        
        if not tolls[driver] then
       		if (driver) then  
           		if (speed <= 35) then
             		if (not moving[markers[source]]) then
               		    Tolled(driver, hitEle, markers[source])
          		    end
          		end
       		end
    	end
    end
end

function tollMarkerLeave(hitEl)
  --[[ if not (hitElement) or not (getElementType(hitEl) == "player") then return false end
    
    if (tolls[hitEl]) then
        tolls[hitEl] = nil
    end
  --]]
end

function Tolled(player, car, objectid)
	if tolls[player] then
		OpenBarrier(player,objectid,true)
		return
	end
    setElementFrozen(car, true)
    triggerClientEvent(player, "GTItollgate.tollgatespeak", resourceRoot, "Please wait, your vehicle is being verified...", true)
    setTimer(function() 
		if not isElement(car) then return end
        if (freecars[getElementModel(car)]) then

        else
        	if (exports.GTIpoliceWanted:isPlayerWanted(player)) then
           		exports.GTIhud:dm("The toll worker won't let you through, ram the barrier down or lose your wanted level!", player, 255, 255, 255)
           	else
           	  	exports.GTIbank:TPM(player, 50, "Toll fine paid") 
            end 
        end

        if (exports.GTIpoliceWanted:isPlayerWanted(player)) then
       		triggerClientEvent(player, "GTItollgate.tollgatespeak", player, "You're wanted by the police. Get out of here now before I call the cops!", true)
       	else
       		triggerClientEvent(player, "GTItollgate.tollgatespeak", player, "Ok everything looks clear, proceed.", true)
       		OpenBarrier(player, objectid, true)
   		end
 
        setElementFrozen(car, false)
        setTimer(function() triggerClientEvent(player, "GTItollgate.tollgatespeak", player, "", false)  end, 5000, 1)
    end, 3000, 1)
end

function OpenBarrier(player, objectid, state)
    if (moving[objectid] == false) then
        moving[objectid] = true
        open(objectid, state)
    end
end

function open(objectid)
        moveObject(object[objectid], 1500, objects[objectid][2], objects[objectid][3], objects[objectid][4], objects[objectid][8], 0, 0)

        
        setTimer(function(objectid) 
            moveObject(object[objectid], 1500, objects[objectid][2], objects[objectid][3], objects[objectid][4], objects[objectid][9], 0, 0)
            setTimer(function(objectid) moving[objectid] = false end, 1500, 1, objectid)
        end, 6000, 1, objectid) -- wait 4 seconds, close the barrier
end