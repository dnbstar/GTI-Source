addEvent("GTIfood.setFeature", true)
addEventHandler("GTIfood.setFeature", root,
	function(option, item, hp, cost)
		if option == "buy" then
			local money = getPlayerMoney(source)
			if money ~= 0 and money > 0 and money >= cost then
				local stat = getPedStat(source, 24)
				local hp1 = getElementHealth(source)
				if stat == 1000 then
					local gain = getElementHealth(source) + hp
					if hp1 < 200 then
						outputChatBox("You bought the "..item.." ("..hp.." HP) for $"..cost, source, 255, 255, 0)
						setElementHealth(source, gain)
					else
						outputChatBox("You bought the "..item.." for $"..cost, source, 255, 255, 0)
					end
					exports.GTIbank:TPM(source, cost, "Food: Bought the "..item)
				else
					local gain = getElementHealth(source) + hp
					if hp1 < 100 then
						outputChatBox("You bought the "..item.." ("..hp.." HP) for $"..cost, source, 255, 255, 0)
						setElementHealth(source, gain)
					else
						outputChatBox("You bought the "..item.." for $"..cost, source, 255, 255, 0)
					end
					exports.GTIbank:TPM(source, cost, "Food: Bought the "..item)
				end
			else
				outputChatBox("You don't have enough money to buy the "..item.." (Costs $"..cost..")", source, 255, 0, 0)
			end
		elseif option == "vomit" then
			local loss = getElementHealth(source) + hp
			setElementHealth( source, loss)
		end
	end
)

addEventHandler( "onPlayerArrested", root,
	function()
		triggerClientEvent( source, "GTIfood.bugStopper", source)
	end
)

addEventHandler( "onPlayerWasted", root,
	function()
		triggerClientEvent( source, "GTIfood.bugStopper", source)
	end
)
