local farmerMarker1 = createMarker (-1060.479, -1203.0179, 128.218, "cylinder", 1.5, 255, 150, 0, 200)
local farmerMarker = createColTube( -1060.479, -1203.0179, 128.218, 1, 2)
local farmerMarkers = {farmerMarker}

local farmerZone1 = createColCuboid( -1215.461, -1220.327, 128.218, 96.551, 67.739, 13.490)
local farmerZone2 = createColCuboid(-1122.410, -1290.260, 126.868, 57.997, 44.900, 13.490)
local farmerZone3 = createColCuboid(-1195.45178, -1064.60535, 128.21875, 188.83837890625, 148.80108642578, 13.490)
local farmerZones = {farmerZone1, farmerZone2, farmerZone3}

local antiPromSpam = false

function drawLines()
	--Zone1
	line1 = dxDrawLine3D( -1118.849, -1220.407, 128.218, -1118.889, -1152.502, 128.218, tocolor( 255, 255, 0, 255), 20, false)
	line2 = dxDrawLine3D( -1118.889, -1152.502, 128.218, -1215.464, -1152.502, 128.218, tocolor( 255, 255, 0, 255), 20, false)
	line3 = dxDrawLine3D( -1215.464, -1152.502, 128.218, -1215.462, -1220.328, 128.218, tocolor( 255, 255, 0, 255), 20, false)
	line4 = dxDrawLine3D( -1118.849, -1220.407, 128.218, -1215.462, -1220.328, 128.218, tocolor( 255, 255, 0, 255), 20, false)
	--Zone2
	line1 = dxDrawLine3D( -1122.410, -1290.260, 128.2, -1122.304, -1245.267, 128.218, tocolor( 255, 255, 0, 255), 20, false)
	line2 = dxDrawLine3D( -1122.410, -1290.260, 128.2, -1064.433, -1290.199, 128.218, tocolor( 255, 255, 0, 255), 20, false)
	line3 = dxDrawLine3D( -1064.433, -1290.199, 128.218, -1064.342, -1245.461, 128.218, tocolor( 255, 255, 0, 255), 20, false)
	line4 = dxDrawLine3D( -1064.342, -1245.461, 128.218, -1122.304, -1245.267, 128.218, tocolor( 255, 255, 0, 255), 20, false)
    --Zone3
    line1 = dxDrawLine3D( -1195.45178, -1064.60535, 128.21875, -1195.45178, -915.804264, 128.21875, tocolor( 255, 255, 0, 255), 20, false)
    line2 = dxDrawLine3D( -1195.45178, -915.804264, 128.21875, -1006.61340109, -915.804264, 128.21875, tocolor( 255, 255, 0, 255), 20, false)
    line3 = dxDrawLine3D( -1006.61340109, -1064.60535, 128.21875, -1006.61340109, -915.804264, 128.21875, tocolor( 255, 255, 0, 255), 20, false)
    line4 = dxDrawLine3D( -1006.61340109, -1064.60535, 128.21875, -1195.45178, -1064.60535, 128.21875, tocolor( 255, 255, 0, 255), 20, false)
end


local farmingRadars = {
 { -1215.461, -1220.327, 96.551, 67.739},
 { -1122.410, -1290.260, 57.997, 44.900},
 { -1195.45178, -1064.60535, 188.83837890625, 148.80108642578}
}

    setTimer (
        function ( )
            for _,v in ipairs ( farmingRadars ) do
                local lx,ly, sx, sy = unpack ( v )
				createRadarArea( lx, ly, sx, sy, 255, 200, 0, 100)
            end
        end, 1000, 1
    )

function createFarmerGUI()
	--Misc
	local occ = getElementData( localPlayer, "job")
    setElementData(localPlayer, "drawHarvestLeft", false)
	if occ == "Farmer" then
		addEventHandler ( "onClientPreRender", root, createSeedsViewer, false )
		addEventHandler ( "onClientPreRender", root, drawPlantedSeeds, false )
		addEventHandler ( "onClientRender", root, drawLines, false )
		triggerServerEvent("checkFarmerSeeds",root,localPlayer)
	else
		removeEventHandler ( "onClientPreRender", root, createSeedsViewer, false )
		removeEventHandler ( "onClientPreRender", root, drawPlantedSeeds, false )
		removeEventHandler ( "onClientRender", root, drawLines, false )
	end
