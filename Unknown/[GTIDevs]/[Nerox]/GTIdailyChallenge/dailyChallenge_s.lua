------------------------------------------------->>
-- PROJECT:			Grand Theft International
-- RESOURCE: 		GTIdailyChallenge/dailyChallenge_c.lua
-- DESCRIPTION:		Completing a challenge everyday in order to win an amount of money.
-- AUTHOR:			Nerox
-- RIGHTS:			All rights reserved to author
------------------------------------------------->>
local missionsTable = {
    Civilian = {
	{"Do 10 Flights", "Cut 20 Tree", "Fix 5 vehicles", {"Pilot", "Lumberjack", "Mechanic"}, {10, 20, 5}},
	{"Deliver 5 mail", "Mine 1000 grams", "Collect 10 trashes", {"Mail Carrier", "Quarry Miner", "Trash Collector"}, {5, 1000, 10}},
	{"Deliver 5 pizzas", "Harvest 100 bail", "Catch 20 fish", {"Pizza Delivery", "Farmer", "Fisherman"}, {5, 100, 20}},
	{"Harvest 100 bail", "Do 10 Flights", "Collect 10 trashes", {"Farmer", "Pilot", "Trash Collector"}, {100, 10, 10}},
	{"Mine 1000 grams", "Submit 7 reports", "Deliver 5 pizzas", {"Quarry Miner", "Journalist", "Pizza Delivery"}, {100, 5, 5}},
	{"Catch 20 fish", "Deliver 5 mail", "Cut 20 tree", {"Fisherman", "Mail Carrier", "Trash Collector"}, {5, 20, 20}},
	{"Cut 20 tree", "Harvest 100 bail", "Fix 5 vehicles", {"Lumberjack", "Farmer", "Mechanic"}, {20, 100, 5}},
	{"Pilot 10 miles", "Submit 7 reports", "Do 2 deliveries", {"Mariner", "Journalist", "Trucker"}, {10, 7, 2}},
	{"Submit 7 reports", "Deliver 5 mail", "Cut 20 tree", {"Journalist", "Mail Carrier", "Lumberjack"}, {7, 5, 20}},
	{"Do 10 Flights", "Mine 1000 grams", "Fix 5 vehicles", {"Pilot", "Quarry Miner", "Mechanic"}, {10, 1000, 5}},
	},
	Criminal = {
	{"Kill 10 cops", "Deliver 2 illegal trucks", "Rob 3 ATMs", {"Police Killing", "Illegal Trucker", "ATM Robbery"}, {10, 2, 3}},
	{"Kill 10 cops", "Deliver 2 hijacks", "Rob 3 ATMs", {"Police Killing", "Hijack", "ATM Robbery"}, {10, 2, 2}},
	{"Kill 10 cops", "Rob 2 stores", "Deliver 2 pimps", {"Police Killing", "Store Robbery", "Pimp"}, {10, 2, 2}},
	{"Kill 10 cops", "Rob 2 houses", "Win a CnR Robbery", {"Police Killing", "House Robbery", "CnR Robbery"}, {10, 2, 1}},
	},
	Law = {
	{"Arrest 5 wanted players", "Stop 2 ammunation robberies", "Stop a CnR robbery", {"Police Officer", "blabla", "blabalalsd"}, {5, 2, 1}},
	{"Arrest 5 wanted players", "Liberate 2 turfs", "Catch 2 cars speeding", {"Police Officer", "SWAT", "Whateveritscalled"}, {5, 2, 2}},
	{"Arrest 5 wanted players", "Extinguish 5 fires", "Stop 2 ammunation robberies", {"Police Officer", "Firefighter", "IDK"}},
	},
}
local criminalTasks = {"Police Killing", "Illegal Trucker", "ATM Robbery", "Hijack", "Ammu-Nation Robbery", "Store Robbery", "Pimp", "House Robbery", "CnR Robbery"}
local civilianTasks = {}
local playersTask = {}
local playersOnChoosePanel = {}
local dataBase = dbConnect("sqlite", ":GTIdailyChallenge/lastSeen.db")
local lastSeenTable = dbExec( dataBase, "CREATE TABLE IF NOT EXISTS lastSeen(accountName varchar(100), lastSeen varchar(100))")
function onLogoutStoreInfo(thePreviousAccount) -- logout or quit
    local realTime = getRealTime()
	local playerAccount
    if (eventName == "onPlayerQuit") or (eventName == "GTIdailyChallenge.onLogoutStoreInfo") then
	    if isGuestAccount(getPlayerAccount(source)) then return false end
        playerAccount = getPlayerAccount(source)
		unregisterData(source)
		if isPlayersOnChoosePanel(source) then
		    setChooseTaskEnabledNextLogin(source, true)
			playersOnChoosePanel[source] = nil
		end
	elseif eventName == "onPlayerLogout" then
	    playerAccount = thePreviousAccount
	end
	dbExec(dataBase, "UPDATE lastSeen SET lastSeen=? WHERE accountName=?", ""..realTime.monthday.."/"..1+realTime.month.."/"..1900+realTime.year.."", getAccountName(playerAccount))
