-- SWAT Skin: 285

npcs = {}
state = {}

swat = {
	--{1467.335, -1433.937, 12.547},
	{1582.518, -1308.265, 16.376, "LilDolla"},
}

local length = 2

function getPointFrontOfElement(x, y, z, rz)
	local tx = x + - ( length ) * math.sin( math.rad( rz ) )
	local ty = y + length * math.cos( math.rad( rz ) )
	local tz = z
	return tx, ty, tz
end

function createEverything()
	for i, npc in ipairs (swat) do
		--local x, y, z = npc[1], npc[2], npc[3]
		local plr = exports.GTIutil:findPlayer( npc[4])
		if isElement( plr) then
			local x, y, z = getElementPosition( plr)
			local z = z + 1
			local ped = createPed( 285, x, y, z+1)
			state[ped] = "idle"
			addEventHandler( "onPedWasted", ped, NPCDeath)
			followPlayer( ped, plr)
			npcs[exports.GTIutil:findPlayer( npc[4])] = ped
			npcs[ped] = exports.GTIutil:findPlayer( npc[4])
			table.insert( npcs, ped)
			--givePedWeapon( ped, 27, 400, true)
		end
	end
end

addEventHandler( "onResourceStart", resourceRoot,
	function()
		createEverything()
	end
)

--[[
seats = {
	["door_lf_dummy"] = 0,
	["door_lr_dummy"] = 1,
	["door_rf_dummy"] = 2,
	["door_rr_dummy"] = 3,
}

valid_comp = {
	["door_lf_dummy"] = true,
	["door_lr_dummy"] = true,
	["door_rf_dummy"] = true,
	["door_rr_dummy"] = true,
}
--]]

function NPCDamage( attacker, weapon, bodypart, loss)
	cancelEvent()
	local tick = getTickCount()+aTime
	attacked[attacker] = tick
	hits[bodypart] = hits[bodypart] + 1
end

function NPCDeath( killer, weapon, bodypart)
	if npcs[source] == killer then
		outputDebugString( getPlayerName(killer).." killed their Frank.")
		outputDebugString( getPlayerName( killer).."'s Frank will themselves with StatTrak in 2 seconds.")
	else
		outputDebugString( getPlayerName(killer).." killed "..getPlayerName(npcs[source]).."'s Frank.")
	end
	--setElementHealth( source, 100)
	setTimer( setElementHealth, 2000, 1, source, 100)
end

function setNPCState( npc, snps)
	state[npc] = snps
end

function crouch( npc, owner)
	if not isElement( npc) then return end
	local block, anim = getPedAnimation( npcs[owner])
	if getPedTask( owner, "secondary", 1) == "TASK_SIMPLE_DUCK" then
		--if anim ~= "WEAPON_crouch" then
			if not state[npcs[owner]] or state[npcs[owner]] == "idle" then
				state[npc] = "crouch"
				setNPCState( npcs[owner], "crouch")
			end
			local cX, cY = getElementPosition(owner)
			local pX, pY = getElementPosition(npc)
			local dist = getDistanceBetweenPoints2D(cX, cY, pX, pY)
			if (dist > 0.95) then
				if anim ~= "GunCrouchFwd" then
					setPedAnimation( npcs[owner], "ped", "GunCrouchFwd", 0, true)
				end
			elseif dist <= 0.95 then
				if anim ~= "WEAPON_crouch" then
					setPedAnimation( npcs[owner], "ped", "WEAPON_crouch")--, 300, false, true, true, false)
				end
			end
		--end
		--setPedControlState( npcs[cop], "crouch", true)
		--setPedControlState(player, "jump", false)
		--setTimer( setPedControlState, 1000, 1, npcs[cop], "crouch", false)
	else
		if anim == "WEAPON_crouch" then
			if state[npcs[owner]] == "crouch" then
				setPedAnimation( npc, "ped", "woman_idlestance")
				setTimer( setPedAnimation, 100, 1, npc, false)
				setNPCState( npcs[owner], "idle")
			end
		end
	end
end

