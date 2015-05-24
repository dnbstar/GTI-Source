addEventHandler( "onResourceStart", resourceRoot,
	function()
		for i, player in ipairs ( getElementsByType( "player")) do
			setClothes( player)
			--checkForCustomClothing( player)
		end
	end
)

addEventHandler( "onResourceStop", resourceRoot,
	function()
		for i, player in ipairs ( getElementsByType( "player")) do
			saveClothes( player)
		end
	end
)

addEventHandler( "onPlayerLogin", root,
	function()
		triggerClientEvent( source, "GTIcc.checkFiles", source)
	end
)

function onLogin()
	setClothes( source)
	triggerClientEvent( source, "loginShaderShow", source)
end
addEvent( "addClothesOnLogin", true)
addEventHandler( "addClothesOnLogin", root, onLogin)

addEventHandler( "onPlayerQuit", root,
	function()
		saveClothes( source)
	end
)

function applyTexture( thePlayer, data)
	triggerClientEvent( root, "applyCustomItem", root, thePlayer, data)
end

function saveClothes( thePlayer)
	local account = getPlayerAccount( thePlayer)
	if not isGuestAccount(account) then
		if getElementModel( thePlayer) == 0 then
			for k = 0, 17, 1 do
				local clothesTexture, clothesModel = getPedClothes( thePlayer, k)

				if clothesModel then
					sCD( account, tostring("clothingItem"..k), clothesTexture..";"..clothesModel)
				end
			end
		end
	end
end

function saveCustomClothing( thePlayer, thePart, theData)
	local account = getPlayerAccount( thePlayer)
	if not isGuestAccount(account) then
		if getElementModel( thePlayer) == 0 then
			sCD( account, thePart, theData)
			--setClothes( thePlayer, true)
			applyTexture( thePlayer, theData)
		end
	end
end

function buyClothingItem( regularData, customData)
	local rData = split( regularData, ";")

	local txd, dff, id = rData[1], rData[2], rData[3]
	local sid = rData[4]

	addPedClothes( client, txd, dff, id)
	saveClothes( client)

	if customData then
		saveCustomClothing( client, "customItem"..id, id..";"..customData..";"..sid)
	else
		saveCustomClothing( client, "customItem"..id, id..";false;"..sid)
	end
end
addEvent( "buyClothingItem", true)
addEventHandler( "buyClothingItem", root, buyClothingItem)

function setClothes( thePlayer, bought)
	local account = getPlayerAccount( thePlayer)
	if ( not isGuestAccount(account) ) then
		if getElementModel(  thePlayer) == 0 then
			for k = 0, 17, 1 do
				local iData = gCD( account, tostring("clothingItem"..k))
				if iData then
					local itemData = split( iData, ";")

					local texture = itemData[1]
					local model = itemData[2]

					addPedClothes( thePlayer, texture, model, k)
				end

				local cItem = gCD( account, tostring("customItem"..k))
				if cItem then
					setTimer( applyTexture, 250, 1, thePlayer, cItem)
				end
			end
		end
	end
end
addEvent( "loadClothingItems", true)
addEventHandler( "loadClothingItems", root, setClothes)

--[[
function checkForCustomClothing( thePlayer)
	local account = getPlayerAccount( thePlayer)
	if ( not isGuestAccount(account) ) then
		local clothingString = ""
		for i = 0, 17, 1 do
			local cItem = gCD( account, tostring("customItem"..i))
			if cItem then
				local cSplit = split( cItem, ";")

				clothingString = clothingString..cItem.."|"
			end
		end
		outputChatBox( clothingString)
	end
end
--]]
