-----------------------------------------------
-- What     : policeRadio_s.lua
-- Type     : Server
-- For      : Grand Theft International
-- Author   : Diego aka diegonese
-- All rights reserved to GTI 2014/2015 (C)
-----------------------------------------------

-- Variables
------------------->>
local policeCruisers = {[402]=true, [415]=true, [426]=true, [427]=true, [490]=true, [528]=true, [523]=true, [541]=true, [598]=true, [596]=true, [597]=true, [599]=true, [601]=true }
local disableC = {}
local disable911 = {}
local timer = {}
local timer2 = {}
local crimesTable = {[12]=true, [13]=true, [14]=true, [15]=true, [16]=true, [24]=true, [25]=true, [19]=true, [20]=true, [22]=true, [23]=true    }
local timer3 = {}
local timer4 = {}
local nineOneOneMsg = {}
local phones = {}
addEvent("GTIpoliceComputer.refresh", true)

-- Misc
-------------------->>
function getPlayersInJob(job)
    local jobPlayers = {}
    if not job then return end
    if type(job) ~= "string" then return end
    for i,v in ipairs (getElementsByType("player")) do
        if (exports.GTIemployment:getPlayerJob(v, true) == job) then
        table.insert(divisionPlayers, v)
        end
    end
        return jobPlayers
end


-- Megaphone
------------------->>
function megaphone(thePlayer,cmd,...)
    local playerName    = getPlayerName(thePlayer)
    local __message       = table.concat({...}, " ")
    local _message = string.gsub(__message, "#%x%x%x%x%x%x", "")
    local message = string.gsub(_message, "#%x%x%x%x%x%x", "")
    local x,y,z  = getElementPosition(thePlayer)
    if (isPlayerInVehicle(thePlayer)) then
    local model  = getElementModel(getPlayerOccupiedVehicle(thePlayer))
    if (policeCruisers[model]) then
    local col      = createColSphere(x,y,z,50)
    local listeners     = getElementsWithinColShape(col)
    local jobRank       = exports.GTIemployment:getPlayerJobRank(thePlayer, "Police Officer")
    local seat    = getPedOccupiedVehicleSeat(thePlayer)
        if (seat == 0 or seat == 1) then
    --  if (jobRank == "Colonel") then
        if string.len(message) == 0 then return end
        for i,player in ipairs(listeners) do
            outputChatBox("[MEGAPHONE] "..jobRank.." "..playerName.." :o< "..message,player,255,255,0,true)
        end
        destroyElement(col)
        --  end
        end
    end
    end
end
addCommandHandler("m",megaphone, false, false)
addCommandHandler("megaphone", megaphone, false, false)

--  Police Radio
------------------->>
local codes = {
-- Locations
["LS"] = "Los Santos",
["LV"] = "Las Venturas",
["SF"] = "San Fierro",
["SA"] = "San Andreas",
["BC"] = "Bone Country",
["AP"] = "Angel Pine",
["PC"] = "Palomino Creek",
-- Events
--["PR"] = "Police Raid",
--["CCR"] = "Caligula's Casino Robbery", 
-- Codes
["10-0"] = "Use caution",

["10-1"] = "Estimated time of arrival in",

["10-2"] = "Busy unless urgent",

["10-3"] = "Patrolling",

["10-4"] = "Affirmative",

["10-5"] = "Negative",

["10-6"] = "On Duty",

["10-7"] = "Off Duty",

["10-15"] = " Requesting a medic on ",

["10-16"] = " Man down",

["10-20"] = " Requesting Pickup ",

["10-21"] = " Requesting available units to respond to ",

["10-22"] = " Requesting all units to respond to ",

["10-23F"] = " Requesting fast pursuit Unit to ",

["10-23A"] = " Requesting air support to ",

["10-23B"] = " Requesting boat support to ",

["10-25"] = " In Pursuit on ",

["10-26"] = " All suspects in custody ",

["10-30"] = " Current status of situation ",
 
["10-50"] = " Do I have backup my coming ",

["10-51"] = " Subject disturbing the peace ",

["10-52"] = " Suspect has a Gun ",

["10-53"] = " Multiple suspects in the area of ",

["10-55"] = " Preparing a roadblock at ", 
}
local splitWords = {}

