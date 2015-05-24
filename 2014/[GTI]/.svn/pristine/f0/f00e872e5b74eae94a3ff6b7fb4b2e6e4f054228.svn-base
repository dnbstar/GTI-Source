local healLock = {
	["Paramedic"] = true,
}

local medicPay = {
	[0] = 25,
	[1] = 50,
	[2] = 75,
	[3] = 100,
	[4] = 125,
	[5] = 150,
	[6] = 175,
	[7] = 200,
	[8] = 225,
	[9] = 250,
	[10] = 275,
}

allowedVehModels = {
	[416] = true,
}

addCommandHandler( "pmpc",
	function( source)
		local vehicle = getPedOccupiedVehicle( source)
		if isPedInVehicle( source) then
			local model = getElementModel( vehicle)
			if model == 416 then
				local job = getElementData( source, "job")
				if job == "Paramedic" then
					local rank = exports.GTIpromotions:getPlayerJobLevel( source, "Paramedic")
					if rank >= 2 then
						triggerClientEvent( source, "accessMedicComputer", source)
					end
				else
					exports.GTIhud:dm( "You must be a working as a Paramedic to be able to access to medic computer", source, 255, 0, 0)
				end
			end
		end
	end
)

addEvent( "onPlayerGetJob", true)
addEventHandler( "onPlayerGetJob", root,
	function( jobName, newJob)
		if jobName == "Paramedic" then
			if newJob == true then
				local account = getPlayerAccount( source)
				local gunAccount, gunAmmoAccount = exports.GTIgun:getGunAccountData( account, 41)
				if gunAccount ~= 41 then
					giveWeapon( source, 41, 9999, true)
				end
			end
		end
	end
)

addEvent( "onPlayerQuitJob", true)
addEventHandler( "onPlayerQuitJob", root,
	function( jobName, resignJob)
		if jobName == "Paramedic" then
			if resignJob == true then
				takeWeapon( source, 41)
				local theVehicle = getPedOccupiedVehicle(source)
				if theVehicle then
					if getElementModel( theVehicle) == 416 then
						destroyElement( theVehicle)
					end
				end
			end
		end
	end
)

local blockedSeats = {
	[0] = true,
	[1] = true,
}

addEventHandler( "onPlayerLogin", root,
	function( pAcc, cAcc)
		local player = getAccountPlayer( cAcc)
		local job = getElementData( player, "job")
		if job == "Paramedic" then
			local gunAccount, gunAmmoAccount = exports.GTIgun:getGunAccountData( cAcc, 41)
			if gunAccount ~= 41 then
				giveWeapon( player, 41, 9999, true)
			end
		end
	end
)

addEventHandler( "onPlayerSpawn", root,
	function()
		local cAcc = getPlayerAccount( source)
		local job = getElementData( source, "job")
		if job == "Paramedic" then
			local gunAccount, gunAmmoAccount = exports.GTIgun:getGunAccountData( cAcc, 41)
			if gunAccount ~= 41 then
				setTimer(giveWeapon, 5000, 1, source, 41, 9999, true)
			end
		end
	end
)

addEventHandler( "onPlayerVehicleEnter", root,
	function( vehicle, seat, jacked)
		local model = getElementModel( vehicle)
		local driver = getVehicleOccupant( vehicle)
		if model == 416 then
			if driver then
				if healLock[getElementData( driver, "job")] then
					local rank = exports.GTIpromotions:getPlayerJobLevel( driver, "Paramedic")
					if seat == 0 then
						if rank >= 2 then
							exports.GTIhud:dm( "(ESR): Medical Database Computer Access Granted (/pmpc).", source, 0, 255, 255)
						elseif rank < 2 then
							--outputChatBox( "(ESR): Medical Database Computer Access #FF0000Denied#00FFFF (L3+).", source, 0, 255, 255, true)
						end
					end
				end
				if not healLock[getElementData( source, "job")] then
					if blockedSeats[seat] then
						if seat ~= 0 then
							outputChatBox( "You can only get healed if you are in the back of the ambulance.", source, 255, 0, 0)
						end
					else
						if healLock[getElementData( driver, "job")] then
							local hp = getElementHealth( source)
							local level = exports.GTIpromotions:getPlayerJobLevel( driver, "Paramedic")
							local pay = medicPay[level]
							if hp < 100 or hp < 200 then
								outputChatBox( "You have been healed by "..getPlayerName(driver)..".", source, 0, 255, 255)
								outputChatBox( "You have healed "..getPlayerName(source)..".", driver, 0, 255, 255)
								setElementHealth( source, 200)
								takePlayerMoney( source, pay*4)
								exports.GTIpromotions:modifyPlayerJobProgress( medic, "Paramedic", 8)
								exports.GTIpromotions:modifyPlayerCivilianExp( medic, 4, "Paramedic")
								exports.GTIpromotions:givePlayerJobMoney( medic, "Paramedic", pay*4)
							end
						end
					end
				end
			end
		end
	end
)

