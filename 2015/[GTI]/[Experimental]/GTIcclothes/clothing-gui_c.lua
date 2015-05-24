local sW, sH = guiGetScreenSize()
local rotating = false

shops = {
	stype = {},
}

GTIccl = {
    gridlist = {},
    staticimage = {},
    label = {}
}


GTIccl.staticimage[1] = guiCreateStaticImage( 10, (sH - 540) / 2, 715, 540, "images/panel.png", false)
guiSetVisible( GTIccl.staticimage[1], false)

GTIccl.gridlist[1] = guiCreateGridList(18, 143, 169, 171, false, GTIccl.staticimage[1])
guiGridListAddColumn(GTIccl.gridlist[1], "Categories", 0.9)

GTIccl.gridlist[2] = guiCreateGridList(191, 143, 496, 335, false, GTIccl.staticimage[1])
guiGridListAddColumn(GTIccl.gridlist[2], "Clothing Apparel", 0.9)

--[
GTIccl.gridlist[3] = guiCreateGridList(18, 317, 169, 161, false, GTIccl.staticimage[1])
guiGridListAddColumn(GTIccl.gridlist[3], "Apparel Cart", 0.9)
--]]

GTIccl.staticimage[2] = guiCreateStaticImage(577, 488, 110, 35, "images/button.png", false, GTIccl.staticimage[1])

local font_0 = guiCreateFont("font.ttf")

GTIccl.label[1] = guiCreateLabel(6, 5, 98, 24, "Buy Item", false, GTIccl.staticimage[2])
guiSetFont(GTIccl.label[1], font_0)
guiLabelSetColor(GTIccl.label[1], 50, 50, 50)
guiLabelSetHorizontalAlign(GTIccl.label[1], "center", false)
guiLabelSetVerticalAlign(GTIccl.label[1], "center")

GTIccl.staticimage[3] = guiCreateStaticImage(457, 488, 110, 35, "images/button.png", false, GTIccl.staticimage[1])
GTIccl.label[2] = guiCreateLabel(6, 5, 98, 29, "Buy CJ Skin", false, GTIccl.staticimage[3])
guiSetFont(GTIccl.label[2], font_0)
guiLabelSetColor(GTIccl.label[2], 50, 50, 50)
guiLabelSetHorizontalAlign(GTIccl.label[2], "center", false)
guiLabelSetVerticalAlign(GTIccl.label[2], "center")

GTIccl.staticimage[4] = guiCreateStaticImage(337, 488, 110, 35, "images/button.png", false, GTIccl.staticimage[1])
GTIccl.label[3] = guiCreateLabel(6, 5, 98, 29, "Close", false, GTIccl.staticimage[4])
guiSetFont(GTIccl.label[3], font_0)
guiLabelSetColor(GTIccl.label[3], 50, 50, 50)
guiLabelSetHorizontalAlign(GTIccl.label[3], "center", false)
guiLabelSetVerticalAlign(GTIccl.label[3], "center")

GTIccl.staticimage[5] = guiCreateStaticImage(8, 28, 715, 140, "images/logo.png", false, GTIccl.staticimage[1])

function checkCJSkin( theElement)
	if isElement( theElement) then
		if getElementModel( theElement) == 0 then
			if guiGetVisible( GTIccl.staticimage[3]) then
				guiSetVisible( GTIccl.staticimage[3], false)
			end
			guiSetPosition( GTIccl.staticimage[4], 457, 488, false)
		else
			if not guiGetVisible( GTIccl.staticimage[3]) then
				guiSetVisible( GTIccl.staticimage[3], true)
			end
			guiSetPosition( GTIccl.staticimage[4], 337, 488, false)
		end
	else
		return false
	end
end

function hex2rgb(hex)
  hex = hex:gsub("#","")
  return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

function getStoreName( theColShape)
	if isElement( theColShape) then
		if shops.stype[theColShape] then
			return shops.stype[theColShape]
		else
			return false
		end
	end
end

function cachePlayerWorldDetails( theElement)
	local interior = getElementInterior( theElement)
	local dimension = getElementDimension( theElement)
	setElementData( theElement, "GTIccl.plrEntryData", interior..";"..dimension)
end

function getPlayerWorldCache( theElement)
	local worldCache = getElementData( theElement, "GTIccl.plrEntryData")
	if worldCache then
		local data = split(worldCache, ";")
		return data[1], data[2]
	else
		return false
	end
end

