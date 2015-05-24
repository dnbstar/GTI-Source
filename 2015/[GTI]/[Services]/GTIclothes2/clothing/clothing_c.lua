types = {
	{ name = "Shirts", id = 0},
	{ name = "Hair", id = 1},
	{ name = "Pants", id = 2},
	{ name = "Shoes", id = 3},
	{ name = "Necklaces", id = 13},
	{ name = "Watches", id = 14},
	{ name = "Glasses", id = 15},
	{ name = "Hats", id = 16},
	{ name = "Extra Skins", id = 17},
}

setTimer(
	function ( )
		guiGridListClear( typeGrid)
		for i,k in ipairs ( types ) do
			local typeRow = guiGridListAddRow(typeGrid)
			guiGridListSetItemText(typeGrid, typeRow, 1, k.name, false, false)
			guiGridListSetItemData(typeGrid, typeRow, 1, k.id)
		end
	end, 100, 1
)

function updateRotation()
	if (not isElement(tPed)) then removeEventHandler("onClientRender", root, updateRotation) timer = nil return end
	local _, _, crot = getElementRotation(tPed)
	setElementRotation(tPed, 0, 0, crot + 1.5)
end

addEventHandler( "onClientGUIClick", root,
	function ( )
		if source == typeGrid then
			local Trow, Tcol = guiGridListGetSelectedItem(typeGrid)
			local sType = guiGridListGetItemText(typeGrid, Trow, Tcol)
			guiGridListClear( clothingGrid)
			if sType == "Hats" then
				for i,v in ipairs ( clothes ) do
					if v.id == 16 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Shirts" then
				for i,v in ipairs ( clothes ) do
					if v.id == 0 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Pants" then
				for i,v in ipairs ( clothes ) do
					if v.id == 2 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Shoes" then
				for i,v in ipairs ( clothes ) do
					if v.id == 3 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Hair" then
				for i,v in ipairs ( clothes ) do
					if v.id == 1 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Extra Skins" then
				for i,v in ipairs ( clothes ) do
					if v.id == 17 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Glasses" then
				for i,v in ipairs ( clothes ) do
					if v.id == 15 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Watches" then
				for i,v in ipairs ( clothes ) do
					if v.id == 14 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			elseif sType == "Necklaces" then
				for i,v in ipairs ( clothes ) do
					if v.id == 13 then
						local aRow = guiGridListAddRow(clothingGrid)
						guiGridListSetItemText(clothingGrid, aRow, 1, v.name, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 2, v.price, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 3, v.texture, false, false)
						guiGridListSetItemText(clothingGrid, aRow, 4, v.model, false, false)
						guiGridListSetItemData(clothingGrid, aRow, 4, v.model)
						guiGridListSetItemData(clothingGrid, aRow, 3, v.texture)
						guiGridListSetItemData(clothingGrid, aRow, 1, v.id)
					end
				end
			end
		end
	end
)

