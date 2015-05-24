-- Event Entities
local warps = 0
local eLimit = 0
local eTitle = ""
local emWarp = false
local eX, eY, eZ = 0, 0, 0
local multi_warping = false
local freezeOnWarp = false
local eint, edim = 0, 0
local warped = {}
local running_manager = false

local full = false

local teamLock = false
local eTeam = false

local ents = {
	hp = {},
	ap = {},
	vehicles = {},
}

function oEMF( message, element, etype)
	local fmessage = "EVENT: "..message
	if not etype then
		exports.killmessages:outputMessage( fmessage, element, 41, 163, 122)
	else
		if etype == "white" then
			lmessage = "EVENT LOG: "..message
			r, g, b = 255, 255, 255
		elseif etype == "pmsg" then
			lmessage = "PRIVATE EVENT MESSAGE: "..message
			r, g, b = 204, 102, 0
		else
			lmessage = fmessage
			r, g, b = 206, 59, 108
		end
		exports.killmessages:outputMessage( lmessage, element, r, g, b)
	end
end

function outputEM( message, publisher, element, etype)
	if not publisher then
		message = "EVENT: "..message
	else
		message = "(EVENT) "..getPlayerName( publisher)..": "..message
	end
	if not etype then
		outputChatBox( message, element, 41, 163, 122)
	else
		outputChatBox( message, element, 206, 59, 108)
	end
end

-- Event Creation

function createEvent( limit, title, int, dim, warpFreeze, multiple, teamEvent)
	if not emWarp then
		oEMF( "Creating event.", client)

		local pX, pY, pZ = getElementPosition( client)

		eint, edim = int, dim
		eX, eY, eZ = pX, pY, pZ
		eLimit = limit

		warps = 0
		warped = {}
		prohibit = {}
		savedPos = {}
		emWarp = true
		eTitle = title
		running_manager = client

		if teamEvent then
			teamLock = true
			eTeam = teamEvent
		else
			teamLock = false
		end
		if multiple then
			multi_warping = true
		else
			multi_warping = false
		end
		if warpFreeze then
			freezeOnWarp = true
			processEntityFunction( "toggleCollisions", client)
		else
			freezeOnWarp = false
		end
		oEMF( "Event '"..title.."' created. notifying players.", client)
		outputEM( "An event has been created. type /eventwarp to join (Slots: "..limit..").", false, root)
	else
		oEMF( "An event is currently being hosted.", client, true)
	end
end
addEvent( "GTIevents.createEvent", true)
addEventHandler( "GTIevents.createEvent", root, createEvent)

-- Event Stopping

function stopEvent()
	if emWarp then
		for player in pairs ( warped) do
			if isElement( player) then
				if not prohibit[player] then
					leaveEvent( player, true)
					oEMF( getPlayerName( running_manager).." stopped the event.", player, true)
				end
			end
		end
		warps = 0
		warped = {}
		prohibit = {}
		savedPos = {}
		emWarp = false
		running_manager = false
		full = false
		teamLock = false
		eTeam = false
		eLimit = 0
		eint, edim = 0, 0
		multi_warping = false
		oEMF( "The event is no longer running.", source, true)
	else
		oEMF( "There is no event currently being hosted.", source, true)
	end
end
addEvent( "GTIevents.stopEvent", true)
addEventHandler( "GTIevents.stopEvent", root, stopEvent)

-- Event Leaving Function
prohibit = {}

function leaveEvent( element, ltype)
	if warped[element] and prohibit[element] ~= "kicked" or prohibit[element] ~= "left" then
		local lastPos = savedPos[element]
		local lastPos = split( lastPos, ";")
		local lX, lY, lZ = lastPos[1], lastPos[2], lastPos[3]
		local lInt, lDim = lastPos[4], lastPos[5]
		if ltype then
			warped[element] = nil
			prohibit[element] = "kicked"
			setElementPosition( element, lX, lY, lZ)
			setElementInterior( element, lInt)
			setElementDimension( element, lDim)
		elseif ltype == "killed" then
			warped[element] = nil
			prohibit[element] = "killed"
		else
			warped[element] = nil
			prohibit[element] = "left"
			setElementPosition( element, lX, lY, lZ)
			setElementInterior( element, lInt)
			setElementDimension( element, lDim)
		end
		warps = warps - 1

		toggleAllControls( element, true)
		processEntityFunction( "updateParticipantList", root, "leave", element)
	end
