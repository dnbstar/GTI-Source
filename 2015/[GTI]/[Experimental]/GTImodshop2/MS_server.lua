setGarageOpen(10, true)
setGarageOpen(15, true)
setGarageOpen(18, true)
setGarageOpen(33, true)
setGarageOpen(00, true)

addEvent("onVehicleMod")
modShops = {}
local TIME_IN_MODSHOP = 10 -- 10 minutes
local moddedVehicles = {}
local timers = {}
local timersClient = {}
local vehLocked = {}
emergencyVehicles = {[455]=true, [443]=true, [500]=true, [583]=true, [408]=true, [416]=true, [433]=true, [427]=true, [490]=true, [528]=true, [407]=true, [544]=true, [523] = true, [598] = true, [596] = true, [597] = true, [599] = true, [432] = true, [601] = true, [428]=true }
emergencyVehicles = {}

modShops[1] = {}
modShops[1].veh = false
modShops[1].marker = createMarker( -2723.7060, 217.2689, 2.6133, "cylinder", 3, 255, 0, 0, 100 )
modShops[1].name = "Wheel Arch Angles"
--createBlipAttachedTo( modShops[ 1 ].marker, 27, 2, 0,0,0,255, 0, 180 )

modShops[2] = {}
modShops[2].veh = false
modShops[2].marker = createMarker( 1990.6890, 2056.8046, 9.3844, "cylinder", 3, 255, 0, 0, 100 )
modShops[2].name = "LV TransFender"
--createBlipAttachedTo( modShops[ 2 ].marker, 27, 2, 0,0,0,255, 0, 180 )
createObject(11326, 1994.276, 2041.688, 12.063, 0, 0, 90)

modShops[3] = {}
modShops[3].veh = false
modShops[3].marker = createMarker(1041.39, -1018.62, 31.5, "cylinder", 3, 255, 0, 0, 100 )
modShops[3].name = "LS TransFender"
--createBlipAttachedTo( modShops[ 3 ].marker, 27, 2, 0,0,0,255, 0, 180 )

modShops[4] = {}
modShops[4].veh = false
modShops[4].marker = createMarker(-1936.24, 245.46, 33.4, "cylinder", 3, 255, 0, 0, 100)
modShops[4].name = "SF TransFender"
--createBlipAttachedTo(modShops[4].marker, 27, 2, 0,0,0,255, 0, 180)

modShops[5] = {}
modShops[5].veh = false
modShops[5].marker = createMarker(2412.27, -2471.46, 12.5, "cylinder", 3, 255, 0, 0, 100)
modShops[5].name = "LS Docks"
--createBlipAttachedTo(modShops[5].marker, 27, 2, 0,0,0,255, 0, 180)

modShops[6] = {}
modShops[6].veh = false
modShops[6].marker = createMarker(-1561.03, 1247.93, 0.53, "cylinder", 6, 255, 0, 0, 100)
modShops[6].name = "Boat Mods #1"
--createBlipAttachedTo(modShops[6].marker, 27, 2, 0,0,0,255, 0, 180)

modShops[7] = {}
modShops[7].veh = false
modShops[7].marker = createMarker(1409.777, 1811.573, 9.82, "cylinder", 6, 255, 0, 0, 100)
modShops[7].name = "LV Airport Plane Mods"
--createBlipAttachedTo(modShops[7].marker, 27, 2, 0,0,0,255, 0, 180)

modShops[8] = {}
modShops[8].veh = false
modShops[8].marker = createMarker(1643.7539, -1516.0722, 12.56, "cylinder", 6, 255, 0, 0, 100)
modShops[8].name = "LS Central Mods"
--createBlipAttachedTo(modShops[8].marker, 27, 2, 0,0,0,255, 0, 180)

modShops[9] = {}
modShops[9].veh = false
modShops[9].marker = createMarker(1040.816, -1053.554, 30.703, "cylinder", 3, 255, 0, 0, 100 )
modShops[9].name = "LS TransFender Relief"

modShops[10] = {}
modShops[10].veh = false
modShops[10].marker = createMarker(1028.298, -1052.88, 30.651, "cylinder", 3, 255, 0, 0, 100 )
modShops[10].name = "LS TransFender Relief 2"

modShops[11] = {}
modShops[11].veh = false
modShops[11].marker = createMarker(1431.993, -2439.917, 12.555, "cylinder", 6, 255, 0, 0, 100)
modShops[11].name = "LS Airport Plane Mods"


modShops[12] = {}
modShops[12].veh = false
modShops[12].marker = createMarker(-1598.853, -631.776, 13.148, "cylinder", 6, 255, 0, 0, 100)
modShops[12].name = "SF Airport Plane Mods"

modShops[13] = {}
modShops[13].veh = false
modShops[13].marker = createMarker(-3723.989, -440.944, 0.469, "cylinder", 6, 255, 0, 0, 100)
modShops[13].name = "Sea Side City Mods"

