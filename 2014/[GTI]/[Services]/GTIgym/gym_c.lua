local screenW, screenH = guiGetScreenSize()
styles = {
	['Walking Styles'] = {
		--{ "Walk Style", Style Cost, ID, type}
		{ "Default Style", 500, 0, "walk"},
		{ "Sneek Style", 500, 69, "walk"},
		{ "Old Man Style", 500, 120, "walk"},
		{ "Gangster Style 1", 500, 121, "walk"},
		{ "Gangster Style 2", 500, 122, "walk"},
		{ "Old Fat Man Style", 500, 123, "walk"},
		{ "Fat Man Style", 500, 124, "walk"},
		{ "Jogger Style", 500, 125, "walk"},
		{ "Drunk Style", 500, 126, "walk"},
		{ "Blind Style", 500, 127, "walk"},
		{ "SWAT Style", 500, 128, "walk"},
		{ "Busy Woman Style", 500, 131, "walk"},
		{ "Sexy Woman Style", 500, 132, "walk"},
		{ "Hooker Style", 500, 133, "walk"},
		{ "Old Woman Style", 500, 134, "walk"},
		{ "Fat Woman Style", 500, 135, "walk"},
		{ "Jogger Woman Style", 500, 135, "walk"},
	},
	['Fighting Styles'] = {
		--{ "Fight Style", Style Cost, ID, type}
		{ "Default Style", 500, 4, "fight"},
		{ "Boxing Style", 500, 5, "fight"},
		{ "Kung Fu Style", 500, 6, "fight"},
		{ "Knee-Head Style", 500, 7, "fight"},
		{ "Grab-Kick Style", 500, 15, "fight"},
		{ "Elbow Style", 500, 16, "fight"},
	},
}

wStyleNames = {
	[0] = "Default",
	[69] = "Sneek",
	[120] = "Old Man",
	[121] = "Gangster 1",
	[122] = "Gangster 2",
	[123] = "Old Fat Man",
	[124] = "Fat Man",
	[125] = "Jogger",
	[126] = "Drunk",
	[127] = "Blind",
	[128] = "SWAT",
	[133] = "Hooker",
	[134] = "Old Woman",
	[135] = "Fat Woman",
	[136] = "Jogging Woman",
}

fStyleNames = {
	[4] = "Default",
	[5] = "Boxing",
	[6] = "Kung Fu",
	[7] = "Knee-Head",
	[15] = "Grab-Kick",
	[16] = "Elbow",
}

GTIgym = {
    gridlist = {},
    window = {},
    label = {}
}

GTIgym.window[1] = guiCreateWindow((screenW - 399) / 2, (screenH - 262) / 2, 399, 262, "GTI - Player Customization", false)
guiWindowSetSizable( GTIgym.window[1], false)
guiSetVisible( GTIgym.window[1], false)

GTIgym.gridlist[1] = guiCreateGridList(9, 22, 170, 230, false, GTIgym.window[1])
guiGridListAddColumn(GTIgym.gridlist[1], "Customization", 0.8)

GTIgym.label[1] = guiCreateLabel(364, 22, 25, 15, "close", false, GTIgym.window[1])
guiSetFont(GTIgym.label[1], "default-small")
guiLabelSetHorizontalAlign(GTIgym.label[1], "center", false)
guiLabelSetVerticalAlign(GTIgym.label[1], "center")

GTIgym.label[2] = guiCreateLabel(189, 37, 175, 15, "Customization Type: ", false, GTIgym.window[1])
guiSetFont(GTIgym.label[2], "default-small")
guiLabelSetVerticalAlign(GTIgym.label[2], "center")

GTIgym.label[3] = guiCreateLabel(189, 57, 175, 15, "Current Style: ", false, GTIgym.window[1])
guiSetFont(GTIgym.label[3], "default-small")
guiLabelSetVerticalAlign(GTIgym.label[3], "center")

GTIgym.label[4] = guiCreateLabel(189, 77, 175, 15, "Selected Style: ", false, GTIgym.window[1])
guiSetFont(GTIgym.label[4], "default-small")
guiLabelSetVerticalAlign(GTIgym.label[4], "center")

GTIgym.label[5] = guiCreateLabel(189, 97, 175, 15, "Style Cost: $", false, GTIgym.window[1])
guiSetFont(GTIgym.label[5], "default-small")
guiLabelSetVerticalAlign(GTIgym.label[5], "center")

GTIgym.label[6] = guiCreateLabel(364, 237, 25, 15, "buy", false, GTIgym.window[1])
guiSetFont(GTIgym.label[6], "default-small")
guiLabelSetHorizontalAlign(GTIgym.label[6], "center", false)
guiLabelSetVerticalAlign(GTIgym.label[6], "center")

local renames = {
	['walk'] = "Walking Style",
	['fight'] = "Fighting Style",
}

local guiConversion = {
	['currentStyle'] = GTIgym.label[3],
}

local nameConversion = {
	['walk'] = wStyleNames,
	['fight'] = fStyleNames,
}

function getStyleNameFromID( getType, theID)
	if getType == "walk" then
		tname = wStyleNames[theID]
	elseif getType == "fight" then
		tname = fStyleNames[theID]
	end
	return tname
