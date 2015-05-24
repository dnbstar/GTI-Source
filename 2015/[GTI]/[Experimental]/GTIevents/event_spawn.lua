elements = {
	spawners = {},
	objects = {},
	blips = {},
	pickups = {},
}

spawned_vehicles = {}

pikID = {
	["hp"] = 1240,
	["ap"] = 1242,
}

-- Blip Creation

function createEventBlip( id, coordTable, creator, int, dim)
	if id and coordTable and creator then
		local coordData = split( coordTable, ",")
		local x, y, z = coordData[1], coordData[2], coordData[3]

		--oEMF( "Created Blip @ "..coordTable, source)

		local blip = createBlip( x, y, z, id, 2, 255, 0, 0, 255, 0, 450)
		setElementInterior( blip, int)
		setElementDimension( blip, dim)
		table.insert( elements.blips, {blip})

		-- Create Blip Element
		local element_blip = createElement("e_blip")
		setElementData( element_blip, "model", id)
		setElementData( element_blip, "blip", blip)
		--setElementData( element_blip, "owner", owner)

		if isElement( creator) then
			local name = getPlayerName( creator)
			local owner = getAccountName( getPlayerAccount( creator))
			setElementData( element_blip, "creator", name)
			setElementData( element_blip, "owner", owner)
		else
			setElementData( element_blip, "creator", "N/A")
			setElementData( element_blip, "owner", false)
		end
	end
end

-- Object Creation

function createEventObject( id, coordTable, rotTable, creator, int, dim)
	if id and coordTable and creator then
		local coordData = split( coordTable, ",")
		local rotData = split( rotTable or "0,0,0", ",")

		local x, y, z = coordData[1], coordData[2], coordData[3]
		local rX, rY, rZ = rotData[1] or 0, rotData[2] or 0, rotData[3] or 0

		local object = createObject( id, x, y, z, rX, rY, rZ, false)
		setElementInterior( object, int or 0)
		setElementDimension( object, dim or 0)
        setElementDoubleSided(object, true)
        setElementFrozen(object, true)
		table.insert( elements.objects, {object})
		if isElement( creator) then
			local name = getPlayerName( creator)
			local owner = getAccountName( getPlayerAccount( creator))
			setElementData( object, "creator", name)
			setElementData( object, "owner", owner)
		else
			setElementData( object, "creator", "N/A")
		end

		return true
	else
		return false
	end
end
addEvent( "GTIevents.spawnObject", true)
addEventHandler( "GTIevents.spawnObject", root, createEventObject)

function deleteEventObject( element)
	if getElementType( element) ~= "vehicle" then
		if isElement( source) then
			local accName = getAccountName( getPlayerAccount( source))
			local owner = getElementData( element, "owner") or false
			if owner then
				if owner ~= accName then
					oEMF( "Access denied, you are not the creator of this object.", source, true)
					return
				end
			end
		end
	end
	if isElement( element) then
		if getElementType( element) ~= "v_spawner" then
		--if not getElementData( element, "objDelete") == "veh" then
			if getElementType( element) == "object" then
				oEMF( "Object deleted.", source, true)
				setElementData( element, "creator", nil)
				destroyElement( element)
			elseif getElementType( element) == "e_blip" then
				oEMF( "Blip deleted.", source, true)
				setElementData( element, "creator", nil)
				destroyElement( getElementData( element, "blip"))
				destroyElement( element)
			elseif getElementType( element) == "vehicle" then
				destroyElement( element)
				if spawned_vehicles[element] then
					spawned_vehicles[element] = nil
				end
			else
				oEMF( "Element deleted.", source, true)
				destroyElement( element)
			end
			return true
		else
			oEMF( "Vehicle spawner deleted.", source, true)
			local spawner = getElementData( element, "elem_obj")
			setElementData( spawner, "creator", nil)
			destroyElement( element)
			destroyElement( spawner)

			for i, veh_spawned in ipairs ( getElementsByType( "vehicle", resourceRoot)) do
				if spawned_vehicles[spawner][veh_spawned] == spawner then
					if getVehicleController( veh_spawned) then
						oEMF( "Vehicle destroyed because spawner was deleted.", getVehicleController( veh_spawned), true)
						removePedFromVehicle( getVehicleController( veh_spawned))
						--if spawned_vehicles[getVehicleController( veh_spawned)] then
							spawned_vehicles[getVehicleController( veh_spawned)] = false
						--end
					end
					destroyElement( veh_spawned)
				end
			end
			return true
		end
	else
		return false
	end
end
addEvent( "GTIevents.deleteObject", true)
addEventHandler( "GTIevents.deleteObject", root, deleteEventObject)

-- Spawner/Pickup Creation

