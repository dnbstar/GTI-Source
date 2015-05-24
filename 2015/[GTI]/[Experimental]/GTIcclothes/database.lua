-- Database Functions
---------------------->>

local ipairs = ipairs
local type = type
local tonumber = tonumber

local dataName = "clothing"

local db = dbConnect("mysql", "dbname=gti;host=127.0.0.1", "GTI", "2xN2U2XKneEyVxb")
dbExec(db, "CREATE TABLE IF NOT EXISTS `"..dataName.."`(`id` INT NOT NULL AUTO_INCREMENT, `name` TEXT, PRIMARY KEY(id))")

local database_online		-- Is Database Online?
local clothesData = {}		-- Account Data Cache

addEvent("onDatabaseLoad", true)	-- Triggers when the database is ready

-- Cache Account Data Database
------------------------------->>

addEventHandler("onResourceStart", resourceRoot, function()
	dbQuery(cacheDatabase, {}, db, "SELECT * FROM `"..dataName.."`")
end)

function cacheDatabase(qh)
	local result = dbPoll(qh, 0)
	clothesData["Console"] = {}
	for i,row in ipairs(result) do
		clothesData[row.name] = {}
		for column,value in pairs(row) do
			if (column ~= "name" or column ~= "id") then
				if (not clothesData["Console"][column]) then
					clothesData["Console"][column] = true
				end
				if (value == "true") then value = true end
				if (value == "false") then value = false end
				clothesData[row.name][column] = value
			end
		end
	end
	database_online = true
	triggerEvent("onDatabaseLoad", resourceRoot, "clothing")
end

-- Account Exports
------------------->>

function sCD(account, key, value)
	--if (not database_online) then return false end
	if (not account or not key) then return false end
	if (isGuestAccount(account)) then return false end

	local account = getAccountName(account)

	if (not clothesData[account]) then
		clothesData[account] = {}
		dbExec(db, "INSERT INTO `"..dataName.."`(name) VALUES(?)", account)
	end

	if (clothesData["Console"] and clothesData["Console"][key] == nil) then
		clothesData["Console"][key] = true
		dbExec(db, "ALTER TABLE `"..dataName.."` ADD `??` text", key)
	end

	clothesData[account][key] = value
	if (value ~= nil) then
		dbExec(db, "UPDATE `"..dataName.."` SET `??`=? WHERE name=?", key, tostring(value), account)
	else
		dbExec(db, "UPDATE `"..dataName.."` SET `??`=NULL WHERE name=?", key, account)
	end
	return true
end

function gCD(account, key)
	--if (not database_online) then return nil end
	if (not account or not key) then return nil end
	if (isGuestAccount(account)) then return nil end

	local account = getAccountName(account)
	if (clothesData[account] == nil) then return nil end
	if (clothesData[account][key] == nil) then return nil end

	return tonumber(clothesData[account][key]) or clothesData[account][key]
end