local bonusTeams = {
	["Emergency Services"] = true,
	["Civilians"] = true,
}

local bonuses = {
	["Emergency Services"] = 1.5,
	["Civilians"] = 1.2,
}

addEvent( "onPlayerMedicHeal", true)
addEventHandler( "onPlayerMedicHeal", root,
	function( medic)
		--if getElementHealth( source) >= 100 then return end
		if healLock[getElementData( medic, "job")] then
			if getElementHealth( source) <= 100 or getElementHealth( source) <= 200 then
				local hp = getElementHealth( source)
				local pT = getPlayerTeam( source)
				local team = getTeamName( pT)
				local money = getPlayerMoney( source)
				if money >= 100 then
					if hp >= 25 then
						local heal = getElementHealth( source) +10
						local level = exports.GTIpromotions:getPlayerJobLevel( medic, "Paramedic")
						local pay = medicPay[level]
						setElementHealth( source, heal)
						if (heal < 100) then
							if bonusTeams[team] then
								local bonus = bonuses[team]
								if not isTimer( antiSpam) then
									exports.GTIpromotions:givePlayerJobMoney( medic, "Paramedic", pay*bonus)
									takePlayerMoney( source, pay)
									--outputChatBox( "You earned a "..bonus.."% bonus for healing a player in the '"..team.."' team.", medic, 0, 255, 255)
									antiSpam = setTimer( function() end, 10000, 1)
								else
									exports.GTIpromotions:givePlayerJobMoney( medic, "Paramedic", pay)
									takePlayerMoney( source, pay)
								end
							else
								exports.GTIpromotions:givePlayerJobMoney( medic, "Paramedic", pay)
								takePlayerMoney( source, pay)
							end
							exports.GTIpromotions:modifyPlayerJobProgress( medic, "Paramedic", 2)
							exports.GTIpromotions:modifyPlayerCivilianExp( medic, 1, "Paramedic")
						end
					elseif hp <= 25 then
						local heal = getElementHealth( source) +10
						local level = exports.GTIpromotions:getPlayerJobLevel( medic, "Paramedic")
						local pay = medicPay[level]
						setElementHealth( source, heal)
						if (heal < 100) then
							if bonusTeams[team] then
								local bonus = bonuses[team]
								if not isTimer( antiSpam) then
									exports.GTIpromotions:givePlayerJobMoney( medic, "Paramedic", pay*bonus)
									takePlayerMoney( source, pay)
									--outputChatBox( "You earned a "..bonus.."% bonus for healing a player in the '"..team.."' team.", medic, 0, 255, 255)
									antiSpam = setTimer( function() end, 10000, 1)
								else
									exports.GTIpromotions:givePlayerJobMoney( medic, "Paramedic", pay)
									takePlayerMoney( source, pay)
								end
							else
								exports.GTIpromotions:givePlayerJobMoney( medic, "Paramedic", pay)
								takePlayerMoney( source, pay)
							end
							exports.GTIpromotions:modifyPlayerJobProgress( medic, "Paramedic", 2)
							exports.GTIpromotions:modifyPlayerCivilianExp( medic, 1, "Paramedic")
						end
						--outputChatBox( getPlayerName( source).." cannot be healed because his health is too low.", medic, 0, 255, 255)
						--outputChatBox( getPlayerName(medic).." couldn't heal you because your health is too low.", source, 255, 255, 0)
					end
				end
			end
		end
	end
)
