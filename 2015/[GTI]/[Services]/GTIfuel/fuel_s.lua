----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: LilDolla
-- Date: 12 Sept 2014
-- Resource: GTIfuel/fuel_s.lua
-- Version: 1.0
----------------------------------------->>

local fR, fG, fB = 153, 153, 153 -- Fuel Station Color
local dBlipDistance = 45 -- Fuel Station View Distance

fuelStation = {
    data = {},
    marker = {},
    col = {},
    blips = {},
}

blipCheck = {}
totalGasStations = 0

function doesVehicleHasFuel( vehicle)
    local fuel = getElementData( vehicle, "fuel") or 24
    if fuel ~= 0 then
        return true
    else
        return false
    end
end

function setVehicleFuel( vehicle, fuel)
    setElementData( vehicle, "fuel", fuel)
    --exports.GTIvehicles:setVehicleData( vehicle, "fuel", fuel)
end

function getVehicleFuel( vehicle)
    local fuel = getElementData( vehicle, "fuel")
    return fuel
end

function setColData( theCol, theKey, theData)
    if not fuelStation.data[theCol] then
        fuelStation.data[theCol] = {}
    end
    if not fuelStation.data[theCol][theKey] then
        fuelStation.data[theCol][theKey] = true
    end
    fuelStation.data[theCol][theKey] = theData
    setElementData( theCol, theKey, theData)
end

function getColData( theCol, theKey)
    if fuelStation.data[theCol] then
        if fuelStation.data[theCol][theKey] then
            return fuelStation.data[theCol][theKey]
        else
            return false
        end
    else
        return false
    end
end

function checkPumps()
    for i, pump in ipairs ( getElementsByType( "colshape", resourceRoot)) do
        local busy = getColData( pump, "stationStatus")
        local theMarker = getColData( pump, "colMarker")
        local r, g, b = getMarkerColor( theMarker)
        if busy then
            if not r == 153 and g == 0 and b == 0 then
                setMarkerColor( theMarker, 153, 0, 0)
            end
        else
            if not r == fR and g == fG and b == fB then
                setMarkerColor( theMarker, fR, fG, fB)
            end
        end
    end
end
setTimer( checkPumps, 1000, 0)

addEventHandler( "onResourceStart", resourceRoot,
    function()
        --->> Setting Up Stations
        for i, data in ipairs (stations) do
            local x, y, z = data[1], data[2], data[3]
            --[[
            local zoneName = getZoneName( x, y, z)
            if stationNames[zoneName] then
                zoneName = stationNames[zoneName]
            end
            --]]

            if data[4] then
                if data[4] == "A" then
                    fuelStation.marker[i] = createMarker( x, y, z, "cylinder", 8, fR, fG, fB, 30)
                    fuelStation.col[i] = createColTube( x, y, z, 4, 8)
                    setColData( fuelStation.col[i], "airplanesOnly", true)
                else
                    fuelStation.marker[i] = createMarker( x, y, z, "cylinder", 4, fR, fG, fB, 30)
                    fuelStation.col[i] = createColTube( x, y, z, 2, 4)
                    setColData( fuelStation.col[i], "airplanesOnly", false)
                end
            else
                fuelStation.marker[i] = createMarker( x, y, z, "cylinder", 4, fR, fG, fB, 30)
                fuelStation.col[i] = createColTube( x, y, z, 2, 4)
                setColData( fuelStation.col[i], "airplanesOnly", false)
            end
            if data[5] then
                if data[5] == "D" then
                    setElementData(fuelStation.col[i], "GTIfuel.twoblip", "yes")
                end
            else
                setElementData(fuelStation.col[i], "GTIfuel.twoblip", "no")
            end
            -- Data Records
            setColData( fuelStation.col[i], "theID", i)
            setColData( fuelStation.col[i], "stationStatus", true)
            setColData( fuelStation.col[i], "colMarker", fuelStation.marker[1])
            setColData( fuelStation.col[i], "markerPos", x..","..y..","..z)
            --[[
            if not blipCheck[zoneName] then
                blipCheck[zoneName] = true
                fuelStation.blips[i] = createBlipAttachedTo( fuelStation.marker[i], 0, 1.5, fR, fG, fB, 255, 0, dBlipDistance)
                totalGasStations = totalGasStations+1
            end
            --]]
            addEventHandler( "onColShapeHit", fuelStation.col[i], GasStationEntry)
            addEventHandler( "onColShapeLeave", fuelStation.col[i], GasStationLeave)
        end
        --->> Setting Up No Fuel Needed Vehicles
        for i, vehicle in ipairs ( getElementsByType( "vehicle")) do
			setElementData( vehicle, "GTIfuel.oldDist", 0)
			setElementData( vehicle, "GTIfuel.oldX", 0)
			setElementData( vehicle, "GTIfuel.oldY", 0)
            local vehicleType = getVehicleType( vehicle)
            if noFuelVehicles[vehicleType] then
                setVehicleFuel( vehicle, 100)
            end
        end
        --->> Setting up Fuel
        setTimer( checkFuel, 1000, 0)
        setTimer( updateFuel, 5000, 0)
    end
)

