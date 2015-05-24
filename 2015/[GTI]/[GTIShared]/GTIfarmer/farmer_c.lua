farmerZone1 = createColCuboid( -1215.461, -1220.327, 128.218, 96.551, 67.739, 13.490)
--[[
local farmerZone2 = createColCuboid(-1122.410, -1290.260, 126.868, 57.997, 44.900, 13.490)
local farmerZone3 = createColCuboid(-1195.45178, -1064.60535, 128.21875, 188.83837890625, 148.80108642578, 13.490)
--]]
farmerZones = {farmerZone1}--, farmerZone2, farmerZone3}

antiPromSpam = false
dxEnabled = false

local zonelines = {
    -- Zone 1
    { -1118.849, -1220.407, 128.218, -1118.889, -1152.502, 128.218},
    { -1118.889, -1152.502, 128.218, -1215.464, -1152.502, 128.218},
    { -1215.464, -1152.502, 128.218, -1215.462, -1220.328, 128.218},
    { -1118.849, -1220.407, 128.218, -1215.462, -1220.328, 128.218},
    --[[Zone 2
    { -1122.410, -1290.260, 128.2, -1122.304, -1245.267, 128.218},
    { -1122.410, -1290.260, 128.2, -1064.433, -1290.199, 128.218},
    { -1064.433, -1290.199, 128.218, -1064.342, -1245.461, 128.218},
    { -1064.342, -1245.461, 128.218, -1122.304, -1245.267, 128.218},
    --Zone 3
    { -1195.451, -1064.605, 128.218, -1195.451, -915.804, 128.218},
    { -1195.451, -915.804, 128.218, -1006.613, -915.804, 128.218},
    { -1006.613, -1064.605, 128.218, -1006.613, -915.804, 128.218},
    { -1006.613, -1064.605, 128.218, -1195.451, -1064.605, 128.218},
    --]]
}