end

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIgym.label[1] then
			local visibility = guiGetVisible( GTIgym.window[1])
			if visibility then
				guiSetVisible( GTIgym.window[1], false)
				showCursor( false)
			end
		elseif source == GTIgym.label[6] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem( GTIgym.gridlist[1])
			if selectedRow and selectedCol then
				local name = guiGridListGetItemText( GTIgym.gridlist[1], selectedRow, selectedCol)
				local data = guiGridListGetItemData( GTIgym.gridlist[1], selectedRow, selectedCol)
				if data ~= nil then
					local info = split(data, string.byte( ";"))
					local styleID, styleCost, styleType = info[1], info[2], info[3]
					local name = string.gsub( name, "Style ", "")
					local name = string.gsub( name, "Style", "")
					triggerServerEvent( "GTIgym.buyStyle", localPlayer, styleType, name, styleID, styleCost)
				end
			end
		--Gridlist Movement
		elseif source == GTIgym.gridlist[1] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem( GTIgym.gridlist[1])
			local name = guiGridListGetItemText( GTIgym.gridlist[1], selectedRow, selectedCol)
			local data = guiGridListGetItemData( GTIgym.gridlist[1], selectedRow, selectedCol)
			if data ~= nil then
				local info = split(data, string.byte( ";"))
				local styleID, styleCost, styleType = info[1], info[2], info[3]
				--outputChatBox( "Data: "..styleType)
				guiSetText( GTIgym.label[2], "Customization Type: "..renames[styleType])
				guiSetText( GTIgym.label[5], "Style Cost: $"..styleCost)
				triggerServerEvent( "GTIgym.queryStyle", localPlayer, styleType, 'currentStyle', name, styleID)
			end
		end
	end
)

addEventHandler( "onClientMouseEnter", root,
	function()
		if source == GTIgym.label[1] then
			guiLabelSetColor( source, 255, 51, 51)
		elseif source == GTIgym.label[6] then
			guiLabelSetColor( source, 51, 255, 51)
		end
	end
)

addEventHandler( "onClientMouseLeave", root,
	function()
		if source == GTIgym.label[1] then
			guiLabelSetColor( source, 255, 255, 255)
		elseif source == GTIgym.label[6] then
			guiLabelSetColor( source, 255, 255, 255)
		end
	end
)

addEvent( "GTIgym.returnQuery", true)
addEventHandler( "GTIgym.returnQuery", root,
	function( theQuery, theElement, theType, theName, theID)
		local guiElement = guiConversion[theElement]
		local visibility = guiGetVisible( guiElement)
		if theQuery ~= "disabled" then
			if theQuery ~= "buy" then
				local style = getStyleNameFromID( theType, theQuery)
				if style then
					guiSetText( guiElement, "Current Style: "..style)
				else
					guiSetText( guiElement, "Current Style: "..theQuery)
				end
				if not visibility then
					guiSetVisible( guiElement, true)
				end
			end
		else
			if visibility then
				guiSetVisible( guiElement, false)
			end
		end
		local sstyle = string.gsub( theName, "Style ", "")
		local sstyle = string.gsub( theName, "Style", "")
		guiSetText( GTIgym.label[4], "Selected Style: "..sstyle)
	end
)

dimCol = {}

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		for name, category in pairs (styles) do
			local row = guiGridListAddRow(GTIgym.gridlist[1])
			guiGridListSetItemText(GTIgym.gridlist[1], row, 1, name, true, false)
			for index, bookmark in pairs (category) do
				local srow = guiGridListAddRow(GTIgym.gridlist[1])
				--    tData = id;cost;styletype
				local tData = bookmark[3]..";"..bookmark[2]..";"..bookmark[4]
				--
				guiGridListSetItemText(GTIgym.gridlist[1], srow, 1, bookmark[1], false, false)
				guiGridListSetItemData(GTIgym.gridlist[1], srow, 1, tData)
				if bookmark[3] ~= "" then
					guiGridListSetItemText(GTIgym.gridlist[1], srow, 2, bookmark[3], false, false)
					guiGridListSetItemData(GTIgym.gridlist[1], srow, 2, tData)
				end
			end
		end
		--Marker Loading
		for index, loc in pairs (locations) do
			local x, y, z = loc.pos[1], loc.pos[2], loc.pos[3]
			local int, dim = loc.world[1], loc.world[2]
			--
			marker = createMarker( x, y, z, "cylinder", 2, 51, 255, 51)
			col = createColTube( x, y, z, 1, 2)
			--
			dimCol[col] = dim
			setElementInterior( marker, int)
			setElementDimension( marker, dim)
			addEventHandler( "onClientColShapeHit", col, colshapeEntry)
			addEventHandler( "onClientColShapeLeave", col, colshapeExit)
		end
		--Blip Loading
		for index, blip in pairs (blips) do
			local x, y, z = blip.pos[1], blip.pos[2], blip.pos[3]
			local icon = blip.icon
			--
			blip = createBlip( x, y, z, icon, 2, 255, 0, 0, 255, 0, 450)
		end
	end
)

function colshapeEntry( element, mDim)
	local dC = dimCol[source]
	local dim = getElementDimension( element)
	if element == localPlayer then
		if isPlayerInVehicle( element) then return end
		if dim == dC then
			local visibility = guiGetVisible( GTIgym.window[1])
			if visibility ~= true then
				guiSetVisible( GTIgym.window[1], true)
				showCursor( true)
			end
		end
	end
end

function colshapeExit( element, mDim)
	local dC = dimCol[source]
	local dim = getElementDimension( element)
	if element == localPlayer then
		if dim == dC then
			local visibility = guiGetVisible( GTIgym.window[1])
			if visibility == true then
				guiSetVisible( GTIgym.window[1], false)
				showCursor( false)
			end
		end
	end
end
