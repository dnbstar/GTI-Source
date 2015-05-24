local blacklisted_clothes = {
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
}

function getCurrentPlayerClothes( theElement)
	guiGridListClear( GTIccl.gridlist[3])
	for i = 0, 17 do
		if not blacklisted_clothes[i] then
			local txd, dff = getPedClothes( theElement, i)
			if type(txd) ~= "boolean" and type(dff) ~= "boolean" then
				for k, item in ipairs (clothes) do
					if string.match( item.texture, txd) and string.match(item.model, dff) then
						local apparelRow = guiGridListAddRow( GTIccl.gridlist[3])
						guiGridListSetItemText( GTIccl.gridlist[3], apparelRow, 1, "$"..exports.GTIutil:tocomma(item.price).." | "..item.name, false, false)
					end
				end
			end
		end
	end
end

-- Check Clothing Index

function findClothing( ctype, idex)
	if ctype == 0 then
		index = 67
	elseif ctype == 1 then
		index = 32
	elseif ctype == 2 then
		index = 44
	elseif ctype == 3 then
		index = 37
	end

	local theRValue

	if not idex then
		local ctable = {}
		for k = 0, index do
			local ctex, cmod = getClothesByTypeIndex( ctype, k)
			if ctex and cmod then
				outputDebugString( "Texture: "..ctex.." | Model: "..cmod)
				table.insert( ctable, { name = ctex, texture = ctex, model = cmod, id = ctype, price = 150, custom = false})
			end
		end
		outputChatBox( "Returning Table")
		return ctable
	else
		local texture, model = getClothesByTypeIndex( ctype, idex)
		outputChatBox( "Returning Strings")
		return texture, model
	end
end

function getClothesFromID( theID)
	guiGridListClear( GTIccl.gridlist[2])
	if type( theID) == "number" then
		local ctable = findClothing( theID)
		for i, item in ipairs ( ctable) do
			if item.id ~= nil then
				local itemRow = guiGridListAddRow( GTIccl.gridlist[2])
				guiGridListSetItemText( GTIccl.gridlist[2], itemRow, 1, "$"..exports.GTIutil:tocomma( item.price).." - "..item.name, false, false)
				guiGridListSetItemData( GTIccl.gridlist[2], itemRow, 1, item.texture..";"..item.model..";"..item.id..";0")
			end
		end
		--[[
		for i, item in ipairs (clothes) do
			if item.id ~= nil then
				if theID == item.id then
					local itemRow = guiGridListAddRow( GTIccl.gridlist[2])
					guiGridListSetItemText( GTIccl.gridlist[2], itemRow, 1, "$"..exports.GTIutil:tocomma( item.price).." - "..item.name, false, false)
					guiGridListSetItemData( GTIccl.gridlist[2], itemRow, 1, item.texture..";"..item.model..";"..item.id..";0")
				end
			end
		end
		--]]
	else
		for name, category in pairs (custom) do
			local catRow = guiGridListAddRow( GTIccl.gridlist[2])
			guiGridListSetItemText( GTIccl.gridlist[2], catRow, 1, name, true, false)
			for i, item in pairs (category) do
				local itemRow = guiGridListAddRow( GTIccl.gridlist[2])
				guiGridListSetItemText( GTIccl.gridlist[2], itemRow, 1, "$"..exports.GTIutil:tocomma( item.price).." - "..item.name, false, false)
				guiGridListSetItemData( GTIccl.gridlist[2], itemRow, 1, item.texture..";"..item.model..";"..item.id..";1;"..item.custom)
			end
		end
	end
end

function previewClothingItem( txd, dff, id)
	if txd and dff and id then
		local ctxd, cdff = getPedClothes( theClothingPed, id)
		if ctxd and cdff then
			if string.match( ctxd, txd) and string.match( cdff, dff) then
				getCurrentPlayerClothes( theClothingPed, txd, dff)
			else
				if isElement(theClothingPed) then
					addPedClothes( theClothingPed, txd, dff, id)
					getCurrentPlayerClothes( theClothingPed, txd, dff)
				end
			end
		else
			if isElement(theClothingPed) then
				addPedClothes( theClothingPed, txd, dff, id)
				getCurrentPlayerClothes( theClothingPed, txd, dff)
			end
		end
	end
end

-- Custom Clothing Check
local directory = "@/clothes/"

function doesCustomClothingFileExist( directory)
	if fileExists( directory) then
		return true
	else
		return false
	end
end

