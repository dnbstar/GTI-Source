--Farmer Quota
---------------------
quotaPos = {}
quotaPos[1] = {x=-388.998, y=-1407.202, z=24.215}
quotaPos[2] = {x=-380.523, y=-1454.020, z=24.726}
quotaPos[3] = {x=-1447.021, y=-1479.301, z=100.759}
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
    removeEventHandler("onClientVehicleExplode", source ,onWaltonExit)
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

function onWaltonEnter(_, seat)
    if getElementData(localPlayer,"job") == "Farmer" then
        local theVehicle = getPedOccupiedVehicle(localPlayer)
        if theVehicle and getVehicleType(theVehicle) == "Automobile" then
            local vehModel = getElementModel( theVehicle)
            if vehModel == 478 then
                if seat == 0 then
                --
                if isElement(deliveryMarker) then   destroyElement(deliveryMarker) deliveryMarker = false end
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
end
addEventHandler("onClientPlayerVehicleEnter",localPlayer, onWaltonEnter)
