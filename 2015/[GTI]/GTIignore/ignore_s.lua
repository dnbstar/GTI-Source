function table.empty(a )
    if type(a ) ~= "table" then
        return false
    end

    return not next(a )
end

-- Add Ignore
function addIgnore(name)
	if exports.GTIutil:findPlayer(name) then
		local plr = exports.GTIutil:findPlayer(name)
		local name = getPlayerName(plr)
		local pAcc = getPlayerAccount(plr)
		local accName = getAccountName(pAcc)
		triggerClientEvent(source, "GTIignore.finalizeIgnore", source, name, accName)
	end
end
addEvent("GTIignore.addIgnore", true)
addEventHandler("GTIignore.addIgnore", root, addIgnore)

-- Save Ignore Table
function saveIgnores(theTable)
	local account = getPlayerAccount(source)
	exports.GTIaccounts:invSet(account, "ignore_list", theTable)
end
addEvent("GTIignore.sendTableOnline", true)
addEventHandler("GTIignore.sendTableOnline", root, saveIgnores)

function getPlayerIgnoreTable(player)
	local account = getPlayerAccount(player)
	if exports.GTIaccounts:invGet(account, "ignore_list") then
		local ttable = exports.GTIaccounts:invGet(account, "ignore_list")
		return ttable
	else
		return false
	end
end

function sendIgnoreTableToClient(player, theTable)
	triggerClientEvent(player, "getTable", player, theTable)
end

function isPlayerOnIgnoreList(player, name)
	if type(player) == "string" then
		player = exports.GTIutil:findPlayer(player)
	end
	if not isElement(player) then
		return false
	end
	local account = getPlayerAccount(player)
	if not isGuestAccount(account) then
		if getPlayerIgnoreTable(player) then
			local theTable = getPlayerIgnoreTable(player)
			local plr = exports.GTIutil:findPlayer(name)
			if isElement(plr) then
				local searchAccount = getAccountName(getPlayerAccount(plr))
				if string.find(theTable, searchAccount) then
					return true
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	else
		return false
	end
end

--[[
function isPlayerOnIgnoreList(player, name)
	local account = getPlayerAccount(player)
	if not isGuestAccount(account) then
		if getPlayerIgnoreTable(player) then
			local theTable = getPlayerIgnoreTable(player)
			if table.empty(theTable) then return false end
			for i, data in pairs (theTable) do
				local accountName = data[2]
				local plr = getPlayerFromName(name)
				if plr then
					local searchAccount = getAccountName(getPlayerAccount(plr))
					if string.find(accountName, searchAccount) then
						return true
					else
						return false
					end
				else
					return false
				end
			end
		else
			return false
		end
	else
		return false
	end
end
--]]

addEventHandler("onPlayerLogin", root,
	function(pAcc, account)
		if getPlayerIgnoreTable(source) then
			local theTable = getPlayerIgnoreTable(source)
			triggerClientEvent(source, "GTIignore.loadIgnoreTable", source, theTable)
		end
	end
)

addEventHandler("onResourceStart", resourceRoot,
	function()
		for i, player in pairs (getElementsByType("player")) do
			local account = getPlayerAccount(player)
			if not isGuestAccount(account) then
				if getPlayerIgnoreTable(player) then
					local theTable = getPlayerIgnoreTable(player)
					--triggerClientEvent(player, "getTable", player, theTable)
					setTimer(sendIgnoreTableToClient, 500, 1, player, theTable)
				end
			end
		end
	end
)
