function goToCar()
        local theVeh = getPedOccupiedVehicle(localPlayer)
        if not isElement(theVeh) then return end
        local cx,cy,cz = getElementPosition(theVeh)
        local dx,dy,dz = getVehicleComponentPosition(theVeh, "door_rf_dummy")
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
