local healLock = {
	["Paramedic"] = true,
}

local medicPay = {
	[0] = 14,
	[1] = 14.5,
	[2] = 16,
	[3] = 16.5,
	[4] = 18,
	[5] = 18.5,
	[6] = 20,
	[7] = 20.5,
	[8] = 21,
	[9] = 21.5,
	[10] = 24,
}

allowedVehModels = {
	[416] = true,
	[586] = true,
	[487] = true,
	[563] = true,
}

local last_pay = {}		-- Pay in last 10 seconds
local last_exp = {} 	-- Experience in the last 10 seconds
local last_prog = {}	-- Progress in last 10 seconds

allowedWeapons = {
	[41] = true,
}

addEventHandler( "onPlayerWeaponSwitch", root,
	function( _, weapon)
		if exports.GTIemployment:getPlayerJob( source) == "Paramedic" then
			if allowedWeapons[weapon] then
				toggleControl( source, "fire", true)
			else
				toggleControl( source, "fire", false)
			end
		end
	end
)

setTimer(function()
	for player,amt in pairs(last_pay) do
		exports.GTIemployment:givePlayerJobMoney(player, "Paramedic", amt)
	end
	last_pay = {}
	for player,amt in pairs(last_exp) do
		exports.GTIemployment:modifyPlayerEmploymentExp(player, amt, "Paramedic")
	end
	last_exp = {}
	for player,amt in pairs(last_prog) do
		exports.GTIemployment:modifyPlayerJobProgress(player, "Paramedic", amt)
	end
	last_prog = {}
end, 10000, 0)

function payTheMedic(player, victim, ambulance)
	local pay = 65
	local hrPay = 40000
	local hrExp = exports.GTIemployment:getHourlyExperience()

	local pay = math.ceil(pay)
	local Exp = math.ceil((pay/hrPay)*hrExp)
	local pay = math.ceil(math.random(pay*0.9, pay*1.1))

	if (ambulance) then
		local hp = getElementHealth(victim)/10
		local pay = math.ceil(pay*hp)
		exports.GTIemployment:givePlayerJobMoney(player, "Paramedic", pay)
		exports.GTIbank:TPM(victim, pay, "Medic: Healed by "..getPlayerName(player))
	else
		if (not last_pay[player]) then last_pay[player] = 0 end
		last_pay[player] = last_pay[player] + pay
		exports.GTIbank:TPM(victim, pay, "Medic: Healed by "..getPlayerName(player))
	end

	if (not last_exp[player]) then last_exp[player] = 0 end
	last_exp[player] = last_exp[player] + Exp

	if (not last_prog[player]) then last_prog[player] = 0 end
	last_prog[player] = last_prog[player] + 10
end

function medicPC(source)
	local vehicle = getPedOccupiedVehicle(source)
	if isPedInVehicle(source) then
		local model = getElementModel(vehicle)
		local job = getElementData(source, "job")
		if job == "Paramedic" then
			local rank = exports.GTIemployment:getPlayerJobLevel(source, "Paramedic")
			if rank >= 2 and rank < 6 then
				if allowedVehModels[model] then
					triggerClientEvent(source, "accessMedicComputer", source)
				end
			elseif rank >= 6 then
				triggerClientEvent(source, "accessMedicComputer", source)
			end
		--else
			--exports.GTIhud:dm("You must be a working as a Paramedic to be able to access to medic computer", source, 255, 0, 0)
		end
	end
end

--[
for i, player in ipairs ( getElementsByType( "player")) do
	bindKey( player, "F6", "down", medicPC)
end
--]]

addEventHandler( "onPlayerLogin", root,
	function()
		local job = exports.GTIemployment:getPlayerJob( source)
		if job == "Paramedic" then
			bindKey( source, "F6", "down", medicPC)
		end
	end
)

addEvent("onPlayerGetJob", true)
addEventHandler("onPlayerGetJob", root,
	function(jobName, newJob)
		if jobName == "Paramedic" then
			bindKey( source, "F6", "down", medicPC)
			--if newJob == true then
				--local account = getPlayerAccount(source)
				--local gunAccount, gunAmmoAccount = exports.GTIammu:getGunAccountData(account, 41)
				--if gunAccount ~= 41 then
					--giveWeapon(source, 41, 9999, true)
				--end
			--end
		end
	end
)