function storeFade()
	fadeCamera(false)
	setTimer( fadeCamera, 1200, 1, true)
end

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		-- Load All Stores
		for i, storedata in ipairs (clothing_locations) do
			local x, y, z = storedata.pos[1], storedata.pos[2], storedata.pos[3]
			local interior, dimension = storedata.world[1], storedata.world[2]
			local name = storedata.store
			local r, g, b = hex2rgb( shop_colors[name])

			local showMarker = createMarker( x, y, z, "cylinder", 3, r, g, b, 200)
			local colMarker = createColTube( x, y, z, 2, 2)
			shops.stype[colMarker] = name

			addEventHandler( "onClientColShapeHit", colMarker, enterClothingStore, false)
		end
	end
)

function setupPedFor( state, theElement)
	if state then
		if isElement( theElement) then
			if not isElement( theClothingPed) then
				theClothingPed = createPed( 0, pedX, pedY, pedZ+1)
				setElementDimension( theClothingPed, viewingDim)
			end
			cachePlayerWorldDetails( theElement)
			setElementFrozen( theElement, true)
			setElementDimension( theElement, viewingDim)
			setElementInterior( theElement, 0)
			setCameraMatrix( mX, mY, mZ, mLX, mLY, mLZ)
			if not rotating then
				rotating = true
				addEventHandler("onClientRender", root, updateRotation)
			end
		end
	else
		if isElement( theClothingPed) then
			destroyElement( theClothingPed)
			if rotating then
				rotating = false
				removeEventHandler("onClientRender", root, updateRotation)
			end
		end
		if isElement( theElement) then
			if getPlayerWorldCache( theElement) then
				local int, dim = getPlayerWorldCache( theElement)
				local int, dim = tonumber( int), tonumber( dim)
				setElementInterior( theElement, int)
				setElementDimension( theElement, dim)
				setElementFrozen( theElement, false)
				setCameraTarget( localPlayer)
			end
		end
	end
end

function updateRotation()
	if (not isElement(theClothingPed)) then
		removeEventHandler("onClientRender", root, updateRotation)
		rotating = false
		return
	end
	local _, _, crot = getElementRotation(theClothingPed)
	setElementRotation(theClothingPed, 0, 0, crot + 0.75)
end

function displayStore( state, store, theElement)
	guiGridListClear( GTIccl.gridlist[1])
	guiGridListClear( GTIccl.gridlist[2])
	if state then
		if not store then return false end
		if not guiGetVisible( GTIccl.staticimage[1]) then
			guiSetVisible( GTIccl.staticimage[1], true)
			showCursor( true)
		end

		local hexColor = shop_colors[store]
		local r, g, b = hex2rgb( hexColor)

		-- Load All Categories
		for i, category in ipairs (types) do
			if category.id ~= nil then
				local typeRow = guiGridListAddRow( GTIccl.gridlist[1])
				guiGridListSetItemText( GTIccl.gridlist[1], typeRow, 1, category.name, false, false)
				guiGridListSetItemData( GTIccl.gridlist[1], typeRow, 1, category.id)
				guiGridListSetItemColor( GTIccl.gridlist[1], typeRow, 1, r, g, b)
			end
		end

		guiSetProperty(GTIccl.staticimage[1], "ImageColours", "tl:FF"..hexColor.." tr:FF"..hexColor.." bl:FF"..hexColor.." br:FF"..hexColor)
		guiStaticImageLoadImage( GTIccl.staticimage[5], "images/logo_"..store..".png")
		setupPedFor( true, theElement)
		--getCurrentPlayerClothes( theClothingPed)
	else
		storeFade()
		--setupPedFor( false, theElement)
		setTimer( setupPedFor, 1200, 1, false, theElement)
		if guiGetVisible( GTIccl.staticimage[1]) then
			guiSetVisible( GTIccl.staticimage[1], false)
			showCursor( false)
		end
	end
end

function enterClothingStore( hitElement, matchingDimension)
	if getElementType(hitElement) == "player" then
		if hitElement == localPlayer then
			if not matchingDimension then return false end
			if not isPedInVehicle( hitElement) then
				local storeName = getStoreName( source)
				storeFade()
				setTimer( displayStore, 1200, 1, true, storeName, hitElement)
				--displayStore( true, storeName, hitElement)
				checkCJSkin( hitElement)
				setElementData( localPlayer, "GTIccl.theCurrentStore", storeName)
			end
		end
	end
end