modShops[14] = {}
modShops[14].veh = false
modShops[14].marker = createMarker(2398.021, -1311.136, 24.509, "cylinder", 6, 255, 0, 0, 100)
modShops[14].name = "East Los Santos Mods"

modShops[15] = {}
modShops[15].veh = false
modShops[15].marker = createMarker(-2027.204, 124.581, 28.107, "cylinder", 6, 255, 0, 0, 100)
modShops[15].name = "Doherty SF Mods"



function quitHandler()
	local theCar = getPedOccupiedVehicle(source)
	if (theCar and isElement(theCar) and getElementType(theCar) == "vehicle") then
		local driver = getVehicleOccupant(theCar)
		if getVehicleModShop(theCar) then
			unfreezeVehicleInModShop(theCar)
		end
	end
end
addEventHandler("onPlayerQuit", root, quitHandler)
addEventHandler("onPedWasted", root, quitHandler)

function destroyHandler()
	if (getElementType(source) == "vehicle") then
		if getVehicleModShop(source) then
			unfreezeVehicleInModShop(source)
		end
	end
end
addEventHandler("onElementDestroy", root, destroyHandler)

function resourceStop()
	for k, veh in pairs(getElementsByType("vehicle")) do
		if (isVehicleInModShop(veh)) then
			unfreezeVehicleInModShop(veh)
		end
	end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), resourceStop)

function hitMarker(player, dimension)
	if (dimension and isElement(player) and getElementType(player) == "player") then
		local vehicle = getPedOccupiedVehicle(player)
		if (vehicle and isElement(vehicle) and getElementType(vehicle) == "vehicle") then
			local driver = getVehicleController(vehicle)
			if (driver == player and not getVehicleInModShop(source)) then
				local owner = exports.GTIvehicles:getVehicleOwner(vehicle)
				if (emergencyVehicles[getElementModel(vehicle)]) then
					exports.GTIhud:dm("Our modshops don't mod emergency vehicles, get it out of here!", player, 255, 255, 0)
					return
				elseif (owner and owner ~= player) then
					exports.GTIhud:dm("This vehicle is not owned by you, therefore is unmoddable.", player, 255, 255, 0)
					return
				end
				for index, value in ipairs(modShops) do
					if (modShops[index].marker == source) then
						timers[vehicle] = setTimer(unfreezeVehicleInModShop, 60000 * TIME_IN_MODSHOP, 1, vehicle)
						timersClient[vehicle] = setTimer(function(driver)
							if (isElement(driver)) then
								triggerClientEvent(driver, "modShop_clientResetVehicleUpgrades", driver)
							end
						end, 60000 * TIME_IN_MODSHOP - 200, 1, driver)
						setModShopBusy(source, vehicle)
						freezVehicleInModShop(vehicle, modShops[index].marker)
						triggerClientEvent(driver, "onClientPlayerEnterModShop", player, vehicle, getPlayerMoney(player), modShops[index].name)
					end
				end
			end
		end
	end
end
addEventHandler("onMarkerHit", resourceRoot, hitMarker)

function playerLeaveModShop(vehicle, itemsCost, upgrades, colors, paintjob, shopName)
	local pMoney = getPlayerMoney(source)
	if pMoney >= itemsCost then
		if itemsCost > 1800 then
			fixVehicle( vehicle)
		end
		modTheVehicle( vehicle, upgrades, colors, paintjob, shopName )
		exports.GTIbank:TPM(source, itemsCost, "GTImodshop Mod costs")
		triggerClientEvent( source, "modShop_moddingConfirmed", source )
		triggerEvent("onPlayerBuyVehicleMods", source, itemsCost)
	else
		exports.GTIhud:dm("You don't have enough money. Uninstall some upgrades, or right click the button to exit", source, 255, 255, 0)
	end
end
addEvent("modShop_playerLeaveModShop", true )
addEventHandler("modShop_playerLeaveModShop", root, playerLeaveModShop)

function modTheVehicle( vehicle, upgrades, colors, paintjob, shopName)
    if isElement( vehicle) and getElementType( vehicle) == 'vehicle' and type( upgrades) == 'table' or getVehiclePaintjob( vehicle) ~= paintjob then
        local trigger = false

		--outputDebugString( "Colors recieved from client: ".. colors[ 1 ] ..", "..tostring( colors[ 2 ] ) )
        local oldColor = { getVehicleColor( vehicle)}
        local newColor = { 0, 0, 0, 0}
        local fixVeh = false
        for i = 1, 2 do
            if oldColor[i] == colors[i] then
                newColor[i] = oldColor[i]
                colors[i] = false
            else
                newColor[i] = colors[i]
                trigger = true
                fixVeh = true
            end
        end

        if paintjob == 255 or paintjob == getVehiclePaintjob( vehicle) then
            paintjob = false
        else
            setVehiclePaintjob( vehicle, paintjob)
            trigger = true
        end

        local vehUpg = { getVehicleUpgrades( vehicle)}
        local upgs = {}
        for k,v in pairs( upgrades) do
            for i,j in pairs( vehUpg) do
                if v ~= j then
                    addVehicleUpgrade( vehicle, v)
                    table.insert( upgs, v)
                    trigger = true
                end
            end
        end

        if fixVeh then
            --fixVehicle( vehicle)
            setVehicleColor( vehicle, unpack( newColor))
        end
        for _, veh in ipairs( moddedVehicles) do
            if veh ~= vehicle then
                table.insert( moddedVehicles, veh)
            end
        end
        unfreezeVehicleInModShop( vehicle)
        if trigger then
            triggerEvent( "onVehicleMod", vehicle, upgs, colors, paintjob, shopname)
        end
    end