end

-- Client Action Handler
addEvent( "GTIevents.handleClientAction", true)
addEventHandler( "GTIevents.handleClientAction", root,
	function( action, element, data)
		local plr_msg = ""
		local em_msg = ""
		local em_type = false
		if source ~= running_manager then
			outputEM( "Access Denied. You are not the current running manager.", source, source, false)
			return
		end
		if action == "announceMessage" then
			local data = split( data, ";")
			local message = data[1]
			local etype = data[2]
			if element == "root" then
				outputEM( message, source, root, etype)
			--[[
			elseif element == "part" then
				for i, player in ipairs ( warped) do
					outputEM( message, source, player, etype)
				end
			--]]
			elseif element == "part" then
				for player, category in pairs ( warped) do
					oEMF( message, player, "pmsg")
					--outputEM( message, source, player, etype)
				end
			end
		elseif action == "freeze_p" then
			if not isElementFrozen( element) then
				setElementFrozen( element, true)
				toggleAllControls( element, false)
				plr_msg = "You were frozen by "..getPlayerName(running_manager)
				em_msg = "You froze "..getPlayerName( element)
				server_log = getPlayerName(running_manager).." froze "..getPlayerName( element).."."
			else
				setElementFrozen( element, false)
				toggleAllControls( element, true)
				plr_msg = "You were unfrozen by "..getPlayerName(running_manager)
				em_msg = "You unfroze "..getPlayerName( element)
				server_log = getPlayerName(running_manager).." unfroze "..getPlayerName( element).."."
			end
		elseif action == "toggle_jet" then
			if not doesPedHaveJetPack( element) then
				givePedJetPack( element)
				plr_msg = "You were given a jetpack by "..getPlayerName(running_manager)
				em_msg = "You gave "..getPlayerName( element).." a jetpack."
				server_log = getPlayerName(running_manager).." gave a jetpack to "..getPlayerName( element).."."
			else
				removePedJetPack( element)
				plr_msg = "Your jetpack was taken by "..getPlayerName(running_manager)
				em_msg = "You took "..getPlayerName( element).."'s jetpack."
				server_log = getPlayerName(running_manager).." took a jetpack from "..getPlayerName( element).."."
			end
		elseif action == "kill_p" then
			leaveEvent( element, "killed")
			setTimer( killPed, 500, 1, element)
			plr_msg = "You were killed by "..getPlayerName(running_manager)
			em_msg = "You killed "..getPlayerName( element)
			server_log = getPlayerName(running_manager).." killed "..getPlayerName( element).."."
		elseif action == "kick_p" then
			leaveEvent( element, true)
			plr_msg = "You were kicked from the event by "..getPlayerName(running_manager)
			em_msg = "Kicked "..getPlayerName(element).." from the event."
			server_log = getPlayerName(running_manager).." kicked "..getPlayerName( element).."."
			em_type = true
		elseif action == "set_hp" then
			local hp = getElementHealth( element)
			if hp ~= 100 then
				local missing_hp = 100-hp
				setElementHealth( element, hp+missing_hp)
				plr_msg = "HP set to 100% by "..getPlayerName(running_manager)
				em_msg = "Set 100% HP for "..getPlayerName( element).."."
				server_log = getPlayerName(running_manager).." set "..getPlayerName( element).."'s HP to 100."
			else
				em_msg = getPlayerName( element).." has full HP."
				em_type = true
			end
		elseif action == "set_ap" then
			local ap = getPedArmor( element)
			if ap ~= 100 then
				local missing_ap = 100-ap
				setPedArmor( element, ap+missing_ap)
				plr_msg = "AP set to 100% by "..getPlayerName(running_manager)
				em_msg = "Set 100% AP for "..getPlayerName( element).."."
				server_log = getPlayerName(running_manager).." set "..getPlayerName( element).."'s AP to 100."
			else
				em_msg = getPlayerName( element).." has full AP."
				em_type = true
			end
		elseif action == "give_m" then
			plr_msg = "You got $"..data.." from"..getPlayerName( running_manager)
			em_msg = "You gave "..getPlayerName( element).." $"..data.."."
			server_log = getPlayerName(running_manager).." gave "..getPlayerName( element).." $"..data.."."
			exports.GTIbank:GPM( element, data, "Received from Event Manager "..getPlayerName( running_manager).." during event '"..eTitle.."'")
		end
		if plr_msg and plr_msg ~= "" then
			if element ~= running_manager then
				oEMF( plr_msg, element)
			end
		end
		if em_msg and em_msg ~= "" then
			oEMF( em_msg, running_manager, em_type)
		end
		if server_log and server_log ~= "" then
			exports.GTIlogs:outputServerLog( "EVENT: "..server_log, "eventsystem", running_manager)
		end
	end
)

