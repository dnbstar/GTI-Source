selected = {}
playerRow = {}

function addPlayersToGridlist()
	guiGridListClear( GTIres.gridlist[7])
	for index, player in pairs(getElementsByType("player")) do
		local team = getPlayerTeam(player)
		if (team) then
			mainR, mainG, mainB = getTeamColor(team)
		else
			mainR, mainG, mainB = 255, 255, 255
		end
		local row = guiGridListAddRow( GTIres.gridlist[7])
		local name = getPlayerName(player)
		guiGridListSetItemText( GTIres.gridlist[7], row, playerColumn, name, false, false)
		guiGridListSetItemColor( GTIres.gridlist[7], row, playerColumn, mainR, mainG, mainB)
		playerRow[player] = row
	end
end
addEvent( "GTIresLocal.getPlayers", true)
addEventHandler( "GTIresLocal.getPlayers", root, addPlayersToGridlist)

function changeOnNick(_, newNick)
	if playerRow[source] then
		guiGridListRemoveRow(playersList, playerRow[source])
		playerRow[source] = nil
		local team = getPlayerTeam(source)
		if (team) then
			cR, cG, cB = getTeamColor(team)
		else
			cR, cG, cB = 255, 255, 255
		end
		local row = guiGridListAddRow( GTIres.gridlist[7])
		guiGridListSetItemText( GTIres.gridlist[7], row, playerColumn, newNick, false, false)
		guiGridListSetItemColor( GTIres.gridlist[7], row, playerColumn, mainR, mainG, mainB)
		playerRow[source] = row
	end
end
addEventHandler("onClientPlayerChangeNick", root, changeOnNick)

function addOnJoin()
	if not playerRow[source] then
		local row = guiGridListAddRow( GTIres.gridlist[7])
		local name = getPlayerName( source)
		guiGridListSetItemText( GTIres.gridlist[7], row, playerColumn, name, false, false)
		playerRow[source] = row
	end
end
addEventHandler("onClientPlayerJoin", root, addOnJoin)

function removeOnLeave()
	if playerRow[source] then
		for i, player in pairs(getElementsByType("player")) do
			local row = playerRow[source]
			if row then
				guiGridListRemoveRow( GTIres.gridlist[7], row)
				playerRow[source] = nil
			end
		end
	end
end
addEventHandler("onClientPlayerQuit", root, removeOnLeave)

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIres.gridlist[7] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem( GTIres.gridlist[7])
			local playerName = guiGridListGetItemText( GTIres.gridlist[7], selectedRow, selectedCol)
			player = getPlayerFromName(playerName)
			if not isElement(player) then return end
			--[[
			if isTimer(antispamTimer) then return end
			local function doNotSpamInterface()
				if (isTimer(antispamTimer)) then
					killTimer(antispamTimer)
				end
			end
			antispamTimer = setTimer(doNotSpamInterface, 1000, 0)
			--]]
			triggerServerEvent("GTIres.fetchSelectedDetails", localPlayer, player)
		end
	end
)

