addEventHandler("onResourceStart",resourceRoot,
function()
	for k,v in ipairs(getElementsByType("player")) do
		loadGymData(v)
	end
end)

addEventHandler("onPlayerLogin",root,
function(_,acc)
	loadGymData(source)
end)

function loadGymData(player)
	if not player or not isElement(player) or not getElementType(player) == "player" then return false end
	
	local acc = getPlayerAccount(player)
	if isGuestAccount(acc) then return false end
	
	local gym_styles = exports.GTIaccounts:GAD(acc, "gym_styles") or "0,0"
	gym_styles = split(gym_styles, ",")
	gym_styles = {tonumber(gym_styles[1]), tonumber(gym_styles[2])}
	
	setPedWalkingStyle(player, gym_styles[1])
	setPedFightingStyle(player, gym_styles[2])
	return true
end

addEvent("GTIgym.queryStyle",true)
addEventHandler("GTIgym.queryStyle",root,
function(styleType, theElement, theName, theID)
	if styleType == "walk" then
		triggerClientEvent( source, "GTIgym.returnQuery", source, "disabled", theElement, styleType, theName, theID)
	elseif styleType == "fight" then
		local option = getPedFightingStyle(source) or 0
		triggerClientEvent( source, "GTIgym.returnQuery", source, tostring(option), theElement, styleType, theName, theID)
	end
end)

addEvent("GTIgym.buyStyle",true)
addEventHandler("GTIgym.buyStyle",root,
function(styleType,styleName,styleID,styleCost)
	local acc = getPlayerAccount(client)
	if isGuestAccount(acc) then return end
	
	styleCost = tonumber(styleCost)
	local gym_styles = exports.GTIaccounts:GAD(acc, "gym_styles") or "0,0"
	gym_styles = split(gym_styles, ",")
	gym_styles = {tonumber(gym_styles[1]), tonumber(gym_styles[2])}
	
	if (styleType == "walk") then
		--If he's trying to buy the same style, cancel it.
		if (styleID ~= gym_styles[1]) then
			gym_styles[1] = styleID
			exports.GTIhud:dm("You have bought the "..styleName.." walking style for $"..exports.GTIutil:tocomma(styleCost)..".",client,51,255,51)
			exports.GTIbank:TPM(client, styleCost, "GTIgym: Bought walking style ("..styleName..")")
			setPedWalkingStyle(client, styleID)
			exports.GTIaccounts:SAD(acc, "gym_styles", table.concat(gym_styles, ","))
			return true
		else
			exports.GTIhud:dm("You have "..styleName.." already. Choose a different walking style.",client,255,51,51)
			return false
		end
	elseif (styleType == "fight") then
		if (styleID ~= gym_styles[2]) then
			gym_styles[2] = styleID
			exports.GTIhud:dm("You have bought the "..styleName.." fighting style for $"..exports.GTIutil:tocomma(styleCost)..".",client,51,255,51)
			exports.GTIbank:TPM(client, styleCost, "GTIgym: Bought fighting style ("..styleName..")")
			setPedFightingStyle(client,styleID)
			exports.GTIaccounts:SAD(acc, "gym_styles", table.concat(gym_styles, ","))
			return true
		else
			exports.GTIhud:dm("You have "..styleName.." already. Choose a different fighting style.",client,255,51,51)
			return false
		end
	else
		outputDebugString("[GYM] Invalid styleType sent to server. ("..getPlayerName(client)..")",0,255,0,0)
		return false
	end
end)