local stores = {
	--{x, y, z, dimension, interior, r, g, b},
--Binco
	{217.485, -98.763, 1004, 0, 15, 204, 51, 255},
	{217.485, -98.763, 1004, 1, 15, 204, 51, 255},
	{217.485, -98.763, 1004, 2, 15, 204, 51, 255},
	{217.485, -98.763, 1004, 3, 15, 204, 51, 255},
--ProLaps
	{198.882, -136.201, 1002.507, 0, 3, 204, 51, 255},
	{198.882, -136.201, 1002.507, 1, 3, 204, 51, 255},
	{198.882, -136.201, 1002.507, 2, 3, 204, 51, 255},
	{198.882, -136.201, 1002.507, 3, 3, 204, 51, 255},
--Victim
	{210.335, -8.295, 1004.210, 0, 5, 204, 51, 255},
	{210.335, -8.295, 1004.210, 1, 5, 204, 51, 255},
	{210.335, -8.295, 1004.210, 2, 5, 204, 51, 255},
	{210.335, -8.295, 1004.210, 3, 5, 204, 51, 255},
--SubUrban
	{213.035, -41.728, 1001.023, 0, 1, 204, 51, 255},
	{213.035, -41.728, 1001.023, 1, 1, 204, 51, 255},
	{213.035, -41.728, 1001.023, 2, 1, 204, 51, 255},
	{213.035, -41.728, 1001.023, 3, 1, 204, 51, 255},
--ZIP
	{178.412, -88.377, 1001.023, 0, 18, 204, 51, 255},
	{178.412, -88.377, 1001.023, 1, 18, 204, 51, 255},
	{178.412, -88.377, 1001.023, 2, 18, 204, 51, 255},
	{178.412, -88.377, 1001.023, 4, 18, 204, 51, 255},
--DS
	{212.668, -156.092, 999.523, 0, 14, 204, 51, 255},
	{212.668, -156.092, 999.523, 1, 14, 204, 51, 255},
	{212.668, -156.092, 999.523, 2, 14, 204, 51, 255},
	{212.668, -156.092, 999.523, 3, 14, 204, 51, 255},
	{470.083, -1483.293, 30.860, 0, 0, 0, 204, 51, 255}
}

    setTimer (
        function ( )
            for _,v in ipairs ( stores ) do
                local x, y, z, dimension, interior, r, g, b = unpack ( v )
                local q = createMarker ( x, y, z, "cylinder", 2, r, g, b, 150 )
				local markers = createColTube( x, y, z, 1, 2)
                setElementInterior ( markers, interior )
				setElementDimension ( markers, dimension )
                setElementInterior ( q, interior )
				setElementDimension ( q, dimension )
                addEventHandler ( "onClientColShapeHit", markers, openClothesWindow, false )
            end
        end, 100, 1
    )

function setPlayerClothesInCart()
	if getElementModel( localPlayer) == 0 then
		guiGridListClear( cartGrid)
		for i=0, 17, 1 do
			removePedClothes( tPed, i)
			local txd, dff = getPedClothes( localPlayer, i)
			for k,t in ipairs (clothes) do
				if t.texture == txd then
					if t.model == dff then
						if t.id == i then
							local cartRow = guiGridListAddRow(cartGrid)
							if cartRow then
								addPedClothes( tPed, txd, dff, i)
								guiGridListSetItemText(cartGrid, cartRow, 1, t.name, false, false)
								guiGridListSetItemText(cartGrid, cartRow, 2, t.price, false, false)
								guiGridListSetItemText(cartGrid, cartRow, 3, txd, false, false)
								guiGridListSetItemText(cartGrid, cartRow, 4, dff, false, false)
								guiGridListSetItemData(cartGrid, cartRow, 4, dff)
								guiGridListSetItemData(cartGrid, cartRow, 3, txd)
								guiGridListSetItemData(cartGrid, cartRow, 1, i)
							end
						end
					end
				end
			end
		end
	end
end

    function openClothesWindow( hitElement )
        if getElementType(hitElement) == "player" and (hitElement == localPlayer) then
			if not guiGetVisible(clotheShopWindow) then
				guiSetVisible( clotheShopWindow, true )
				showCursor( true, true )
				triggerServerEvent( "togglePreCam0", localPlayer)
				setElementData( localPlayer, "int", getElementInterior(localPlayer))
				setElementData( localPlayer, "dim", getElementDimension(localPlayer))
				if isElement(tPed) ~= true then
					tPed = createPed( 0, 671.1025390625, -1300.423828125, 13.6328125)
					timer = addEventHandler("onClientRender", root, updateRotation)
				else
					destroyElement(tPed)
					timer = nil
					removeEventHandler("onClientRender", root, updateRotation)
					tPed = createPed( 0, 671.1025390625, -1300.423828125, 13.6328125)
					--setElementFrozen( tPed, true)
					timer = addEventHandler("onClientRender", root, updateRotation)
				end
				if isElement( tPed) then
					setElementInterior( tPed, 0)
					setElementDimension( tPed, 10)
					setPlayerClothesInCart()
				end
			end
        end
    end

local screenW, screenH = guiGetScreenSize()
clotheShopWindow = guiCreateWindow(screenW - 434 - 50, (screenH - 548) / 2, 434, 548, "GTI - Clothing Store", false)
guiWindowSetSizable(clotheShopWindow, false)
guiWindowSetMovable(clotheShopWindow, false)
guiSetVisible(clotheShopWindow, false)