function managePoliceRadio (thePlayer, cmd, ...)
    local playerName    = getPlayerName(thePlayer)
    local __message       = table.concat({...}, " ")
    local _message = string.gsub(__message, "#%x%x%x%x%x%x", "")
    local message = string.gsub(_message, "#%x%x%x%x%x%x", "")
    local team    = getTeamFromName("Law Enforcement")
    local r, g, b       = getPlayerNametagColor (thePlayer)
    local listeners     = getPlayersInTeam(team)
    if (timer[thePlayer] == nil) then
        if getTeamName(getPlayerTeam(thePlayer)) == "Law Enforcement" then
            for i, player in ipairs (listeners) do
                if getTeamName(getPlayerTeam(player)) == "Law Enforcement" then
                    if string.len(message) == 0 then return end
                        for i,v in next, ( codes ) do
                        message = string.gsub(message,"(%S+)", function(w) if w == i then return v end end) 
                    --    message = string.gsub( message, i, v..' ')
                        end
                        cancelEvent( true )
                        outputChatBox("> (RADIO) "..playerName..": #FFFFFF"..message..", over", player, r, g, b, true)
                        exports.GTIlogs:outputLog("(POLICE RADIO) "..playerName..": "..message..", over", "PoliceRadio", thePlayer)

                               timer[thePlayer] = 1
                            setTimer(function () timer[thePlayer] = nil end, 1000, 1)
                end
            end
        end
    elseif (timer[thePlayer] ~= nil) then
        outputChatBox("* You need to wait 1 second between each message.", thePlayer, 255, 0, 0)
    end
end
addCommandHandler("r", managePoliceRadio, false, false)

function manageParamedicsRadio (thePlayer, cmd, ...)
    local playerName    = getPlayerName(thePlayer)
    local __message       = table.concat({...}, " ")
    local _message = string.gsub(__message, "#%x%x%x%x%x%x", "")
    local message = string.gsub(_message, "#%x%x%x%x%x%x", "")
    local team    = getTeamFromName("Emergency Services")
    local r, g, b       = getPlayerNametagColor (thePlayer)
    local listeners     = getPlayersInTeam(team)
       if (timer4[thePlayer] == nil) then
        if getTeamName(getPlayerTeam(thePlayer)) == "Emergency Services" then

            for i, player in ipairs (listeners) do
                if getTeamName(getPlayerTeam(player)) == "Emergency Services" then
                    if string.len(message) == 0 then return end
                        outputChatBox("> (RADIO) "..playerName..": #FFFFFF"..message..", over", player, r, g, b, true)
                        exports.GTIlogs:outputLog("(PARAMEDICS RADIO) "..playerName..": "..message..", over", "ParamedicsRadio", thePlayer)
                            timer4[thePlayer] = 1
                            setTimer(function () timer4[thePlayer] = nil end, 1000, 1)
                end
            end
        end
       elseif (timer4[thePlayer] ~= nil) then
           outputChatBox("* You need to wait 1 second between each message.", thePlayer, 255, 0, 0)
       end
end
addCommandHandler("r", manageParamedicsRadio, false, false)

--  Backup Calls
------------------->>
function manageBackupCalls(thePlayer, cmd)
    local playerName    = getPlayerName(thePlayer)
    local team    = getTeamFromName("Law Enforcement")
    local r, g, b       = getTeamColor(team)
    local x, y, z       = getElementPosition(thePlayer)
    local zone    = getZoneName(thePlayer, x, y, z)
    local city    = getZoneName(thePlayer, x, y, z, true)

    local listeners     = getPlayersInTeam(team)
        if (timer2[thePlayer] == nil) then
            for i,player in ipairs (listeners) do
            if (getTeamName(getPlayerTeam(thePlayer)) == "Law Enforcement") then
                local division = exports.GTIemployment:getPlayerJobDivision(player)
                if (getTeamName(getPlayerTeam(player)) == "Law Enforcement" and division ~= "SWAT Division") then
                    outputChatBox("(RADIO) #FF0000Dispatch: #FFFFFFAttention all units, "..playerName.." requests backup in "..zone..", "..city..", over", player, r, g, b, true)
                    exports.GTIlogs:outputLog("(POLICE RADIO) "..playerName.." requested backup.", "PoliceRadio", thePlayer)
                    triggerClientEvent(player,"call4backupE",thePlayer)
                    timer2[thePlayer] = true
                    setTimer(function () timer2[thePlayer] = nil end, 25000, 1)
                end
            end
        end
            elseif (timer2[thePlayer] ~= nil) then
                    outputChatBox("* You can only call backup once every 25 seconds.", thePlayer, 255, 0, 0)
    end
end
addCommandHandler("b", manageBackupCalls, false, false)
addCommandHandler("backup", manageBackupCalls, false, false)