function getIDShader( id)
	local id = tostring(id)
	if cu_ids[id] then
		return cu_ids[id]
	else
		return false
	end
end

function serverShow( plr, data)
	local data = split(data, ";")

	local id = data[1]
	local txd = data[2]
	local sid = data[3]

	if txd == "false" then
		txd = false
	end

	if txd then
		applyCustomTexture( plr, directory..txd, sid)
	else
		removeCustomTexture( plr, sid)
	end
end
addEvent( "applyCustomItem", true)
addEventHandler( "applyCustomItem", root, serverShow)

function applyClothing( player, txd, mdl, id, sid, custom, path)
	if getElementType(player) == "ped" then
		previewClothingItem( txd, mdl, id)
	else
		addPedClothes( player, txd, mdl, id)
	end
	if custom then
		applyCustomTexture( player, path, sid)
	else
		removeCustomTexture( player, sid)
	end
end

function writeSkinFile( theFile, theData, shaderID)
	if fileExists( theFile) then
		local file = fileOpen( theFile)
		fileWrite( file, theData)
		fileClose( file)
	else
		local file = fileCreate( theFile)
		if file then
			fileWrite( file, theData)
			fileClose( file)
		end
	end
	applyCustomTexture( theClothingPed, theFile, shaderID)
end
addEvent( "addCustomSkin", true)
addEventHandler( "addCustomSkin", root, writeSkinFile)

-- Buttons

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIccl.label[3] then
			if guiGetVisible( GTIccl.staticimage[1]) then
				displayStore( false, "", localPlayer)
				triggerServerEvent( "loadClothingItems", localPlayer, localPlayer, false)
			end
		elseif source == GTIccl.label[1] then
			local itemRow, itemCol = guiGridListGetSelectedItem( GTIccl.gridlist[2])
			local theClothingData = guiGridListGetItemData( GTIccl.gridlist[2], itemRow, itemCol)

			if theClothingData then
				local theClothingData = split( theClothingData, ";")

				local txd, dff, id = theClothingData[1], theClothingData[2], theClothingData[3]
				local shaderID = getIDShader( id)
				local isCustom = tonumber( theClothingData[4])

				if isCustom == 0 then
					triggerServerEvent( "buyClothingItem", localPlayer, txd..";"..dff..";"..id..";"..shaderID)
					displayStore( false, "", localPlayer)
				elseif isCustom == 1 then
					local path = theClothingData[5]
					triggerServerEvent( "buyClothingItem", localPlayer, txd..";"..dff..";"..id..";"..shaderID, path)
					displayStore( false, "", localPlayer)
				end
			end
		elseif source == GTIccl.gridlist[1] then
			local categoryRow, categoryCol = guiGridListGetSelectedItem( GTIccl.gridlist[1])
			local theClothingID = guiGridListGetItemData( GTIccl.gridlist[1], categoryRow, categoryCol)
			getClothesFromID( theClothingID)
		elseif source == GTIccl.gridlist[2] then
			local itemRow, itemCol = guiGridListGetSelectedItem( GTIccl.gridlist[2])
			local theClothingData = guiGridListGetItemData( GTIccl.gridlist[2], itemRow, itemCol)

			--[[
			local theClothingData = split( theClothingData, ";")
			local txd, dff, id = theClothingData[1], theClothingData[2], theClothingData[3]
			local shaderID = getIDShader( id)

			previewClothingItem( txd, dff, id)
			--]]
			if theClothingData then
				local theClothingData = split( theClothingData, ";")
				local txd, dff, id = theClothingData[1], theClothingData[2], theClothingData[3]

				local shaderID = getIDShader( id)

				local isCustom = tonumber( theClothingData[4])
				if isCustom == 0 then
					applyClothing( theClothingPed, txd, dff, id, shaderID, false)
				elseif isCustom == 1 then
					local path = theClothingData[5]
					local path = directory..path

					if doesCustomClothingFileExist( path) then
						applyClothing( theClothingPed, txd, dff, id, shaderID, true, path)
					else
						triggerServerEvent( "downloadSkin", root, localPlayer, path, shaderID)
					end
				end
			end--]]
		end
	end
)

function checkAllFiles()
	for name, category in pairs (custom) do
		for i, item in pairs (category) do
			local loc = item.custom
			local loc = directory..path

			if doesCustomClothingFileExist( path) then
				triggerServerEvent( "addClothesOnLogin", localPlayer)
			else
				triggerServerEvent( "downloadSkin", root, localPlayer, path, shaderID)
			end
		end
	end
end
