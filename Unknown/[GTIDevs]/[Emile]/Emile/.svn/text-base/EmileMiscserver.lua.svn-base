function clearWantedPoints(playerSource)
	if getServerPort() == 22020 then
		if playerSource then
			exports.GTIpoliceWanted:clearPlayerWantedLevel(playerSource)
			tag = "QCA"
			qca_text = getPlayerName(playerSource).." cleared their wanted level."
			exports.GTIlogs:outputAdminLog(tag..": "..qca_text, playerSource)
		end
	end
end
addCommandHandler ( "clearwl", clearWantedPoints)
