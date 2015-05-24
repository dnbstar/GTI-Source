function dm(player, message, r, g, b)
	if (isElement(player)) then
		--triggerClientEvent(player, "GTIhelp.dm", player, message, r, g, b)
		exports.GTIhud:dm( message, player, r, g, b)
	end
end

function giveDaMoney(daPlayah, moneh)
    givePlayerMoney(daPlayah, moneh)
	exports.CRPmessage:smallNote( daPlayah, "+ $"..convertNumber(moneh), 45, 130, 49)
end
addEvent("giveMoney",true)
addEventHandler("giveMoney",getRootElement(),giveDaMoney)

function takeDaMoney(daNoob, money)
    takePlayerMoney(daNoob, money)
	if (isTimer(antiSMSSpam)) then return end
	antiSMSSpam = setTimer(function() end, 2500, 1)
	exports.CRPmessage:smallNote( daNoob, "- $"..convertNumber(money), 130, 45, 49)
end
addEvent("takeMoney",true)
addEventHandler("takeMoney",getRootElement(),takeDaMoney)

function setDaMoney(daPlayah, amount)
    setPlayerMoney(daPlayah, amount)
end
addEvent("setMoney",true)
addEventHandler("setMoney",getRootElement(),setDaMoney)

function giveMoney(player, amount)
	if (isElement(player)) then
		triggerClientEvent(player, "GTIhelp.gm", player, tonumber(amount))
	end
end

function takeMoney(player, amount)
	if (isElement(player)) then
		triggerClientEvent(player, "GTIhelp.tm", player, tonumber(amount))
	end
end

function isPlayerInACL(player,acl)
    local account = getAccountName(getPlayerAccount(player))
    if(isObjectInACLGroup("user."..account,aclGetGroup(acl))) then
        return true
    else
        return false
    end
end

function formatNumber ( number )
	local formatted = number
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if ( k==0 ) then
			break
		end
	end
	return formatted
end
