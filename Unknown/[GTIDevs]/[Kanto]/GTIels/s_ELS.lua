local lstate = {[1] = {1, 0, 2}, [2] = {1, 0, 1}, [3] = {1, 0, 2}, [4] = {1, 0, 1}, [5] = {0, 1, 2}, [6] = {0, 1, 1}, [7] = {0, 1, 2}, [8] = {0, 1, 1}}
local vehIDs = {[416] = true, [427] = true, [490] = true, [528] = true, [407] = true, [544] = true, [598] = true, [596] = true, [597] = true, [599] = true, [601] = true, [541] = true}
local timers = {}
local els = {}
local lvl = {}
 
function turnEls(player)
	if isPedInVehicle(player) then
		local veh = getPedOccupiedVehicle(player)
		if getVehicleController(veh) == player then
			if getTeamName(getPlayerTeam(player)) == "Law Enforcement" or getTeamName(getPlayerTeam(player)) == "Emergency Services" then
				if (vehIDs[getElementModel(veh)]) then
					setVehicleOverrideLights(veh, 2)
					if els[veh] == nil then
						els[veh] = 1
						setPedAnimation(player, "ped", "car_tune_radio", 200, false, false, true, true)
						timers[veh] = setTimer(function ()
						local r, g, b = getVehicleHeadLightColor(veh)
						if r == 255 and g == 255 and b == 255 then
							local state = lvl[veh] or 0
							if state == 8 then
								local state = 1
								lvl[veh] = state
							else local state = state + 1 lvl[veh] = state end
								local a, b, c = unpack(lstate[lvl[veh]])
								setVehicleLightState(veh, 0, a)
								setVehicleLightState(veh, 1, b)
								setVehicleLightState(veh, 2, a)
								setVehicleLightState(veh, 3, b)
								setVehicleOverrideLights(veh, c)
							else
								killTimer(timers[veh])
								els[veh] = nil
								timers[veh] = nil
								lvl[veh] = nil
							end
						end, 50, 0)
					else
						setPedAnimation(player, "ped", "car_tune_radio", 200, false, false, true, true)
						killTimer(timers[veh])
						els[veh] = nil
						timers[veh] = nil
						lvl[veh] = nil
						setVehicleOverrideLights(veh, 0)
						setVehicleLightState(veh, 0, 0)
						setVehicleLightState(veh, 1, 0)
						setVehicleLightState(veh, 2, 0)
						setVehicleLightState(veh, 3, 0)
					end
				end               
			end
		end
	end
end
addCommandHandler("els", turnEls)
 
function onRespawn()
	if els[source] == 1 then
		killTimer(timers[source])
		els[source] = nil
		timers[source] = nil
		lvl[source] = nil
	end
end
addEventHandler("onVehicleRespawn", getRootElement(), onRespawn)
 
function onDestroy()
	if getElementType(source) == "vehicle" and els [source] == 1 then
		killTimer(timers[source])
		els[source] = nil
		timers[source] = nil
		lvl[source] = nil
	end
end
addEventHandler("onElementDestroy", getRootElement(), onDestroy)
 
function onExplode()
	if els[source] == 1 then
		killTimer(timers[source])
		els[source] = nil
		timers[source] = nil
		lvl[source] = nil      
	end
end
addEventHandler("onVehicleExplode", root, onExplode)

function turnLight(thePlayer)
	if isPedInVehicle(thePlayer) then
		local theVehicle = getPedOccupiedVehicle(thePlayer)
		if getVehicleController(theVehicle) == thePlayer then
			if getVehicleOverrideLights(theVehicle) ~= 2 then
				setVehicleOverrideLights(theVehicle, 2) 
			else
				setVehicleOverrideLights(theVehicle, 1)
			end	
		end
	end
end

addEventHandler("onPlayerJoin", root, function ()
	bindKey(source, "j", "down", turnEls)
	bindKey(source, "l", "down", turnLight)
end)

for i,v in ipairs (getElementsByType("player") or {}) do
	bindKey(v, "j", "down", turnEls)
	bindKey(v, "l", "down", turnLight)	
end



