------------------------------------------------->>
-- PROJECT:     Grand Theft International
-- RESOURCE:    GTIhelmet/client.lua
-- TYPE:        Clientside
-- AUTHOR:      Diego Hernandez (diegonese)
-- RIGHTS:      Copyright GTI (C) 2014/2015 
------------------------------------------------->>

local camX, camY, camZ, lookAtX, lookAtY, lookAtZ, roll, fov  = 1096.9024658203, -1435.8723144531, 16.628829956055, 1096.9024658203, -1335.8914794922, 18.585626602173, 0, 70
local itemPosX, itemPosY, itemPosZ = 1097.2, -1435.073, 16.664
local thePed = createPed(217, 1100.627, -1442.958, 15.797, 90)
setElementFrozen(thePed, true)
addEventHandler("onClientPedDamage", thePed, cancelEvent)


--  Create the GUIs
------------------>>

-- Shop GUI:
GTIhelmet = {    gridlist = {},    staticimage = {},    label = {}}
GTIhelmet.staticimage[1] = guiCreateStaticImage(0.08, 0.15, 0.37, 0.61, "files/zipXpress.png", true)
local font = guiCreateFont("font.ttf", 9)
GTIhelmet.label[1] = guiCreateLabel(0.30, 0.91, 0.09, 0.03, "BUY", true, GTIhelmet.staticimage[1])
guiSetFont(GTIhelmet.label[1], font)
guiLabelSetColor(GTIhelmet.label[1], 70, 70, 70)
GTIhelmet.label[2] = guiCreateLabel(0.57, 0.91, 0.15, 0.04, "CLOSE", true, GTIhelmet.staticimage[1])
guiSetFont(GTIhelmet.label[2], font)
guiLabelSetColor(GTIhelmet.label[2], 70, 70, 70)

GTIhelmet.gridlist[1] = guiCreateGridList(0.09, 0.54, 0.80, 0.20, true, GTIhelmet.staticimage[1])
guiGridListAddColumn(GTIhelmet.gridlist[1], "Item", 0.7)
guiGridListAddColumn(GTIhelmet.gridlist[1], "Price", 0.2)
for i = 1, 4 do
    guiGridListAddRow(GTIhelmet.gridlist[1])
end
guiGridListSetItemText(GTIhelmet.gridlist[1], 0, 1, "1. Green motorcycle helmet", false, false)
guiGridListSetItemText(GTIhelmet.gridlist[1], 0, 2, "$10.000", false, false) -- Price
guiGridListSetItemText(GTIhelmet.gridlist[1], 1, 1, "2. Red motorcycle helmet", false, false)
guiGridListSetItemText(GTIhelmet.gridlist[1], 1, 2, "$10.000", false, false) -- Price
guiGridListSetItemText(GTIhelmet.gridlist[1], 2, 1, "3. Blue motorcycle helmet", false, false)
guiGridListSetItemText(GTIhelmet.gridlist[1], 2, 2, "$10.000", false, false) -- Price
guiGridListSetItemData(GTIhelmet.gridlist[1], 0, 1, 3903)
guiGridListSetItemData(GTIhelmet.gridlist[1], 1, 1, 3899)
guiGridListSetItemData(GTIhelmet.gridlist[1], 2, 1, 3902)

GTIhelmet.label[3] = guiCreateLabel(0.05, 0.26, 0.88, 0.20, "Welcome to ZIPxpress. \nHere you can buy helmets for your motorcycles. Helmets \nhelp you getting only 50% of the damage if you're on a \nmotorbike. You can use  the command '/helmet' to wear or \ntake it off. We also offer cheap and perfect prices.", true, GTIhelmet.staticimage[1])
GTIhelmet.label[4] = guiCreateLabel(0.11, 0.49, 0.75, 0.03, "", true, GTIhelmet.staticimage[1])
guiSetFont(GTIhelmet.label[3], "default-small")
guiSetFont(GTIhelmet.label[4], "default-small")
guiLabelSetColor(GTIhelmet.label[4], 150, 0, 0)
guiLabelSetHorizontalAlign(GTIhelmet.label[3], "center", false)    
guiLabelSetHorizontalAlign(GTIhelmet.label[4], "center", false)    

