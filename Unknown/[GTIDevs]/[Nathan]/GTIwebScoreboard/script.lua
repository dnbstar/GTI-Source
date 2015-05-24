local onlinePlayers = {}

function WEBgetOnlinePlayers()
    return onlinePlayers
end

function startGatherPlayers()
    for i, k in ipairs(getElementsByType("player")) do
        gatherPlayerData(k)
    end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), startGatherPlayers);
setTimer(startGatherPlayers, 300000, 0)


function loginHandler(_, account)
    local player = getAccountPlayer(account)
    if (player) then
        gatherPlayerData(player)
    end
end
addEventHandler("onPlayerLogin", getRootElement(), loginHandler)

function quitHandler()
    local account = getPlayerAccount(source)
    local accountName = tostring(getAccountName(account))
    if (accountName) then
        onlinePlayers[accountName] = nil
    end
end
addEventHandler("onPlayerQuit", getRootElement(), quitHandler)

function gatherPlayerData(player)
    if (player and getElementType(player) == "player") then
        local accountName = tostring(getAccountName(getPlayerAccount(player)))
        if (accountName and exports.GTIutil:isPlayerLoggedIn(player)) then
            onlinePlayers[accountName] = {}
            onlinePlayers[accountName]["team"] = getTeamName(getPlayerTeam(player))
            onlinePlayers[accountName]["ingamename"] = getPlayerName(player)
            onlinePlayers[accountName]["WL"] = exports.GTIpoliceWanted:getPlayerWantedLevel(player, true)
            onlinePlayers[accountName]["occupation"] = exports.GTIemployment:getPlayerJob(player, false)
            onlinePlayers[accountName]["money"] = getPlayerMoney(player)
            onlinePlayers[accountName]["ping"] = getPlayerPing(player)
            onlinePlayers[accountName]["ip"] = getPlayerIP(player)
            teamR, teamG, teamB = getPlayerNametagColor(player)

            onlinePlayers[accountName]["team_color"] = RGBToHex(getTeamColor(getPlayerTeam(player)))
            onlinePlayers[accountName]["timestamp"] = getRealTime().timestamp
			onlinePlayers[accountName]["group"] = exports.GTIgroups:getPlayerGroup(player, true)
        end
    end
end

function table.size(table)
    local length = 0
    for _ in pairs(table) do length = length +1 end
    return length
end

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