function GasStationEntry( hitElement, matchingDimension)
    if getElementType( hitElement) == "vehicle" then return false end
    if not matchingDimension then
        return false
    end
    if not isPedInVehicle( hitElement) then
        exports.GTIhud:drawNote( "pumpNotification", "Must be in a vehicle to use fuel pumps", hitElement, 144, 60, 81, 5000)
        return false
    end
    local vehicle = getPedOccupiedVehicle( hitElement)
    if noFuelVehicles[getVehicleType( vehicle)] then
        return false
    end
    local id = getColData( source, "theID")
    local status = getColData( source, "stationStatus")
    local lockType = getColData( source, "airplanesOnly")
    local vehType = getVehicleType( vehicle)
    if lockType then
        if lockType == "A" then
            if vehType ~= "Plane" or vehType ~= "Helicopter" then
                exports.GTIhud:drawNote( "pumpNotification", "Only aircrafts can use this fuel pump", hitElement, 144, 60, 81, 5000)
                return false
            end
        end
    end
    if status then
        setColData( source, "stationStatus", false)
        setColData( source, "currentOccupant", hitElement)
        triggerClientEvent( hitElement, "GTIfuel.onFuelStationEnter", hitElement, vehicle)
    else
        local occupants = getVehicleOccupants(vehicle) or {}
        for seat, occupant in ipairs ( occupants) do
            if occupant then
                if occupant == hitElement then
                    exports.GTIhud:drawNote( "pumpNotification", "Driver is filling up fuel tank.", occupant, 144, 60, 81, 5000)
                end
            else
                exports.GTIhud:drawNote( "pumpNotification", "Pump in currently in use", hitElement, 144, 60, 81, 5000)
            end
        end
    end
    --exports.GTIhud:drawNote( "pumpNotification", "You are already using a pump.", hitElement, 144, 60, 81, 5000)
end

function GasStationLeave( leaveElement, matchingDimension)
    if not matchingDimension then
        return false
    end
    if getColData(source, "currentOccupant") == leaveElement then
        triggerClientEvent( leaveElement, "GTIfuel.onFuelStationLeave", leaveElement)
        local status = getColData( source, "stationStatus")
        if not status then
            setColData( source, "stationStatus", true)
            setColData( source, "currentOccupant", nil)
        end
    end
end

function payForFuel( oldFuelAmount, fuelAmount, fuelCost)
    if isPedInVehicle( client) then
        local playerMoney = getPlayerMoney( client)
        if playerMoney >= fuelCost then
            exports.GTIhud:drawNote( "pumpNotification", "Paid $"..fuelCost.." for filling "..fuelAmount.."% of "..oldFuelAmount.."% ("..fuelAmount+oldFuelAmount.."%) Fuel", client, 81, 142, 60, 5000)
            exports.GTIbank:TPM( client, fuelCost, "GTIfuel: Paid $"..fuelCost.." for filling tank up to "..(fuelAmount+oldFuelAmount).."%")
            local vehicle = getPedOccupiedVehicle( client)
            setVehicleFuel( vehicle, fuelAmount+oldFuelAmount)
        else
            exports.GTIhud:drawNote( "pumpNotification", "Not enough money for refill", client, 144, 60, 81, 5000)
        end
    else
        exports.GTIhud:drawNote( "pumpNotification", "Must drive vehicle out of marker to refill", client, 144, 60, 81, 5000)
    end