guiSetVisible(GTIhelmet.staticimage[1], false)


-- Confirmation GUI:
confirmation = {    button = {},    window = {},    staticimage = {},    label = {}}
local sX, sY = guiGetScreenSize()
local wX, wY = 337, 112
local x, y = (sX/2)-(wX/2), (sY/2)-(wY/2)

confirmation.window[1] = guiCreateWindow(x, y, wX, wY, "Confirmation", false)
guiWindowSetSizable(confirmation.window[1], false)

confirmation.label[1] = guiCreateLabel(54, 31, 263, 34, "Are you sure you want to buy\n ..element..for $10.000?", false, confirmation.window[1])
guiLabelSetHorizontalAlign(confirmation.label[1], "center", false)
confirmation.button[1] = guiCreateButton(74, 78, 100, 25, "Yes", false, confirmation.window[1])
confirmation.button[2] = guiCreateButton(217, 78, 100, 25, "No", false, confirmation.window[1])
confirmation.staticimage[1] = guiCreateStaticImage(11, 31, 43, 37, "files/warning.png", false, confirmation.window[1])    
guiSetVisible(confirmation.window[1], false)

--  Miscellaneous 
------------------>>
local markers = {
    {1098.953, -1442.919, 14.797}, -- Verona Mall
}

function createMarkers()
    for i, v in ipairs (markers) do
        shopMarkers = createMarker(v[1], v[2], v[3], "cylinder", 0.8, 255, 255, 255, 100)
        shopCols = createColTube( v[1], v[2], v[3], 0.50, 1.50)
        blips = createBlip ( v[1], v[2], v[3],  45, _, _, _, _, _, _, 450 )
        addEventHandler("onClientColShapeHit", shopCols, enterShop)
    end
end
addEventHandler("onClientResourceStart", resourceRoot, createMarkers)

function updateObjectRotation()
    if not isElement(object) then 
        removeEventHandler("onClientPreRender", root, updateObjectRotation)
    else
    local rotX, rotY, rotZ = getElementRotation(object)
    setElementRotation(object, 0, 0, rotZ+1.5)
    end 
end

addEventHandler("onClientMouseEnter", root, function ()
    if (source == GTIhelmet.label[2]) or (source == GTIhelmet.label[1]) then
        guiLabelSetColor(source, 155, 0, 0)
    end
end)

addEventHandler("onClientMouseLeave", root, function ()
    if (source == GTIhelmet.label[2]) or (source == GTIhelmet.label[1]) then
        guiLabelSetColor(source, 70, 70, 70)
    end
end)

function loadObjects ()
    txd1 = engineLoadTXD('files/MatClothes.txd')
    col1 = engineLoadCOL('files/MotorcycleHelmet4.col') -- blue
    dff1 = engineLoadDFF('files/MotorcycleHelmet4.dff', 0)
    engineImportTXD(txd1,3902)
    engineReplaceCOL(col1, 3902)
    engineReplaceModel(dff1, 3902)
    
    txd2 = engineLoadTXD('files/MatClothes.txd')
    col2 = engineLoadCOL('files/MotorcycleHelmet5.col') -- Green
    dff2 = engineLoadDFF('files/MotorcycleHelmet5.dff', 0)
    engineImportTXD(txd2,3903)
    engineReplaceCOL(col2, 3903)
    engineReplaceModel(dff2, 3903)
    
    txd3 = engineLoadTXD('files/MatClothes.txd')
    col3 = engineLoadCOL('files/MotorcycleHelmet1.col') -- RED
    dff3 = engineLoadDFF('files/MotorcycleHelmet1.dff', 0)
    engineImportTXD(txd3,3899)
    engineReplaceCOL(col3, 3899)
    engineReplaceModel(dff3, 3899)  