function pickupHit( thePlayer)
	local id = getElementData( source, "spawn_type") or false
	if id then
		if isPlayerInEvent( thePlayer) then
			if id == "hp" then
				local health = getElementHealth( thePlayer)
				if health ~= 100 then
					local hp_needed = 100 - health
					setElementHealth( thePlayer, health + hp_needed)
					oEMF( "You have replenished your health", thePlayer)
				end
			elseif id == "ap" then
				local armor = getPedArmor( thePlayer)
				if armor ~= 100 then
					local ap_needed = 100 - armor
					setPedArmor( thePlayer, armor + ap_needed)
					oEMF( "You have replenished your armor", thePlayer)
				end
			end
		else
			oEMF( "You cannot use this because you are not in the event.", thePlayer, true)
		end
	end
end

function spawnerHit( thePlayer, match)
	if getElementData( source, "lock") == true then
		return
	end
	if isElement( thePlayer) and getElementType( thePlayer) == "player" and match then
		if not isPedInVehicle( thePlayer) then
			--if not spawned_vehicles[thePlayer] then
				local int = getElementInterior( thePlayer)
				local dim = getElementDimension( thePlayer)
				local x, y, z = getElementPosition( thePlayer)
				local rX, rY, rZ = getElementRotation( thePlayer)

				local id = getElementData( source, "spawn_type")
				if id then
					local vehicle = createVehicle(id, x, y, z + 2, rX, rY, rZ)
					setElementInterior( vehicle, int)
					setElementDimension( vehicle, dim)
					warpPedIntoVehicle( thePlayer, vehicle)
					setElementData( vehicle, "fuel", 100)
					--getElementData( vehicle, "veh_spa", source)
					spawned_vehicles[source][vehicle] = source
					spawned_vehicles[thePlayer] = vehicle
				end
			--[[
			else
				--oEMF( "You already have a spawned vehicle.", thePlayer, true)
				if isElement( spawned_vehicles[thePlayer]) and getElementType( spawned_vehicles[thePlayer]) == "vehicle" then
					deleteEventObject( spawned_vehicles[thePlayer])
					spawned_vehicles[thePlayer] = false
					oEMF( "Vehicle destroyed, please re enter the spawner.", thePlayer, true)
				end
			end
			--]]
		end
	end
end

function createSpawner( sType, id, coordTable, creator, int, dim)
	local spawn_id = 0
	local spawn_name = ""
	if sType and id and coordTable and creator and int and dim then
		local coordData = split( coordTable, ",")
		local x, y, z = coordData[1], coordData[2], coordData[3]

		if sType == "pickup" then
			if id == "hp" or id == "ap" then
				spawn_id = pikID[id]
				spawn_name = string.upper( id).." Spawner"
			end

			local pickup = createPickup( x, y, z, 3, spawn_id, 0)
				setElementInterior( pickup, int)
				setElementDimension( pickup, dim)
			setElementData( pickup, "spawn_type", id)
			addEventHandler( "onPickupHit", pickup, pickupHit)
			table.insert( elements.pickups, {pickup})

			if isElement( creator) then
				local name = getPlayerName( creator)
				local owner = getAccountName( getPlayerAccount( creator))
				setElementData( pickup, "creator", name)
				setElementData( pickup, "owner", owner)
			else
				setElementData( pickup, "creator", "N/A")
			end
		elseif sType == "spawner" then
			if getVehicleModelFromName( id) then
				local spawner = createMarker( x, y, z - 1, "cylinder", 1.5, 206, 59, 108, 100)
				spawned_vehicles[spawner] = {}

				setElementInterior( spawner, int)
				setElementDimension( spawner, dim)
				setElementData( spawner, "spawn_type", getVehicleModelFromName( id))
				addEventHandler( "onMarkerHit", spawner, spawnerHit)
				table.insert( elements.spawners, {spawner})
				setElementData( spawner, "lock", true)
				setTimer( setElementData, 2000, 1, spawner, "lock", false)

				setElementData( spawner, "objDelete", "veh")
				-- Create Spawner Element
				local element_spawner = createElement("v_spawner")
				setElementData( element_spawner, "elem_obj", spawner)
				setElementData( element_spawner, "elem_spa", id)
				setElementData( element_spawner, "posX", x)
				setElementData( element_spawner, "posY", y)
				setElementData( element_spawner, "posZ", z)
				if isElement( creator) then
					local name = getPlayerName( creator)
					local owner = getAccountName( getPlayerAccount( creator))
					setElementData( spawner, "creator", name)
					setElementData( element_spawner, "creator", name)
					setElementData( spawner, "owner", owner)
					setElementData( element_spawner, "owner", owner)
				else
					setElementData( spawner, "creator", "N/A")
					setElementData( element_spawner, "creator", "N/A")
				end
			end
		end
	end
end

function deleteSpawner( sType, element)
end
