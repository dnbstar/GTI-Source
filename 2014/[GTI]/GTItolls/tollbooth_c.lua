local localPlayer = getLocalPlayer()

tolls = {}
booth = {}
gate = {}
spike = {
	obj = {},
	scol = {},
}
sidentification = {}
col = {}
identification = {}
tdest = {}
restrict = {}
rX, rY, rZ = {}, {}, {}
broken = {}
stick = {}
antispam = {
	output = {},
	move = {},
}

function getTollPayment( player)
	local currentMoney = getPlayerMoney( player)
	if currentMoney >= 0 and currentMoney <= 149999 then
		payTable = paymentDetails["low"]
	elseif currentMoney >= 150000 and currentMoney <= 499999 then
		payTable = paymentDetails["middle"]
	elseif currentMoney >= 500000 and currentMoney <= 99999999 then
		payTable = paymentDetails["high"]
	end
	local values = split( payTable, string.byte( ";"))
	if (#values == 0) then return true end
	local minimum, maximum, name, crimeID, minFine, maxFine = values[1], values[2], values[3], values[4], values[5], values[6]
	local cost = math.random( minimum, maximum)
	local cost = math.floor( cost)
	--
	local theFine = math.random( minFine, maxFine)
	local theFine = math.floor( theFine)
	--
	return cost, name, crimeID, theFine
end

function payToll(player, destination, tollDestroyed)
	local cost, name, crimeID, fine = getTollPayment( player)
	if tollDestroyed == true then
		--exports.GTIhud:dm( "You destroyed a toll and have been fined $"..fine.." for damages.", 255, 0, 0)
		exports.GTIhud:dm( "You destroyed a toll worth $"..fine.." of damages. (unpaid)", 255, 0, 0)
		outcome, arg1, arg2 = "pay_fine", fine, crimeID
	else
		exports.GTIhud:dm( "You paid a toll fee of $"..cost..". This tollway leads to "..destination, 0, 255, 255)
		outcome, arg1, arg2 = "pay_toll", cost, "none"
	end
	triggerServerEvent( "GTItolls.manageTolls", localPlayer, outcome, arg1, arg2)
end

function setTollStickState( toll, state)
	if toll then
		if state == true then
			broken[gate[toll]] = true
			--outputDebugString( "Toll Booth Stick '"..tostring(toll).."' broken", 0, 255, 0, 255)
		elseif state == false then
			broken[gate[toll]] = false
			--outputDebugString( "Toll Booth Stick '"..tostring(toll).."' fixed", 0, 0, 255, 255)
		end
	end
end

function setStickState( tstick, state, show)
	if stick then
		if state == true then
			stick[gate[tstick]] = "up"
				if show == true then
					outputDebugString( "Toll Booth Stick '"..tostring(tstick).."' is now up", 0, 0, 255, 0)
				end
		elseif state == false then
			stick[gate[tstick]] = "down"
			if show == true then
				outputDebugString( "Toll Booth Stick '"..tostring(tstick).."' is now down", 0, 0, 255, 255)
			end
		elseif state == "NF" then
			stick[gate[tstick]] = "n/f"
			if show == true then
				outputDebugString( "Toll Booth Stick '"..tostring(tstick).."' is non-functional", 0, 255, 0, 0)
			end
		end
	end
end

function enterTollBooth( hitElement)
	if hitElement ~= localPlayer then return end
	if getElementType( localPlayer) == "player" then
		if isPlayerInVehicle( localPlayer) then
			local correctGate = identification[source]
			--local correctSpike = sidentification[source]
			local curX, curY, curZ = getElementPosition( gate[correctGate])
			--local curSX, curSY, curSZ = getElementPosition( spike.obj[correctSpike])
			--local curSCX, curSCY, curSCZ = getElementPosition( spike.obj[correctSpike])
			local rotX, rotY, rotZ = rX[source], rY[source], rZ[source]
			local access = restrict[source]
			local vehicle = getPedOccupiedVehicle( localPlayer)
			local speedx, speedy, speedz = getElementVelocity(vehicle)
			local vehicleSpeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)*180
			local gateState = broken[gate[correctGate]]
			local skState = stick[gate[correctGate]]
			local playerCash = getPlayerMoney( localPlayer)
			local theLead = tdest[source]
			local payment = getTollPayment( localPlayer)
			if vehicleSpeed < 50 then
				if access == "" or access == "ALL" then
					if gateState == false then
						if skState == "down" then
							if playerCash >= payment then
								if not isTimer( antispam.move[2]) then
									payToll( hitElement, theLead)
									setStickState( correctGate, true)
									setElementCollidableWith( gate[correctGate], vehicle, false)
									--moveObject( gate[correctGate], 1250, curX, curY, curZ, -rotX, -rotY, -rotZ, "OutQuad")
									setElementRotation( gate[correctGate], -rotX, -rotY, -rotZ)
									--
									--moveObject( spike.obj[correctSpike], 1250, curSX, curSY, curSZ+2, 0, 0, 0, "OutQuad")
									--moveObject( spike.scol[correctSpike], 1250, curSCX-0.4, curSCY-3.5, curSCZ+2, 0, 0, 0, "OutQuad")
									--setTimer( setElementPosition, 1000, 1, spike.scol[correctSpike], curSCX-0.4, curSCY-3.5, curSCZ+2)
									setTimer( setElementCollidableWith, 1000, 1, gate[correctGate], vehicle, true)
									--setElementPosition( spike.scol[correctSpike], curSCX-0.4, curSCY-3.5, curSCZ+2)
									antispam.move[2] = setTimer( function() end, 5000, 1)
									--triggerServerEvent( )
								end
							else
								if not isTimer( antispam.spam[3]) then
									exports.GTIhud:dm( "You can't pass through a toll road because you don't have enough money ($"..payment..")", 255, 0, 0)
									antispam.spam[3] = setTimer( function() end, 5000, 1)
								end
							end
						end
					end
				else
					if gateState == false then
						if skState == "down" then
							if getTeamName(getPlayerTeam( hitElement)) == access then
								if not isTimer( antispam.move[2]) then
									setStickState( correctGate, true)
									moveObject( gate[correctGate], 1250, curX, curY, curZ, -rotX, -rotY, -rotZ, "OutQuad")
									setElementRotation( gate[correctGate], -rotX, -rotY, -rotZ)
									antispam.move[2] = setTimer( function() end, 5000, 1)
								end
							else
								if not isTimer( antispam.output[1]) then
									setStickState( correctGate, true)
									outputChatBox( "You must be in the '"..access.."' Team to use gain access through this toll.", 255, 0, 0)
									antispam.output[1] = setTimer( function() end, 5000, 1)
								end
							end
						end
					end
				end
			end
		end
	end