end
addEventHandler("onClientResourceStart", resourceRoot, loadObjects)

local buyCompletionC
function conditions(buyCompletion)
    buyCompletionC = buyCompletion
    --outputChatBox("Received: "..buyCompletionC.."")   
end
addEvent("GTIhelmets.buyCompletion", true)
addEventHandler("GTIhelmets.buyCompletion", root, conditions)


function getHelmetColor(accData)
    if tostring(accData) == "Blue" or tostring(accData) == "Green" or tostring(accData) == "Red" then
        guiSetText(GTIhelmet.label[4], "You currently have: "..tostring(accData).." Motorcycle Helmet")
    else
        guiSetText(GTIhelmet.label[4], "You currently don't have any motorcycle helmet")
    end
end
addEvent("GTIhelmets.onClientGetHelmetColor", true)
addEventHandler("GTIhelmets.onClientGetHelmetColor", root, getHelmetColor)

function backToNormal(thePlayer)
    if thePlayer == localPlayer then
    guiSetVisible(confirmation.window[1], false)
    guiSetVisible(GTIhelmet.staticimage[1], false)
    showCursor(false)
    removeEventHandler("onClientPlayerDamage", localPlayer, cancelEvent)
    setElementFrozen(localPlayer, false)
    setCameraTarget(localPlayer)
    if isElement(object) then destroyElement(object) end
    end
end

--  Shop scripts 
------------------>>
function enterShop(hitElement, dimension)
    if localPlayer == hitElement then
        if getPlayerWantedLevel() == 0 then
        fadeCamera(false)
        setTimer(fadeCamera, 2000, 1, true)
        local visible = guiGetVisible(GTIhelmet.staticimage[1])
        local cursorShowing = isCursorShowing()
        setTimer(guiSetVisible, 2000, 1, GTIhelmet.staticimage[1], not visible)
        setTimer(showCursor, 2000, 1, not cursorShowing)
        setTimer(setCameraMatrix, 2000, 1, camX, camY, camZ, lookAtX, lookAtY, lookAtZ, roll, fov)
        setElementFrozen(localPlayer, true)
        addEventHandler("onClientPlayerDamage", localPlayer, cancelEvent)
        triggerServerEvent("GTIhelmet.onGetHelmetColor", localPlayer)
        else
        outputChatBox("You can't enter this marker while you're wanted.", 255, 0, 0)
        end
    end 
end

