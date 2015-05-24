local antiTick  = {}
local spam = {}

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

function mainChat(message, mType)
	if (mType == 0) then
		message = message:gsub("#%x%x%x%x%x%x", "")
		if (isPlayerMuted(source)) then
			outputChatBox("You can not chat while being muted!", source, 255, 0, 0)
			return
		end
		cancelEvent()
		local tick = getTickCount()
		if (antiTick[source] and antiTick[source][1] and tick - antiTick[source][1] < 1000) then
			outputChatBox("You need to wait 1 second between each message", source, 255, 0, 0)
			return
		end
		if (getPlayerTeam(source)) then
			r, g, b = getTeamColor(getPlayerTeam(source))
            nr, ng, nb = getPlayerNametagColor(source)
            cr = nr or r
            cg = ng or g
            cb = nb or b
		end
		--[[
		--if (tonumber(getPlayerMoney(source)) < 350) then
			exports.GTIhelp:dm( source, "You need $350 to speak on Main Chat, use 'U' for Local Chat", 255, 0, 0)
			cancelEvent()
			return
		end
		takePlayerMoney(source, 350)
		exports.GTIhelp:dm( source, "You paid $350 to talk on Main Chat", 255, 255, 0)
		--]]
		local city = getPlayerCity(source)
		local newMessage = "("..city..") "..getPlayerName(source).. ": #FFFFFF"..message
		if (not antiTick[source]) then
			antiTick[source] = {}
		end
		if (not spam[source]) then
			spam[source] = {}
		end
		antiTick[source][1] = getTickCount()
		spam[source][1] = message
		for i, v in ipairs ( getElementsByType( "player")) do
			local zone = getPlayerCity( v)
			if city == zone then
				outputChatBox(newMessage, v, cr, cg, cb, true)

			else
				local acc = getPlayerAccount( v)
				local accName = getAccountName( acc)
				if isObjectInACLGroup("user."..accName, aclGetGroup("Admin")) then
					local hexColor = RGBToHex( cr, cg, cb)
					local teamName = getTeamName( getPlayerTeam( source))
					if city ~= "N/A" then
						staffMessage = "(#FFFFFF"..city.." Chat"..hexColor..") "..getPlayerName(source)..": #FFFFFF"..message
					else
						staffMessage = "(#FFFFFFOutside Chatbox"..hexColor..") "..getPlayerName(source)..": #FFFFFF"..message
					end
					outputChatBox(staffMessage, v, cr, cg, cb, true)
				elseif isObjectInACLGroup("user."..accName, aclGetGroup("Dev")) then
					local hexColor = RGBToHex( cr, cg, cb)
					local teamName = getTeamName( getPlayerTeam( source))
					if city ~= "N/A" then
						staffMessage = "(#FFFFFF"..city.." Chat"..hexColor..") "..getPlayerName(source)..": #FFFFFF"..message
					else
						staffMessage = "(#FFFFFFOutside Chatbox"..hexColor..") "..getPlayerName(source)..": #FFFFFF"..message
					end
					outputChatBox(staffMessage, v, cr, cg, cb, true)
				elseif isObjectInACLGroup("user."..accName, aclGetGroup("QCM")) then
					local hexColor = RGBToHex( cr, cg, cb)
					local teamName = getTeamName( getPlayerTeam( source))
					if city ~= "N/A" then
						staffMessage = "(#FFFFFF"..city.." Chat"..hexColor..") "..getPlayerName(source)..": #FFFFFF"..message
					else
						staffMessage = "(#FFFFFFOutside Chatbox"..hexColor..") "..getPlayerName(source)..": #FFFFFF"..message
					end
					outputChatBox(staffMessage, v, cr, cg, cb, true)
				end
			end
		end
		logSocialMessage( getPlayerName(source), message, "MainChat", 0, "Main", "Main Chat", "world")
	end
end
addEventHandler("onPlayerChat", root, mainChat)