addEvent("onPlayerQuitJob", true)
addEventHandler("onPlayerQuitJob", root,
	function(jobName, resignJob)
		if jobName == "Paramedic" then
			if resignJob == true then
				--takeWeapon(source, 41)
				local theVehicle = getPedOccupiedVehicle(source)
				if theVehicle then
					if getElementModel(theVehicle) == 416 then
						destroyElement(theVehicle)
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

local blockedHP = {
	[100] = true,
	[200] = true,
}

addEventHandler("onPlayerVehicleEnter", root,
	function(vehicle, seat, jacked)
		local model = getElementModel(vehicle)
		local driver = getVehicleOccupant(vehicle)
		if model == 416 then
			if driver then
				if healLock[getElementData(driver, "job")] then
					local rank = exports.GTIemployment:getPlayerJobLevel(driver, "Paramedic")
					if seat == 0 then
						if rank >= 2 then
							--exports.GTIhud:dm("(ESR): Medical Database Computer Access Granted (/pmpc).", source, 0, 255, 255)
						elseif rank < 2 then
							--outputChatBox("(ESR): Medical Database Computer Access #FF0000Denied#00FFFF (L3+).", source, 0, 255, 255, true)
						end
					end
				end
				if not healLock[getElementData(source, "job")] then
					if blockedSeats[seat] then
						if seat ~= 0 then
							outputChatBox("You can only get healed if you are in the back of the ambulance.", source, 255, 0, 0)
						end
					else
						if healLock[getElementData(driver, "job")] then
							local hp = getElementHealth(source)
							local level = exports.GTIemployment:getPlayerJobLevel(driver, "Paramedic")
							local pay = medicPay[level]
							--
							--
							if not blockedHP[hp] then
								outputChatBox("You have been healed by "..getPlayerName(driver)..".", source, 0, 255, 255)
								outputChatBox("You have healed "..getPlayerName(source)..".", driver, 0, 255, 255)
								payTheMedic(driver, source, true)
								setElementHealth(source, 200)
								--[[
								exports.GTIemployment:modifyPlayerJobProgress(driver, "Paramedic", 40)
								exports.GTIemployment:modifyPlayerEmploymentExp(driver, 4, "Paramedic")
								exports.GTIemployment:givePlayerJobMoney(driver, "Paramedic", pay*4)
								--]]
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

addEvent("onPlayerMedicHeal", true)
addEventHandler("onPlayerMedicHeal", root,
	function(medic)
		--if getElementHealth(source) >= 100 then return end
		local lastAttacker = exports.GTIdamage:getLastAttackedPlayer(medic)
		if lastAttacker == source then
			if not isTimer(antiSpamCancel) then
				outputChatBox("You can't heal the last player you recently attacked.", medic, 255, 25, 25)
				antiSpamCancel = setTimer(function() end, 1500, 1)
			end
			return
		end
		if healLock[getElementData(medic, "job")] then
			if (getElementHealth(source) <= 100 or getElementHealth(source) <= 200) then
				local hp = getElementHealth(source)
				local pT = getPlayerTeam(source)
				local team = getTeamName(pT)
				local money = getPlayerMoney(source)
				if money >= 100 then
					local heal = getElementHealth(source)
					local level = exports.GTIemployment:getPlayerJobLevel(medic, "Paramedic")
					--local pay = medicPay[level]
					--if (heal <= 100) then
					if not blockedHP[heal] then
						if (heal + 10 > 100) then heal = 90 end
						setElementHealth(source, heal + 10)
						triggerEvent("onPlayerMedicHealed", source)
						payTheMedic(medic, source)
						--[[
						if bonusTeams[team] then
							local bonus = bonuses[team]
							if not isTimer(antiSpam) then
								exports.GTIemployment:givePlayerJobMoney(medic, "Paramedic", pay*bonus)
								exports.GTIbank:TPM(source, pay, "Medic healing")
								--outputChatBox("You earned a "..bonus.."% bonus for healing a player in the '"..team.."' team.", medic, 0, 255, 255)
								antiSpam = setTimer(function() end, 10000, 1)
							else
								exports.GTIbank:GPM(medic, pay, "Medic Job Pay")
								exports.GTIbank:TPM(source, pay, "Medic healing")
							end
						else
							exports.GTIbank:GPM(medic, pay, "Medic Job Pay")
							exports.GTIbank:TPM(source, pay, "Medic healing")
						end
						exports.GTIemployment:modifyPlayerJobProgress(medic, "Paramedic", 2)
						exports.GTIemployment:modifyPlayerEmploymentExp(medic, 1, "Paramedic")
						--]]
					end
				end
			end
		end
	end
)