function enterCar( npc, owner)
	if not isElement( npc) then return end
	local block, anim = getPedAnimation( npcs[owner])
	if getPedTask( owner, "primary", 3) == "TASK_COMPLEX_ENTER_CAR_AS_DRIVER" then
		if not state[npcs[owner]] or state[npcs[owner]] == "idle" then
			if not isPedInVehicle( npcs[owner]) then
				--setNPCState( npcs[owner], "car_enter")
				--if anim ~= "CAR_open_LHS" then
				if state[npcs[owner]] ~= "car_e1" then
					setPedAnimation( npc, "ped", "CAR_open_LHS")
					setNPCState( npcs[owner], "car_e1")
				else
					outputDebugString( "Frank did part 1 of entry")
				end
				--end
				--setTimer( setPedAnimation, 250, 1, npcs[owner], false)
			end
		end
			--setPedAnimation( npc, "ped", "WEAPON_crouch")
		--end
		--setPedControlState( npcs[cop], "crouch", true)
		--setPedControlState(player, "jump", false)
		--setTimer( setPedControlState, 1000, 1, npcs[cop], "crouch", false)
	end
end

function exitCar( npc, owner)
	if not isElement( npc) then return end
	local block, anim = getPedAnimation( npcs[owner])
	if getPedTask( owner, "primary", 3) == "TASK_COMPLEX_LEAVE_CAR" then
		--if anim == "WEAPON_crouch" then
			if isPedInVehicle( npc) then
				if state[npcs[owner]] == "car_enter" then
					--setPedAnimation( npc, "ped", "woman_idlestance")
					--setTimer( setPedAnimation, 100, 1, npc, false)
					setNPCState( npcs[owner], "idle")
				end
			end
		--end
	end
end

function jetpack( npc, owner)
	if not isElement( npc) then return end
	if doesPedHaveJetPack( owner) and not doesPedHaveJetPack( npc) then
		givePedJetPack( npcs[owner])
	end
end

local responseTime = 50

function followPlayer(player, cop)
	--[[
	if not npcs[cop] then
		return
	end
	--]]
	if (not isElement(player) and not isElement(cop)) then return end
	--if (isPedInVehicle(player) then return end
	if isPedDead( player) then return end

	local cX, cY = getElementPosition(cop)
	local pX, pY = getElementPosition(player)
	local copangle = (360 - math.deg(math.atan2((cX - pX), (cY - pY)))) % 360
	setPedRotation(player, copangle)
	--setCameraTarget(player, player)

	setElementInterior(player, getElementInterior(cop))
	setElementDimension(player, getElementDimension(cop))

	--[[
	crouch( npcs[cop], cop)
	enterCar( npcs[cop], cop)
	exitCar( npcs[cop], cop)
	--]]

	local nX, nY, nZ = getElementPosition( player)
	local nrX, nrY, nrZ = getElementRotation( player)
	local nX2, nY2, nZ2 = getPointFrontOfElement( nX, nY, nZ, nrZ)

	--[[if not isLineOfSightClear( nX, nY, nZ+0.2, nX2, nY2, nZ2+0.2, true, true, false, true, false, false, false, cop) or not isLineOfSightClear( nX, nY, nZ-0.2, nX2, nY2, nZ2-0.2, true, true, false, true, false, false, false, cop) then
		setPedAnalogControlState( player, "jump", 1)
		setTimer( setPedControlState, 150, 1, player, "jump", false)
	end
	--]]

	local dist = getDistanceBetweenPoints2D(cX, cY, pX, pY)
	if (dist > 24) then
			-- Warp
		local x, y, z = getElementPosition(cop)
		setElementPosition(player, x, y, z)
		setTimer(followPlayer, responseTime, 1, player, cop)
	elseif (dist > 8) then
			-- Sprint
		setPedAnalogControlState( player, "sprint", 1)
		setPedAnalogControlState( player, "walk", 0)
		setPedAnalogControlState( player, "forwards", 1)
		setPedAnalogControlState( player, "jump", 1)
		setTimer(followPlayer, responseTime, 1, player, cop)
	elseif (dist > 4) then
			-- Jog
		setPedAnalogControlState( player, "sprint", 0)
		setPedAnalogControlState( player, "walk", 0)
		setPedAnalogControlState( player, "forwards", 1)
		setTimer(followPlayer, responseTime, 1, player, cop)
	elseif (dist > 1) then
			-- Walk
		setPedAnalogControlState( player, "sprint", 0)
		setPedAnalogControlState( player, "walk", 1)
		setPedAnalogControlState( player, "forwards", 1)
		setTimer(followPlayer, responseTime, 1, player, cop)
	elseif (dist <= 1) then
			-- Stop
		setPedAnalogControlState( player, "sprint", 0)
		setPedAnalogControlState( player, "walk", 0)
		setPedAnalogControlState( player, "forwards", 0)
		setTimer(followPlayer, responseTime, 1, player, cop)
	end
end
--]]