-- Event Action Handler
addEvent( "GTIevents.handleEventAction", true)
addEventHandler( "GTIevents.handleEventAction", root,
	function( action, value)
		local person = source
		if action == "freeze_p" then
			--for participants in pairs (warped) do
			--end
		elseif action == "disable_wep" then
		elseif action == "return_p" then
		elseif action == "create_hp" then
			local x, y, z = getElementPosition( person)
			local int = getElementInterior( person) or eint
			local dim = getElementDimension( person) or edim
			local coordMap = x..","..y..","..z
			createSpawner( "pickup", "hp", coordMap, person, int, dim)
		elseif action == "create_ap" then
			local x, y, z = getElementPosition( person)
			local int = getElementInterior( person) or eint
			local dim = getElementDimension( person) or edim
			local coordMap = x..","..y..","..z
			createSpawner( "pickup", "ap", coordMap, person, int, dim)
		elseif action == "create_veh_spawner" then
			local x, y, z = getElementPosition( person)
			local id = value
			local int = getElementInterior( person) or eint
			local dim = getElementDimension( person) or edim
			local coordMap = x..","..y..","..z
			createSpawner( "spawner", id, coordMap, person, int, dim)
		elseif action == "create_blip" then
			local x, y, z = getElementPosition( person)
			local id = value
			local int = getElementInterior( person) or eint
			local dim = getElementDimension( person) or edim
			local coordMap = x..","..y..","..z
			createEventBlip( id, coordMap, person, int, dim)
			--oEMF( id, person, true)
		elseif action == "freeze_v" then
		elseif action == "lock_v" then
		elseif action == "dmg_v" then
		elseif action == "toggle_collision" then
		elseif action == "destroy_v" then
		elseif action == "fix_v" then
		end
		--oEMF( tostring( action), running_manager or source, "white")
	end
)

-- Event Message Output
addEvent( "GTIevents.outputEM", true)
addEventHandler( "GTIevents.outputEM", root,
	function( message, etype)
		oEMF( message, source, etype)
	end
)

-- Event Checking

function isPlayerInEvent( player)
	if isElement( player) then
		if warped[player] and warped[player] == true then
			return true
		else
			return false
		end
	else
		return false
	end
end

function isEventManager( player, isGovt)
	if exports.GTIutil:isPlayerInACLGroup( player, "Event") then
		if isGovt then
			if getTeamName( getPlayerTeam( player)) == "Government" then
				return true
			else
				return false
			end
		else
			return true
		end
	else
		return false
	end
end

-- Open Event Panel

function attemptEMEntry( player)
	local account = getPlayerAccount( player)
    local accName = getAccountName( account)
	local team = getPlayerTeam( player)
	local teamName = getTeamName( team)

	local skin = tonumber( getElementModel( player))

	if isEventManager( player, true) then
		triggerClientEvent( player, "GTIevents.openPanel", player)
		--exports.GTIemployment:setPlayerJob( player, "Event Manager", "Government", nil, tonumber(skin))
	else
		if not isEventManager( player) then
			oEMF( "You don't have access to this.", player, true)
		elseif not isEventManager( player, true) then
			oEMF( "Must be in Government team to host or use the event panel.", player, true)
		end
    end
