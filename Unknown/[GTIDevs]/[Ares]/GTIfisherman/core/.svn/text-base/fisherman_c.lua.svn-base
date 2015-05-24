------------------------------------------------------------------------------------
--  PROJECT:     Grand Theft International
--  RIGHTS:      All rights reserved by developers
--  FILE:        GTIfisherman/core/fisherman_c.lua
--  PURPOSE:     Fisherman job, client part.
--  DEVELOPERS:  Tomas Caram (Ares)
------------------------------------------------------------------------------------
fishermanData = {}
fishermanData.kilo = 0
fishermanData.fish = 0
fishermanData.mission = false
fishermanData.fishing = false
fishermanData.working = false
fishermanData.water = false
fishermanObjects = {} 

local tableStrings = {
[1] = "Decrease the speed, the fish are scared.",
[2] = "Something is forcing the fishing rod! Pay attention!",
[3] = "To fish you need to go between 3 and 15 mph.",
[4] = "",
[5] = "The fish were frightened.",
[6] = "Fish Weight",
[7] = "Fishing",
[8] = "You successfully collected ",
[9] = "Unloading",
[10] = "Go to the market to sell your fish.",
[11] = "Fish Cargo",
[12] = "To unload the fish, you need to go slow.",
[13] = "The bucket got damaged and the fish have escaped",
[14] = "You don't have packed fish",
[15] = "You don't have ",-- ..$fish.. fish to sell
[16] = "The fishing line has broken.",
}
local tableItems = {
[1] = "a Crab", 
[2] = "a Tuna", 
[3] = "a Shrimp",
[4] = "some garbage",
[5] = "a Small fish",
[6] = "a Big fish",
}
message = false
function onBoatEnter(player,seat)
    if player == getLocalPlayer() then
    if seat == 0 and getElementModel(source) == 453 and exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
        if fishermanData.fish > 1 then
        destroyElement(fishermanObjects.bucket)
        fishermanData.fire = true
        exports.GTIhud:drawStat("Fisherman_tosell","")
        toggleAllControls(true)
        end
             exports.GTIhud:drawStat("Fisherman_tosell","","")
            startFishermanMision(player)
            if not message then
            exports.GTIhud:dm("To fish you need to go slow, when a fish force the fishing line you will be alerted.",255,200,0) 
            exports.GTIhud:dm("When you have +2kg of fish, you will be able to sell your fish on the market.",255,200,0)
            message = true
            end
        end
    end
end
addEventHandler("onClientVehicleEnter",root,onBoatEnter)

function onGetTheJob(jobName)
    if jobName == "Fisherman" then
        exports.GTIhud:dm("To start fishing rent a Reefer at the port.",255,200,0)   
        Fisher_Timer = setTimer(Fishing,1500,0)
        addEventHandler("onClientPreRender",root,onEnterToTheWaterWithTheBucket)
        addEventHandler("onClientPreRender",root,toggleFire)
    end
end
addEventHandler("onClientPlayerGetJob",root,onGetTheJob) 

function onQuitJob(jobName)
    if jobName == "Fisherman" then
        if isTimer(Fisher_Timer) then
            killTimer(Fisher_Timer)
        end
        removeEventHandler("onClientPreRender",root,onEnterToTheWaterWithTheBucket)
        removeEventHandler("onClientPreRender",root,toggleFire)
    end
end
addEventHandler("onClientPlayerQuitJob",root,onQuitJob)

function onClientResourceStart(res)
	if (not getResourceFromName("GTIemployment") or getResourceState(getResourceFromName("GTIemployment")) ~= "running") then return end
        if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
            Fisher_Timer = setTimer(Fishing,1500,0)
            addEventHandler("onClientPreRender",root,onEnterToTheWaterWithTheBucket)
            addEventHandler("onClientPreRender",root,toggleFire)
        end
end
addEventHandler("onClientResourceStart",resourceRoot,onClientResourceStart)
            
function startFishermanMision(player)
    if player == getLocalPlayer() then
        draws(player,1)
        fishermanData.working = true
    end
end

