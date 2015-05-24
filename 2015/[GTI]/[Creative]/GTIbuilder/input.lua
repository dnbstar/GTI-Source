local DEFAULT_ZONE_INFO = "This zone has no information which either means it was is for sale or the owner hasn't edited the zone information yet."

function addZoneToDatabase( x, y, z, size, owner, color, id)
	local positionData = x..","..y..","..z
	local owner = owner
	local color = color
	local account =  "zone"..id
	--outputChatBox( positionData.." "..size.." "..zonenumber.." "..offsets.." "..owner.." "..color, root)
	setZoneData(account, "pos", positionData)
	setZoneData(account, "size", size)
	setZoneData(account, "owner", owner)
	setZoneData(account, "color", color)
	--[[
	setZoneData(account, "offsets", )
	setZoneData(account, "", )
	setZoneData(account, "", )
	setZoneData(account, "", )
	--]]
end
addEvent( "GTIbuilder.addZoneToDatabase", true)
addEventHandler( "GTIbuilder.addZoneToDatabase", resourceRoot, addZoneToDatabase)

function buildZone( element)
	for name, category in pairs (builderdata) do
		if name ~= "Console" then
			if not getZoneData( name, "cost") then
				setZoneData( name, "cost", 750000)
			end
			if not getZoneData( name, "objects") then
				setZoneData( name, "objects", "")
			end
			if not getZoneData( name, "shownname") then
				setZoneData( name, "shownname", "Unowned Zone")
			elseif getZoneData( name, "shownname") == "Unowned Zone" then
				setZoneData( name, "shownname", "Un-named Zone")
			end
			if not getZoneData( name, "description") then
				setZoneData( name, "description", DEFAULT_ZONE_INFO)
			end

			local pos = getZoneData( name, "pos")
			local size = getZoneData( name, "size")
			local owner = getZoneData( name, "owner")
			local color = getZoneData( name, "color")
			local price = getZoneData( name, "cost")
			local objects = getZoneData( name, "objects")
			local zonename = getZoneData( name, "shownname")
			--local id = #category
			local id = getZoneData( name, "id")
			triggerClientEvent( element, "GTIbuilder.pushZoneDataToClient", resourceRoot, pos, size, owner, color, id, price, zonename, name)
			if objects ~= "" then
				triggerClientEvent( element, "GTIbuilder.pushObjectsToClient", resourceRoot, objects.."@"..name)
			end
		end
	end
end

addEventHandler( "onPlayerLogin", root,
	function()
		buildZone( source)
	end
)

falsePositive = {
	[false] = true,
	["false"] = true,
}

local editmode = {}

function viewZoneNotice( client, id, text, r, g, b, name)
	local account = getPlayerAccount( client)
	local accName = getAccountName( account)
	local zoneOwner = getZoneData( name, "owner")
	exports.GTIhud:drawNote( id, text, client, r, g, b)
	if name and not falsePositive[zoneOwner] then
		if string.match( accName, zoneOwner) then
			if not editmode[client] then
				editmode[client] = true
				--triggerClientEvent( client, "GTIbuilder.toggleEditorMode", resourceRoot, true)
				setTimer( triggerClientEvent, 100, 1, client, "GTIbuilder.toggleEditorMode", client, true)
			else
				editmode[client] = false
				triggerClientEvent( client, "GTIbuilder.toggleEditorMode", client, false)
			end
		end
	end
end
addEvent( "GTIbuilder.viewZoneNotice", true)
addEventHandler( "GTIbuilder.viewZoneNotice", root, viewZoneNotice)

function data( option, entity, datas)
	triggerClientEvent( root, "GTIbuilder.data", root, option, entity, datas)
end
addEvent( "GTIbuilder.data", true)
addEventHandler( "GTIbuilder.data", root, data)