typeGrid = guiCreateGridList(9, 22, 163, 141, false, clotheShopWindow)
guiGridListAddColumn(typeGrid, "Categories", 0.9)
clothingGrid = guiCreateGridList(182, 22, 242, 516, false, clotheShopWindow)
nameC = guiGridListAddColumn(clothingGrid, "Name", 0.6)
prC = guiGridListAddColumn(clothingGrid, "$", 0.5)
txdC = guiGridListAddColumn(clothingGrid, "", 0)
dffC = guiGridListAddColumn(clothingGrid, "", 0)
cartGrid = guiCreateGridList(9, 357, 163, 141, false, clotheShopWindow)
cartC = guiGridListAddColumn(cartGrid, "Cart", 0.6)
priceC = guiGridListAddColumn(cartGrid, "$", 0.5)
txdcC = guiGridListAddColumn(cartGrid, "", 0)
dffcC = guiGridListAddColumn(cartGrid, "", 0)
goCJButton = guiCreateButton(9, 166, 163, 30, "Buy CJ Skin", false, clotheShopWindow)
resetPed = guiCreateButton(9, 206, 163, 30, "Reset Mannequin", false, clotheShopWindow)
cancelButton = guiCreateButton(9, 246, 163, 30, "Cancel", false, clotheShopWindow)
confirmBuyButton = guiCreateButton(9, 508, 163, 30, "Purchase", false, clotheShopWindow)
function closeShopGUI()
	guiSetVisible( clotheShopWindow, false)
	showCursor( false)
	triggerServerEvent( "resetTheCam", localPlayer)
	local int = getElementData( localPlayer, "int")
	destroyElement( tPed)
	guiGridListClear( cartGrid)
end
addEventHandler( "onClientGUIClick", cancelButton, closeShopGUI, false)

function resetDefaultSkin()
	if getElementModel( localPlayer) ~= 0 then
		triggerServerEvent( "setPlayerModel", root, localPlayer)
		setPlayerClothesInCart()
	else
		outputChatBox( "You already have the CJ Skin", localPlayer, 255, 0, 0)
	end
end
addEventHandler( "onClientGUIClick", goCJButton, resetDefaultSkin, false)

function resetThePed()
	setPlayerClothesInCart()
end
addEventHandler( "onClientGUIClick", resetPed, resetThePed, false)

addEventHandler( "onClientGUIClick", root,
	function()
		if source == confirmBuyButton then
			for row=0, guiGridListGetRowCount( cartGrid) do
				local idSC = tonumber(guiGridListGetItemData(cartGrid, row, 1))
				local txdSC = guiGridListGetItemData(cartGrid, row, 3)
				local dffSC = guiGridListGetItemData(cartGrid, row, 4)
				local mSC = tostring(guiGridListGetItemText(clothingGrid, row, 2))
				if idSC then
					if mSC then
						setTimer( triggerServerEvent, 50, row, "purchaseClothes", root, localPlayer, txdSC, dffSC, idSC, mSC)
					else
						setTimer( triggerServerEvent, 50, row, "purchaseClothes", root, localPlayer, txdSC, dffSC, idSC, 1)
					end
					triggerServerEvent( "purchaseMSG", root, localPlayer, mSC)
					--guiGridListClear( cartGrid)
					--outputChatBox( "( "..txdSC..", "..dffSC..", "..idSC..")")
				end
			end
			triggerServerEvent( "resetTheCam", localPlayer)
			guiSetVisible( clotheShopWindow, false)
			showCursor( false)

		end
	end
)

addEventHandler( "onClientGUIClick", root,
	function()
		if source == clothingGrid then
			local row, col = guiGridListGetSelectedItem(clothingGrid)
			if row then
				local id = tonumber(guiGridListGetItemData(clothingGrid, row, 1))
				local txd = tostring(guiGridListGetItemData(clothingGrid, row, 3))
				local dff = tostring(guiGridListGetItemData(clothingGrid, row, 4))
				if id then
					addPedClothes( tPed, txd, dff, id)
				end
			end
		--[[
		elseif source == cartGrid then
			rowh1 = guiGridListAddRow( cartGrid)
			if rowh1 then
				local id1 = tonumber(guiGridListGetItemData(cartGrid, rowh1, 1))
				local txd1 = tostring(guiGridListGetItemText(cartGrid, rowh1, 3))
				local dff1 = tostring(guiGridListGetItemData(cartGrid, rowh1, 4))
				local price = tostring(guiGridListGetItemData(clothingGrid, rowh1, 2))
				if id1 then
					addPedClothes( tPed, txd1, dff1, id1)
				end
			end
		--]]
		end
	end
)