end
addEventHandler("onClientResourceStart",resourceRoot,createFarmerGUI)

------------------------------------------------------------------------------------------------------------------------------------------------------

currentSeeds = 0
theSeeds = "0"

function createSeedsViewer()
    if (not isPlayerMapVisible()) then
        if theSeeds ~= nil then
            local screenW, screenH = guiGetScreenSize()
            local screenW = screenW - 100
			dxDrawText("Seeds: "..theSeeds, screenW, screenH-58, screenW+63, screenH/2, tocolor(0, 0, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
            dxDrawText("Seeds: "..theSeeds, screenW, screenH-60, screenW+65, screenH/2, tocolor(255, 255, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
        end
    end
end

function setSeeds(seeds)
    currentSeeds = math.floor(seeds)
    if currentSeeds <= 0 then currentSeeds = 0 end
    theSeeds = tostring(currentSeeds)
end
addEvent("placeSeeds",true)
addEventHandler("placeSeeds",root,setSeeds)

function fixFarmerLogin( jobState)
	if getElementData( localPlayer, "job") == "Farmer" then
		addEventHandler( "onClientPreRender", root, createSeedsViewer, false)
		addEventHandler( "onClientPreRender", root, drawPlantedSeeds, false)
		addEventHandler( "onClientPreRender", root, drawLines, false)
	else
		if jobState == true then
			removeEventHandler( "onClientPreRender", root, createSeedsViewer, false)
			removeEventHandler( "onClientPreRender", root, drawPlantedSeeds, false)
			removeEventHandler( "onClientRender", root, drawLines, false)
		end
	end
end
addEvent("fixFarmerLogin", true)
addEventHandler("fixFarmerLogin",root,fixFarmerLogin)


-------------------------------------------------------------------------------------------------------------------------------------------------

local farmTrailer = {}

function getFarmTrailer(theTrailer)
    farmTrailer[localPlayer] = theTrailer
end
addEvent("getFarmTrailer",true)
addEventHandler("getFarmTrailer", root, getFarmTrailer)

seedsPlanted = {}
currentPlanted = 0
thePlanted = "0"

currentHarvest = 0
plantsToHarvest = "0"
spawnedPlants = {}

--------------------------
currentQuota = 0
theQuota = "0"

function setBailQuota(quota)
    currentQuota = math.floor(quota)
    if currentQuota <= 0 then currentQuota = 0 end
    theQuota = tostring(currentQuota)
end
addEvent("setBailQuota",true)
addEventHandler("setBailQuota",root,setBailQuota)

--------------------------

function farmerPlant()
    local curPl = seedsPlanted[localPlayer] or 0
    if currentSeeds <= 0 then
        killTimer(plantTimer)
		currentSeeds = 0
        return
    end
    if curPl >= 100 then
        killTimer(plantTimer)
        curPL = 100
        return
    end
	if currentQuota >= 250 then
		killTimer(plantTimer)
		return
	end
	if isPlayerInVehicle( localPlayer) then
		if isElement(farmTrailer[localPlayer]) then
			if isVehicleOnGround(farmTrailer[localPlayer]) then
				local x, y, z = getElementPosition(farmTrailer[localPlayer])
				local x = math.floor(x)
				local randomN = math.random(1,2)
				if randomN == 1 then
					farmYPick = math.floor
				else
					farmYPick = math.ceil
				end
				local yy = farmYPick(y)
				thePlant = createObject(856, x, yy, z-0.5, 0, 0, 0, true) --Regular
				--thePlant = createObject(870, x, yy, z-0.5, 0, 0, 0, true) --Flower
				--thePlant = createObject(3409, x, yy, z-0.5, 0, 0, 0, true) --Weed
				setObjectScale(thePlant,0.03)
				plantCol = createColSphere(x, y, z, 3)
				theBlip = createBlipAttachedTo( thePlant, 0, 1, 150, 150, 150, 255, 0, 100)
				attachElements(plantCol, thePlant)
				spawnedPlants[plantCol] = {}
				spawnedPlants[plantCol].object = thePlant
				spawnedPlants[plantCol].blip = theBlip
				spawnedPlants[plantCol].X = x
				spawnedPlants[plantCol].Y = yy
				spawnedPlants[plantCol].Z = z
				setTimer( setObjectScale, 3000, 1, thePlant, 0.1)
				setTimer( setObjectScale, 6000, 1, thePlant, 0.15)
				setTimer( setObjectScale, 9000, 1, thePlant, 0.2)
				setTimer( setObjectScale, 12000, 1, thePlant, 0.25)
				setTimer( setObjectScale, 15000, 1, thePlant, 0.3)
				setTimer( setObjectScale, 18000, 1, thePlant, 0.35)
				setTimer( setObjectScale, 21000, 1, thePlant, 0.4)
				setTimer( setObjectScale, 24000, 1, thePlant, 0.45)
				setTimer( setObjectScale, 27000, 1, thePlant, 0.5)
				setTimer( setObjectScale, 30000, 1, thePlant, 0.55)
				setTimer( setObjectScale, 33000, 1, thePlant, 0.6)
				setTimer( setObjectScale, 36000, 1, thePlant, 0.65)
				setTimer( setObjectScale, 39000, 1, thePlant, 0.7)
				setTimer( setObjectScale, 42000, 1, thePlant, 0.75)
				setTimer( setObjectScale, 45000, 1, thePlant, 0.8)
				setTimer( setObjectScale, 48000, 1, thePlant, 0.85)
				setTimer( setObjectScale, 51000, 1, thePlant, 0.9)
				setTimer( setObjectScale, 54000, 1, thePlant, 0.95)
				setTimer( setObjectScale, 57000, 1, thePlant, 1)
				setTimer( plantsReady, 60000, 1, theBlip, thePlant, plantCol)
				takeSeeds(1)
				plantSeeds(curPl+1)
				seedsPlanted[localPlayer] = curPl+1
				if currentHarvest ~= curPl then
					triggerServerEvent("plantedSeeds", localPlayer, localPlayer, false)
				end
			end
		end
    end
end

function beginPlanting(theElement)
    if ( theElement == farmTrailer[localPlayer] ) then
		if currentQuota <= 250 then
			plantTimer = setTimer(farmerPlant, 250, 0)
		else
			exports.GTIhelp:dm( "You must sell your quota before planting again", 255, 0, 0)
			if isTimer( plantTimer) then
				killTimer( plantTimer)
			end
		end
    end
end

function stopPlanting(theElement)
    if ( theElement == farmTrailer[localPlayer] ) then
        killTimer(plantTimer)
    end
end

function drawPlantedSeeds()
    if (not isPlayerMapVisible()) then
        if not getElementData(localPlayer, "drawHarvestLeft") then
            if thePlanted ~= nil then
                local screenW, screenH = guiGetScreenSize()
                local screenW = screenW - 100
                local curPl = seedsPlanted[localPlayer] or 0
					dxDrawText("Seeds Planted: "..thePlanted.."/100", screenW, screenH+2, screenW+13, screenH/2, tocolor(0, 0, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
                    dxDrawText("Seeds Planted: "..thePlanted.."/100", screenW, screenH, screenW+15, screenH/2, tocolor(255, 255, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
					--
					dxDrawText("Total Seed Quota: "..theQuota.."/250", screenW-20, screenH+32, screenW+13, screenH/2, tocolor(0, 0, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
					dxDrawText("Total Seed Quota: "..theQuota.."/250", screenW-20, screenH+30, screenW+15, screenH/2, tocolor(255, 255, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
                if curPl == 0 then
					dxDrawText("Use a tractor to plant seeds", screenW, screenH+92, screenW-32, screenH/2, tocolor(0, 0, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
                    dxDrawText("Use a tractor to plant seeds", screenW, screenH+90, screenW-30, screenH/2, tocolor(255, 255, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
                else
                    dxDrawText("Use a combine when ready", screenW, screenH+92, screenW-32, screenH/2, tocolor(0, 0, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
					dxDrawText("Use a combine when ready", screenW, screenH+90, screenW-30, screenH/2, tocolor(255, 255, 0, 255), 1.25, "sans", "center", "center", false, false, false, false, false)
                end
            end
        end
    end
end

function plantSeeds(amount)
    currentPlanted = math.floor(amount)
    if currentPlanted <= 0 then currentPlanted = 0 end
    if currentPlanted >= 100 then currentPlanted = 100 end
    thePlanted = tostring(currentPlanted)
end
addEvent("plantSeeds",true)
addEventHandler("plantSeeds",root,plantSeeds)

function drawPlantsToHarvest()
    if (not isPlayerMapVisible()) then
        if getElementData(localPlayer, "drawHarvestLeft") then
            if currentHarvest > 0 then
                local screenW, screenH = guiGetScreenSize()
                local screenW = screenW - 100
                dxDrawText("Plants to harvest: "..plantsToHarvest, screenW, screenH+60, screenW+10, screenH/2, tocolor(255, 255, 0, 255), 1.25, "sans", "center", "center", false, false, true, false, false)
            end
        end
    end
end

function plants2Harvest(amount)
    currentHarvest = math.floor(amount)
    if currentHarvest <= 0 then currentHarvest = 0 end
    if currentHarvest >= 100 then currentHarvest = 100 end
    plantsToHarvest = tostring(currentHarvest)
end
addEvent("harvestPlants",true)
addEventHandler("harvestPlants",root,plants2Harvest)


function plantsReady(plantBlip, farmPlant, farmMarker)
    local curPl = seedsPlanted[localPlayer] or 0
    setBlipColor(plantBlip, 0, 255, 0, 255)
    plants2Harvest(currentHarvest+1)
    addEventHandler("onClientColShapeHit", farmMarker, harvestFix)
    if  currentHarvest == curPl then
        triggerServerEvent("plantedSeeds", localPlayer, localPlayer, true)
        addEventHandler ( "onClientPreRender", root, drawPlantsToHarvest, false )
    else
        triggerServerEvent("plantedSeeds", localPlayer, localPlayer, false)
    end
end


local droppedHay = {}
function harvestFix(hitElement)
    if getElementType(hitElement) == "vehicle" then
        if getElementModel(hitElement) == 532 then
            local player = getVehicleOccupant(hitElement,0)
            if player == localPlayer then
                local data = spawnedPlants[source]
                if ( type ( data ) == "table" ) then
					if currentQuota <= 250 then
						destroyElement ( source )
						destroyElement ( data.blip )
						destroyElement ( data.object )
						local x = data.X
						local y = data.Y
						local z = data.Z
						local theHay = createObject(2901, x, y, z, 0, 0, 0, true)
						local hayCol = createColSphere(x, y, z, 1)
						local curPl = seedsPlanted[localPlayer] or 0
						droppedHay[hayCol] = {}
						droppedHay[hayCol].hay = theHay
						addEventHandler("onClientColShapeHit", hayCol, onBalePickup)

						spawnedPlants[localPlayer] = nil
						plants2Harvest(currentHarvest-1)
						plantSeeds(curPl-1)
						seedsPlanted[localPlayer] = curPl-1
					else
						if not isTimer( antiStopTimer) then
							exports.GTIhelp:dm( "You must sell your quota before picking up more harvest")
							antiStopTimer = setTimer( function() end, 5000, 1)
							return
						end
					end
                end
            end
        end
    end
end

function onBalePickup(hitPlayer, matchingDimension)
    if hitPlayer == localPlayer then
        if getElementData(localPlayer,"job") == "Farmer" then
			if not isPedInVehicle(localPlayer) then
				local data = droppedHay[source]
				if ( type ( data ) == "table" ) then
					destroyElement(source)
					destroyElement(data.hay)
					local farmerRank2 = getElementData(localPlayer,"farmerRank")
					playSoundFrontEnd(32)
					triggerServerEvent("setsJobCash", getLocalPlayer())
				end
			end
        end
    end
end

-------------------

function noCollide()
    local myVehicle = getPedOccupiedVehicle(localPlayer)
    local vehicles = getElementsByType("vehicle")
    for k,v in ipairs(vehicles) do
        if getElementData(localPlayer, "job") == "Farmer" then
			if myVehicle then
				if (getElementModel(myVehicle) == 532) then
					setElementCollidableWith(myVehicle, v, false)
				elseif (getElementModel(myVehicle) == 531) then
					setElementCollidableWith(myVehicle, v, false)
				elseif (getElementModel(myVehicle) == 572) then
					setElementCollidableWith(myVehicle, v, false)
				end
			end
        end
    end
end
setTimer( noCollide, 2000, 0)

function noTrailerCollide(trailer, tractor)
    local vehicles2 = getElementsByType("vehicle")
    for i,veh in ipairs(vehicles2) do
		if veh then
			if trailer then
				setElementCollidableWith(veh, trailer, false)
			end
		end
    end
end
addEvent("noTrailerCollide",true)
addEventHandler("noTrailerCollide", root, noTrailerCollide)


function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

--Farmer Quota
---------------------
quotaPos = {}
quotaPos[1] = {x=-388.998, y=-1407.202, z=24.215}
quotaPos[2] = {x=-380.523, y=-1454.020, z=24.726}
lastDelivery = false
deliveryPrice = false

deliveryMarker = false
deliveryBlip = false

function onDeliveryHit(hitPlayer, matchingDimension)
    if getElementData(localPlayer,"job") == "Farmer" then
		if hitPlayer == localPlayer then
			if getPedOccupiedVehicle(hitPlayer) and matchingDimension and isVehicleOnGround(getPedOccupiedVehicle(hitPlayer)) and getElementModel(getPedOccupiedVehicle(hitPlayer)) == 478 then
				local archRandomNumber = 1
				triggerServerEvent("farmerDelivered", root, localPlayer)
				--exports.CRPhelp:giveMoney(localPlayer, deliveryPrice)

				destroyElement(deliveryMarker)
				destroyElement(deliveryBlip)
				deliveryMarker = false
				deliveryBlip = false
				deliveryPrice = false
			end
		end
    end
end

function onWaltonExit(reason)
	removeEventHandler("onClientVehicleExit",source,onWaltonExit)
	deleteMission(reason)
end
addEvent("farmerRemoveMission",true)
addEventHandler("farmerRemoveMission", root, onWaltonExit)

function onWaltonE()
	removeEventHandler("onClientVehicleExit",source,onWaltonE)
	deleteMission("you don't have enough quota")
end

function deleteMission(reason)
	if deliveryMarker then
        triggerServerEvent("farmerCancel", root, localPlayer, reason)
		destroyElement(deliveryMarker)
		destroyElement(deliveryBlip)
		deliveryMarker = false
		deliveryBlip = false
		deliveryPrice = false
	end
end
addEventHandler("onClientPlayerSpawn", localPlayer, deleteMission)

function onWaltonEnter()
    if getElementData(localPlayer,"job") == "Farmer" then
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if theVehicle and getVehicleType(theVehicle) == "Automobile" then
			local vehModel = getElementModel( theVehicle)
			if vehModel == 478 then
				--
                if isElement(deliveryMarker) then	destroyElement(deliveryMarker) deliveryMarker = false end
                if isElement(deliveryBlip) then  destroyElement(deliveryBlip) deliveryBlip = false end
                local optionsNew = deepcopy(quotaPos)
                if lastDelivery then table.remove(optionsNew, lastDelivery) end
                local randomNumber = math.random(1,#optionsNew)
                lastDelivery = randomNumber
                local x = optionsNew[randomNumber]['x']
                local y = optionsNew[randomNumber]['y']
                local z = optionsNew[randomNumber]['z']
                triggerServerEvent("farmerDeliver", root, localPlayer, x, y, z)
                deliveryMarker = createMarker(x,y,z,"cylinder",3,255,255,0,200)
                deliveryBlip = createBlipAttachedTo(deliveryMarker,41)
				--
                addEventHandler("onClientMarkerHit", deliveryMarker,onDeliveryHit)
                addEventHandler("onClientVehicleExit", theVehicle ,onWaltonExit)
				addEventHandler("onClientVehicleExit", theVehicle ,onWaltonE)
                addEventHandler("onClientVehicleExplode", theVehicle ,onWaltonExit)
                addEventHandler("onPlayerWasted", localPlayer, deleteMission)
			end
		end
    end
end
addEventHandler("onClientPlayerVehicleEnter",localPlayer,function() onWaltonEnter() end)

--Agri Cars
---------------------
--[[

local farmSpawner11 = createMarker (-1098.946, -1214.391, 128.225, "cylinder", 1.5, 255, 255, 0, 200) -- Farmer Vehicles 1
local farmSpawner22 = createMarker (-1098.946, -1180.839, 128.218, "cylinder", 1.5, 255, 255, 0, 200) -- Farmer Vehicles 2
local farmSpawner33 = createMarker( -1040.199, -1215.599, 128.218, "cylinder", 1.5, 255, 255, 0, 200) -- Farmer Vehicles 3
local farmSpawner44 = createMarker( -1040.199, -1268.157, 128.214, "cylinder", 1.5, 255, 255, 0, 200) -- Farmer Vehicles 4
local farmSpawner1 = createColTube( -1098.946, -1214.391, 128.225, 1, 2)
local farmSpawner2 = createColTube( -1098.946, -1180.839, 128.218, 1, 2)
local farmSpawner3 = createColTube( -1040.199, -1215.599, 128.218, 1, 2)
local farmSpawner4 = createColTube( -1040.199, -1268.157, 128.214, 1, 2)

local vehicles = { "Tractor", "Combine Harvester", "Walton"}

local farmMarkers = {farmSpawner1, farmSpawner2, farmSpawner3, farmSpawner4}

function onFCarEnter()
    if getElementData(localPlayer,"job") == "Farmer" then
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if theVehicle and getVehicleType(theVehicle) == "Automobile" then
			local vehModel = getElementModel( theVehicle)
			if vehModel == 531 then
				local x, y, z = getElementPosition( localPlayer)
				addEventHandler ( "onClientColShapeHit", farmerZone1, beginPlanting)
				addEventHandler ( "onClientColShapeHit", farmerZone2, beginPlanting)
				addEventHandler ( "onClientColShapeHit", farmerZone3, beginPlanting)
				addEventHandler("onClientColShapeLeave", farmerZone1, stopPlanting)
				addEventHandler("onClientColShapeLeave", farmerZone2, stopPlanting)
				addEventHandler("onClientColShapeLeave", farmerZone3, stopPlanting)
			elseif vehModel == 572 then
				addEventHandler ( "onClientColShapeHit", farmerZone1, beginFertilizing)
				addEventHandler ( "onClientColShapeHit", farmerZone2, beginFertilizing)
				addEventHandler ( "onClientColShapeHit", farmerZone3, beginFertilizing)
				addEventHandler("onClientColShapeLeave", farmerZone1, stopFertilizing)
				addEventHandler("onClientColShapeLeave", farmerZone2, stopFertilizing)
				addEventHandler("onClientColShapeLeave", farmerZone3, stopFertilizing)
			end
		end
    end
end
addEventHandler("onClientPlayerVehicleEnter",localPlayer,function() onFCarEnter() end)

function createFCarGui ()
    farmGui = guiCreateWindow(554, 227, 227, 274, "GTI - Farm Vehicles", false)
    guiSetVisible(farmGui,false)
    guiWindowSetSizable ( farmGui, false )
    farmGrid = guiCreateGridList(9, 24, 209, 176, false,farmGui)
    guiGridListSetSelectionMode(farmGrid,2)
    _fcars = guiGridListAddColumn(farmGrid,"Vehicles",0.85)
    farmSpawn = guiCreateButton(9, 219, 99, 45, "Spawn", false,farmGui)
    guiSetFont(farmSpawn,"default-bold-small")
    farmCancel = guiCreateButton(119, 219, 99, 45, "Cancel",false,farmGui)
    guiSetFont(farmCancel,"default-bold-small")
    for index, fcars in ipairs(vehicles) do
        local row = guiGridListAddRow (farmGrid)
        guiGridListSetItemText ( farmGrid, row, _fcars, tostring(fcars), false, false )
    end
end
addEventHandler("onClientResourceStart",resourceRoot,createFCarGui)

for _,smallFcars in ipairs(farmMarkers) do
addEventHandler ( "onClientColShapeHit", smallFcars,
    function ( hitElement )
        if ( hitElement == localPlayer ) and not isPedInVehicle(localPlayer) then
            if getElementData(hitElement,"job") == "Farmer" then
                guiSetVisible ( farmGui, true )
                showCursor ( true )
            else
                triggerServerEvent("farmerVehicleMessage",root, hitElement)
            end
        end
    end
)
addEventHandler ( "onClientColShapeLeave",smallFcars,
    function ( hitElement)
        if (hitElement == localPlayer) then
            triggerEvent("closeFarmWindow",root)
        end
    end
)
end

oddRotationVehicles = { ['Linerunner']=true, ['Walton']=true}

addEventHandler("onClientGUIClick",root,
    function()
        if (source == farmSpawn) then
			local row,col = guiGridListGetSelectedItem(farmGrid)
			local vehicleName = guiGridListGetItemText(farmGrid, row, 1)
            if isElementWithinColShape(localPlayer,farmSpawner1) then
				if oddRotationVehicles[vehicleName] then
					daRotation = 180
				else
					daRotation = 86
				end
			elseif isElementWithinColShape(localPlayer,farmSpawner2) then
				if oddRotationVehicles[vehicleName] then
					daRotation = 180
				else
					daRotation = 86
				end
			elseif isElementWithinColShape(localPlayer,farmSpawner3) then
				if oddRotationVehicles[vehicleName] then
					daRotation = 180
				else
					daRotation = 86
				end
			elseif isElementWithinColShape(localPlayer,farmSpawner4) then
				if oddRotationVehicles[vehicleName] then
					daRotation = 180
				else
					daRotation = 86
				end
			end
            local farmerRank2 = getElementData(localPlayer,"farmerRank")
			if (row and col and row ~= -1 and col ~= -1) then
				if vehicleName == "Tractor" then
					triggerServerEvent("spawnFCar",localPlayer,531, daRotation,r1,g1,b1,r2,g2,b2)
				elseif vehicleName == "Combine Harvester" then
					triggerServerEvent("spawnFCar",localPlayer,532, daRotation,r1,g1,b1,r2,g2,b2)
				elseif vehicleName == "Walton" then
					triggerServerEvent("spawnFCar",localPlayer,478, daRotation,r1,g1,b1,r2,g2,b2)
				end
			end
		end
	end
)

--]]

---------------------


addEventHandler("onClientGUIClick",root,
function()
    if source == farmCancel then
        triggerEvent("closeFCarWindow",root)
    end
end
)


--------------------


addEvent("closeFCarWindow", true)
addEventHandler("closeFCarWindow", root,
function ()
    guiSetVisible(farmGui, false)
    showCursor(false)
end
)


--Seeds

seedsMarker11 = createMarker (-1059.752, -1211.178, 128.218, "cylinder", 1, 255, 255, 0, 200) -- Seeds Location 1
seedsMarker1 = createColTube( -1059.752, -1211.178, 128.218, 1, 2)

local farmSMarkers = {seedsMarker1}

function createSeedGui ()
	local screenW, screenH = guiGetScreenSize()
	seedsGUI = guiCreateWindow(screenW - 184 - 10, (screenH - 237) / 2, 184, 237, "Buy Seeds", false)
	guiWindowSetSizable(seedsGUI, false)
	guiSetVisible( seedsGUI, false)
	seeds1Radio = guiCreateRadioButton(10, 38, 164, 15, "100 Seed - $500", false, seedsGUI)
	seeds2Radio = guiCreateRadioButton(10, 63, 164, 15, "200 Seeds - $2,500", false, seedsGUI)
	seeds3Radio = guiCreateRadioButton(10, 88, 164, 15, "500 Seeds - $5,000", false, seedsGUI)
	seeds4Radio = guiCreateRadioButton(10, 113, 164, 15, "1000 Seeds - $7,500", false, seedsGUI)
	seeds5Radio = guiCreateRadioButton(10, 138, 164, 15, "2000 Seeds - $10,000", false, seedsGUI)
	buySeedsButton = guiCreateButton(10, 163, 164, 31, "Buy ", false, seedsGUI)
	--guiSetProperty(buySeedsButton, "NormalTextColour", "FFAAAAAA")
	closeSeedGUI = guiCreateButton(64, 204, 54, 22, "Close", false, seedsGUI)
	--guiSetProperty(closeSeedGUI, "NormalTextColour", "FFAAAAAA")
end
addEventHandler("onClientResourceStart",resourceRoot,createSeedGui)


for _,seeds in ipairs(farmSMarkers) do
addEventHandler ( "onClientColShapeHit", seeds,
    function ( hitElement )
        if ( hitElement == localPlayer ) and not isPedInVehicle(localPlayer) then
            if getElementData(hitElement,"job") == "Farmer" then
                guiSetVisible ( seedsGUI, true )
                showCursor ( true )
            else
                triggerServerEvent("farmerSeedMessage",root, hitElement)
            end
        end
    end
)
end

addEventHandler("onClientGUIClick",root,
function()
    if source == closeSeedGUI then
        triggerEvent("closeSeedWindow",localPlayer)
	elseif source == buySeedsButton then
		if guiRadioButtonGetSelected( seeds1Radio) then
            if takePlayerMoney( 500) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 100)
            else
                exports.GTIhelp:dm("You don't have enough money!", 255, 0, 0)
            end
		elseif guiRadioButtonGetSelected( seeds2Radio) then
            if takePlayerMoney( 2500) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 200)
            else
                exports.GTIhelp:dm("You don't have enough money!", 255, 0, 0)
            end
		elseif guiRadioButtonGetSelected( seeds3Radio) then
            if takePlayerMoney( 5000) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 500)
            else
                exports.GTIhelp:dm("You don't have enough money!", 255, 0, 0)
            end
		elseif guiRadioButtonGetSelected( seeds4Radio) then
            if takePlayerMoney( 7500) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 1000)
            else
                exports.GTIhelp:dm("You don't have enough money!", 255, 0, 0)
            end
		elseif guiRadioButtonGetSelected( seeds5Radio) then
            if takePlayerMoney( 10000) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 2000)
            else
                exports.GTIhelp:dm("You don't have enough money!", 255, 0, 0)
            end
		end
    end
end
)

function giveSeeds( amount)
	if amount then
		triggerServerEvent("giveTheSeeds", localPlayer, amount)
	end
end

function takeSeeds( amount)
	if amount then
		triggerServerEvent("takeTheSeeds", localPlayer, amount)
	end
end
--------------------


addEvent("closeSeedWindow", true)
addEventHandler("closeSeedWindow", root,
function ()
    guiSetVisible(seedsGUI, false)
    showCursor(false)
end
)

addEvent("setBuyDelay", true)
addEventHandler("setBuyDelay", root,
function ()
    guiSetEnabled(buySeedsButton,false)
    setTimer(guiSetEnabled, 5000,1,buySeedsButton,true)
end
)