end
addEvent( "GTIfuel.payFuelFee", true)
addEventHandler( "GTIfuel.payFuelFee", root, payForFuel)


function disableVehicle( theVehicle, thePlayer)
    setVehicleEngineState( theVehicle, false)
    if isElement(thePlayer) and getElementType( thePlayer) == "player" then
        exports.GTIhud:dm( "This vehicle has no fuel, a mechanic needs to refuel it.", thePlayer, 144, 60, 81)
    end
end

decreaseTimer = {}

function checkFuel()
    for i, theVehicle in ipairs ( getElementsByType( "vehicle")) do
        local fuel = getElementData( theVehicle, "fuel") or -1
        if fuel == -1 then
            setVehicleFuel( theVehicle, 24)
        end
        if fuel == 0 then
            if getVehicleEngineState( theVehicle) then
                if getVehicleController( theVehicle) then
                    disableVehicle( theVehicle, getVehicleController( theVehicle))
                end
            end
        end
    end
end

function updateFuel()
    for i, theVehicle in ipairs ( getElementsByType( "vehicle")) do
        --local controller = getVehicleController( theVehicle)
		local controller = getVehicleOccupant( theVehicle, 0)
		if controller then
			local newFuel = tonumber( getElementData( theVehicle, "fuel"))

			local lastDistance = getElementData( theVehicle, "GTIfuel.oldDist") or 0
			local oldX, oldY = getElementData( theVehicle, "GTIfuel.oldX") or 0, getElementData( theVehicle, "GTIfuel.oldY") or 0
			local x, y, _ = getElementPosition( theVehicle)

			local distance = getDistanceBetweenPoints2D( oldX, oldY, x, y)
			local distance = math.ceil(distance)-1
			local distance = (distance/400)

			if getVehicleEngineState( theVehicle) then
				local speed = exports.GTIutil:getElementSpeed( theVehicle, "mph")
				if speed > 5 then
					--
					setElementData( theVehicle, "GTIfuel.oldDist", lastDistance+distance)
					setElementData( theVehicle, "GTIfuel.oldX", x)
					setElementData( theVehicle, "GTIfuel.oldX", y)
					--
					local vehType = getVehicleType( theVehicle)
					if not noFuelVehicles[vehType] then
						if doesVehicleHasFuel( theVehicle) then
							if lastDistance >= 30 then
								setElementData( theVehicle, "GTIfuel.oldDist", 0)
								local newFuel = newFuel-1
								setVehicleFuel( theVehicle, newFuel)
							end
						else
							disableVehicle( theVehicle)
						end
					end
				end
			end

			if newFuel <= 10 and newFuel ~= 0 then
				if getVehicleController( theVehicle) then
					exports.GTIhud:drawStat( "GTIfuel.notif", "Remaining Fuel: ", newFuel.."%", getVehicleController( theVehicle), 255, 0, 125, 5000)
				end
			end
		end
    end
end

addEventHandler( "onVehicleEnter", root,
    function( player)
        if not noFuelVehicles[getVehicleType(source)] then
            if not tonumber(getElementData( source, "fuel")) then
                setVehicleFuel( source, "fuel", 24)
            end
            if not doesVehicleHasFuel( source) then
                disableVehicle( source, player)
            end
        end
    end
)


function loginCheck()
    triggerClientEvent("GTIfuel.addBlips", source)
end
addEventHandler("onPlayerLogin", root, loginCheck)


--[[
addEventHandler( "onVehicleExit", root,
    function( player)
        if isTimer( decreaseTimer[player]) then
            killTimer( decreaseTimer[player])
        end
    end
)

addEventHandler( "onPlayerQuit", root,
    function()
        if isTimer( decreaseTimer[source]) then
            killTimer( decreaseTimer[source])
        end
    end
)
--]]