--  Crime reports calls
------------------->>
function crimeReport(crimeID)

    local playerName    = getPlayerName(source)
    local crimeName     = exports.GTIpoliceWanted:getCrimeName(crimeID)
    local r, g, b       = getTeamColor(getTeamFromName("Law Enforcement"))
    local listeners     = getPlayersInTeam(getTeamFromName("Law Enforcement"))
    local x, y, z       = getElementPosition(source)
    local zone    = getZoneName(source, x, y, z)
    local city    = getZoneName(source, x, y, z, true)

    if (crimesTable[crimeID]) then

    if exports.GTIemployment:getPlayerJob(source, true) == "Gangster" then return end
    
    --[[if (getResourceFromName("GTIeventsys") and getResourceState(getResourceFromName("GTIeventsys")) == "running") then
        if exports.GTIeventsys:isPlayerInEvent(source) then return end
    end--]]
    
    if getResourceFromName("GTIcnr") and (getResourceState(getResourceFromName("GTIcnr")) == "running") then
        if (exports.GTIcnr:isPlayerInCnREvent(source)) then
            return
        end
    end
        -- If the guy isn't inside an event
    if crimeName == "Armed Robbery" then
        cor = "an"
    else
        cor = "a"
    end
    for i,player in ipairs (listeners) do
        local division = exports.GTIemployment:getPlayerJobDivision(player)
        if (getTeamName(getPlayerTeam(player)) == "Law Enforcement" and division ~= "SWAT Division") then
        local acc = getPlayerAccount(player)
        if disableC[acc] ~= true then
        if isPedInVehicle(source) then
        local theVehicle    = getPedOccupiedVehicle(source)
        local id        = getElementModel(theVehicle)
        local carName      = getVehicleNameFromModel (id)
            outputMessage = "(RADIO) #FF0000Dispatch: #FFFFFFAttention all units, We got "..cor.." "..crimeName.." in "..zone..", "..city..". Suspect is in a "..carName
        elseif not isPedInVehicle(source) then
            outputMessage = "(RADIO) #FF0000Dispatch: #FFFFFFAttention all units, We got "..cor.." "..crimeName.." in "..zone..", "..city..". Suspect is on foot"
        end
        outputChatBox(outputMessage,player,r,g,b, true)
        triggerClientEvent(player,"crimeReportE",source)
                end
            end
        end
    end
end
addEventHandler("onPlayerCommitCrime", root, crimeReport)

--  Emergency services calls
------------------------------>>
local nine11calls = {}

for i,v in ipairs (getElementsByType("player")) do
    setElementData(v, "GTIcallingApp.isOnCall", false)
    setElementData(v, "GTIcallingApp.callNumber", "")
end

function callEmergencyNumber(caller, number, emergencyText, r, g, b)
    if not isElement(caller) or not getElementType(caller) == "player" then error("Player is wrong type") end
    if not type(number) == "string" or not type(emergencyText) == "string" then error("Number is wrong type") end
    if not number == "911" or not number == "9112" then error("Wrong number") end
    if getElementData(caller, "GTIcallingApp.isOnCall") then outputChatBox("You are already on a call but you forgot to answer back, use /ph <emergency> or hangup", caller, 255, 0, 0) return false end
    if timer3[caller] == true then outputChatBox("You can only call emergency services once every 5 minutes", caller, 255, 0, 0) return end

    if getTeamName(getPlayerTeam(caller)) == "Law Enforcement" then
    outputChatBox("You can't call emergency services while you're a cop", caller, 255, 0, 0)
    return
    end

    if getTeamName(getPlayerTeam(caller)) == "Emergency Services" then
    outputChatBox("You can't call emergency services while you're a medic", caller, 255, 0, 0)
    return
    end

    if exports.GTIpoliceWanted:isPlayerWanted(caller) then
    outputChatBox("You can't call emergency services while you're wanted.", caller, 255, 0, 0)
    return
    end

    if (getResourceFromName("GTIeventsys") and getResourceState(getResourceFromName("GTIeventsys")) == "running") then
        if exports.GTIeventsys:isPlayerInEvent(caller) then
            outputChatBox("You can't call emergency services while you're in an event.", caller, 255, 0, 0)
            return
        end
    end
    for i, v in ipairs(getElementsByType("player")) do
    local distance = exports.GTIutil:getDistanceBetweenElements2D(caller, v)
    local block = getElementData(caller, "GTI911called")
    if (block) then return end
    if (distance < 100) then
        if (exports.GTIpoliceWanted:isPlayerWanted(v)) then
        outputChatBox("You can't call while you're near a wanted criminal!", caller, 255, 0, 0)
                return
            end
    end
    end

    exports.GTIlogs:outputLog(""..getPlayerName(caller).." called "..number.."", "EmergencyCalls", caller)
    outputChatBox("(CELLPHONE) Calling "..number.."...", caller, 255, 255, 0)
    setTimer(outputChatBox, 1000, 1, "(CELLPHONE) They answered the call", caller, 255, 255, 0, true)
    setTimer(outputChatBox, 1500, 1, ""..emergencyText.."", caller, r, g, b, true)
    timer3[caller] = true
    setTimer(setElementData, 1500, 1, caller, "GTIcallingApp.isOnCall", true)
    setTimer(setElementData, 1500, 1, caller, "GTIcallingApp.callNumber", number)
    setPedAnimation(caller, "ped", "phone_talk", 50, true, false, false, true)
    triggerClientEvent(caller, "GTIcallingApp.playRingSound", caller)
    setTimer(function (caller) timer3[caller] = nil end, 300000, 1, caller)
    setElementData(caller, "GTI911called", true)
    setTimer(function (p) setElementData(p, "GTI911called", false) end, 2000, 1, caller)
    return true