function fetchPlayerDetails( details)
	refreshTimer = setTimer(updateDetailsOnPanel, 100, 0)
	local x, y, z = getElementPosition(player)
	local city, place = getZoneName(x, y, z, true), getZoneName(x, y, z)
	local localTeam = getPlayerTeam(player)
	local pedWeapon = getPedWeapon(player)
	local interior, dimension = getElementInterior(player), getElementDimension(player)
	if localTeam then
		teamText = getTeamName(localTeam)
	else
		teamText = "N/A"
	end
	if pedWeapon then
		weaponText = getWeaponNameFromID(pedWeapon).." (ID: "..pedWeapon..")"
	else
		weaponText = "N/A"
	end
	local occ = getElementData(player, "occupation") or "N/A"
	local vehicle = getPedOccupiedVehicle(player)
	if vehicle then
		vehicleModel = getElementModel(vehicle)
		vehicleName = getVehicleNameFromModel(vehicleModel)
		vehicleHP = math.floor(getElementHealth(vehicle)).."%"
	else
		vehicleModel = "N/A"
		vehicleName = "N/A"
		vehicleHP = "N/A"
	end
	local health = math.floor(getElementHealth(player))
	local armor = getPedArmor(player)
	local model = getElementModel(player)
	local job = getElementData(player, "Occupation") or "N/A"
	local cash = getPlayerMoney(player) or "0"
	local cash = formatNumber( cash)
	guiSetText( GTIres.label[19], "Name: "..getPlayerName(player))
	guiSetText( GTIres.label[26], "Health: "..health.."%")
	guiSetText( GTIres.label[27], "Armor: "..armor.."%")
	guiSetText( GTIres.label[28], "Skin: "..model)
	guiSetText( GTIres.label[30], "Money: $"..cash)
	guiSetText( GTIres.label[29], "Team: "..teamText)
	guiSetText( GTIres.label[31], "Weapon: "..weaponText)
	guiSetText( GTIres.label[33], "X: "..x)
	guiSetText( GTIres.label[34], "Y: "..y)
	guiSetText( GTIres.label[35], "Z: "..z)
	guiSetText( GTIres.label[36], "Interior: "..interior)
	guiSetText( GTIres.label[37], "Dimension: "..dimension)
	guiSetText( GTIres.label[39], "Vehicle: "..vehicleName.." (ID: "..vehicleModel..")")
	guiSetText( GTIres.label[40], "Vehicle Health: "..vehicleHP)
	guiSetText( GTIres.label[32], "Location: "..place..", "..city)
	for index, detail in pairs (details) do
		local ipaddress = detail[1]
		local serial = detail[2]
		local version = detail[3]
		local account = detail[4]
		local country = detail[5]
		--
		if account == "guest" then
			plrAcc = "Not Logged In"
		else
			plrAcc = account
		end
		guiSetText( GTIres.label[20], "Account: "..plrAcc)
		guiSetText( GTIres.label[21], "IP: "..ipaddress)
		guiSetText( GTIres.label[22], "Serial: "..serial)
		guiSetText( GTIres.label[23], "Version: "..version)
		guiSetText( GTIres.label[24], "Country: "..country)
	end
end
addEvent( "GTIres.placePlayerDetails", true)
addEventHandler( "GTIres.placePlayerDetails", root, fetchPlayerDetails)

function updateDetailsOnPanel()
	if (isElement(player)) then
		local x, y, z = getElementPosition(player)
		local city, place = getZoneName(x, y, z, true), getZoneName(x, y, z)
		local localTeam = getPlayerTeam(player)
		local pedWeapon = getPedWeapon(player)
		local interior, dimension = getElementInterior(player), getElementDimension(player)
		if localTeam then
			teamText = getTeamName(localTeam)
		else
			teamText = "N/A"
		end
		if pedWeapon then
			weaponText = getWeaponNameFromID(pedWeapon).." (ID: "..pedWeapon..")"
		else
			weaponText = "N/A"
		end
		local occ = getElementData(player, "occupation") or "N/A"
		local vehicle = getPedOccupiedVehicle(player)
		if vehicle then
			vehicleModel = getElementModel(vehicle)
			vehicleName = getVehicleNameFromModel(vehicleModel)
			vehicleHP = math.floor(getElementHealth(vehicle)).."%"
		else
			vehicleModel = "N/A"
			vehicleName = "N/A"
			vehicleHP = "N/A"
		end
		local health = math.floor(getElementHealth(player))
		local armor = getPedArmor(player)
		local model = getElementModel(player)
		local job = getElementData(player, "Occupation") or "N/A"
		local cash = getPlayerMoney(player) or "0"
		local cash = formatNumber( cash)
		guiSetText( GTIres.label[19], "Name: "..getPlayerName(player))
		guiSetText( GTIres.label[26], "Health: "..health.."%")
		guiSetText( GTIres.label[27], "Armor: "..armor.."%")
		guiSetText( GTIres.label[28], "Skin: "..model)
		guiSetText( GTIres.label[30], "Money: $"..cash)
		guiSetText( GTIres.label[29], "Team: "..teamText)
		guiSetText( GTIres.label[31], "Weapon: "..weaponText)
		guiSetText( GTIres.label[33], "X: "..x)
		guiSetText( GTIres.label[34], "Y: "..y)
		guiSetText( GTIres.label[35], "Z: "..z)
		guiSetText( GTIres.label[36], "Interior: "..interior)
		guiSetText( GTIres.label[37], "Dimension: "..dimension)
		guiSetText( GTIres.label[39], "Vehicle: "..vehicleName.." (ID: "..vehicleModel..")")
		guiSetText( GTIres.label[40], "Vehicle Health: "..vehicleHP)
		guiSetText( GTIres.label[32], "Location: "..place..", "..city)
	end
end

function formatNumber(n)
	if (not n) then return end
    local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
    return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end
