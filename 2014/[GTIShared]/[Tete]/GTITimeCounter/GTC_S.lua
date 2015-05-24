-- Global variables

local playerTickCount = {}
local updatingTimer

-- Easing functions

local function isPlayerGuest ( player )
	return isGuestAccount ( getPlayerAccount ( player )  )
end

local function secsToHM ( seconds )
	local hours   = math.floor ( seconds / ( 60 * 60 ) )
	local minutes = math.floor ( ( seconds / 60 ) % 60 )
	hours         = ( hours < 10 and 0 .. hours ) or hours
	minutes       = ( minutes < 10 and 0 .. minutes ) or minutes
	return hours .. ":" .. minutes
end

local function HMToSecs ( hours, minutes )
	local hoursToSecs   = hours * ( 60 * 60 )
	local minutesToSecs = minutes * 60
	return hoursToSecs + minutesToSecs
end

local function updateScoreboard ( )
	for index, player in ipairs ( getElementsByType ( "player" ) ) do
		local pAcc = getPlayerAccount ( player )
		if ( not isPlayerGuest ( player ) ) then
			if ( not playerTickCount [ player ] ) then
				playerTickCount [ player ] = getTickCount ( )
			end
			local currentTime = math.floor ( ( getTickCount ( ) - playerTickCount [ player ]  ) / 1000 )
			local totalTime   = getAccountPlayTime ( pAcc ) + currentTime
			setElementData ( player, "Play time", secsToHM ( totalTime ) )
		end
	end
end

-- Exported function(s)

function getAccountPlayTime ( account, timeType )
	if ( not isGuestAccount ( account ) ) then
		local result = exports.GTIaccounts:GAD ( account, "playtime" )
		if ( result ) then
			result = tonumber ( result )
			if ( not timeType ) then timeType = "Seconds" end
			if ( timeType == "Seconds" ) then
				result = result
			elseif ( timeType == "Minutes" ) then
				result = math.floor ( result / 60 )
			elseif ( timeType == "Hours" ) then
				result = math.floor ( result / ( 60 * 60 ) )
			end
			return result
		end
	end
	return false
end

function setAccountPlayTime ( account, hours, minutes )
	if ( not isGuestAccount ( account ) ) then
		local seconds  = tostring ( HMToSecs ( hours, minutes ) )
		local player   = getAccountPlayer ( account )
		if ( isElement ( player ) ) then
			setElementData ( player, "Play time", secsToHM ( seconds ) )
		end
		return exports.GTIaccounts:SAD ( account, "playtime", seconds )
	end
	return false
end

-- Events

function onLogin ( preAcc, curAcc )
	if ( not exports.GTIaccounts:GAD ( curAcc,"playtime" ) ) then
		exports.GTIaccounts:SAD ( curAcc, "playtime", "0" )
		outputChatBox ( "Worked" )
	end
	local time = ( getAccountPlayTime ( curAcc ) ) -- Seconds
	setElementData ( source, "Play time", secsToHM ( time ) )
	playerTickCount [ source ] = getTickCount ( )
end
addEventHandler ( "onPlayerLogin", root, onLogin )

function onQuit ( )
	if ( not isPlayerGuest ( source ) ) then
		local account = getPlayerAccount ( source )
		local pAccTime  = getAccountPlayTime ( account )
		local pPlayTime = math.floor ( ( getTickCount ( ) - playerTickCount [ source ] ) / 1000 )
		exports.GTIaccounts:SAD ( account, "playtime", tostring ( pAccTime + pPlayTime ) )
		playerTickCount [ source ] = nil
	end
end
addEventHandler ( "onPlayerQuit", root, onQuit )

function onStart ( )
	updateScoreboard ( )
	updatingTimer = setTimer ( updateScoreboard, 60000, 0 ) -- There is no need to define a variable for the timer but we might need this variable in the future.
end
addEventHandler ( "onResourceStart", resourceRoot, onStart )

function onStop ( )
	for index, player in ipairs ( getElementsByType ( "player" ) ) do
		if ( not isPlayerGuest ( player ) ) then
			local account   = getPlayerAccount ( player )
			local pAccTime  = getAccountPlayTime ( account )
			local pPlayTime = math.floor ( ( getTickCount ( ) - playerTickCount [ player ] ) / 1000 )
			exports.GTIaccounts:SAD ( account, "playtime", tostring ( pAccTime + pPlayTime ) )
		end
	end
end
addEventHandler ( "onResourceStop", resourceRoot, onStop )

-- The end

exports.scoreboard:scoreboardAddColumn ( "Play time" )