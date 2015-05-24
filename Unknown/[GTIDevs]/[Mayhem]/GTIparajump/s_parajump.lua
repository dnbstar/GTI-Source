--Grand Theft International
function startJump(x, y, z)
	if (exports.GTIpoliceWanted:isPlayerWanted(client)) then
		triggerClientEvent(client, "GTIparajump.unable", client)
		exports.GTIhud:dm("You are wanted so you are not allowed to participate in this activity!", client, 255, 255, 255)
	else
		giveWeapon(client, 46, 1, true)
		setElementPosition(client, x, y, z)

		setElementFrozen(client, true)
		exports.GTIhud:dm("Your goal is to go through all of the hoops, You will start in 5 seconds!", client, 255, 255, 255)

		setTimer(function(client) triggerClientEvent(client, "GTIparajump.starthoops", client) setElementFrozen(client, false) end, 5000, 1, client)
	end
end
addEvent("GTIparajump.startjump", true)
addEventHandler("GTIparajump.startjump", getRootElement(), startJump)

function payPlayer(amount)
	exports.GTIbank:GPM(client, amount, "Parajump payment")
end
addEvent("GTIparajump.payplayer", true)
addEventHandler("GTIparajump.payplayer", getRootElement(), payPlayer)