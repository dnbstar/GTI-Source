------------------------------------------------->>
-- PROJECT:     Grand Theft International
-- RESOURCE:    GTIhelmet/server.slua
-- TYPE:        Serverside
-- AUTHOR:      Diego Hernandez (diegonese)
-- RIGHTS:      Copyright GTI (C) 2014/2015 
------------------------------------------------->>

--  Utilities
------------------>>

local buyCompletion
local helmet = {}

function setData(helmetColor, helmetName)
    local account = getPlayerAccount(client)
    local accData = tostring(exports.GTIaccounts:GAD(account, "helmet.color")) 
    local helmetColor = tostring(helmetColor)
    --local color = exports.GTIaccounts:invGet(account, "helmet.color")
    
    if (helmetColor == accData) then
        exports.GTIhud:dm("You already got this helmet!", client, 255, 0, 0)
        return
    end
    
    if string.lower(accData) == string.lower(helmetColor) then
        buyCompletion = "false"
    else
        buyCompletion = "true"
    end
    if buyCompletion == "true" then
        exports.GTIaccounts:SAD(account, "helmet.has", true)
        exports.GTIaccounts:SAD(account, "helmet.color", helmetColor) 
        exports.GTIbank:TPM(client, 10000, "Bought a helmet for $10000")
        triggerClientEvent("GTIhelmets.DrawNotes", client, client, helmetName)
    end
    triggerClientEvent(client, "GTIhelmets.buyCompletion", client, buyCompletion)
end
addEvent("GTIhelmets.setAccountData", true)
addEventHandler("GTIhelmets.setAccountData", root, setData)

function getHelmetColor()
    local account = getPlayerAccount(client)
    local accData = tostring(exports.GTIaccounts:GAD(account, "helmet.color")) 
    triggerClientEvent("GTIhelmets.onClientGetHelmetColor", resourceRoot, accData)
end
addEvent("GTIhelmet.onGetHelmetColor", true)
addEventHandler("GTIhelmet.onGetHelmetColor", root, getHelmetColor)

for i,v in ipairs (getElementsByType("player") or {}) do
    setElementData(v, "wearingHelmet", false)
end

local bikeModels = {[581] = true, [509] = true, [481] = true, [462] = true, [521] = true, [463] = true, [510] = true, [522] = true, [461] = true, [448] = true, [468] = true, [586] = true, [523] = true}
function wearHelmet(thePlayer, command)
    local account = getPlayerAccount(thePlayer)
    local colorData = exports.GTIaccounts:GAD(account, "helmet.color") 
    local helmetData = exports.GTIaccounts:GAD(account, "helmet.has")

    local theVehicle = getPedOccupiedVehicle(thePlayer)
    local x, y, z = getElementPosition(thePlayer)
    
    if not theVehicle then
        outputChatBox("You need to be in a bike to use this command", thePlayer, 255, 0, 0)
        return
    end
    
    local vehicleModel = getElementModel(theVehicle)
    
    if not bikeModels[vehicleModel] then -- If it's a bike.
        outputChatBox("You need to be in a bike to use this command", thePlayer, 255, 0, 0)
        return
    end
    
    if not helmetData then
        exports.GTIhud:dm("You don't own a helmet.", thePlayer, 255, 0, 0)
        return
    end
    
    if tostring(colorData) == "Red" then
        objectID = 3899
    elseif tostring(colorData) == "Green" then
        objectID = 3903
    elseif tostring(colorData) == "Blue" then
        objectID = 3902
    end
    
    if getElementData(thePlayer, "wearingHelmet") == false then
        helmet[thePlayer] = createObject(objectID, x, y, z, 0, 0, 0)
        exports.bone_attach:attachElementToBone(helmet[thePlayer], thePlayer, 1, 0, 0.02, 0.04, 0, 10, 90)
        setElementData(thePlayer, "wearingHelmet", true)
        addEventHandler("onVehicleExit", theVehicle, onVehicleExit)
        addEventHandler("onElementDestroy", theVehicle, onVehicleDestroy)
        addEventHandler("onPlayerWasted", thePlayer, onPlayerWasted)
        addEventHandler("onPlayerQuit", thePlayer, onPlayerQuit)
    elseif getElementData(thePlayer, "wearingHelmet") == true then
        if isElement(helmet[thePlayer]) then destroyElement(helmet[thePlayer]) end
        removeEventHandler("onVehicleExit", theVehicle, onVehicleExit)
        removeEventHandler("onElementDestroy", theVehicle, onVehicleDestroy)
        removeEventHandler("onPlayerWasted", thePlayer, onPlayerWasted)
        removeEventHandler("onPlayerQuit", thePlayer, onPlayerQuit)
        setElementData(thePlayer, "wearingHelmet", false)
    end
end
addCommandHandler("helmet", wearHelmet)

function onVehicleExit(thePlayer, seat, jacker)
    if getElementData(thePlayer, "wearingHelmet") == true then
        if source == this then
            if isElement(helmet[thePlayer]) then destroyElement(helmet[thePlayer]) end
            setElementData(thePlayer, "wearingHelmet", false)
        end
    end
end

function onVehicleDestroy()
    if getElementType(source) == "vehicle" then
    local model = getElementModel(source)
    
    if source == this then
    if bikeModels[model] then
    
    local occupants = getVehicleOccupants(source)
    
    for k,v in pairs (occupants) do
        if getElementData(v, "wearingHelmet") == true then
        if isElement(helmet[v]) then destroyElement(helmet[v]) end
        setElementData(v, "wearingHelmet", false)
        end
    end     
            end
        end
    end
end

function onPlayerWasted()
    if getElementData(source, "wearingHelmet") == true then
    if source == this then
    if isElement(helmet[source]) then 
        destroyElement(helmet[source])
        setElementData(source, "wearingHelmet", false)
            end
        end
    end
end

function onPlayerQuit()
    if getElementData(source, "wearingHelmet") == true then
    if source == this then
    if isElement(helmet[source]) then 
        destroyElement(helmet[source])
        setElementData(source, "wearingHelmet", false)
            end
        end
    end
end

function exploit()
    if not isPedInVehicle(client) and getElementData(client, "wearingHelmet") == true  then 
            setElementData(client, "wearingHelmet", false)
            if isElement(helmet[client]) then destroyElement(helmet[client]) end
    end
end
addEvent("GTIhelmets.fixExploit", true)
addEventHandler("GTIhelmets.fixExploit", root, exploit)