end

local tollRespawnTime = 5000

function leaveTollBooth( leaveElement)
	if leaveElement ~= localPlayer then return end
	if getElementType( localPlayer) == "player" then
		if isPlayerInVehicle( localPlayer) then
			local correctGate = identification[source]
			local curX, curY, curZ = getElementPosition( gate[correctGate])
			local rotX, rotY, rotZ = rX[source], rY[source], rZ[source]
			local access = restrict[source]
			local gateState = broken[gate[correctGate]]
			local skState = stick[gate[correctGate]]
			if access == "" or access == "ALL" then
				if gateState == false then
					if skState == "up" then
						if not isTimer( antispam.move[1]) then
							setStickState( correctGate, false)
							--setTimer( moveObject, 1000, 1, gate[correctGate], 1250, curX, curY, curZ, rotX, rotY, rotZ, "InQuad")
							setTimer( setElementRotation, 1000, 1, gate[correctGate], rotX, rotY, rotZ)
							antispam.move[1] = setTimer( function() end, 5000, 1)
						end
					end
				end
				--moveObject( gate[correctGate], 1250, curX, curY, curZ, rotX, rotY, rotZ, "InQuad")
			else
				if gateState == false then
					if skState == "up" then
						if getTeamName(getPlayerTeam( localPlayer)) == access then
							if not isTimer( antispam.move[1]) then
								setStickState( correctGate, false)
								--setTimer( moveObject, 1000, 1, gate[correctGate], 1250, curX, curY, curZ, rotX, rotY, rotZ, "InQuad")
								setTimer( setElementRotation, 1000, 1, gate[correctGate], rotX, rotY, rotZ)
								antispam.move[1] = setTimer( function() end, 5000, 1)
							end
							--moveObject( gate[correctGate], 1250, curX, curY, curZ, rotX, rotY, rotZ, "InQuad")
						else
							if not isTimer( antispam.output[1]) then
								setStickState( correctGate, false)
								outputChatBox( "You must be in the '"..access.."' Team to use gain access through this toll.", 255, 0, 0)
								antispam.output[1] = setTimer( function() end, 5000, 1)
							end
						end
					end
				end
			end
		end
	end
end

function spikeStripHit( hitElement)
	if getElementType( localPlayer) == "player" then
		if isPlayerInVehicle( localPlayer) then
			local correctSpike = sidentification[source]
			local vehicle = getPedOccupiedVehicle( localPlayer)
			setVehicleWheelStates( vehicle, 1, 1, 1, 1)
		end
	end
end

function damagedTollBooth( loss, attacker)
end

function fixToll ( theToll)
	if not theToll then return end
	setTimer(respawnObject, tollRespawnTime, 1, gate[theToll])
	setTimer(setTollStickState, tollRespawnTime, 1, theToll, false)
	setTimer( setStickState, tollRespawnTime, 1, theToll, false)
end

