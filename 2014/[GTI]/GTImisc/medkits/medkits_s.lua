function healthBuy2()
	local playerHP = getElementHealth(source)
	if (playerHP < 100) then
		local money = getPlayerMoney(source)
		if money >= 1000 then
			takePlayerMoney(source, 1000)
			--triggerEvent("onHealthBuy",source)
			setElementHealth(source, 200)
			outputChatBox("You now have full Health.", source, 255, 255, 0, false)
		end
	elseif (playerHP > 100 or 200) then
		exports.GTIhelp:dm( source, "You have enough health to survive", 130, 45, 49)
	end
end
addEvent("onHealthBuy2", true)
addEventHandler("onHealthBuy2", getRootElement(), healthBuy2)

function buyMedkit(amount)
	if (not isGuestAccount(getPlayerAccount(client))) then
		if amount then
			local account = getPlayerAccount(client)
			local medkits = exports.GTIaccounts:GAD( account, "GTImisc.kits") or 0
			local money = getPlayerMoney(client)
			if money >= 250*amount/2 then
				exports.GTIaccounts:SAD(account, "GTImisc.kits", medkits + amount)
				takePlayerMoney(client, 250*amount/2)
				exports.GTIhelp:dm( client, "You bought "..amount.." medkits for $"..250*amount, 255, 255, 0)
			else
				exports.GTIhelp:dm( client, "You don't have enough money to buy "..amount.." medkits ($"..(250*amount/2)..")", 255, 0, 0)
			end
		end
	end
end
addEvent("GTImisc.buyMedkit", true)
addEventHandler("GTImisc.buyMedkit", root, buyMedkit)

function takePlayerMedKit(player, amount)
	if (isElement(player)) then
		if (not isGuestAccount(getPlayerAccount(player))) then
			local account = getPlayerAccount(player)
			local medkits = exports.GTIaccounts:GAD( account, "GTImisc.kits") or 0
			exports.GTIaccounts:SAD(account, "GTImisc.kits", medkits - amount)
		end
	end
end

function givePlayerMedKit(player, amount)
	if (isElement(player)) then
		if (not isGuestAccount(getPlayerAccount(player))) then
			local account = getPlayerAccount(player)
			local medkits = exports.GTIaccounts:GAD( account, "GTImisc.kits") or 0
			exports.GTIaccounts:SAD(account, "GTImisc.kits", medkits + amount)
		end
	end
end

function giveMedKitToPlayer( player, toPlayer, amount)
	if (isElement(player)) then
		if toPlayer then
			if amount then
				local other = getPlayerFromName( toPlayer)
				local giverAccount = getPlayerAccount(player)
				local otherAccount = getPlayerAccount(other)
				local medkits1 = exports.GTIaccounts:GAD( giverAccount, "GTImisc.kits") or 0
				local medkits2 = exports.GTIaccounts:GAD( otherAccount, "GTImisc.kits") or 0
				exports.GTIaccounts:SAD( giverAccount, "GTImisc.kits", medkits1 - amount)
				exports.GTIaccounts:SAD( otherAccount, "GTImisc.kits", medkits2 + amount)
				exports.GTIhelp:dm( other, getPlayerName(player).." gave you "..amount.." medkits", 0, 255, 0)
				exports.GTIhelp:dm( player, "You gave "..toPlayer.." "..amount.." medkits", 0, 255, 0)
			end
		end
	end
end

function getPlayerMedKits(player)
	if (isElement(player)) then
		local account = getPlayerAccount(player)
		local medkits = exports.GTIaccounts:GAD( account, "GTImisc.kits") or 0
		return medkits or 0
	end
end

function useKit( thePlayer, theAmount)
	if isElement( thePlayer) then
		if theAmount then
			if not isTimer(antiSpam) then
				antiSpam = setTimer(function() end, 5000, 1)
				local health = getElementHealth( thePlayer)
				local medKits = getPlayerMedKits( thePlayer)
				if medKits >= 1 then
					if medKits >= theAmount then
						local hpStat = getPedStat( thePlayer, 24)
						if hpStat == 1000 then
							if health ~= 200 then
								setElementHealth( thePlayer, health+70)
								takePlayerMedKit( thePlayer, theAmount)
								local newMedKit = medKits-theAmount
								exports.GTIhud:dqm( "medkitUse", theAmount.." Medkit used - "..newMedKit.." left", thePlayer, 0, 192, 0, 5000)
							else
								outputChatBox( "You already have full health", thePlayer, 255, 255, 0)
							end
						else
							if health ~= 100 then
								setElementHealth( thePlayer, health+35)
								takePlayerMedKit( thePlayer, theAmount)
								local newMedKit = medKits-theAmount
								exports.GTIhud:dqm( "medkitUse", theAmount.." Medkit used - "..newMedKit.." left", thePlayer, 0, 192, 0, 5000)
							else
								outputChatBox( "You already have full health", thePlayer, 255, 255, 0)
							end
						end
					end
				else
					return exports.GTIhelp:dm( thePlayer, "You don't have any medkits to use", 255, 0, 0)
				end
			else
				return exports.GTIhelp:dm( thePlayer, "You can only use a medkit once every 5 seconds", 255, 255, 0)
			end
		end
	end
end

local blockedHealth = { [100]=true, [200]=true}

function medkitUse( source, command, amount)
	if isElement(source) then
		local health = getElementHealth( source)
		local health = math.floor(health)
		if blockedHealth[health] then
			if tonumber( amount) then
				if tonumber(amount) <= 5 then
					useKit( source, amount)
				else
					exports.GTIhud:dqm( "medkitFail", "You can't use over 5 medkits at once", source, 132, 0, 0, 5000)
				end
			else
				useKit( source, 1)
			end
		else
			exports.GTIhud:dqm( "medkitFail", "You have full health", source, 132, 0, 0, 5000)
		end
	end
end
addCommandHandler( "usemedkit", medkitUse)
