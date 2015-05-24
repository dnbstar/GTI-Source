local antiTick  = {}
local spam = {}

no_highlight = {
    ["JTPenn"] = "J.T.P.e.n.n.",
    ["LilDolla"] = "Dolla",
    ["Gus"] = "Gu.s",
    ["Annex"] = "Anexation",
    ["Diego"] = "D.iego",
    ["StefanM"] = "Stefan.M",
    ["Emile"] = "Emi.le",
    ["Jack"] = "J.ack",
    ["EnemyCRO"] = "Enem.y",
    ["Naseer"] = "N@$eer",
    ["Sjoerd"] = "SjoerdPSV",
    ["AG-Sjoerd*CIA"] = "AG-SjoerdPSV*CIA",
    ["Mitch"] = "M.itch",
    ["Ares"] = "Ar�s",
    ["JayXxX"] = "JayX.Killer",
    ["IceBoy"] = "IceyBoi",
    ["rock_roll"] = "rocknroll",
}
-- Main Chats
-------------->>

function mainChat(message, mType)
    if (mType == 0) then
        cancelEvent()
        repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
        if (not exports.GTIutil:isPlayerLoggedIn(source)) then return end
        local tick = getTickCount()
        if (antiTick[source] and antiTick[source][1] and tick - antiTick[source][1] < 1000) then
            outputChatBox("You need to wait 1 second between each message", source, 255, 0, 0)
            return
        end
        if (exports.GTIgovt:isPlayerMuted(source)) then
            outputChatBox("* ERROR: You are muted.", source, 255, 25, 25)
            return
        end
        if (getPlayerTeam(source)) then
            r, g, b = getTeamColor(getPlayerTeam(source))
            nr, ng, nb = getPlayerNametagColor(source)
            cr = nr or r
            cg = ng or g
            cb = nb or b
        else
            cr = 255
            cg = 255
            cb = 255
        end

        local city = exports.GTIchat:getPlayerCity(source)
        if not city then
            outputChatBox( "You cannot talk where you are currently located.", source, 255, 0, 0)
            return
        end
        local newMessage = "("..city..") "..getPlayerName(source).. ": #FFFFFF"..message
        if (not antiTick[source]) then
            antiTick[source] = {}
        end
        if (not spam[source]) then
            spam[source] = {}
        end
        antiTick[source][1] = getTickCount()
        spam[source][1] = message

        if (getResourceFromName("GTIirc") and getResourceState(getResourceFromName("GTIirc")) == "running") then
            exports.GTIirc:outputIRC("07("..city..") "..(no_highlight[getPlayerName(source)] or getPlayerName(source)).."1: "..message)
        end
            -- Output Server Log
        exports.GTIlogs:outputServerLog("("..city..") "..getPlayerName(source).. ": "..message, "chat", source)
        for i, v in ipairs (getElementsByType("player")) do
            if not exports.GTIignore:isPlayerOnIgnoreList(v, getPlayerName(source)) then
                if getElementData(v,"GTIchat.markedMAIN") then
                    outputChatBox(newMessage, v, cr, cg, cb, true)
                end
                --triggerClientEvent(v, "GTIchat.addChatRow", v, "Main", newMessage)
                outputGridlist ( v, v, "Main", newMessage )
            end
        end
    end
end
addEventHandler("onPlayerChat", root, mainChat)

-- Roleplay Chats
------------------>>

addEventHandler("onPlayerChat", root,
    function(msg, type)
        if type == 1 then
            cancelEvent()
            rpChat(source, msg, "me")
        end
    end
)