end


function call911 (number)
    if number == "911" then
    callEmergencyNumber(client, number, "(CELLPHONE) Dispatch: #FFFFFFHello, this is the Police Department, what's your emergency? ((Use /ph <emergency>))", 30, 125, 255)
    elseif  number == "9112" then
    for i,v in ipairs (getPlayersInTeam(getTeamFromName("Emergency Services"))) do
        outputChatBox("(RADIO) #FF0000Dispatch: #FFFFFF"..getPlayerName(client).." requires medical assistance at "..getZoneName(client,getElementPosition(client))..", "..getZoneName(client,getElementPosition(client),true), v, 30, 255, 125, true)
    end
    if callEmergencyNumber(client, number, "", 20, 0, 0) then
        setTimer(outputChatBox, 2000, 1, "(CELLPHONE) Dispatch: #FFFFFFYour call has been processed, emergency services will arrive shortly.", client, 30, 255, 125, true)
        setTimer(outputChatBox, 2000, 1, "(CELLPHONE) Call ended (They hung up)", client, 255, 255, 0, true)
        setTimer(setPedAnimation, 3000, 1, client, "ped", "phone_in", 50, false, false, false, true)
        setTimer(setElementData, 3000, 1, client, "GTIcallingApp.callNumber", "")
        setTimer(setElementData, 3000, 1, client, "GTIcallingApp.isOnCall", false)

    end
    end
end
addEvent("GTIcallingApp.call911", true)
addEventHandler("GTIcallingApp.call911", root, call911)

function hangup()
    outputChatBox("(CELLPHONE) Call ended (You hung up)", client, 255, 255, 0)
    setElementData(client, "GTIcallingApp.isOnCall", false)
    setElementData(client, "GTIcallingApp.callNumber", "")
    setPedAnimation (client, "ped", "phone_out", 50, false, false, false, true)
    setTimer(setPedAnimation, 1000, 1, client)
    if isElement(phones[client]) then destroyElement(phones[client]) end
end
addEvent("GTIcallingApp.hangup", true)
addEventHandler("GTIcallingApp.hangup", root, hangup)

function call911Handler (thePlayer, cmd, ...)
    if thePlayer then
    if getElementData(thePlayer, "GTIcallingApp.isOnCall") == true then
    if getElementData(thePlayer, "GTIcallingApp.callNumber") == "911" then

    local playerName    = getPlayerName(thePlayer)
    local __message       = table.concat({...}, " ")
    local _message = string.gsub(__message, "#%x%x%x%x%x%x", "")
    local message =  string.gsub(_message, "#%x%x%x%x%x%x", "")
    local r, g, b       = getTeamColor(getTeamFromName("Law Enforcement"))
    local x, y, z       = getElementPosition(thePlayer)
    local zone    = getZoneName(thePlayer,x, y, z)
    local city    = getZoneName(thePlayer,x, y, z, true)
    local listeners     = getPlayersInTeam(getTeamFromName("Law Enforcement"))

    if string.len(message) == 0 then
    outputChatBox("Please state your emergency situation", thePlayer, 255, 0, 0) return false
    elseif string.len(message) > 50 then
    outputChatBox("Maximum characters: 50", thePlayer, 255, 0, 0)
    return false