function brokenTollBooth( atkr)
	local object = getElementModel( source)
	local correctBooth = booth[source]
	for i=1, 1000 do
		if getElementType( atkr) == "vehicle" then
			if source == gate["FC"..i] then
				setStickState( "FC"..i, "NF")
				setTollStickState( "FC"..i, true)
				fixToll( "FC"..i)
				if atkr == localPlayer then
					payToll( atkr, "", true)
				end
			elseif source == gate["FI"..i] then
				setStickState( "FI"..i, "NF")
				setTollStickState( "FI"..i, true)
				fixToll( "FI"..i)
				if atkr == localPlayer then
					payToll( atkr, "", true)
				end
			elseif source == gate["MB"..i] then
				setStickState( "MB"..i, "NF")
				setTollStickState( "MB"..i, true)
				fixToll( "MB"..i)
				if atkr == localPlayer then
					payToll( atkr, "", true)
				end
			elseif source == gate["FB"..i] then
				setStickState( "FB"..i, "NF")
				setTollStickState( "FB"..i, true)
				fixToll( "FB"..i)
				if atkr == localPlayer then
					payToll( atkr, "", true)
				end
			elseif source == gate["LV"..i] then
				setStickState( "LV"..i, "NF")
				setTollStickState( "LV"..i, true)
				fixToll( "LV"..i)
				if atkr == localPlayer then
					payToll( atkr, "", true)
				end
			elseif source == gate["GB"..i] then
				setStickState( "GB"..i, "NF")
				setTollStickState( "GB"..i, true)
				fixToll( "GB"..i)
				if atkr == localPlayer then
					payToll( atkr, "", true)
				end
			end
		else
			--cancelEvent()
			if source == gate["FC"..i] then
				setStickState( "FC"..i, "NF")
				setTollStickState( "FC"..i, true)
				fixToll( "FC"..i)
			elseif source == gate["FI"..i] then
				setStickState( "FI"..i, "NF")
				setTollStickState( "FI"..i, true)
				fixToll( "FI"..i)
			elseif source == gate["MB"..i] then
				setStickState( "MB"..i, "NF")
				setTollStickState( "MB"..i, true)
				fixToll( "MB"..i)
			elseif source == gate["FB"..i] then
				setStickState( "FB"..i, "NF")
				setTollStickState( "FB"..i, true)
				fixToll( "FB"..i)
			elseif source == gate["LV"..i] then
				setStickState( "LV"..i, "NF")
				setTollStickState( "LV"..i, true)
				fixToll( "LV"..i)
			elseif source == gate["GB"..i] then
				setStickState( "GB"..i, "NF")
				setTollStickState( "GB"..i, true)
				fixToll( "GB"..i)
			end
		end
	end
end

function createTollBooths()
	for index, booth in ipairs (tollDetails) do
		local colX, colY, colZ = booth.markerPos[1], booth.markerPos[2], booth.markerPos[3]
		local ecolX, ecolY, ecolZ = booth.exitPos[1], booth.exitPos[2], booth.exitPos[3]
		local objX, objY, objZ = booth.objectPos[1], booth.objectPos[2], booth.objectPos[3]
		local objRotX, objRotY, objRotZ = booth.objectRotDown[1], booth.objectRotDown[2], booth.objectRotDown[3]
		local objModel = booth.id
		local idt = booth.tid
		local sidt = booth.sid
		local team = booth.restrictedTeam[1]
		local dest = booth.destination
		--
		--marker1 = createMarker( colX, colY, colZ, "cylinder", 4, 20, 20, 150)
		--marker2 = createMarker( ecolX, ecolY, ecolZ, "cylinder", 4, 150, 20, 20)
		col = createColTube( colX, colY, colZ, 2, 4)
		gate[idt] = createObject( objModel, objX, objY, objZ, objRotX, objRotY, objRotZ)
		identification[col] = idt
		booth[gate[idt]] = idt
		stick[gate[idt]] = "down"
		broken[gate[idt]] = false
		restrict[col] = team
		tdest[col] = dest
		rX[col], rY[col], rZ[col] = objRotX, objRotY, objRotZ
		--
		--spike.scol[sidt] = createColCuboid( ecolX-0.4, ecolY-5, ecolZ-2, 1, 9.5, 2)
		--spike.obj[sidt] = createObject( 2892, ecolX, ecolY, ecolZ-2, 0, 0, objZ)
		--sidentification[col] = sidt
		--
		setElementDoubleSided( gate[idt], true)
		setObjectBreakable( gate[idt], true)
		setElementFrozen( gate[idt], true)
		if isObjectBreakable( gate[idt]) == true then
			--outputDebugString( "Toll Booth '"..idt.."' is breakable", 0, 255, 255, 0)
		else
			--outputChatBox( "Toll Booth '"..idt.."' is unbreakable", 0, 255, 0, 0)
			setObjectBreakable( gate[idt], true)
		end
		--
		addEventHandler( "onClientColShapeHit", col, enterTollBooth)
		addEventHandler( "onClientColShapeLeave", col, leaveTollBooth)
		--addEventHandler( "onClientObjectDamage", gate[idt], damagedTollBooth)
		addEventHandler( "onClientObjectBreak", gate[idt], brokenTollBooth)
		--
		--addEventHandler( "onClientColShapeHit", spike.scol[sidt], spikeStripHit)
	end
end
addEventHandler( "onClientResourceStart", resourceRoot, createTollBooths)
