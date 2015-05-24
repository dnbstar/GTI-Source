--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
-------------------------------------------------------------------------
-- What			: plb_s.lua
-- For			: Grand Theft International
-- Author(s)	: Diego & Kanto.
-- Description	: Lightbar for undercover police cruisers.
-- All rights reserved to authors and to Grand Theft International MTASA ©
-------------------------------------------------------------------------
--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--

l_bar = {}

function attachDetachLightbarOnCommand(player, cmd)
		local vehOffsets = {[428]= {0, 0.8, 1.38}, [541]= {-0.35, 0.1, 0.7}, [402]= {-0.35, -0.3, 0.82}, [560]= {-0.4, 0.13, 0.88}, [426]= {-0.4, 0.13, 0.88}, [421]= {-0.4, 0.13, 0.76}, [426]= {-0.4, 0.13, 0.88}}

		if isPedInVehicle(player) then

		local vehicle = getPedOccupiedVehicle(player)
		local id = getElementModel(vehicle)

		if vehOffsets[id] ~= nil then
		if getTeamName(getPlayerTeam(player)) == 'Law Enforcement' or getTeamName(getPlayerTeam(player)) == 'Emergency Services' then
		if getVehicleController(vehicle) == player then

		if l_bar[vehicle] == nil then
			local x, y, z =  getElementPosition(vehicle)
			local light = createObject (3895, x, y, z)
			addVehicleSirens(vehicle,1,1)
			setVehicleSirensOn(vehicle, true)
			attachElements(light, vehicle, unpack(vehOffsets[id]))
			l_bar[vehicle] = light

	elseif l_bar[vehicle] ~= nil then
			removeVehicleSirens(vehicle)
			setVehicleSirensOn(vehicle, false)
			destroyElement(l_bar[vehicle])
			l_bar[vehicle] = nil
					end
				end
			end
		end
	end
end
addCommandHandler('plb', attachDetachLightbarOnCommand)

function destroyLightOnVehicleRespawn()
        if l_bar[source] ~= nil then
                destroyElement(l_bar[source])
                l_bar[source] = nil
        end
end
addEventHandler("onVehicleRespawn", getRootElement(), destroyLightOnVehicleRespawn)

function destroyLightOnVehicleDestroy()
        if (getElementType(source) == "vehicle") then
                if l_bar[source] ~= nil then
                        destroyElement(l_bar[source])
                        l_bar[source] = nil
                end
        end
end
addEventHandler("onElementDestroy", getRootElement(), destroyLightOnVehicleDestroy)

function destroyLightOnVehicleExplode()
        if l_bar[source] ~= nil then
                destroyElement(l_bar[source])
                l_bar[source] = nil
        end
end
addEventHandler("onVehicleExplode", getRootElement(), destroyLightOnVehicleExplode)
