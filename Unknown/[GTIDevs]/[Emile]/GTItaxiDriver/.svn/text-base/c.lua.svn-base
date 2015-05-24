local loc = {
	{1976.107, -1456.336, 12.054},
    --[[{2001.9, -1758.1, 12.5, 0},
    {1496.6, -1878.1, 12.6, 0},
    {1498.5, -1586.1, 12.5, 0},
    {1091.2, -1566.2, 12.6, 0},
    {980, -1226.7, 15.9, 0},
    {1364.5, -1285.9, 12.6, 0},
    {1468.6, -1027.4, 22.9, 0},
    {2232.7, -1127.7, 24.8, 0},
    {2743.5, -1185.1, 68.4, 0},
    {803.7, -1732.1, 12.5, 0},
    {-2158.6001, 128.1, 34.3, 0},
    {-2153.1001, 391.4, 34.3, 0},
    {-2153.5, 781, 68.4, 0},
    {-1685.2, 940.2, 23.8, 0},
    {-1955, 1187.7, 44.4, 0},
    {-2524.8999, 1125.5, 54.6, 0},
    {-2630.6001, 575.2, 13.6, 0},
    {-2186.8999, 555.9, 34, 0},
    {-2801.8, -157.9, 6.2, 0},
    {1639.8, 1820.4, 9.8, 0},
    {1463.4, 1980.2, 9.7, 0},
    {1517.1, 2598.3999, 9.6, 0},
    {1615.7, 2812.1001, 9.7, 0},
    {2281.2, 2350.3, 9.7, 0},
    {2500.3, 2158.1001, 9.8, 0},
    {2838.1001, 2066, 9.6, 0},
    {2574.8999, 1065.8, 9.9, 0},
    {2169.6001, 705.8, 9.7, 0},
    {1459.5, 659.9, 9.9, 0},
    {2080.5, 1460.3, 9.8, 0},
    {697.9, 1945.6, 4.5, 0},
    {-20.5, 1204.6, 18.1, 0},
    {-856.7, 1543, 21.7, 0},
    {-1505.2, 2594.8, 54.7, 0},
    {-2477.8, 2439, 15, 0},
    {-2199.7, -2268.2, 29.4, 0},
    {-41.8, -2502.6001, 35, 0},
    {751.8, -522.7, 15.1, 0},
    {2300.5, 55.8, 25.4, 0},
    {1308.9, 324.7, 18.3, 0},]]
}
payammount = 0
cargo = 0
dist = 0
currentCount = 0
currentMinute = 0