function meChat( source, message, mType)
	if (mType == 1) then
		if (isPlayerMuted(source)) then
			outputChatBox("You can not use interactions while being muted!", source, 255, 0, 0)
			return
		end
		cancelEvent()
		if (not message) then return end
		message = message:gsub("#%x%x%x%x%x%x", "")
		if (message == "") then return end
		local r, g, b = getPlayerNametagColor(source)
		local hex = getHexFromRGB(r, g, b)
		local posX, posY, posZ = getElementPosition(source)
		local recipients = {}
		for index, player2 in pairs(getElementsByType("player")) do
			local posX2, posY2, posZ2 = getElementPosition(player2)
			if (--[[player ~= player2 and--]] getDistanceBetweenPoints3D(posX, posY, posZ, posX2, posY2, posZ2)) <= 30 then
				table.insert(recipients, player2)
			end
		end
		for index, player2 in pairs(recipients) do
			outputChatBox("(LME)("..#recipients..") *"..getPlayerName(source).." "..message, player2, 255, 0, 255, false)
		end
	end
end
addEventHandler("onPlayerChat", root, meChat)
--addCommandHandler("")

function teamChat(message, mType)
	if (mType == 2) then
		if (isPlayerMuted(source)) then
			outputChatBox("You can not chat while being muted!", source, 255, 0, 0)
			return
		end
		cancelEvent()
		message = message:gsub("#%x%x%x%x%x%x", "")
		local tick = getTickCount()
		if (antiTick[source] and antiTick[source][2] and tick - antiTick[source][2] < 1000) then
			outputChatBox("You need to wait 1 second between each message", source, 255, 0, 0)
			return
		end
		if (getPlayerTeam(source)) then
			local sourceTeam = getPlayerTeam(source)
			for index, player in pairs(getElementsByType("player")) do
				local playerTeam = getPlayerTeam(player)
				if (playerTeam) then
					local r, g, b = getTeamColor(sourceTeam)
					local teamName = getTeamName(sourceTeam)
					local newMessage = "(TEAM) "..getPlayerName(source)..": #FFFFFF"..message
					outputChatBox(newMessage, player,  r or 255, g or 255, b or 255, true)
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
		end
	end
end
addEventHandler("onPlayerChat", root, teamChat)

function localChat(player, _, ...)
	if (isPlayerMuted(player)) then
		outputChatBox("You can not chat while being muted!", player, 255, 0, 0)
		return
	end
	local message = table.concat({...}, " ")
	if (not message) then return end
	message = message:gsub("#%x%x%x%x%x%x", "")
	if (message == "") then return end
	local r, g, b = getPlayerNametagColor(player)
	local hex = getHexFromRGB(r, g, b)
	local posX, posY, posZ = getElementPosition(player)
	local recipients = {}
	for index, player2 in pairs(getElementsByType("player")) do
		local posX2, posY2, posZ2 = getElementPosition(player2)
		if (--[[player ~= player2 and--]] getDistanceBetweenPoints3D(posX, posY, posZ, posX2, posY2, posZ2)) <= 30 then
			table.insert(recipients, player2)
		end
	end
	--local detection = string.gsub( message, "/")
	if string.find( message, "/me", 1, true) then
		--outputChatBox( "You tried entering a command in localchat.", player, 255, 0, 0)
		local message1 = string.gsub( message, "/me ", "")
		if message1 ~= "" then
			meChat( player, message1, 1)
			return
		end
	end
	for index, player2 in pairs(recipients) do
		local r, g, b = getTeamColor(getPlayerTeam(player))
		local name = getPlayerName( player2)
		outputChatBox("(LOCAL)("..#recipients..") "..getPlayerName(player)..": #FFFFFF"..message, player2, r or 255, g or 255, b or 255, true)
		logSocialMessage( name, "(LOCAL)("..#recipients.."): "..getPlayerName(player)..": "..message, "localchat", 6, "Local/PM", "LocalChat", "player")
	end
	triggerEvent("onPlayerLocalChat", player, message, recipients)
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
				triggerClientEvent(player, "GTIsocial.addBubble", source, message)
			end
		end
	else
		for index, player in pairs(recipients) do
			triggerClientEvent(player, "GTIsocial.addBubble", source, message)
		end
	end
end
addEvent("onPlayerLocalChat")
addEventHandler("onPlayerLocalChat", root, addBubble)

function pmCommand(player, _, name, ...)
	if (not name) then outputChatBox("Syntax: /pm playerName message", player, 255, 0, 0) return end
	local message = table.concat({...}, " ")
	if not message then outputChatBox("Syntax: /pm playerName message", player, 255, 0, 0) return end
	local target = findPlayer(name)
	if (not target) then return end
	if (target == player) then outputChatBox("You can't PM yourself", player, 255, 0, 0) return end
	local pName = getPlayerName( player)
	local tName = getPlayerName( target)
	exports.GTIhelp:dm( target, "PM From "..pName..": "..message, 36, 143, 0)
	exports.GTIhelp:dm( player, "PM To "..tName..": "..message, 0, 107, 143)
	logSocialMessage( getPlayerName( player), "(PM): "..pName.." to "..tName..": "..message, "localchat", 6, "Local/PM", "PM", "player")
	logSocialMessage( getPlayerName( target), "(PM): From "..pName..": "..message, "localchat", 6, "Local/PM", "PM", "player")
	--exports.GTIhud:dqm( "pmSent", "PM Sent to "..getPlayerName( target).." (Viewable via Log)", player, 0, 107, 143, 2500)
	--exports.GTIhud:dqm( "pmRecieved", "PM Recieved from "..getPlayerName( player).." (Viewable via Log)", 36, 143, 0, target, 2500)
end
addCommandHandler("pm", pmCommand)

nameTable = {
	['JTPenn814'] = "[GTI]JTPenn",
	['pillow'] = "[GTI]Gus",
	['wetrippymane'] = "[GTI]Juan",
	['smokemonsta'] = "[GTI]Smoke",
	['Smoke'] = "[GTI]Smoke",
	['yutaz'] = "[GTI]Yutaz",
	['LilDollaTechZone'] = "[GTI]LilDolla"
}

function noteChat( source, command, ...)
	local acc = getPlayerAccount( source)
	local accName = getAccountName( acc)
	if isPlayerMuted( source, true) then
		return
		exports.GTIhelp:dm( source, "You are globally muted", 255, 0, 0)
	else
	end
	if ( ... ) then
		if isObjectInACLGroup("user."..accName, aclGetGroup("Admin")) then
			local text = table.concat( {...}, " ")
			noteNick = getPlayerName( source)
			if nameTable[accName] then
				noteNick = nameTable[accName]
			end
			outputChatBox( "#FF0000(NOTE) "..noteNick..": #FFFFFF"..text, root, 255, 255, 255, true)
		elseif isObjectInACLGroup("user."..accName, aclGetGroup("Dev")) then
			local text = table.concat( {...}, " ")
			noteNick = getPlayerName( source)
			if nameTable[accName] then
				noteNick = nameTable[accName]
			end
			outputChatBox( "#FF0000(NOTE) "..noteNick..": #FFFFFF"..text, root, 255, 255, 255, true)
		elseif isObjectInACLGroup("user."..accName, aclGetGroup("QCM")) then
			local text = table.concat( {...}, " ")
			noteNick = getPlayerName( source)
			if nameTable[accName] then
				noteNick = nameTable[accName]
			end
			outputChatBox( "#FF0000(QCM NOTE) "..noteNick..": #FFFFFF"..text, root, 255, 255, 255, true)
		end
	else
		outputChatBox( "You must specify a message to deliver.", source, 255, 0, 0)
	end
end
addCommandHandler( "note", noteChat)

function eventChat( source, command, ...)
	local acc = getPlayerAccount( source)
	local accName = getAccountName( acc)
	if isPlayerMuted( source, true) then
		return
		exports.GTIhelp:dm( source, "You are globally muted", 255, 0, 0)
	else
	end
	if ( ... ) then
		if isObjectInACLGroup("user."..accName, aclGetGroup("Admin")) then
			local text = table.concat( {...}, " ")
			eventNick = getPlayerName( source)
			if nameTable[accName] then
				eventNick = nameTable[accName]
			end
			outputChatBox( "#006B8F(EVENT) "..eventNick..": #FFFFFF"..text, root, 255, 255, 255, true)
		elseif isObjectInACLGroup("user."..accName, aclGetGroup("Dev")) then
			local text = table.concat( {...}, " ")
			eventNick = getPlayerName( source)
			if nameTable[accName] then
				eventNick = nameTable[accName]
			end
			outputChatBox( "#006B8F(EVENT) "..eventNick..": #FFFFFF"..text, root, 255, 255, 255, true)
		end
	else
		outputChatBox( "You must specify a message to deliver.", source, 255, 0, 0)
	end
end
addCommandHandler( "event", eventChat)