end
addEventHandler ( "onPlayerQuit", root, onLogoutStoreInfo )
addEventHandler("onPlayerLogout", root, onLogoutStoreInfo)
addEvent("GTIdailyChallenge.onLogoutStoreInfo", true)
addEventHandler("GTIdailyChallenge.onLogoutStoreInfo", root, onLogoutStoreInfo)
local firstTimePlayers = {}
function onFirstLoginStoreInfo(plr, currAcc)
    local currentAccount
    if eventName == "GTIdailyChallenge.onLoginStoreInfo" then
	    currentAccount = getPlayerAccount(plr)
	else
	    currentAccount = currAcc
	end
    if dataBase then
	    local query = dbQuery(dataBase, "SELECT * FROM lastSeen WHERE accountName=?", getAccountName(currentAccount))
		local poll = dbPoll(query, -1)
		local realTime = getRealTime()
		if (#poll == 0) then
		    dbExec(dataBase, "INSERT INTO lastSeen(accountName, lastSeen) VALUES(?,?)", getAccountName(currentAccount), ""..realTime.monthday.."/"..1+realTime.month.."/"..1900+realTime.year.."")
		    firstTimePlayers[getAccountPlayer(currentAccount)] = true
		end
	end
	processDailyChallenge(getAccountPlayer(currentAccount))
end
addEvent("GTIdailyChallenge.onLoginStoreInfo", true)
addEventHandler("GTIdailyChallenge.onLoginStoreInfo", root, onFirstLoginStoreInfo)
addEventHandler("onPlayerLogin", root, onFirstLoginStoreInfo)
function processDailyChallenge(player)
    local pDay, pMonth, pYear = getPlayerLastSeen(player)
	local cTime = getRealTime()
	local cDay, cMonth, cYear = tonumber(cTime.monthday), tonumber(1+cTime.month), tonumber(1900+cTime.year)
	---
	--outputChatBox("Day: "..cDay..", "..pDay.."...Month: "..cMonth..", "..pMonth.."...Year: "..cYear..", "..pYear.."")
	if (tonumber(pDay) == cDay and tonumber(pMonth) == cMonth and tonumber(pYear) == cYear) and not firstTimePlayers[player] then
	    adjustPlayerData(player)
		if exports.GTIaccounts:GAD(getPlayerAccount(player), "GTIdailyChallenge.setChooseTaskEnabledNextLogin") then
		    exports.GTIaccounts:SAD(getPlayerAccount(player), "GTIdailyChallenge.setChooseTaskEnabledNextLogin", false)
		    return setTimer(triggerClientEvent, 2000, 1, player, "GTIdailyChallenge.choooseTask", player, true)
		end
		if exports.GTIaccounts:GAD(getPlayerAccount(player), "GTIdailyChallenge.isDailyChallengeCompleted") then
		    setTimer(triggerClientEvent, 2000, 1, player, "GTIdailyChallenge.setDailyChallengeCompleted", player, true)
		end
	    local pData = exports.GTIaccounts:GAD(getPlayerAccount(player), "GTIdailyChallenge.dailyChallenge")
		local jobsTable = getPlayerMissionJobs(player)
	    setTimer(triggerClientEvent, 1000, 1, player, "GTIdailyChallenge.recieveData", player, pData, jobsTable)
	else
		setTimer(triggerClientEvent, 2000, 1, player, "GTIdailyChallenge.choooseTask", player, true)
	end
end
function onChooseChallengeType(category)
    pickRandomMission(client, category)
	exports.GTIaccounts:SAD(getPlayerAccount(client), "GTIdailyChallenge.isDailyChallengeCompleted", false)
	setTimer(function(player)
	    local pData = exports.GTIaccounts:GAD(getPlayerAccount(player), "GTIdailyChallenge.dailyChallenge")
		local jobsTable = getPlayerMissionJobs(player)
	    triggerClientEvent(player, "GTIdailyChallenge.recieveData", player, pData, jobsTable)
	end, 1000, 1, client)
end
addEvent("GTIdailyChallenge.onChooseChallengeType", true)
addEventHandler("GTIdailyChallenge.onChooseChallengeType", root, onChooseChallengeType)
function getPlayerLastSeen(player) --- Returns day, month, year
    if player and not isGuestAccount(getPlayerAccount(player)) then
	    local lastSeenQuery = dbQuery(dataBase, "SELECT * FROM lastSeen WHERE accountName=?", getAccountName(getPlayerAccount(player)))
		local lastSeenPoll = dbPoll(lastSeenQuery, -1)
		if (#lastSeenPoll == 0) then return false end
	    local splittedDate = split(lastSeenPoll[1].lastSeen, "/")
		return splittedDate[1], splittedDate[2], splittedDate[3]
	end
end
function adjustPlayerData(player)
    if player and not isGuestAccount(getPlayerAccount(player)) then
	    local playerAccount	= getPlayerAccount(player)
		local playerAccountData = exports.GTIaccounts:GAD(playerAccount, "GTIdailyChallenge.dailyChallenge")
		if not playerAccountData then return false end
		local splittedData = split(playerAccountData, ";")
		local playerCategory = splittedData[1]
		local playerTasks = split(splittedData[2], ",")
		for i=1, #missionsTable[playerCategory] do
		    if playerTasks[1] == missionsTable[playerCategory][i][1] and playerTasks[2] == missionsTable[playerCategory][i][2] and playerTasks[3] == missionsTable[playerCategory][i][3] then
			   playersTask[player] = {}
			   playersTask[player]["mCategory"] = playerCategory
			   playersTask[player]["mTask"] = missionsTable[playerCategory][i]
			   playersTask[player]["mJobs"] = playersTask[player]["mTask"][4]
			   playersTask[player]["mMaxTaskProgress"] = playersTask[player]["mTask"][5]
		    end
		end
	end
end
function pickRandomMission(player, category)
    if category == "Civilian" then
	    playersTask[player] = {}
		playersTask[player]["mCategory"] = "Civilian"
	    playersTask[player]["mTask"] = missionsTable.Civilian[math.random(#missionsTable.Civilian)]
		playersTask[player]["mJobs"] = playersTask[player]["mTask"][4]
		playersTask[player]["mMaxTaskProgress"] = playersTask[player]["mTask"][5]
		exports.GTIaccounts:SAD(getPlayerAccount(player), "GTIdailyChallenge.dailyChallenge", "Civilian;"..playersTask[player]["mTask"][1]..","..playersTask[player]["mTask"][2]..","..playersTask[player]["mTask"][3]..";0,0,0;"..playersTask[player]["mMaxTaskProgress"][1]..","..playersTask[player]["mMaxTaskProgress"][2]..","..playersTask[player]["mMaxTaskProgress"][3].."")
		return true
	elseif category == "Criminal" then
	    playersTask[player] = {}
		playersTask[player]["mCategory"] = "Criminal"
		playersTask[player]["mTask"] = missionsTable.Criminal[math.random(#missionsTable.Criminal)]
		playersTask[player]["mJobs"] = playersTask[player]["mTask"][4]
		playersTask[player]["mMaxTaskProgress"] = playersTask[player]["mTask"][5]
		exports.GTIaccounts:SAD(getPlayerAccount(player), "GTIdailyChallenge.dailyChallenge", "Criminal;"..playersTask[player]["mTask"][1]..","..playersTask[player]["mTask"][2]..","..playersTask[player]["mTask"][3]..";0,0,0;"..playersTask[player]["mMaxTaskProgress"][1]..","..playersTask[player]["mMaxTaskProgress"][2]..","..playersTask[player]["mMaxTaskProgress"][3].."")
		return true
	elseif category == "Law" then
	    playersTask[player] = {}
	    playersTask[player]["mCategory"] = "Law"
		playersTask[player]["mTask"] =  missionsTable.Law[math.random(#missionsTable.Law)]
		playersTask[player]["mJobs"] = playersTask[player]["mTask"][4]
		playersTask[player]["mMaxTaskProgress"] = playersTask[player]["mTask"][5]
		exports.GTIaccounts:SAD(getPlayerAccount(player), "GTIdailyChallenge.dailyChallenge", "Law;"..playersTask[player]["mTask"][1]..","..playersTask[player]["mTask"][2]..","..playersTask[player]["mTask"][3]..";0,0,0;"..playersTask[player]["mMaxTaskProgress"][1]..","..playersTask[player]["mMaxTaskProgress"][2]..","..playersTask[player]["mMaxTaskProgress"][3].."")
		return true
	end
end
function getPlayerMissionCategory(player)
    if not isElement(player) or not getElementType(player) == "player" then return false end
    if isGuestAccount(getPlayerAccount(player)) then return false end
	if not playersTask[player]["mCategory"] then return false end
	return playersTask[player]["mCategory"]
end
function getPlayerMissionTask(player)
    if not isElement(player) or not getElementType(player) == "player" then return false end
    if isGuestAccount(getPlayerAccount(player)) then return false end
	if not playersTask[player]["mTask"] then return false end
	return {playersTask[player]["mTask"][1], playersTask[player]["mTask"][2], playersTask[player]["mTask"][3]}
end
function getPlayerMissionJobs(player)
    if not isElement(player) or not getElementType(player) == "player" then return false end
    if isGuestAccount(getPlayerAccount(player)) then return false end
	if getPlayerMissionCategory(player) == "Law" then return false end
	if not playersTask[player]["mJobs"] then return false end
	return playersTask[player]["mJobs"]
end
function getPlayerMissionsMaxProgress(player)
    if not isElement(player) or not getElementType(player) == "player" then return false end
    if isGuestAccount(getPlayerAccount(player)) then return false end
	if not playersTask[player]["mMaxTaskProgress"] then return false end
	return playersTask[player]["mMaxTaskProgress"]
end
function unregisterData(player)
    playersTask[player] = nil
end
function modifyPlayerChallenge(player, taskName, progress)
    if player and taskName and progress then
	    if isGuestAccount(getPlayerAccount(player)) then return false end
	    if getPlayerMissionCategory(player) == "Civilian" then
		    local missionJobs = getPlayerMissionJobs(player)
		    for i=1, #missionJobs do
			    if missionJobs[i] == taskName then
				    modifyPlayerAccountData(player, i, progress)
						setTimer(function(player)
	    	    	        local pData = exports.GTIaccounts:GAD(getPlayerAccount(player), "GTIdailyChallenge.dailyChallenge")
							local jobsTable = getPlayerMissionJobs(player)
	  	    	            triggerClientEvent(player, "GTIdailyChallenge.recieveData", player, pData, jobsTable)
	    	    	    end, 1000, 1, player)
				    break
				end
			end
		end
	end
end
addEventHandler("onPlayerJobProgressModified", root, function(taskName, progress)
    modifyPlayerChallenge(source, taskName, progress)
end)
function modifyPlayerAccountData(player, progressOrder, progress)
    if exports.GTIaccounts:GAD(getPlayerAccount(player), "GTIdailyChallenge.isDailyChallengeCompleted") then 
	    return false
	end
    if player and isElement(player) and getElementType(player) == "player" then
        local playerAccount	= getPlayerAccount(player)
		local playerAccountData = exports.GTIaccounts:GAD(playerAccount, "GTIdailyChallenge.dailyChallenge")
		if not playerAccountData then return false end
		local playerCategory = getPlayerMissionCategory(player)
		local playerTasks = getPlayerMissionTask(player)
		local playerJobs = getPlayerMissionJobs(player)
		local playerOldProgress = split(split(playerAccountData, ";")[3], ",")
        if progressOrder == 1 then
	        exports.GTIaccounts:SAD(playerAccount, "GTIdailyChallenge.dailyChallenge", ""..playerCategory..";"..playerTasks[1]..","..playerTasks[2]..","..playerTasks[3]..";"..progress+(playerOldProgress[1])..","..playerOldProgress[2]..","..playerOldProgress[3]..";"..playersTask[player]["mMaxTaskProgress"][1]..","..playersTask[player]["mMaxTaskProgress"][2]..","..playersTask[player]["mMaxTaskProgress"][3].."")
	    elseif progressOrder == 2 then
		    exports.GTIaccounts:SAD(playerAccount, "GTIdailyChallenge.dailyChallenge", ""..playerCategory..";"..playerTasks[1]..","..playerTasks[2]..","..playerTasks[3]..";"..playerOldProgress[1]..","..progress+(playerOldProgress[2])..","..playerOldProgress[3]..";"..playersTask[player]["mMaxTaskProgress"][1]..","..playersTask[player]["mMaxTaskProgress"][2]..","..playersTask[player]["mMaxTaskProgress"][3].."")
		elseif progressOrder == 3 then
		    exports.GTIaccounts:SAD(playerAccount, "GTIdailyChallenge.dailyChallenge", ""..playerCategory..";"..playerTasks[1]..","..playerTasks[2]..","..playerTasks[3]..";"..playerOldProgress[1]..","..playerOldProgress[2]..","..progress+(playerOldProgress[3])..";"..playersTask[player]["mMaxTaskProgress"][1]..","..playersTask[player]["mMaxTaskProgress"][2]..","..playersTask[player]["mMaxTaskProgress"][3].."")
		end
		checkCurrentProgress(player)
	end
end
function checkCurrentProgress(player)
    if player and isElement(player) and getElementType(player) == "player" then
        local playerAccount	= getPlayerAccount(player)
		local playerAccountData = exports.GTIaccounts:GAD(playerAccount, "GTIdailyChallenge.dailyChallenge")
		if not playerAccountData then return false end
		local playerCategory = getPlayerMissionCategory(player)
		local playerTasks = getPlayerMissionTask(player)
		local playerJobs = getPlayerMissionJobs(player)
		local playerOldProgress = split(split(playerAccountData, ";")[3], ",")
		local missionsProgress = getPlayerMissionsMaxProgress(player)
		if (tonumber(playerOldProgress[1]) >= tonumber(missionsProgress[1])) and (tonumber(playerOldProgress[2]) >= tonumber(missionsProgress[2])) and (tonumber(playerOldProgress[3]) >= tonumber(missionsProgress[3])) then
		    triggerEvent("GTIdailyChallenge.onPlayerFinishDailyChallenge", player)
		end
	end
end
function onPlayerFinishDailyChallenge()
    if exports.GTIaccounts:GAD(getPlayerAccount(source), "GTIdailyChallenge.isDailyChallengeCompleted") then 
	    return false
	end
    if source and isElement(source) and getElementType(source) == "player" then
	    ---Give money
		exports.GTIbank:GPM(source, 8000, "Daily challenge: Completed daily challenge")
		exports.GTIaccounts:SAD(getPlayerAccount(source), "GTIdailyChallenge.isDailyChallengeCompleted", true)
		triggerClientEvent(source, "GTIdailyChallenge.setDailyChallengeCompleted", source, true)
	end
end
addEvent("GTIdailyChallenge.onPlayerFinishDailyChallenge", true)
addEventHandler("GTIdailyChallenge.onPlayerFinishDailyChallenge", root, onPlayerFinishDailyChallenge)
function onStartStoreInfo()
    for id, player in ipairs(getElementsByType("player")) do
	    if not isGuestAccount(getPlayerAccount(player)) then
		    triggerEvent("GTIdailyChallenge.onLoginStoreInfo", player, player)
			if exports.GTIaccounts:GAD(getPlayerAccount(player), "GTIdailyChallenge.isDailyChallengeCompleted") then
		        --setTimer(triggerClientEvent, 2000, 1, player, "GTIdailyChallenge.setDailyChallengeCompleted", player, true)
		    end
		end
	end
end
addEventHandler("onResourceStart", resourceRoot, onStartStoreInfo)
function onStopStoreInfo()
    for id, player in ipairs(getElementsByType("player")) do
	    if not isGuestAccount(getPlayerAccount(player)) then
		    triggerEvent("GTIdailyChallenge.onLogoutStoreInfo", player)
		end
	end
end
addEventHandler("onResourceStop", resourceRoot, onStopStoreInfo)
local playersOnPanel = {}
function setPlayerOnPanel(state)
    if state then
	    playersOnPanel[client] = true
	else
	    playersOnPanel[client] = nil
	end
end
addEvent("GTIdailyChallenge.setPlayerOnPanel", true)
addEventHandler("GTIdailyChallenge.setPlayerOnPanel", root, setPlayerOnPanel)
function isPlayerOnPanel(player)
    if playersOnPanel[player] then
	    return true
	else
	    return false
	end
end
function setPlayerOnChoosePanel(state)
    if state then
	    playersOnChoosePanel[client] = true
	else
	    playersOnChoosePanel[client] = nil
	end
end
addEvent("GTIdailyChallenge.setPlayerOnChoosePanel", true)
addEventHandler("GTIdailyChallenge.setPlayerOnChoosePanel", root, setPlayerOnChoosePanel)
function isPlayersOnChoosePanel(player)
    if playersOnChoosePanel[player] then
	    return true
	else
	    return false
	end
end
addEventHandler("onPlayerQuit", root, function()
    if playersOnPanel[source] then
	    playersOnPanel[source] = nil
	end
end)
function isLeapYear(year)
    if year then year = math.floor(year)
    else year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
end
function getTimestamp(year, month, day, hour, minute, second)
    -- initiate variables
    local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
    local timestamp = 0
    local datetime = getRealTime()
    year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
    hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second
 
    -- calculate timestamp
    for i=1970, year-1 do timestamp = timestamp + (isLeapYear(i) and 31622400 or 31536000) end
    for i=1, month-1 do timestamp = timestamp + ((isLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
    timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second
 
    timestamp = timestamp - 3600 --GMT+1 compensation
    if datetime.isdst then timestamp = timestamp - 3600 end
 
    return timestamp
end
local minuteTimeFix = 60
local hourTimeFix = 11
local delayMinuteFix = false
function getTimeLeftForNextDay()
    local realTime = getRealTime()
	local currentTime = getTimestamp(1900+realTime.year, 1+realTime.month, realTime.monthday, realTime.hour, realTime.minute, realTime.second)
	local nextDayTime = getTimestamp(1900+realTime.year, 1+realTime.month, realTime.monthday, 12, 0, 0)
	local timeLeft = (currentTime - nextDayTime)/ 3600
	local splittedTime = split(timeLeft, ".")
	local minutesLeft = minuteTimeFix-((tonumber("0."..(splittedTime[2] or 0).."") * 3600)/60)
	local secondsLeft = math.ceil(tonumber("0."..(split(minutesLeft, ".")[2] or 0).."") * 60)
	local hoursLeft = hourTimeFix-splittedTime[1]
	if hoursLeft > 11 then
	    hourTimeFix = 12
		minuteTimeFix = 0
	else
	    hourTimeFix = 11
		minuteTimeFix = 60 
	end
	minutesLeft = string.gsub(minutesLeft, "-", "")
	if tonumber(hoursLeft) == 0 and math.ceil(tonumber(minutesLeft)) == 1 and not delayMinuteFix then
	    resetDailyChallengeForAll()
		delayMinuteFix = true
		setTimer(function()
		    delayMinuteFix = false
		end, 65000, 1)
	end
	for id, player in ipairs(getElementsByType("player")) do
	    if isPlayerOnPanel(player) then
            triggerClientEvent(player, "GTIdailyChallenge.updateTimeLeft", player, hoursLeft, math.ceil(minutesLeft), secondsLeft)
        end
	end
end
setTimer(getTimeLeftForNextDay, 1000, 0)
function resetDailyChallengeForAll()
    for id, player in ipairs(getElementsByType("player")) do
	    triggerClientEvent(player, "GTIdailyChallenge.setPlayerAbleToOpenPanel", player, true)
		triggerClientEvent(player, "GTIdailyChallenge.choooseTask", player, true)
		triggerClientEvent(player, "GTIdailyChallenge.setDailyChallengeCompleted", player, false)
		exports.GTIaccounts:SAD(getPlayerAccount(player), "GTIdailyChallenge.isDailyChallengeCompleted", false)
	end
end
function setChooseTaskEnabledNextLogin(player, state)
    if state then
	    exports.GTIaccounts:SAD(getPlayerAccount(player), "GTIdailyChallenge.setChooseTaskEnabledNextLogin", true)
	else
	    exports.GTIaccounts:SAD(getPlayerAccount(player), "GTIdailyChallenge.setChooseTaskEnabledNextLogin", false)
	end
end
addEvent("GTIdailyChallenge.setChooseTaskEnabledNextLogin", true)
addEventHandler("GTIdailyChallenge.setChooseTaskEnabledNextLogin", root, setChooseTaskEnabledNextLogin)