function manageButtonClicks(btn)
    if (source == GTIhelmet.gridlist[1]) then -- Gridlist management
        local row, col = guiGridListGetSelectedItem(GTIhelmet.gridlist[1])
        if row == nil then return end
        local objectID = guiGridListGetItemData(GTIhelmet.gridlist[1], row, 1)
        if not objectID then return end     
        if isElement(object) then
            destroyElement(object)
            removeEventHandler("onClientPreRender", root, updateObjectRotation)
        end
        object = createObject(objectID, itemPosX, itemPosY, itemPosZ, 0, 0, 0)
        effects = fxAddDebris( itemPosX, itemPosY, itemPosZ, 30, 155, 255, 155, 0.020, 50)
        addEventHandler("onClientPreRender", root, updateObjectRotation)
        setElementDoubleSided(object, true)
        
    elseif (source == GTIhelmet.label[2]) then -- Closing the GUI.
        backToNormal(localPlayer)
        
    elseif (source == GTIhelmet.label[1]) then -- Buy button
        local row, col = guiGridListGetSelectedItem(GTIhelmet.gridlist[1])
        if row == nil then return end
        local theHelmet = guiGridListGetItemText(GTIhelmet.gridlist[1], row, 1)
        helmetName = string.gsub(theHelmet, "%d%p", "")
        guiSetVisible(confirmation.window[1], true)
        guiBringToFront(confirmation.window[1])
        guiSetText(confirmation.label[1], "Are you sure you want to buy\n ("..helmetName.." ) for $10.000?")
        
    elseif (source == confirmation.button[2]) then -- No.
        guiSetVisible(confirmation.window[1], false)
        
    elseif (source == confirmation.button[1]) then -- Buying a helmet.
        guiSetVisible(confirmation.window[1], false)
        if getPlayerMoney () < 10000 then 
            exports.GTIhud:dm("Sorry, you can't afford this.", 255, 0, 0)
            return
        end

        if string.find(tostring(helmetName), "Red") then
            helmetColor = "Red"
        elseif string.find(tostring(helmetName), "Green") then
            helmetColor = "Green"
        elseif string.find(tostring(helmetName), "Blue") then
            helmetColor = "Blue"
        end
        triggerServerEvent("GTIhelmets.setAccountData", localPlayer, helmetColor, helmetName)       
        --[[setTimer(function()
        if tostring(buyCompletionC) == "true" then
        exports.GTIhud:dm("ZIPxpress: You have successfully bought a ("..helmetName..") for $10.000.", 255, 255, 0)
        exports.GTIhud:drawNote("GTIhelmets.money", "-$10.000", 255, 0, 0, 5000)
        exports.GTIhud:drawNote("GTIhelmets.helmet", "+1"..helmetName.."", 0, 255, 0, 5000)
        backToNormal(localPlayer)
    else
        --outputChatBox("Result: "..buyCompletionC.."")             
        guiSetVisible(confirmation.window[1], false)
        exports.GTIhud:dm("ZIPxpress: You already have got"..helmetName..".", 255, 0, 0)
            end
            end, 500, 1)]]--
  end
end
addEventHandler("onClientGUIClick", GTIhelmet.gridlist[1], manageButtonClicks, false)
addEventHandler("onClientGUIClick", GTIhelmet.label[2], manageButtonClicks, false)
addEventHandler("onClientGUIClick", GTIhelmet.label[1], manageButtonClicks, false)
addEventHandler("onClientGUIClick", confirmation.button[2], manageButtonClicks, false)
addEventHandler("onClientGUIClick", confirmation.button[1], manageButtonClicks, false)

function drawNotesonBuy(player, helmetName)
    if (player == localPlayer) then
        exports.GTIhud:dm("ZIPxpress: You have successfully bought a ("..helmetName..") for $10.000.", 255, 255, 0)
        exports.GTIhud:drawNote("GTIhelmets.money", "-$10.000", 255, 0, 0, 5000)
        exports.GTIhud:drawNote("GTIhelmets.helmet", "+1"..helmetName.."", 0, 255, 0, 5000)
        backToNormal(localPlayer)
    end    
end
addEvent("GTIhelmets.DrawNotes", true)
addEventHandler("GTIhelmests.DrawNotes", root, drawNotesonBuy)

function helmetDamage(attacker, attackerweapon, bodypart, loss)
    --outputChatBox(loss)
    if getElementData(source, "wearingHelmet") then
        cancelEvent()
        setTimer(function(source)
            if getElementType(attacker) == "player" then
                newDmg = math.ceil(loss)/2
            elseif getElementType(attacker) == "vehicle" then
                newDmg = math.ceil(loss)/4
            end
            --local shouldBe = getElementHealth(source) - math.ceil(loss)/2
            --outputChatBox("New damage: "..newDmg.." -- Loss: "..loss.."")
            setElementHealth(source, getElementHealth(source)-newDmg)
            --[[outputChatBox("Health should be : "..shouldBe..", Health is: "..getElementHealth(source).."")
            outputChatBox("Health after losing health:" ..getElementHealth(source))]]
        end, 800, 1, source)
    end
end
addEventHandler("onClientPlayerDamage", root, helmetDamage)

function exploit()
    triggerServerEvent("GTIhelmets.fixExploit", localPlayer)
end
addEventHandler("onClientRender", root, exploit)