end
addCommandHandler( "empanel", attemptEMEntry)
addCommandHandler( "em", attemptEMEntry)

--[[ Object Test
function objTest( player)
	local x, y, z = getElementPosition( player)

	createEventObject( 980, x..","..y..","..z, "0,0,0", player)
end
addCommandHandler( "emo", objTest)
--]]

-- Trigger Entity Modifying

function processEntityFunction( action, element, data, player)
	if data ~= nil then
		triggerClientEvent( element, "GTIevents.processEntityFunction", element, action, data, player)
	else
		triggerClientEvent( element, "GTIevents.processEntityFunction", element, action)
	end
end

-- Event Warp

function warpEvent( player)
	-- Check for event
	if not emWarp then
		oEMF( "No event currently being hosted.", player, true)
		return
	end
	-- Check for Team-Lock
	if teamLock then
		if not exports.GTIutil:isPlayerInTeam(player, eTeam) then
			oEMF( "Event is Team-Locked ["..eTeam.." Only.].", player, true)
			return
		end
	end
	-- Check if player is in custody
    if exports.GTIpoliceArrest:isPlayerInPoliceCustody(player, true, true, true, true, true ) then
        oEMF("You must not be in custody to join an event.", player, true)
        return
    end
	-- Check if player is wanted
    if exports.GTIpoliceWanted:isPlayerWanted(player) then
        oEMF("You must be un-wanted to join an event.", player, true)
        return
    end
	-- Check if player is logged in
    if not exports.GTIutil:isPlayerLoggedIn(player) then
        oEMF("Logging in is required to join an event.", player, true)
        return
    end
	-- Check if player is already warped
    if prohibit[player] == "left" and multi_warping ~= true then
        oEMF("Event Re-entry is disabled.", player, true)
        return
	end
	-- Check if player was kicked from the event
	if prohibit[player] == "kicked" then
		oEMF("You may not rejoin this event due to being kicked from it.", player, true)
		return
	end
	-- Check if player was killed while in the event
	if prohibit[player] == "killed" then
		oEMF( "You died in this event and therefore cannot rejoining it.", player, true)
		return
	end
	-- Check if player is elegible to leave
	if prohibit[player] and prohibit[player] ~= "left" then
		leaveEvent( player, false)
		--[[
		if tonumber( warps) >= tonumber( eLimit) then
			outputEM( "A player has left the event. Slot(s) is available.", false, root, true)
		end
		--]]
		if player ~= running_manager then
			oEMF( "Left the event.", player, true)
		end
		oEMF( getPlayerName( player).." left the event.", running_manager, "white")
		--triggerClientEvent( root, "GTIevents.processEntityFunction", root, "updateParticipantList", player, "leave")
		return
	end
	-- Check if slots still exist
	if emWarp and tonumber(warps) < tonumber(eLimit) then
		if not getPedOccupiedVehicle(player) then
			if not prohibit[player] or prohibit[player] == "left" then
				warped[player] = true
				local pX, pY, pZ = getElementPosition( player)
				local int , dim = getElementInterior( player), getElementDimension( player)

				savedPos[player] = pX..";"..pY..";"..pZ..";"..int..";"..dim
			end
			setElementPosition( player, eX, eY, eZ)
			setElementInterior( player, eint)
			setElementDimension( player, edim)
			if freezeOnWarp then
				toggleAllControls( player, false)
				setPedWeaponSlot( player, 0)
			end
			warps = warps + 1
			if player ~= running_manager then
				oEMF( "Warped to event.", player)
			end
			oEMF( getPlayerName( player).." joined the event.", running_manager, "white")
			--triggerClientEvent( root, "GTIevents.processEntityFunction", root, "updateParticipantList", player, "join")
			processEntityFunction( "updateParticipantList", root, "join", player)

			if tonumber( warps) >= tonumber( eLimit) then
				if not full then
					outputEM( "Event is full.", false, root, true)
					full = true
				end
			end
		else
			oEMF( "Leave the vehicle before warping.", player, true)
		end
	else
		oEMF( "Event is full.")
	end
end
addCommandHandler( "eventwarp", warpEvent)