end
    for i,v in ipairs (listeners) do
    local accname = getPlayerAccount(v)
    if disable911[accname] ~= true then
        setTimer(outputChatBox, 1000, 1, "(RADIO) #FF0000Dispatch: #FFFFFFCivilian "..playerName.." requires 911 assistance. Use the Police Computer for more information.", v, r, g, b, true)
    end
    end
    setTimer(outputChatBox, 1000, 1, "(CELLPHONE) Dispatch: #FFFFFFYour call has been processed, emergency services will arrive shortly.", thePlayer, r, g, b, true)
    setTimer(outputChatBox, 2000, 1, "(CELLPHONE) Call ended (They hung up)", thePlayer, 255, 255, 0, true)
    setTimer(setPedAnimation, 2000, 1, thePlayer, "ped", "phone_out", 50, false, false, false, true)
    setTimer(setPedAnimation, 3000, 1, thePlayer)
    setTimer(function(plr) if isElement(phones[plr]) then destroyElement(phones[plr]) end end, 2000, 1, thePlayer)
    setElementData(thePlayer, "GTIcallingApp.isOnCall", false)
    setElementData(thePlayer, "GTIcallingApp.callNumber", "")
    nine11calls[thePlayer] = {getPlayerName(thePlayer), x, y, z, message}
    triggerClientEvent(thePlayer, "GTIpoliceComputer.911calls", root, nine11calls)
    setTimer(function (player)
        nine11calls[player] = nil
    end, 300000, 1, thePlayer)
        end
    end
    end
end
addCommandHandler("call", call911, false, false)
addCommandHandler("ph", call911Handler, false, false)
addEventHandler("GTIpoliceComputer.refresh", root, call911Handler)

function call911Hand(player)
triggerClientEvent("GTIpoliceComputer.911calls", player, nine11calls)
end

function start()
 bindKey(source, "F6", "down", call911Hand)
end
addEventHandler("onPlayerJoin", root, start)

 for i,v in ipairs (getElementsByType("player") or {}) do
  bindKey(v, "F6", "down", call911Hand)
 end



--  Enabling/Disabling radio through GTIpoliceComputer
------------------------------------->>
-- Crime reports
function turnOffCrime ()
    local acc = getPlayerAccount(client)
    if disableC[acc] ~= true then
        exports.GTIhud:dm("Crime reports have been disabled", client, 225, 0, 0)
        disableC[acc] = true
    end
end
addEvent("GTIpoliceMisc.turnOffCrime", true)
addEventHandler("GTIpoliceMisc.turnOffCrime", root, turnOffCrime)

function turnOnCrime ()
    local acc = getPlayerAccount(client)
    if disableC[acc] == true then
        exports.GTIhud:dm("Crime reports have been enabled", client, 0, 225, 0)
        disableC[acc] = false
    end
end
addEvent("GTIpoliceMisc.turnOnCrime", true)
addEventHandler("GTIpoliceMisc.turnOnCrime", root, turnOnCrime)

-- 911 calls
function turnOff911 ()
    local acc = getPlayerAccount(client)
    if disable911[acc] ~= true then
        exports.GTIhud:dm("911 messages have been disabled", client, 225, 0, 0)
        disable911[acc] = true
    end
end
addEvent("GTIpoliceMisc.turnOff911", true)
addEventHandler("GTIpoliceMisc.turnOff911", root, turnOff911)

function turnOn911 ()
    local acc = getPlayerAccount(client)
    if disable911[acc] == true then
        exports.GTIhud:dm("911 messages have been enabled", client, 0, 225, 0)
        disable911[acc] = false
    end
end
addEvent("GTIpoliceMisc.turnOn911", true)
addEventHandler("GTIpoliceMisc.turnOn911", root, turnOn911)

---------------

local Cruisers = {[596] = true, [597] = true, [598] = true, [599] = true}
addEventHandler("onVehicleStartEnter", root, function (player, seat)
    if getTeamName(getPlayerTeam(player)) ~= "Law Enforcement" and Cruisers[getElementModel(source)] and seat == 0 then
        cancelEvent()
    end
end
)
_getZoneName = getZoneName
function getZoneName(player,x,y,z,city)
    if not player or not isElement(player) then return false end
    if x and y and z then
        if type(city) ~= "boolean" then city = false end
        local zone = _getZoneName(x,y,z,city)
        if zone == "Unknown" then
            local pos = exports.GTIinteriors:getPlayerLastPosition(player)
            if type(pos) == "table" then
                zone = _getZoneName(pos[1],pos[2],pos[3],city)
            end
        end

        return zone
    end

    return false
end