end

--[[
function modTheVehicle(vehicle, upgrades, colors, paintjob, shopName)
    if (isElement(vehicle) and getElementType(vehicle) == "vehicle") then
        local trigger = false
        if (paintjob == 255 or paintjob == getVehiclePaintjob(vehicle)) then
            paintjob = false
        else
            setVehiclePaintjob(vehicle, paintjob)
            trigger = true
        end
		-- Make sure Monster/2/3 don't get hydraulics
		local m = getElementModel(vehicle)
		if (m == 444 or m == 556 or m == 557) then
			for k,v in pairs( upgrades ) do
				if (v == 1087) then
					table.remove(upgrades, k)
				end
			end
		end
		setVehicleColor(vehicle, unpack(colors))
        local vehUpg = { getVehicleUpgrades( vehicle ) }
        local upgs = { }
        for k,v in pairs( upgrades ) do
            for i,j in pairs( vehUpg ) do
                if v ~= j then
                    addVehicleUpgrade( vehicle, v )
                    table.insert( upgs, v )
                    trigger = true
                end
            end
        end
        for index, veh in ipairs(moddedVehicles) do
            if (veh ~= vehicle) then
                table.insert(moddedVehicles, veh)
            end
        end
        unfreezeVehicleInModShop(vehicle)
        if (trigger) then
            triggerEvent("onVehicleMod", vehicle, upgs, colors, paintjob, shopname)
        end
    end
end
--]]

function freezVehicleInModShop(vehicle, marker)
    if (isElement(vehicle) and getElementType(vehicle) == "vehicle") then
        local mX, mY, mZ = getElementPosition(marker)
		if (getElementModel(vehicle) ~= 553) then
			setElementPosition(vehicle, mX, mY, mZ + 1.65)
		else
			setElementPosition(vehicle, mX, mY, mZ + 3.1)
		end
		setElementDimension(marker, 1)
		local r1, r2, r3 = getElementRotation(vehicle)
		setVehicleRotation(vehicle, 0, 0, r3)
		setElementFrozen(vehicle, true)
		setVehicleDamageProof(vehicle, true)
		if (not getElementData(vehicle, "l")) then
			setElementData(vehicle, "l", true)
			vehLocked[vehicle] = true
		end
    end
end

function unfreezeVehicleInModShop(vehicle)
    if (isElement(vehicle) and getElementType(vehicle) == "vehicle") then
        local shop = getVehicleModShop(vehicle)
        if (not shop) then return end
		setElementDimension(shop, 0)
		setModShopBusy(shop, 0, false)
		setElementFrozen(vehicle, false)
		setVehicleDamageProof(vehicle, false)
		if (getElementData(vehicle, "l") and vehLocked[vehicle] == true) then
			setElementData(vehicle, "l", false)
			vehLocked[vehicle] = nil
		end
		if timers[vehicle] then
			if (isTimer(timersClient[vehicle])) then
				killTimer(timersClient[vehicle])
			end
			killTimer(timers[vehicle])
		end
	end
end

function unfreezeVehicle()
    unfreezeVehicleInModShop(source)
end
addEvent("modShop_unfreezVehicle", true)
addEventHandler("modShop_unfreezVehicle", root, unfreezeVehicle)

addEvent( "onVehicleMod")
addEventHandler( "onVehicleMod", root,
	function( upgrades, colors, paintjob, shopName)
		local vehID = getElementData( source, "vehicleID")
		--->> Paint Job Handling
		if paintjob ~= false then
			setVehiclePaintjob( source, paintjob)
			exports.GTIvehicles:setVehicleData( vehID, "paintjob", paintjob)
		end
		--->> Color Handling
		setVehicleColor( source, unpack(colors))
		local saveColors = table.concat(colors, ",")..",0,0,0,0,0,0"
		exports.GTIvehicles:setVehicleData( vehID, "color", saveColors)
		--->> Upgrades Handling
		local tempTable = {}
			-- Tabling All Upgrade Slots
		for i = 0, 16 do
			local upgrade = getVehicleUpgradeOnSlot( source, i)
			table.insert( tempTable, { i, upgrade})
		end
			-- Creating 1st String
		for i,upgrade in pairs(tempTable) do
			tempTable[i] = table.concat(upgrade, ",")
		end
			-- Creating 2nd String
		local upgradeString = table.concat(tempTable, ";")
		tempTable = {}
			-- Saving The Upgrades
		exports.GTIvehicles:setVehicleData( vehID, "upgrades", upgradeString)
	end
)