function mission()
	if not isElement(marker) and not isElement(Nmarker) then--and (exports.GTIemployment:getPlayerJob(true) == "Taxi Driver") then
		local x1, y1, z1 = unpack( loc [math.random (#loc)] )
		marker = createMarker ( x1, y1, z1, "cylinder", 6, 255, 25, 50, 170 )
		blip = createBlipAttachedTo(marker, 41)
		local loca = getZoneName(x1,y1,z1)
		local d1x, d1y, d1z = getElementPosition ( marker )
		addEventHandler("onClientMarkerHit",marker,unload)
		local d2x, d2y, d2z = getElementPosition ( localPlayer )
		local distance = getDistanceBetweenPoints3D(d1x,d1y,d1z,d2x,d2y,d2z)
		payammount = payammount + distance
		dist = distance/1000
		local theVeh = getPedOccupiedVehicle(localPlayer)
		setElementFrozen(theVeh,false)
		toggleControl("enter_exit", true)
			local rand = math.random(1,3)
			if rand == 1 or rand == 2 then 
				exports.GTIhud:dm(RPName.." has requested to go in "..loca, 255, 255, 0)
			elseif rand == 3 then
				currentMinute = math.ceil(dist)
				if currentMinute == 0 then
					currentMinute = 1 
				end
				exports.GTIhud:dm(RPName.." has requested to go in "..loca..". He has a meeting in "..currentMinute.." minutes. BE FAST!", 255, 255, 0)
				missTimer = setTimer(missionTimer,1000,0)
			end
			-- Add Distance for Progress
		dist = payammount 
	end
end


function load(pedi)
	local theVeh = getPedOccupiedVehicle(localPlayer)
	ped = pedi
	timeped = getTickCount()
	timemsg = getTickCount()
	addEventHandler("onClientRender",root,goToCar)
	toggleControl("enter_exit", false)
	passengermsg = false
	RPName = exports.GTIutil:getGenericName()
end
addEvent("GTItaxi.getPed", true)
addEventHandler("GTItaxi.getPed", resourceRoot, load)
function canceldmg(pedi)
addEventHandler("onClientPedDamage",pedi,cancelEvent)
end
addEvent("GTItaxi.canceldmg", true)
addEventHandler("GTItaxi.canceldmg", resourceRoot, canceldmg)
function goToCar()
	local theVeh = getPedOccupiedVehicle(localPlayer)
	if not isElement(theVeh) then return end
	local cx,cy,cz = getElementPosition(theVeh)
	local dx,dy,dz = getVehicleComponentPosition(theVeh, "door_lf_dummy")
	local tx,ty = cx+dx,cy+dy
	local px,py,pz = getElementPosition( ped )
	local dist = getDistanceBetweenPoints2D(tx,ty,px,py)
	angle = ( 360 - math.deg ( math.atan2 ( ( tx - px ), ( ty - py ) ) ) ) % 360
	setPedRotation( ped, angle )
	setPedControlState(ped, "forwards", true)
	if getTickCount() - timeped > 3000 then
		timeped = getTickCount()
		setPedControlState(ped, "jump", true)
		loadTimer1 = setTimer(setPedControlState,400,1,ped,"jump",false)
	end
	if dist < 0.8 then 
		if getVehicleOccupant(theVeh,1) then
			if not passengermsg then
				passengermsg = true
				outputChatBox("*"..RPName..": I wanna be in front seat.",255,0,0)
			end
			return
		end
		setPedControlState(ped,"forwards",false)
		removeEventHandler("onClientRender",root,goToCar)
		setElementRotation( ped, getElementRotation(theVeh) )
		setPedAnimation(ped,"ped","CAR_open_RHS",500,false)
		loadTimer3 = setTimer(setVehicleDoorOpenRatio,500,1,theVeh,3,1,300)
		loadTimer5 = setTimer(setVehicleDoorOpenRatio,1500,1,theVeh,3,0,300)
		loadTimer4 = setTimer(setPedAnimation,1000,1,ped,"ped","CAR_getinL_RHS",500,false)
		loadTimer2 = setTimer(function(theVeh)
			triggerServerEvent("GTItaxi.warpVehicle", resourceRoot, true, ped, theVeh)
			mission()
		end,1200,1,theVeh)
	elseif dist > 10 and dist < 20 then
		if getTickCount() - timemsg > 3000 then
			timemsg = getTickCount()
			outputChatBox("*"..RPName..": Wait for me!",255,0,0)
		end
	elseif dist > 20 then
		removeEventHandler("onClientRender",root,goToCar)
		exports.GTIhud:dm("You've lost your client!", 255, 0, 0)
		triggerServerEvent("GTItaxi.destroyPed", resourceRoot)
	end
end
function unload(thePlayer)
	local theVeh = getPedOccupiedVehicle(localPlayer)
    if ( source == marker ) and ( thePlayer == localPlayer) and ( exports.GTIutil:getElementSpeed(theVeh, "mph") < 40 ) then
		exports.GTIhud:drawStat("TaxiID", "", "", 255, 200, 0)
		setVehicleDoorOpenRatio(theVeh,3,1,0)
		setPedAnimation(ped,"ped","CAR_getout_RHS",400,false,true,false,false,false)
		unloadTimer4 = setTimer(triggerServerEvent,500,1,"GTItaxi.warpVehicle", resourceRoot, false, ped, theVeh)
		unloadTimer3 = setTimer(setPedAnimation,800,1,ped,"ped","CAR_close_RHS",500,false)
		unloadTimer2 = setTimer(function()
			local theVeh = getPedOccupiedVehicle(localPlayer)
			setVehicleDoorOpenRatio(theVeh,3,0,0)
			local tx,ty,tz = getElementPosition(theVeh)
			local px,py,pz = getElementPosition( ped )
			local angle = ( 360 - math.deg ( math.atan2 ( ( tx - px ), ( ty - py ) ) ) ) % 360 
			setPedRotation( ped, angle )
			setPedAnimation(ped,"ON_LOOKERS", "wave_loop",2000,true)
			ped = false
		end,1200,1)
		payTimer = setTimer(triggerServerEvent,4500,1,"GTItaxi.pay", resourceRoot)
		destroyElement(marker)
		destroyElement(blip)
		if isTimer(missTimer) then killTimer(missTimer) end
		currentCount = 0
		currentMinute = 0
	end
end

viewCount2 = "0"
viewCount3 = "0"
function missionTimer()
	if currentCount > 0 then
		currentCount = currentCount - 1
	end
    if currentCount == 0 and currentMinute > 0 then
		currentCount = 59
		currentMinute = currentMinute - 1
	end
	if currentCount == 0 and currentMinute == 0 then
		exports.GTIhud:dm("Time's up! Your pay will be cut by 50%.", 255, 0, 0)
		payammount = payammount/2
		exports.GTIhud:drawStat("TaxiID", "cargo", cargo.."KG", 255, 200, 0)
		killTimer(missTimer)
	end
        if currentCount < 10 then
            viewCount3 = tostring( "0"..currentCount)
            exports.GTIhud:drawStat("TaxiID","Time left:",viewCount2..":"..viewCount3, 255, 0, 0)
        else
            viewCount3 = tostring( currentCount)
			exports.GTIhud:drawStat("TaxiID","Time left:",viewCount2..":"..viewCount3, 255, 0, 0)
        end
    if currentMinute < 10 then
		viewCount2 = tostring( "0"..currentMinute)
		exports.GTIhud:drawStat("TaxiID","Time left:",viewCount2..":"..viewCount3, 255, 0, 0)
    else
		viewCount2 = tostring( currentMinute)
		exports.GTIhud:drawStat("TaxiID","Time left:",viewCount2..":"..viewCount3, 255, 0, 0)
    end
end

function onJobQuit(job)
    if ( job == "Taxi Driver" ) then 
		if isElement(marker) then destroyElement(marker) end
		if isElement(blip) then destroyElement(blip) end
		if isElement(Nmarker) then destroyElement(Nmarker) end
		if isElement(Nblip) then destroyElement(Nblip) end
		if isElement(box) then destroyElement(box) end
		if isTimer(unloadTimer1) then killTimer(unloadTimer1) end
		if isTimer(unloadTimer2) then killTimer(unloadTimer2) end
		if isTimer(unloadTimer3) then killTimer(unloadTimer3) end
		if isTimer(loadTimer1) then killTimer(loadTimer1) end
		toggleControl("enter_exit", true)
		if isTimer(loadTimer2) then killTimer(loadTimer2) end
		if isTimer(loadTimer3) then killTimer(loadTimer3) end
		if isTimer(missTimer) then killTimer(missTimer) end
		if isTimer(payTimer) then killTimer(payTimer) end
		if isTimer(loadTimer4) then killTimer(loadTimer4) end
		if isTimer(loadTimer5) then killTimer(loadTimer5) end
		if isTimer(loadTimer6) then killTimer(loadTimer6) end
		if isTimer(loadTimer7) then killTimer(loadTimer7) end
		if isTimer(unloadTimer4) then killTimer(unloadTimer4) end
		if isTimer(unloadTimer5) then killTimer(unloadTimer5) end
		if isElement(ped1) then destroyElement(ped1) end
		if isElement(ped2) then destroyElement(ped2) end
		if isElement(ped3) then destroyElement(ped3) end
		exports.GTIhud:drawStat("TaxiID", "", "", 255, 200, 0)
		payammount = 0
		cargo = 0
		dist = 0
		currentCount = 0
		currentMinute = 0
	end
end
addEventHandler ("onClientPlayerQuitJob", localPlayer, onJobQuit)

function delelem()
	if (exports.GTIemployment:getPlayerJob(true) == "Taxi Driver") then
		if isElement(marker) then destroyElement(marker) end
		if isElement(blip) then destroyElement(blip) end
		if isTimer(unloadTimer1) then killTimer(unloadTimer1) end
		if isTimer(unloadTimer2) then killTimer(unloadTimer2) end
		if isTimer(unloadTimer3) then killTimer(unloadTimer3) end
		if isTimer(loadTimer1) then killTimer(loadTimer1) end
		if isTimer(loadTimer2) then killTimer(loadTimer2) end
		if isTimer(loadTimer3) then killTimer(loadTimer3) end
		if isTimer(payTimer) then killTimer(payTimer) end
		if isTimer(loadTimer4) then killTimer(loadTimer4) end
		if isTimer(loadTimer5) then killTimer(loadTimer5) end
		if isTimer(loadTimer6) then killTimer(loadTimer6) end
		if isTimer(loadTimer7) then killTimer(loadTimer7) end
		if isTimer(unloadTimer4) then killTimer(unloadTimer4) end
		if isTimer(unloadTimer5) then killTimer(unloadTimer5) end
		exports.GTIhud:drawStat("TaxiID", "", "", 255, 200, 0)
		payammount = 0
		cargo = 0
		dist = 0
		currentCount = 0
		currentMinute = 0
	end
end
addEvent("onClientRentalVehicleHide", true)
addEventHandler ("onClientRentalVehicleHide", root, delelem)
addEventHandler ("onClientPlayerWasted", localPlayer, delelem)
