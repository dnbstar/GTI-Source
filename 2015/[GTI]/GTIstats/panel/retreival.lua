--[[ Documentation
	master : Takes care of local functions
	mexp : Takes care of exports
--]]

function getPlayerCrimes (player)
	local crimes = 0
	for i = 1,90 do
		local dataCrimes = exports.GTIpoliceWanted:getWantedData(getPlayerAccount(player), "crimeID"..i) or "0"
		crimes = crimes + dataCrimes
	end
	return crimes
end

displayedStats = {
	--{"Display Name", "code", args, account function}
	{"Name", "master:name"},
	{"Account", "master:accname"},
	{"Hours", "master:hours"},
	{"Origin", "mexp:admin|getPlayerCountry"},
	{"Location", "mexp:GTIchat|getPlayerCity"},
	{"Money", "master:money"},
	{"", "space:space"},
	{"Total Logins", "master:totalLogins"},
	{"Total Interior Enters", "master:enterInt", "enterInt"},
	{"Times Fined", "master:timesFined"},
	{"Crimes Committed", "master:crimesCommitted"},
	{"", "space:space"},
	{"CnR Event Kills", "master:cnrKills"},
	{"CnR Event Deaths", "master:cnrDeaths"},
	{"", "space:space"},
	{"Occupation", "mexp:GTIemployment|getPlayerJob"},
	{"Employment Level", "mexp:GTIemployment|getPlayerEmploymentLevel"},
	{"Arrests", "master:arrests"},
	{"Heals", "master:heals"},
	{"", "space:space"},
	{"Group", "group:name"},
	{"Group Rank", "group:rank"},
	{"", "space:space"},
	{"Kills", "master:kills"},
	{"Deaths", "master:deaths"},
	{"Suicides", "master:suicides"},
	{"KDR", "master:kdr"},
	{"Wanted Level", "master:wl"},
	{"Total Wanted Points", "master:total_wl"},
}

function master(subf, entity)
	local acc = getPlayerAccount(entity)
	if subf == "name" then
		return getPlayerName(entity)
	elseif subf == "accname" then
		return getAccountName(acc)
	elseif subf == "money" then
		local money = "$"..exports.GTIutil:tocomma(getPlayerMoney(entity))
		return money
	elseif subf == "hours" then
		local hours = math.ceil(getPlayerPlaytime(entity)/60)
		return hours
	elseif subf == "wl" then
		return getPlayerWantedLevel(entity)
	elseif subf == "kdr" then
		local k = getStatData(acc, "kills") or 0
		local d = getStatData(acc, "deaths") or 0
		local kdr = string.format("%.2f", k/d)
		return kdr
	elseif subf == "total_wl" then
		local wp = exports.GTIpoliceWanted:getWantedData(acc, "totalWP") or 0
		return exports.GTIutil:tocomma(wp)
	elseif subf == "heals" then
		local heals = exports.GTIemployment:getPlayerJobProgress(entity,"Paramedic") or 0
		return heals
	elseif subf == "arrests" then
		local arrests = exports.GTIemployment:getPlayerJobProgress(entity,"Police Officer") or 0
		return arrests
	elseif subf == "totalLogins" then
		return getStatData(acc, "totalLogins") or 0
	elseif subf == "enterInt" then
		return getStatData(acc, "totalLogins") or 0
	elseif subf == "timesFined" then
		return getStatData(acc, "timesFined") or 0
	elseif subf == "crimesCommitted" then
		local crimes = getPlayerCrimes( entity) or 0
		return crimes
	elseif subf == "cnrKills" then
		return getStatData(acc, "cnrKills") or 0
	elseif subf == "cnrDeaths" then
		return getStatData(acc, "cnrDeaths") or 0
	elseif subf == "kills" then
		return getStatData(acc, "kills") or 0
	elseif subf == "deaths" then
		return getStatData(acc, "deaths") or 0
	elseif subf == "suicides" then
		return getStatData(acc, "suicides") or 0
	end
end

function space()
	return ""
end

function group(subf, entity)
	local thegroup = exports.GTIgroups:getPlayerGroup(entity)
	if subf == "name" then
		return exports.GTIgroups:getGroupName(thegroup)
	elseif subf == "rank" then
		local rank = exports.GTIgroups:getPlayerGroupRank(entity)
		return exports.GTIgroups:getRankName(rank)
	end
end

function mexp(subdata, entity, args, account)
	local sdata = split(subdata, "|")
	local sube = sdata[1]
	local sube = getResourceFromName(sube)
	local subf = sdata[2]

	local acc = getPlayerAccount(entity)

	if args then
		if account then
			efn = call(sube, subf, acc, args)
		else
			efn = call(sube, subf, entity, args)
		end
	else
		if acount then
			efn = call(sube, subf, acc)
		else
			if (not getResourceFromName("admin") or getResourceState(getResourceFromName("admin")) ~= "running") then return end
			efn = call(sube, subf, entity)
		end
	end

	--exportdata = _G[efn](entity)

	return tostring(efn)
end

function getPlayerStatsData(thePlayer)
	local statTable = {}

	for i, stat in ipairs(displayedStats) do
		local name = stat[1]
		local fsjn = stat[2]
		local args = stat[3]
		local acfn = stat[3]

		local fdata = split(fsjn, ":")
		local fn = fdata[1]
		local sfn = fdata[2]
		-- Get Data
		if args then
			if acfn then
				rdata = _G[fn](sfn, thePlayer, args, true)
			else
				rdata = _G[fn](sfn, thePlayer, args)
			end
		else
			rdata = _G[fn](sfn, thePlayer) or false
			if type(rdata) == "number" then
				rdata = exports.GTIutil:tocomma(rdata) or false
			end
		end
		table.insert(statTable, {name, rdata})
	end
	triggerClientEvent(client, "GTIstatistics.returnData", client, statTable, thePlayer)
	statTable = nil
end

function queryStats(thePlayer)
	--local thePlayer = exports.GTIutil:findPlayer(thePlayer)
	local thePlayer = getPlayerFromName(thePlayer)
	if not thePlayer then
		exports.GTIhud:dm("The player you selected could not be found.", client, 255, 125, 0)
		return
	end

	if (not exports.GTIutil:isPlayerLoggedIn(thePlayer)) then
		exports.GTIhud:dm("Cannot view stats. This player is not logged in.", client, 255, 125, 0)
		return
	end

	getPlayerStatsData(thePlayer)
end
addEvent("GTIstatistics.getAllStats", true)
addEventHandler("GTIstatistics.getAllStats", root, queryStats)