timeToFish = true
function Fishing()
if (not getResourceFromName("GTIemployment") or getResourceState(getResourceFromName("GTIemployment")) ~= "running") then return end
if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
local x,y,z = getElementPosition(localPlayer) 
if getDistanceBetweenPoints3D(80.580, -1991.171, -1.550,x,y,z) < 50 then return end
if not fishermanData.kilo then
fishermanData.kilo = 0
end
    if fishermanData.working and fishermanData.kilo < 15 then
        if not timeToFish  then return end
            if isPedInVehicle(localPlayer) then
                if isElementInWater(getPedOccupiedVehicle(localPlayer)) and getElementModel(getPedOccupiedVehicle(localPlayer)) == 453 then
                    if math.random(1,2) == 2 then 
                        if (exports.GTIutil:getElementSpeed(getPedOccupiedVehicle(localPlayer),"mph") < 3 or exports.GTIutil:getElementSpeed(getPedOccupiedVehicle(localPlayer),"mph") > 15) then
                            exports.GTIhud:dm(tableStrings[3],255,200,0)
                        return end
                    local vehicle = getPedOccupiedVehicle(localPlayer)
                timeToFish = false
                setTimer(function() timeToFish = true end, math.random(20,35)*1000, 1)
                local WhatFish = math.random(#tableItems)
                exports.GTIhud:dm(tableStrings[2],255,200,0)
                if WhatFish == 6 then
                                setTimer( function () if not isPedInVehicle(localPlayer) then return end 
                                playSound("sound/FishingReel.mp3") 
                                draws(localPlayer,2) 
                                setTimer(Pay,9500,1,localPlayer,WhatFish,bonus)
                            end, 1500,1)
                elseif WhatFish == 4 then 
                                setTimer( function () if not isPedInVehicle(localPlayer) then return end 
                                playSound("sound/FishingReel.mp3") 
                                draws(localPlayer,2)
                                setTimer(function()
                                exports.GTIhud:dm("You have found "..tableItems[WhatFish],255,200,0) end,9500,1)
                            end, 1500,1)
                else
                                setTimer( function () if not isPedInVehicle(localPlayer) then return end 
                                playSound("sound/FishingReel.mp3") 
                                draws(localPlayer,2) 
                                setTimer(Pay,9500,1,localPlayer,WhatFish,bonus)
                            end, 1500,1)
                    end
            end end
        end 
    end 
end
end

function Pay(player,WhatFish,bonus)
    if player == localPlayer then
    local vehicle = getPedOccupiedVehicle(localPlayer)
        if not isPedInVehicle(localPlayer) or not isElement(vehicle) then return end 
            if exports.GTIutil:getElementSpeed(getPedOccupiedVehicle(localPlayer),"km/h") > 15 then     
            exports.GTIhud:dm(tableStrings[5],255,0,0)  
            draws(player,1)
            return end
                theRandomPay = math.random(8,12)/10
                if math.random(1,10) > 9 then
                exports.GTIhud:dm(tableStrings[16],255,0,0)
                return end
                if bonus then
                theRandomPay = math.ceil(theRandomPay *150)
                end
                    exports.GTIhud:dm("You have found "..tableItems[WhatFish],255,200,0) 
                    if fishermanData.kilo > 15-theRandomPay then
                        triggerServerEvent("GTIfisherman.pay",resourceRoot,_,15-fishermanData.kilo)
                        fishermanData.kilo = 15
                        draws(localPlayer,1)
                    else
                        triggerServerEvent("GTIfisherman.pay",resourceRoot,_,1)
                        local currentKilo = fishermanData.kilo or 0 
                        fishermanData.kilo = currentKilo+theRandomPay
                        draws(localPlayer,1) 
                    end
                    if fishermanData.kilo >= 2 then
                        if not isElement(fishermanObjects.marker) and not isElement(fishermanObjects.blip) then
                            fishermanObjects.marker = createMarker(80.580, -1991.171, -1.550,"cylinder",4.5,255,255,0,130)
                            fishermanObjects.blip = createBlip(80.580, -1992.171, 2,41,2,255,255,255,255,0,9999)
                            removeEventHandler("onClientMarkerHit",fishermanObjects.marker,DeliveryMarker_f)
                            addEventHandler("onClientMarkerHit",fishermanObjects.marker,DeliveryMarker_f)
                        end
                    end
    end
end 

function DeliveryMarker_f(player)
    if player == localPlayer then
        if isPedInVehicle(player) then
            local vehicle = getPedOccupiedVehicle(player)
            if not vehicle then return end
                if fishermanData.fishing then return end
                    if fishermanData.kilo < 2 then 
                        exports.GTIhud:dm("To unload the fish you need have +2kg",255,200,0)
                        return  
                    end
                if exports.GTIutil:getElementSpeed(vehicle,"km/h") > 15 then
                    exports.GTIhud:dm(tableStrings[12],255,200,0) 
                    return 
                end
                        if getElementModel(vehicle) == 453 then
                            destroyMarkerAndBlip("no")
                            fishermanData.mission = false
                            setElementFrozen(vehicle,true)
                            toggleControl("enter_exit",false)
                            draws(player,4)
                        if isElement(fishermanObjects.marker) or isElement(fishermanObjects.blip) then
                            destroyElement(fishermanObjects.marker)
                            destroyElement(fishermanObjects.blip)
                        end
                        setTimer ( function()
                                if isElement(vehicle) then
                                setElementFrozen(vehicle,false)
                                local cf = fishermanData.kilo or 0
                                fishermanData.fish = cf
                    --          exports.GTIhud:dm(tableStrings[10],255,200,0)
                                exports.GTIhud:drawStat("Fisherman","")
                                setTimer(function() fishermanData.kilo = 0 end,1500,1)
                                triggerServerEvent("GTIfisherman.removePedFromVehicle",resourceRoot)
                                fishermanData.fire = false
                                toggleControl("aim_weapon",false)
                                setTimer(setElementPosition,1000,1,player,82.744, -1986.669, 1.5)
                                setTimer(setElementRotation,1000,1,player,0,0,269,"default",true)
                                toggleControl("enter_passenger",false)
                                draws(player,6,15)
                                    fishermanObjects.bucket = createObject(2713,0,0,0)
                                    setTimer ( function()
                                    exports.bone_attach:attachElementToBone(fishermanObjects.bucket,localPlayer,11,-0.2,0.05,0,90,90,90) 
                                    toggleControl("enter_exit",false)
                                    toggleControl("enter_passenger",false)          
                                    end, 1500,1)
                                else
                                toggleControl("enter_exit",true)
                                toggleControl("enter_passenger",true)
                                end
                                end, fishermanData.kilo*3500,1)
                            end
                end
    end
end

function draws(player,type,data)
if type == 1 then
    local currentKilo = fishermanData.kilo or 0
exports.GTIhud:drawStat("Fisherman",tableStrings[6],currentKilo.."kg/15kg", 255, 200, 0, 999999999)
        elseif type == 2 then
            exports.GTIhud:drawProgressBar("Fisherman_bar", tableStrings[7], 255, 200, 0, 9500)
            fishermanData.fishing = true
            setTimer(function() fishermanData.fishing = false end,9500,1)
        elseif type == 3 then 
            exports.GTIhud:dm(tableStrings[8]..data.." packed fish ",255,200, 0)
        elseif type == 4 then
            local time = fishermanData.kilo
            exports.GTIhud:drawProgressBar("Fisherman_bar", tableStrings[9], 255, 200, 0, time*3500)
        elseif type == 5 then
            exports.GTIhud:dm(tableStrings[10],255,200,0)
        elseif type == 6 then
            local CurrentKiloToSell = fishermanData.fish or 0
            exports.GTIhud:drawStat("Fisherman_tosell",tableStrings[11],math.floor(CurrentKiloToSell).."kg", 255, 200, 0, 999999999)
        end
end

function cancelMisionWhenHideRentalBoat(player)
    if player == getLocalPlayer() then
        if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" and getElementModel(source) == 453 then
            if fishermanData.fish == 0 then 
                destroyMarkerAndBlip()
                fishermanData.kilo = 0
                fishermanData.fish = 0
                exports.GTIhud:drawStat("Fisherman","") 
                exports.GTIhud:drawStat("Fisherman_tosell","")
            end
        end
    end
end

addEventHandler("onClientRentalVehicleHide",root,cancelMisionWhenHideRentalBoat)
local sx,sy = guiGetScreenSize()
local px,py = 1366,768
local x,y =  (sx/px), (sy/py)
        Font = guiCreateFont("font/Champagne_Limousines.ttf",13.5)
        FishMarket = guiCreateWindow(488, 197, 376, 405, "GTI Fish Market", false)
        guiSetAlpha(FishMarket,1)
        guiSetVisible(FishMarket,false)
        guiWindowSetSizable(FishMarket, false)
        pez = guiCreateStaticImage(123, 42, 137, 144, ":GTIfisherman/images/fish1.png", false, FishMarket)
        SellLabel = guiCreateLabel(0.2, 0.3, 0.38, 0.08, "Sell", true, FishMarket)
        YourLabel = guiCreateLabel(0.73, 0.3, 0.38, 0.08, "Your", true, FishMarket)
        FishLabel = guiCreateLabel(0.31, 0.46, 0.38, 0.08, "Fish", true, FishMarket)
        guiLabelSetHorizontalAlign(FishLabel, "center", false)
        edit = guiCreateEdit(27, 227, 315, 38, "", false, FishMarket)
        guiEditSetMaxLength(edit,4)
        SellButton = guiCreateButton(133, 341, 114, 35, "Sell", false, FishMarket)
        guiSetProperty(SellButton, "NormalTextColour", "FFAAAAAA")
        earnings = guiCreateLabel(32, 281, 300, 32, "Earnings", false, FishMarket)    
        Close = guiCreateLabel(300, 376, 90, 25, "Close", false, FishMarket)    
        KiloLabel = guiCreateLabel(150, 205, 155, 22, "Kilogram", false, FishMarket)    
GUILabels = {Close,earnings,SellLabel,FishLabel,YourLabel,KiloLabel}
for index, value in ipairs (GUILabels) do
guiSetFont(value,Font)
if value ~= Close and value ~= earnings and value ~= KiloLabel then
guiLabelSetColor(value,0,255,0)
elseif value == earnings then
guiLabelSetColor(value,255,0,0)
elseif value == KiloLabel then
guiLabelSetColor(value,0,0,255)
end
end
function destroyMarkerAndBlip(a,b)
    showCursor(false)
    fishermanData.mission = false
    exports.GTIhud:drawProgressBar("Fisherman_bar")
if not a then
    exports.GTIhud:drawStat("Fisherman_tosell","")
    fishermanData.fire = true
end
        if isElement(fishermanObjects.marker) or isElement(fishermanObjects.blip)then
            destroyElement(fishermanObjects.marker)
            destroyElement(fishermanObjects.blip)
        end
if not b then
    if isElement(fishermanObjects.bucket) then
        destroyElement(fishermanObjects.bucket)
        exports.GTIanims:setJobAnimation(localPlayer)
        setPedAnimation(localPlayer)
    end
end
        if isElement(sound) then
            destroyElement(sound)   
        end 
end
addEvent("GTIfisherman.destroyStuff",true)
addEventHandler("GTIfisherman.destroyStuff",resourceRoot,destroyMarkerAndBlip)

function onClientResourceStart()
    for index, value in ipairs (getElementsByType("player")) do
        if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
            toggleAllControls(true)
            fishermanData.kilo = 0
            fishermanData.fish = 0
        end
    end
end
addEventHandler("onClientResourceStart",resourceRoot,onClientResourceStart)

function onEnterToTheWaterWithTheBucket()
if (not getResourceFromName("GTIemployment") or getResourceState(getResourceFromName("GTIemployment")) ~= "running") then return end
    if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
            if isElement(fishermanObjects.bucket) then
                if isElementInWater(localPlayer) then
                    if not fishermanData.water then
                        fishermanData.water = true
                        exports.GTIhud:dm(tableStrings[13],255,200,0)
                            if isElement(fishermanObjects.bucket) then
                                destroyElement(fishermanObjects.bucket)
                            end
                        toggleAllControls(true)
                        fishermanData.kilo = 0
                        fishermanData.fish = 0
                        fishermanData.fire = true
                        exports.GTIhud:drawStat("Fisherman_tosell")
                        exports.GTIhud:drawStat("Fisherman")
                        end
                else
                    fishermanData.water = false         
                end
            end
        end 
        end
local PedPositions = {
{128.345, -1897.121, 1.920, 213},
{124.522, -1897.121, 1.920, 18},
{118.814, -1897.121, 1.920, 19},
}
-- Syntax: X,Y,Z, Skin
for index,value in ipairs (PedPositions) do
    local x, y, z,skin = PedPositions[index][1], PedPositions[index][2], PedPositions[index][3], PedPositions[index][4]
    ped = createPed(skin,x,y,z,178)
    addEventHandler("onClientPedDamage",ped,function()cancelEvent()end)
    setElementID(ped,index+10)
end

function onClientMarkerHit(player)
    if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
        if player == localPlayer then
            local x,y,z = getElementPosition(player)
                if z < 4 then
                    if not isPedInVehicle(player) then
                        local IDMarker = getElementID(source) 
                        local thePed = getElementByID(IDMarker+10)
                        setPedAnimation(thePed,"GANGS","prtial_gngtlkB")
                        guiSetVisible(FishMarket,true)
                        guiSetInputEnabled(true)
                        centerWindow(FishMarket)
                        guiSetText(edit,"")
                        guiSetText(earnings,"Earnings:")
                        showCursor(true)
                    end
                end
        end
    end
end
function onClientMarkerLeave(player)
    if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
        if player == localPlayer then
            local IDMarker = getElementID(source) 
            local thePed = getElementByID(IDMarker+10)
            setPedAnimation(thePed)
            guiSetVisible(FishMarket,false)
            guiSetInputEnabled(false)
            showCursor(false)
        end
    end
end

local MarkerPositions = {
{128.524, -1899.240, 1.920,1},
{124.862, -1899.240, 1.920, 1},
{118.965, -1899.240, 1.920,1},
}


for indexx,valuee in ipairs (MarkerPositions) do
    local x, y, z,size = MarkerPositions[indexx][1], MarkerPositions[indexx][2], MarkerPositions[indexx][3], MarkerPositions[indexx][4]
    marker_shop = createMarker(x,y,z,"cylinder",size,0,0,255,100)
    setElementID(marker_shop,indexx)
    addEventHandler("onClientMarkerHit",marker_shop,onClientMarkerHit)
    addEventHandler("onClientMarkerLeave",marker_shop,onClientMarkerLeave)
end

addEventHandler("onClientGUIChanged", edit, function()
    local string = guiGetText(source)
        if tonumber(string) == nil then
            guiSetText(source, string.gsub(string, "%a", ""))
        else
            local newstring = guiGetText(source)
            local newvalue = tonumber(math.floor(newstring))*298
            guiSetText(earnings,"Earnings: $"..exports.GTIutil:tocomma(math.floor(newvalue)).." + bonus")
        end
end
)

addEventHandler( "onClientMouseEnter", Close, function()
    if source == Close then
        guiLabelSetColor( source, 255, 255, 0)
    end
end
)

addEventHandler( "onClientMouseLeave", Close,function()
    if source == Close then
        guiLabelSetColor( source, 255, 255, 255)
    end
end
)

addEventHandler("onClientGUIClick",Close,function()
    if source == Close then
        guiSetVisible(FishMarket,false)
        guiSetInputEnabled(false)
        showCursor(false)
    end
end
)

addEventHandler("onClientGUIClick",SellButton, function ()
    if source == SellButton then
        local Data = fishermanData.fish or 0
            if Data <= 1 then 
                exports.GTIhud:dm(tableStrings[14],255,200,0) return end
                local Market = guiGetText(edit) or 0
                    if tonumber(Market) == nil or tonumber(Market) <= 1 then return end
                        if tonumber(Market) > Data then
                            exports.GTIhud:dm(tableStrings[15]..tonumber(Market).." kilograms of fish.",255,200,0)
                        else
                            fishermanData.fish = fishermanData.fish - math.floor(Market)
                            triggerServerEvent("GTIfisherman.pay",resourceRoot,math.floor(Market))
                            draws(localPlayer,6,15)
                            if isElement(fishermanObjects.bucket) then
                                    exports.GTIanims:setJobAnimation(localPlayer)
                                    exports.GTIanims:setJobAnimation(localPlayer, "CARRY", "putdwn", 1000, true, false, false, false)                                   
                                    setTimer(destroyElement,800,1,fishermanObjects.bucket)
                                    toggleAllControls(true)
                                    fishermanData.fire = true
                                    setTimer ( function()
                                        exports.GTIanims:setJobAnimation(localPlayer)
                                    end,800,1)
                        end
            end end
    end
)
function toggleFire()
    if (not getResourceFromName("GTIemployment") or getResourceState(getResourceFromName("GTIemployment")) ~= "running") then return end
        if exports.GTIemployment:getPlayerJob(localPlayer, true) == "Fisherman" then
            if fishermanData.fire == false then
                toggleControl("fire",false)
            else
                toggleControl("fire",true)
            end
        end
end


function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end