addEventHandler( "onClientGUIDoubleClick", root,
	function()
		local row, col = guiGridListGetSelectedItem(clothingGrid)
		local rowCart, colCart = guiGridListGetSelectedItem(cartGrid)
		if source == clothingGrid then
			if row then
				local name = tostring(guiGridListGetItemText(clothingGrid, row, 1))
				local price = tostring(guiGridListGetItemText(clothingGrid, row, 2))
				local id = tonumber(guiGridListGetItemData(clothingGrid, row, 1))
				local txd = tostring(guiGridListGetItemData(clothingGrid, row, 3))
				local dff = tostring(guiGridListGetItemData(clothingGrid, row, 4))
				local path = tostring(guiGridListGetItemText(clothingGrid, row, 3))
				if id then
					txd1 = string.gsub( txd, "Custom", "")
					if txd ~= txd1 then
						outputChatBox( "Custom Clothing Detected - ( "..txd1..", "..dff..", "..id..")")
						local dTexture = dxCreateTexture ( path)
						dxSetShaderValue( dShader, "Tex0", dTexture)
						--Hat:16, Shirts:0, Pants:2, Shoes: 3, Hair:1, Extras:17, Glasses:15, Watches:14, Necklaces13
						if id == 2 then
							textureType = "cj_ped_legs"
							engineRemoveShaderFromWorldTexture( dShader, "cj_ped_legs")
							engineApplyShaderToWorldTexture( dShader, "cj_ped_legs", tPed)
						elseif id == 3 then
							textureType = "cj_ped_feet"
							engineRemoveShaderFromWorldTexture( dShader, "cj_ped_feet")
							engineApplyShaderToWorldTexture( dShader, "cj_ped_feet", tPed)
						elseif id == 15 or id == 16 or id == 1 then
							textureType = "cj_ped_head"
							engineRemoveShaderFromWorldTexture( dShader, "cj_ped_head")
							engineApplyShaderToWorldTexture( dShader, "cj_ped_head", tPed)
						elseif id == 0 or id == 14 or id == 13 then
							engineRemoveShaderFromWorldTexture( dShader, "cj_ped_torso")
							engineApplyShaderToWorldTexture( dShader, "cj_ped_torso", tPed)
						end
						addPedClothes( tPed, txd1, dff, id)
						addPedClothes( tPed, dTec, dff, id)
					else
						local cartRow = guiGridListAddRow(cartGrid)
						if cartRow then
							for ctRW=0, guiGridListGetRowCount(cartGrid) do
								for pt=0, 17, 1 do
									local ttxd, tdff = getPedClothes( localPlayer, pt)
									if txd ~= ttxd then
										if dff ~= tdff then
											guiGridListSetItemText(cartGrid, cartRow, 1, name, false, false)
											guiGridListSetItemText(cartGrid, cartRow, 2, price, false, false)
											guiGridListSetItemText(cartGrid, cartRow, 3, txd, false, false)
											guiGridListSetItemText(cartGrid, cartRow, 4, dff, false, false)
											guiGridListSetItemData(cartGrid, cartRow, 4, dff)
											guiGridListSetItemData(cartGrid, cartRow, 3, txd)
											guiGridListSetItemData(cartGrid, cartRow, 1, id)
											addPedClothes( tPed, txd, dff, id)
										end
									end
								end
							end
						else
							return
						end
					end
				else
					return
				end
			end
		elseif source == cartGrid then
			if rowCart then
				local rID = tonumber(guiGridListGetItemData(cartGrid, rowCart, 1))
				local rTXD = tostring(guiGridListGetItemData(cartGrid, rowCart, 3))
				local rDFF = tostring(guiGridListGetItemData(cartGrid, rowCart, 4))
				for i=0, 17, 1 do
					local txd, dff = getPedClothes( tPed, i)
					if txd == rTXD then
						if dff == rDFF then
							if i == rID then
								removePedClothes( tPed, rID, rTXD, rDFF)
								triggerServerEvent( "removeClothing", root, localPlayer, rTXD, rDFF, rID)
								guiGridListRemoveRow( cartGrid, rowCart)
							end
						end
					end
				end
			end
		end
	end
)

