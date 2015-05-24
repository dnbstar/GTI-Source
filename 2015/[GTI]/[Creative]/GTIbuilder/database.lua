-- Database Functions
---------------------->>

local ipairs = ipairs
local type = type
local tonumber = tonumber

databaseName = "gti"
databaseUserName = "GTI"
dataBasePass = "2xN2U2XKneEyVxb"
--[[
databaseName = "gt"
databaseUserName = "LilDolla"
dataBasePass = "Mathiasb12"
--]]
dataName = "builderdata"

local db = dbConnect("mysql", "dbname="..databaseName..";host=127.0.0.1", databaseUserName, dataBasePass)
dbExec(db, "CREATE TABLE IF NOT EXISTS `"..dataName.."`(`id` INT NOT NULL AUTO_INCREMENT, `name` TEXT, PRIMARY KEY(id))")

local database_online		-- Is Database Online?
builderdata = {}		-- Account Data Cache

addEvent("onDatabaseLoad", true)	-- Triggers when the database is ready

-- Cache Builder Data Database
------------------------------->>

addEventHandler("onResourceStart", resourceRoot, function()
	dbQuery(cacheDatabase, {}, db, "SELECT * FROM `"..dataName.."`")
end)

function cacheDatabase(qh)
	local result = dbPoll(qh, 0)
	builderdata["Console"] = {}
	for i,row in ipairs(result) do
		builderdata[row.name] = {}
		for column,value in pairs(row) do
			if (column ~= "name" or column ~= "id") then
				if (not builderdata["Console"][column]) then
					builderdata["Console"][column] = true
				end
				if (value == "true") then value = true end
				if (value == "false") then value = false end
				builderdata[row.name][column] = value
			end
		end
	end
	database_online = true
	triggerEvent("onDatabaseLoad", resourceRoot, "builderdata")
	buildZone( root)
end

-- Builder Zone Exports
------------------->>

function setZoneData(account, key, value)
	if (not database_online) then return false end
	if (not account or not key) then return false end
	--if (isGuestAccount(account) or type(key) ~= "string") then return false end
	if (type(key) ~= "string") then return false end

	--local account = getAccountName(account)

	if (not builderdata[account]) then
		builderdata[account] = {}
		dbExec(db, "INSERT INTO `"..dataName.."`(name) VALUES(?)", account)
	end

	if (builderdata["Console"] and builderdata["Console"][key] == nil) then
		builderdata["Console"][key] = true
		dbExec(db, "ALTER TABLE `"..dataName.."` ADD `??` text", key)
	end

	builderdata[account][key] = value
	if (value ~= nil) then
		dbExec(db, "UPDATE `"..dataName.."` SET `??`=? WHERE name=?", key, tostring(value), account)
	else
		dbExec(db, "UPDATE `"..dataName.."` SET `??`=NULL WHERE name=?", key, account)
	end
	return true
end

function getZoneData(account, key)
	if (not database_online) then return nil end
	if (not account or not key) then return nil end
	--if (isGuestAccount(account) or type(key) ~= "string") then return nil end
	if (type(key) ~= "string") then return nil end

	--local account = getAccountName(account)
	if (builderdata[account] == nil) then return nil end
	if (builderdata[account][key] == nil) then return nil end

	return tonumber(builderdata[account][key]) or builderdata[account][key]
end
