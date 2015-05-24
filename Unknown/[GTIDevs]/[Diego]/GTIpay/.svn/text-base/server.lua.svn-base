-- Paying function
--------------------------->>
function getPlayerFromNamePart(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

function payPlayer(thePlayer, command, playerName, amount)
	if playerName and amount then
		local amount = tonumber(amount)
		if (type(amount) == "number") and (amount >= 1) then

			local playerToPay = getPlayerFromNamePart(playerName)
			local cashToGive = tonumber(amount)
			
			local x, y, z = getElementPosition(thePlayer)
			local ex, ey, ez = getElementPosition(playerToPay)
			local cash = getPlayerMoney(thePlayer)
			
			if playerToPay == thePlayer then
				exports.GTIhud:dm("You can't pay yourself", thePlayer, 255, 0, 0)
				return
			end
			
			if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) < 5 then
			
				if (cash < cashToGive) then 
					outputChatBox("You can't afford this.", thePlayer, 200, 0, 0)
					return
				end
			
				if not isPedInVehicle(thePlayer) then
					setPedAnimation(thePlayer, "DEALER", "shop_pay")
					setTimer(setPedAnimation, 4000, 1, thePlayer)
				end
				exports.GTIbank:GPM(playerToPay, cashToGive, "Paying: "..getPlayerName(thePlayer).." sent "..cashToGive.." to "..getPlayerName(playerToPay).."" )
				exports.GTIbank:TPM(thePlayer, cashToGive, "Paying: "..getPlayerName(playerToPay).." received "..cashToGive.." from "..getPlayerName(thePlayer).."")
				exports.GTIhud:drawNote("pay.-", "-$"..cashToGive..", sent to "..getPlayerName(playerToPay)..".", thePlayer, 255, 0, 0, 5000)
				exports.GTIhud:drawNote("pay.+", "+$"..cashToGive..", sent from "..getPlayerName(thePlayer)..".", playerToPay, 0, 255, 0, 5000)	
			else
				exports.GTIhud:dm("You're too far away from "..getPlayerName(playerToPay)..".", thePlayer, 255, 0, 0)
			end
		else
			exports.GTIhud:dm("Insert an amount to send.", thePlayer, 255, 0, 0)
		end
	else
		exports.GTIhud:dm("Insert a player name.", thePlayer, 255, 0, 0)
	end
end
addCommandHandler("pay", payPlayer)