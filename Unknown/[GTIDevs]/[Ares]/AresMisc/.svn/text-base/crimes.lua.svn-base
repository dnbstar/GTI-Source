local Data = {}
function a (player)
Data[player] = 0
account = getPlayerAccount(player)
	for i = 1,90 do
	     crimes = exports.GTIpoliceWanted:getWantedData(account, "crimeID"..i) or "0" 
		 Data[player] = Data[player] + crimes
	end
outputChatBox(Data[player],player)
end
addCommandHandler("crimes",a)