local farmingRadars = {
    { -1215.461, -1220.327, 96.551, 67.739},
--[[
    { -1122.410, -1290.260, 57.997, 44.900},
    { -1195.45178, -1064.60535, 188.83837890625, 148.80108642578}
--]]
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
        if not dxEnabled then
            addEventHandler ( "onClientPreRender", root, createDXViewer, false)
            dxEnabled = true
        end
        triggerServerEvent("checkFarmerSeeds",root,localPlayer)
    else
        if dxEnabled then
            removeEventHandler ( "onClientPreRender", root, createDXViewer, false)
            dxEnabled = false
        end
    end
end
addEventHandler("onClientResourceStart",resourceRoot,createFarmerGUI)

------------------------------------------------------------------------------------------------------------------------------------------------------
sW, sH = guiGetScreenSize()
rX, rY = 1366, 768
offset = 10
offsetT = 20
resText = 1
plantdivision = {
    ["Bail Farmer"] = 856,
    ["Weed Farmer"] = 3409,
}
plantobject = 856

if sW < rX or sH < rY then
    resText = 1.00
elseif sW >= rX or sH >= rY then
    resText = 1.00
end

currentSeeds = 0
theSeeds = "0"
theMaxQuota = 250

currentPlanted = 0
thePlanted = "0"

currentHarvest = 0
plantsToHarvest = "0"

function createDXViewer()
    --->> Line Drawer
    for index, line in ipairs ( zonelines) do
        if not doesPedHaveJetPack( localPlayer) then
            dxDrawLine3D( line[1], line[2], line[3], line[4], line[5], line[6], tocolor( 255, 255, 0, 255), 20, false)
        end
    end
    --->> Seed Viewer
    if (not isPlayerMapVisible()) then
        if theSeeds ~= nil then
            local seedCBar = theSeeds/10000
            local bbX, bbY, bbSX, bbSY = aToR( 1191, 532+offset, 162, 21, rX, rY)
            local scX, scY, scSX, scSY = aToR( 1194, 535+offset, seedCBar*156, 15, rX, rY)
            local scTX, scTY, scsTX, scsTY = aToR( 1191, 532+offsetT, 1353, 553, rX, rY)
            dxDrawRectangle(bbX, bbY, bbSX, bbSY, tocolor(0, 0, 0, 200), false)
            dxDrawRectangle(scX, scY, scSX, scSY, tocolor(139, 138+offset, 138, 200), false)
            dxDrawText(theSeeds.."/10000 Seeds", scTX, scTY, scsTX, scsTY, tocolor(254, 254, 254, 200), resText, "default", "center", "center", false, false, false, false, false)
        end
        --->> Harvest Viewer
        if not getElementData(localPlayer, "drawHarvestLeft") then
            if thePlanted ~= nil then
                local screenW, screenH = guiGetScreenSize()
                local screenW = screenW - 100
                local curPl = seedsPlanted[localPlayer] or 0
                --->> Seeds Planted
                local seedBar = thePlanted/50
                local bX, bY, sBX, sBY = aToR( 1191, 562+offset, 162, 21, rX, rY)
                local spX, spY, sPX, sPY = aToR( 1194, 565+offset, seedBar*156, 15, rX, rY)
                local sTX, sTY, ssTX, ssTY = aToR( 1191, 562+offsetT, 1353, 583, rX, rY)
                dxDrawRectangle(bX, bY, sBX, sBY, tocolor(0, 0, 0, 200), false) -- Black Back
                dxDrawRectangle(spX, spY, sPX, sPY, tocolor(255, 225, 25, 200), false) --Yellow Progress Bar
                dxDrawText( thePlanted.."/50 Seeds Planted", sTX, sTY, ssTX, ssTY, tocolor(127, 110, 0, 200), resText, "default", "center", "center", false, false, false, false, false)
                --[[ Seed Quota
                local quotaBar = theQuota/theMaxQuota
                local bbX, bbY, sbBX, sbBY = aToR( 1191, 590+offset, 162, 21, rX, rY)
                local sqX, sqY, sQX, sQY = aToR( 1194, 593+offset, quotaBar*156, 15, rX, rY)
                local sqTX, sqTY, sQTX, sQTY = aToR( 1191, 590+offsetT, 1353, 611, rX, rY)
                dxDrawRectangle(bbX, bbY, sbBX, sbBY, tocolor(0, 0, 0, 200), false)
                dxDrawRectangle(sqX, sqY, sQX, sQY, tocolor(25, 252, 254, 200), false)
                dxDrawText( theQuota.."/"..tostring(theMaxQuota).." Seed Quota", sqTX, sqTY, sQTX, sQTY, tocolor(0, 127, 128, 200), resText, "default", "center", "center", false, false, false, false, false)
				--]]
                --->> Notification
                local nX, nY, nsX, nsY = aToR( 1134, 629+offset, 1353, 670, rX, rY)
                if curPl == 0 and tonumber(theQuota) > 100 then
                    dxDrawBorderedText("Use a tractor to plant seeds", 1, nX, nY, nsX, nsY, tocolor(25, 252, 254, 200), resText+0.23, "default-bold", "right", "center", false, false, false, false, false)
                elseif tonumber(theQuota) > 0 then
                    dxDrawBorderedText("Drop off your quota using a walton or continue farming", 1, nX, nY, nsX, nsY, tocolor(25, 252, 254, 200), resText+0.23, "default-bold", "right", "center", false, false, false, false, false)
                else
                    dxDrawBorderedText("Use a combine harvester to harvest bails", 1, nX, nY, nsX, nsY, tocolor(25, 252, 254, 200), resText+0.23, "default-bold", "right", "center", false, false, false, false, false)
                end
            end
        end
        --->> Plants To Harvest
        if getElementData(localPlayer, "drawHarvestLeft") then
            if currentHarvest > 0 then
                local screenW, screenH = guiGetScreenSize()
                local screenW = screenW - 100
                dxDrawText("Plants to harvest: "..plantsToHarvest, screenW, screenH+60, screenW+10, screenH/2, tocolor(255, 255, 0, 255), 1.25, "sans", "center", "center", false, false, true, false, false)
            end
        end
    end
end

function setSeeds(seeds)
    currentSeeds = math.floor(seeds) or 0
    if currentSeeds <= 0 then currentSeeds = 0 end
    theSeeds = tostring(currentSeeds)
end
addEvent("placeSeeds",true)
addEventHandler("placeSeeds",root,setSeeds)

function fixFarmerLogin()
    if getElementData( localPlayer, "job") == "Farmer" then
        currentPlanted = 0
        thePlanted = "0"
        if not dxEnabled then
            addEventHandler( "onClientPreRender", root, createDXViewer)
            dxEnabled = true
        end
    else
        if dxEnabled then
            removeEventHandler( "onClientPreRender", root, createDXViewer)
            dxEnabled = false
        end
    end
end
addEvent("fixFarmerLogin", true)
addEventHandler("fixFarmerLogin",root,fixFarmerLogin)

-- ^ Fixes #4170?..


-------------------------------------------------------------------------------------------------------------------------------------------------

function getDivision( theDivision)
    local object = plantdivision[tostring(theDivision)]
    plantobject = tonumber(object)
end
addEvent( "setDivisionObject", true)
addEventHandler( "setDivisionObject", root, getDivision)

--------------------------
currentQuota = 0
theQuota = "0"

function setBailQuota(quota, maxQuota)
    --outputDebugString("client"..quota)
    --outputDebugString("client"..maxQuota)
    currentQuota = math.floor(quota) or 0
    if currentQuota <= 0 then currentQuota = 0 end
    theQuota = tostring(currentQuota)
    theMaxQuota = maxQuota
end
addEvent("setBailQuota",true)
addEventHandler("setBailQuota",root,setBailQuota)

--------------------------

function aToR( X, Y, sX, sY, bxb, byb)
    local sW, sH = guiGetScreenSize()
    local xd = X/rX or X
    local yd = Y/rY or Y
    local xsd = sX/rX or sX
    local ysd = sY/rY or sY
    return xd*sW, yd*sH, xsd*sW, ysd*sH
end

function plants2Harvest(amount)
    currentHarvest = math.floor(amount)
    if currentHarvest <= 0 then currentHarvest = 0 end
    if currentHarvest >= 50 then currentHarvest = 50 end
    plantsToHarvest = tostring(currentHarvest)
end
addEvent("harvestPlants",true)
addEventHandler("harvestPlants",root,plants2Harvest)

---------------------

--Seeds

seedsMarker11 = createMarker (-1059.752, -1211.178, 128.218, "cylinder", 1, 255, 255, 0, 200) -- Seeds Location 1
seedsMarker1 = createColTube( -1059.752, -1211.178, 128.218, 1, 2)

farmSMarkers = {seedsMarker1}

function createSeedGui ()
    local screenW, screenH = guiGetScreenSize()
    seedsGUI = guiCreateWindow(screenW - 184 - 10, (screenH - 237) / 2, 184, 237, "Buy Seeds", false)
    guiWindowSetSizable(seedsGUI, false)
    guiSetVisible( seedsGUI, false)
    seeds1Radio = guiCreateRadioButton(10, 38, 164, 15, "100 Seed - $500", false, seedsGUI)
    seeds2Radio = guiCreateRadioButton(10, 63, 164, 15, "200 Seeds - $1,000", false, seedsGUI)
    seeds3Radio = guiCreateRadioButton(10, 88, 164, 15, "500 Seeds - $2,500", false, seedsGUI)
    seeds4Radio = guiCreateRadioButton(10, 113, 164, 15, "1000 Seeds - $5,000", false, seedsGUI)
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

addEventHandler("onClientPlayerWasted", localPlayer,
function()
    guiSetVisible(seedsGUI,false)
    showCursor(false)
end)

addEventHandler("onClientGUIClick",root,
function()
    if source == closeSeedGUI then
        triggerEvent("closeSeedWindow",localPlayer)
    elseif source == buySeedsButton then
        if getPlayerMoney() ~= 0 or getPlayerMoney() > 0 then
            if guiRadioButtonGetSelected( seeds1Radio) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 100, 500)
            elseif guiRadioButtonGetSelected( seeds2Radio) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 200, 1000)
            elseif guiRadioButtonGetSelected( seeds3Radio) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 500, 2500)
            elseif guiRadioButtonGetSelected( seeds4Radio) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 1000, 5000)
            elseif guiRadioButtonGetSelected( seeds5Radio) then
                triggerEvent("setBuyDelay",localPlayer)
                giveSeeds( 2000, 10000)
            end
        else
            exports.GTIhud:dm( "You do not have enough money.", 255, 0, 0)
        end
    end
end
)

function giveSeeds( amount, cost)
    if amount then
        triggerServerEvent("giveTheSeeds", localPlayer, amount, cost)
    end
end

function takeSeeds( amount)
    if amount then
        triggerServerEvent("takeTheSeeds", localPlayer, amount)
    end
end
--------------------

function onJobQuit( job )
    if ( job == "Farmer" ) then
    triggerEvent("closeSeedWindow", localPlayer)
end
end
addEventHandler ("onClientPlayerQuitJob", localPlayer, onJobQuit)
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
