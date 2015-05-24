function downloadCustomSkin( source, file)
	if file then
		if fileExists( file) then
			local fileContents = fileOpen( file)
			if fileContents then
				local fileInfo = fileRead( fileContents, 512000)
				if fileInfo then
					triggerClientEvent( source, "addCustomSkin", root, file, fileInfo)
				end
			end
		end
	end
end
addEvent( "downloadSkin", true)
addEventHandler( "downloadSkin", root, downloadCustomSkin)

function previewView()
	setElementFrozen( source, true)
	setElementInterior( source, 0)
	setElementDimension( source, 10)
	setCameraMatrix( source, 670.658203125, -1303.138671875, 13.768600463867, 716.009765625, -1214.1123046875, 9.5818252563477)
end
addEvent( "togglePreCam0", true)
addEventHandler( "togglePreCam0", getRootElement(), previewView)

function camReset()
	setCameraTarget( source)
	setElementInterior( source, getElementData( source, "int"))
	setElementDimension( source, getElementData( source, "dim"))
	setElementFrozen( source, false)
end
addEvent( "resetTheCam", true)
addEventHandler( "resetTheCam", getRootElement(), camReset)

function plrR( player)
	if getPlayerMoney( player) >= 250 then
		setElementModel( player, 0)
	else
		exports.GTIhud:dqm( "noClothingMoney", "Transaction Failed - Not Enough Funds", player, 255, 132, 133, 2500)
	end
end
addEvent( "setPlayerModel", true)
addEventHandler( "setPlayerModel", getRootElement(), plrR)

function buyClothes( player, txd, dff, id, money)
	if getElementModel( player) == 0 then
		local mSC = getPlayerMoney( player)
		if money then
			if tonumber(money) then
				--if mSC >= tonumber(money) then
				if tonumber( money) <= mSC then
					addPedClothes( player, txd, dff, id)
				else
					exports.GTIhud:dqm( "noClothingMoney", "Transaction Failed - Not Enough Funds", player, 255, 132, 133, 2500)
				end
			end
		end
	else
		exports.GTIhud:dqm( "noClothingSkin", "Transaction Failed - No CJ Skin", player, 255, 132, 133, 2500)
	end
end
addEvent( "purchaseClothes", true)
addEventHandler( "purchaseClothes", getRootElement(), buyClothes, false)

function removeClothes( player, txd, dff, id)
	if getElementModel( player) == 0 then
		removePedClothes( player, id, txd, dff)
	end
end
addEvent( "removeClothing", true)
addEventHandler( "removeClothing", getRootElement(), removeClothes)

function setMSG( player, money)
	local mSC = getPlayerMoney( player)
	if money then
		if tonumber( money) then
			if mSC >= tonumber(money) then
				takePlayerMoney( player, money)
			end
		end
	end
end
addEvent( "purchaseMSG", true)
addEventHandler( "purchaseMSG", getRootElement(), setMSG)