function rpChat(source, message, mType)
    if (not exports.GTIutil:isPlayerLoggedIn(source)) then return end
	
	if (exports.GTIgovt:isPlayerMuted(source, true)) then
		outputChatBox("* ERROR: You are globally muted.", source, 255, 25, 25)
		return
	end
		
    if (not message) then return end
    repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
    if (message == "") then return end

    local r, g, b = getPlayerNametagColor(source)
    local hex = getHexFromRGB(r, g, b)
    local posX, posY, posZ = getElementPosition(source)
    local recipients = {}
    for index, player2 in pairs(getElementsByType("player")) do
        local posX2, posY2, posZ2 = getElementPosition(player2)
        if (getDistanceBetweenPoints3D(posX, posY, posZ, posX2, posY2, posZ2)) <= 30 then
            table.insert(recipients, player2)
        end
    end
    for index, player2 in pairs(recipients) do
        if not exports.GTIignore:isPlayerOnIgnoreList(players2, getPlayerName(source)) then
            if mType == "me" then
                outputChatBox("["..(#recipients-1).."] * "..getPlayerName(source).." "..message, player2, 255, 0, 255, false)

            elseif mType == "do" then
                outputChatBox("["..(#recipients-1).."] * "..message.." ("..getPlayerName(source)..")", player2, 175, 215, 255, false)

            end
        end
    end

        -- Output Server Log
    if mType == "me" then
        exports.GTIlogs:outputServerLog("ME: ["..(#recipients-1).."] * "..getPlayerName(source).." "..message, "local_chat", source)
    elseif mType == "do" then
        exports.GTIlogs:outputServerLog("DO: ["..(#recipients-1).."] * "..message.." ("..getPlayerName(source)..")", "local_chat", source)
    end
end

addCommandHandler("do", function(player, cmd, ...)
    rpChat(player, table.concat({...}, " "), "do")
end)

-- Team Chat
------------->>

blockIRC = {
    ["Government"] = true,
}

function teamChat(message, mType)
    if (mType == 2) then
        cancelEvent()
        if (not exports.GTIutil:isPlayerLoggedIn(source)) then return end
        repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
        local tick = getTickCount()
        if (antiTick[source] and antiTick[source][2] and tick - antiTick[source][2] < 1000) then
            outputChatBox("You need to wait 1 second between each message", source, 255, 0, 0)
            return
        end

        if (exports.GTIgovt:isPlayerMuted(source)) then
            outputChatBox("* ERROR: You are muted.", source, 255, 25, 25)
            return
        end

        if (getPlayerTeam(source)) then
            local sourceTeam = getPlayerTeam(source)
            for index, player in pairs(getElementsByType("player")) do
                local playerTeam = getPlayerTeam(player)
                if (playerTeam and playerTeam == sourceTeam) then
                    local r, g, b = getTeamColor(sourceTeam)
                    local teamName = getTeamName(sourceTeam)
                    local newMessage = "(TEAM) "..getPlayerName(source)..": #FFFFFF"..message
                    if not exports.GTIignore:isPlayerOnIgnoreList(player, getPlayerName(source)) then
                        if getElementData(player,"GTIchat.markedTEAM") then
                        outputChatBox(newMessage, player,  r or 255, g or 255, b or 255, true)
                        end
                        --triggerClientEvent(player, "GTIchat.addChatRow", player, "Team", newMessage, source)
                        outputGridlist ( player, player, "Team", newMessage )
                    end
                end
            end
            local teamName = getTeamName(sourceTeam)
            if (getResourceFromName("GTIirc") and getResourceState(getResourceFromName("GTIirc")) == "running") then
                if not blockIRC[teamName] then
                    exports.GTIirc:outputIRC("07 ("..teamName..") "..getPlayerName(source)..": "..message)
                end
            end
            if (not antiTick[source]) then
                antiTick[source] = {}
            end
            if (not spam[source]) then
                spam[source] = {}
            end
            antiTick[source][2] = getTickCount()
            spam[source][2] = message
                -- Output Server Log
            exports.GTIlogs:outputServerLog("TEAM: ("..teamName..") "..getPlayerName(source)..": "..message, "chat", source)
        end
    end
end
addEventHandler("onPlayerChat", root, teamChat)

-- Local Chat
-------------->>

antiLocalTick = {}

function localChat(player, _, ...)
    if (not exports.GTIutil:isPlayerLoggedIn(player)) then return end
    
	if (exports.GTIgovt:isPlayerMuted(player, true)) then
		outputChatBox("* ERROR: You are globally muted.", player, 255, 25, 25)
		return
	end
	
    --[[
    local tick = getTickCount()
    if (antiLocalTick[player] and antiLocalTick[player][1] and tick - antiLocalTick[player][1] < 1000) then
        outputChatBox("You need to wait 1 second between each message", player, 255, 0, 0)
        return
    end
    --]]
    if (not antiLocalTick[player]) then
        antiLocalTick[player] = {}
    end
    antiLocalTick[player][1] = getTickCount()
    local message = table.concat({...}, " ")
    if (not message) then return end
    repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
    if (message == "") then return end
    local posX, posY, posZ = getElementPosition(player)
    local dim = getElementDimension(player)
    local recipients = {}
    for index, player2 in pairs(getElementsByType("player")) do
        local posX2, posY2, posZ2 = getElementPosition(player2)
        local dim2 = getElementDimension(player2)
        if (getDistanceBetweenPoints3D(posX, posY, posZ, posX2, posY2, posZ2)) <= 100 then
            if dim == dim2 then
                table.insert(recipients, player2)
            end
        end
    end

    if string.find(message, "/me", 1, true) then
        local message1 = string.gsub(message, "/me ", "")
        if message1 ~= "" then
            rpChat(player, message1, "me")
            return
        end
    elseif string.find(message, "/do", 1, true) then
        local message1 = string.gsub(message, "/do ", "")
        if message1 ~= "" then
            rpChat(player, message1, "do")
            return
        end
    end
    for index, player2 in pairs(recipients) do
        local r, g, b = getPlayerNametagColor(player)
        local name = getPlayerName(player2)
        if not exports.GTIignore:isPlayerOnIgnoreList(player2, getPlayerName(player)) then
        if getElementData(player2,"GTIchat.markedLOCAL") then
            outputChatBox("(Local)["..(#recipients-1).."] "..getPlayerName(player)..": #FFFFFF"..message, player2, r or 255, g or 255, b or 255, true)
        end
            local newMessage = "(Local) "..getPlayerName(player)..": "..message
            --triggerClientEvent(player2, "GTIchat.addChatRow", player2, "Local", newMessage, source)
            outputGridlist ( player2, player2, "Local", newMessage )
        end
    end
    triggerEvent("onPlayerLocalChat", player, message, recipients)
        -- Output Server Log
    exports.GTIlogs:outputServerLog("(Local)["..(#recipients-1).."] "..getPlayerName(player)..": "..message, "local_chat", player)
end
addCommandHandler("local", localChat)

function getHexFromRGB(r, g, b)
    return ("#%02X%02X%02X"):format(r, g, b)
end

function bindLocalChat()
    bindKey(source, "u", "down", "chatbox", "local")
end
addEventHandler("onPlayerJoin", root, bindLocalChat)

function bindLocalChatForAll()
    for index, player in pairs(getElementsByType("player")) do
        bindKey(player, "u", "down", "chatbox", "local")
    end
end
addEventHandler("onResourceStart", resourceRoot, bindLocalChatForAll)

function addBubble(message, recipients, show)
    if show then
        if show ~= false then
            for index, player in pairs(recipients) do
                if not exports.GTIignore:isPlayerOnIgnoreList(player, getPlayerName(source)) then
                    triggerClientEvent(player, "GTIsocial.addBubble", source, message)
                end
            end
        end
    else
        for index, player in pairs(recipients) do
            if not exports.GTIignore:isPlayerOnIgnoreList(player, getPlayerName(source)) then
                triggerClientEvent(player, "GTIsocial.addBubble", source, message)
            end
        end
    end
end
addEvent("onPlayerLocalChat")
addEventHandler("onPlayerLocalChat", root, addBubble)

-- Personal Message
-------------------->>
--[[
addEventHandler("onPlayerCommand", root,
    function(cmd)
        if cmd == "msg" then
            cancelEvent()
            outputChatBox("Use /pm instead.", source, 255, 25, 25)
        end
    end
)

local lastPM = {}

function pmCommand(player, _, name, ...)
    if (not exports.GTIutil:isPlayerLoggedIn(player)) then return end

    if (not name) then outputChatBox("Syntax: /pm playerName message", player, 255, 0, 0) return end
    local message = table.concat({...}, " ")
    if not message then outputChatBox("Syntax: /pm playerName message", player, 255, 0, 0) return end
    local target = findPlayer(name)
    if (not target) then outputChatBox("'"..name.."' not found.", player, 255, 0, 0) return end
    if (target == player) then outputChatBox("You can't PM yourself", player, 255, 0, 0) return end
    if exports.GTIignore:isPlayerOnIgnoreList(player, name) then
        outputChatBox("You can't PM "..name.." because they are on your ignore list.", player, 255, 0, 0)
        return false
    end
    if exports.GTIignore:isPlayerOnIgnoreList(exports.GTIutil:findPlayer(name), getPlayerName(player)) then
        outputChatBox("You can't PM "..name.." because you're on their ignore list.", player, 255, 0, 0)
        return false
    end
    local tick = getTickCount()
    if (antiTick[player] and antiTick[player][1] and tick - antiTick[player][1] < 1000) then
        outputChatBox("You need to wait 1 second between each message", player, 255, 0, 0)
        return
    end
    if (not antiTick[player]) then
        antiTick[player] = {}
    end
    if (not spam[player]) then
        spam[player] = {}
    end
    antiTick[player][1] = getTickCount()
    spam[player][1] = message

    local pName = getPlayerName(player)
    local tName = getPlayerName(target)
    outputChatBox("> PM From "..pName..": "..message, target, 36, 143, 0)
    --triggerClientEvent(target, "GTIchat.addChatRow", target, "PM", "PM From "..pName..": "..message, source)
    outputGridlist ( target, target, "PM", "PM From "..pName..": "..message )
    triggerClientEvent(target, "GTIchat.playSound", target, ":GTIdroid/audio/Tejat.ogg")
    outputChatBox("> PM To "..tName..": "..message, player, 0, 107, 143)
    --triggerClientEvent(player, "GTIchat.addChatRow", player, "PM", "PM To "..tName..": "..message, source)
    outputGridlist ( player, player, "PM", "PM To "..tName..": "..message )

        -- Output Server Log
    exports.GTIlogs:outputServerLog("SMS: "..pName.." to "..tName..": "..message, "sms")
    exports.GTIlogs:outputAccountLog("PM From "..pName..": "..message, "sms", target)
    exports.GTIlogs:outputAccountLog("PM To "..tName..": "..message, "sms", player)

    lastPM[target] = player
end
addCommandHandler("pm", pmCommand)

function quickReply(player, _, ...)
    local message = table.concat({...}, " ")
    local target = getLastPMAuthor(player)
    if (not target) then return end

    local tick = getTickCount()
    if (antiTick[player] and antiTick[player][1] and tick - antiTick[player][1] < 1000) then
        outputChatBox("You need to wait 1 second between each message", player, 255, 0, 0)
        return
    end
    if (not antiTick[player]) then
        antiTick[player] = {}
    end
    if (not spam[player]) then
        spam[player] = {}
    end
    antiTick[player][1] = getTickCount()
    spam[player][1] = message

    if (target == player) then outputChatBox("You can't PM yourself", player, 255, 0, 0) return end
    local pName = getPlayerName(player)
    local tName = getPlayerName(target)
    outputChatBox("> PM From "..pName..": "..message, target, 36, 143, 0)
    local newMsg = "PM From "..pName..": "..message
    --triggerClientEvent(target, "GTIchat.addChatRow", target, "PM", newMsg)
    outputGridlist ( target, target, "PM", newMsg )
    triggerClientEvent(target, "GTIchat.playSound", target, ":GTIdroid/audio/Tejat.ogg")
    outputChatBox("> PM To "..tName..": "..message, player, 0, 107, 143)
    local sendMsg = "PM To "..tName..": "..message
    --triggerClientEvent(player, "GTIchat.addChatRow", player, "PM", sendMsg)
    outputGridlist ( player, player, "PM", sendMsg )

        -- Output Server Log
    exports.GTIlogs:outputServerLog("SMS: "..pName.." to "..tName..": "..message, "sms")
    exports.GTIlogs:outputAccountLog("PM From "..pName..": "..message, "sms", target)
    exports.GTIlogs:outputAccountLog("PM To "..tName..": "..message, "sms", player)

    lastPM[target] = player
end
addCommandHandler("re", quickReply)
addCommandHandler("reply", quickReply)


function getLastPMAuthor(player)
    if (not lastPM[player]) then return end
    if (not isElement(lastPM[player])) then lastPM[player] = nil return end
    return lastPM[player]
end
addEventHandler("onPlayerQuit", root, function() lastPM[source] = nil end)
--]]

function pmCommand(player)
    outputChatBox("This command has been disabled. Use GTIdroid instead.", player, 0, 107, 143)
end
addCommandHandler("pm", pmCommand)
-- Admin Chats
--------------->>

function noteChat(source, command, ...)
    if (not exports.GTIutil:isPlayerLoggedIn(source)) then return end
    local acc = getPlayerAccount(source)
    local accName = getAccountName(acc)

    local message = table.concat({...}, " ")
    if (message == "") then return end
    noteNick = getPlayerName(source)

    outputChatBox("#FF0000(NOTE) "..noteNick..": #FFFFFF"..message, root, 255, 255, 255, true)
    exports.GTIlogs:outputServerLog("NOTE: "..noteNick..": "..message, "chat", source)
    if (getResourceFromName("GTIirc") and getResourceState(getResourceFromName("GTIirc")) == "running") then
        exports.GTIirc:outputIRC("* (4NOTE) "..noteNick..": "..message)
    end
end
addCommandHandler("note", noteChat, true)

function eventChat(source, command, ...)
    if (not exports.GTIutil:isPlayerLoggedIn(source)) then return end
    local acc = getPlayerAccount(source)
    local accName = getAccountName(acc)

    local message = table.concat({...}, " ")
    if (message == "") then return end
    eventNick = getPlayerName(source)

    outputChatBox("#006B8F(EVENT) "..eventNick..": #FFFFFF"..message, root, 255, 255, 255, true)
    exports.GTIlogs:outputServerLog("EVENT: "..eventNick..": "..message, "chat", source)
    if (getResourceFromName("GTIirc") and getResourceState(getResourceFromName("GTIirc")) == "running") then
        exports.GTIirc:outputIRC("* (2EVENT) "..eventNick..": "..message)
    end
end
addCommandHandler("event", eventChat, true)

-- Car Chat
------------>>

local ccSpam = {}
function carChat(player, cmd, ...)
    if (not exports.GTIutil:isPlayerLoggedIn(player)) then return end
    if (not isPedInVehicle(player)) then return end
	
    if (ccSpam[player]) then
        outputChatBox("You need to wait 1 second between each message", player, 255, 0, 0)
        return
    end
    ccSpam[player] = true
    setTimer(function(player) ccSpam[player] = nil end, 1000, 1, player)

    local message = table.concat({...}, " ")
    repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
    if (message == "") then return end

    local vehicle = getPedOccupiedVehicle(player)
    for i,plr in pairs(getVehicleOccupants(vehicle)) do
        outputChatBox("> (CAR) "..getPlayerName(player)..": #FFFFFF"..message, plr, 255, 25, 125, true)
    end

    exports.GTIlogs:outputServerLog("> (CAR) "..getPlayerName(player)..": "..message, "local_chat", player)
end
addCommandHandler("cc", carChat)

-- Other Chats
------------->>

local Chats = { "Main", "Team", "Local", "Group", "AR", "NL", "TR", "TN", "PT", "ES", }
antiLangTick = {}
function lanChats(thePlayer, cmdName, ...)
if (not exports.GTIutil:isPlayerLoggedIn(thePlayer)) then return end
    
	if (exports.GTIgovt:isPlayerMuted(thePlayer)) then
		outputChatBox("* ERROR: You are muted.", thePlayer, 255, 25, 25)
		return
	end
	
    local tick = getTickCount()
        if (antiLangTick[thePlayer] and antiLangTick[thePlayer][1] and tick - antiLangTick[thePlayer][1] < 1000) then
            outputChatBox("You need to wait 1 second between each message", thePlayer, 255, 0, 0)
            return
        end
        if (not antiLangTick[thePlayer]) then
            antiLangTick[thePlayer] = {}
        end
        if (not spam[thePlayer]) then
            spam[thePlayer] = {}
        end
        antiLangTick[thePlayer][1] = getTickCount()

    if ( cmdName == "ar" ) or ( cmdName == "nl" ) or ( cmdName == "tr" ) or ( cmdName == "tn" ) or ( cmdName == "pt" ) or ( cmdName == "es" )then
            cmdName = string.upper(cmdName)
        else
            cmdName = cmdName:gsub("^%l", string.upper)
    end
    local theMessage = table.concat({...}, " ")
    if theMessage:match("^%s*$") then
        outputChatBox("You didn't enter a message!", thePlayer, 200, 0, 0)
    return end
        plrName = getPlayerName(thePlayer)
        for i,v in pairs(getElementsByType("player")) do
        local acc = getPlayerAccount(v)
        local theNewMessage = "("..cmdName..") "..plrName..": "..theMessage
            if not exports.GTIignore:isPlayerOnIgnoreList(v, plrName) then
            if getElementData(v,"GTIchat.marked"..string.upper(cmdName)) then
                if (cmdName ~= "NL") then
                    outputChatBox("#E0FFFF("..cmdName..") "..plrName..": #FFFFFF"..theMessage, v, 255, 255, 255, true)
                else
                    outputChatBox("#FFA200("..cmdName..") "..plrName..": #FFFFFF"..theMessage, v, 255, 0, 0, true)
                end
            end
                outputGridlist ( v, v, string.upper(cmdName), theNewMessage )
            end
        end
    exports.GTIlogs:outputServerLog("("..cmdName..") "..plrName..": "..theMessage, "lang_chat", thePlayer)
end

for i=1,#Chats do
    if ( Chats[i] == "AR" ) or ( Chats[i] == "NL" ) or ( Chats[i] == "TR" ) or ( Chats[i] == "TN" ) or ( Chats[i] == "PT" ) or ( Chats[i] == "ES" ) then
        addCommandHandler( string.lower(Chats[i]), lanChats )
    end
end

function support (thePlayer, cmd, ...)
    if (not exports.GTIutil:isPlayerLoggedIn(thePlayer)) then return end
    local acc = getPlayerAccount(thePlayer)
	
	if exports.GTIgovt:isPlayerMuted(thePlayer) then
		outputChatBox("* ERROR: You are muted", thePlayer, 255, 25, 25)
		return
	end

    local playerName = getPlayerName(thePlayer)
    local message    = table.concat({...}, " ")
    if string.len(message) == 0 then return end
    local newMessage = "#CC0000(Support) #FFFFFF"..getPlayerName( thePlayer )..": #FFFFFF"..message
    for i,v in pairs(getElementsByType("player")) do
        local account = getPlayerAccount(v)
        if getElementData(v,"GTIchat.markedSUPPORT") then
        outputChatBox(newMessage, v, r, g, b, true)
        end
        --triggerClientEvent(v, "GTIchat.addChatRow", v, "Support", newMessage)
        if exports.GTIutil:isPlayerInACLGroup( thePlayer, "Dev1", "Dev2", "Dev3", "Dev4", "Dev5", "Admin1", "Admin2", "Admin3", "Admin4", "Admin5", "QCA1", "QCA4", "QCA5") then
            outputGridlist ( v, v, "Support", newMessage, true)
        else
            outputGridlist ( v, v, "Support", newMessage)
        end
    end
    if (getResourceFromName("GTIirc") and getResourceState(getResourceFromName("GTIirc")) == "running") then
        exports.GTIirc:outputIRC("07(Support) "..(no_highlight[playerName] or playerName).."1: "..message)
    end
    exports.GTIlogs:outputServerLog("(Support) "..playerName..": "..message, "support_chat", thePlayer)
end
addCommandHandler("support", support)

function onChat (chat, msg)
    if not ( chat == "Joinquit" ) then

        if ( chat == "Main" ) then
            mainChat(msg, 0)

        elseif ( chat == "Team" ) then
            teamChat(msg, 2)

        elseif ( chat == "Support" ) then
            support(client, "", msg)

        elseif ( chat == "Local" ) then
            localChat(client, "", msg)


        elseif ( chat == "Group" ) then
            if ( exports.GTIgroups:isPlayerInGroup(client) ) and getElementData(client,"GTIchat.markedGROUP") then
            local gID = exports.GTIgroups:getPlayerGroup(client)
                exports.GTIgroups:outputGroupChat("(GROUP) "..getPlayerName(client)..": #FFFFFF"..msg, gID)
            end

        else
            lanChats(client, chat, msg)

        end
    end
end
addEvent("GTIchat.onChat", true)
addEventHandler("GTIchat.onChat", root, onChat)

-- Utilities
------------->>

function RGBToHex(red, green, blue, alpha)
    if ((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
        return nil
    end
    if (alpha) then
        return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
    else
        return string.format("#%.2X%.2X%.2X", red,green,blue)
    end
end

function outputGridlist ( player1, player2, chatName, message, govt)
    if ( player1 and player2 and chatName and message ) then
        if govt then
            triggerClientEvent( player1, "GTIchat.addChatRow", player2, chatName, message, "yes")
        else
            triggerClientEvent( player1, "GTIchat.addChatRow", player2, chatName, message)
        end
    end
end
-- Disable /showchat when not logged in
---------------------------------------->>

function disableShowChat(command)
    if (command ~= "showchat") then return end
    if (exports.GTIutil:isPlayerLoggedIn(source)) then return end
    cancelEvent()
end
addEventHandler("onPlayerCommand", root, disableShowChat)
