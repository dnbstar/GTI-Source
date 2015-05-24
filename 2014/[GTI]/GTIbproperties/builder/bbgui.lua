GTIbbc = {
	button = {},
}

GTIbb = {
    window = {},
    scrollpane = {},
    gridlist = {},
    label = {},
}

local screenW, screenH = guiGetScreenSize()
GTIbb.window[1] = guiCreateWindow(10, (screenH - 529) / 1.025, 287, 529, "GTI - Business Builder", false)
guiWindowSetMovable(GTIbb.window[1], false)
guiWindowSetSizable(GTIbb.window[1], false)
guiSetVisible( GTIbb.window[1], false)

GTIbb.scrollpane[1] = guiCreateScrollPane(10, 256, 267, 168, false, GTIbb.window[1])

GTIbb.label[1] = guiCreateLabel(10, 10, 247, 350, "~ Using the Business Builder ~\\nnWhen in the builder, once you select an object( if your business property is a buildable property), as soon as you've selected the object, it will be spawned on the position of your business (This will only happen if it's your first time selecting a building.)\n\n~ Keybinds ~\n\nUp - Move the object vertically up (y-axis)\nLeft - Move the object horizontally left (x-axis)\nDown - Move the object vertically down (y-axis)\nRight - Move the object horizontally right (x-axis)\n, - Rotate the object left\n. - Rotate the object right\ni - Move the object vertically up (z-axis)\nk - Move the object vertically down(z-axis)", false, GTIbb.scrollpane[1])
guiLabelSetHorizontalAlign(GTIbb.label[1], "center", true)

GTIbb.gridlist[1] = guiCreateGridList(10, 38, 267, 177, false, GTIbb.window[1])
nameColumn = guiGridListAddColumn(GTIbb.gridlist[1], "Object Name", 0.7)
idColumn = guiGridListAddColumn(GTIbb.gridlist[1], "ID", 0.15)

GTIbb.label[2] = guiCreateLabel(253, 22, 24, 12, "close", false, GTIbb.window[1])
guiSetFont(GTIbb.label[2], "default-small")
guiLabelSetHorizontalAlign(GTIbb.label[2], "center", false)
guiLabelSetVerticalAlign(GTIbb.label[2], "center")
GTIbbc.button[1] = guiCreateButton(169, 218, 108, 28, "Confirm Placement", false, GTIbb.window[1])
guiSetProperty(GTIbbc.button[1], "NormalTextColour", "FFAAAAAA")
GTIbb.label[3] = guiCreateLabel(10, 434, 267, 16, "Property Information", false, GTIbb.window[1])
guiLabelSetHorizontalAlign(GTIbb.label[3], "center", false)
GTIbb.label[4] = guiCreateLabel(71, 458, 206, 15, "XXX Name", false, GTIbb.window[1])
GTIbb.label[5] = guiCreateLabel(10, 458, 56, 15, "Name:", false, GTIbb.window[1])
guiSetFont(GTIbb.label[5], "default-bold-small")
guiLabelSetColor(GTIbb.label[5], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbb.label[5], "center", false)
GTIbb.label[6] = guiCreateLabel(15, 488, 56, 15, "Location:", false, GTIbb.window[1])
guiSetFont(GTIbb.label[6], "default-bold-small")
guiLabelSetColor(GTIbb.label[6], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbb.label[6], "right", false)
GTIbb.label[7] = guiCreateLabel(76, 488, 201, 15, "XXX Location", false, GTIbb.window[1])
GTIbb.label[8] = guiCreateLabel(10, 473, 27, 15, "ID:", false, GTIbb.window[1])
guiSetFont(GTIbb.label[8], "default-bold-small")
guiLabelSetColor(GTIbb.label[8], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbb.label[8], "right", false)
GTIbb.label[9] = guiCreateLabel(42, 473, 24, 15, "XXX", false, GTIbb.window[1])
GTIbb.label[10] = guiCreateLabel(71, 473, 32, 15, "Price:", false, GTIbb.window[1])
guiSetFont(GTIbb.label[10], "default-bold-small")
guiLabelSetColor(GTIbb.label[10], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbb.label[10], "right", false)
GTIbb.label[11] = guiCreateLabel(108, 473, 169, 15, "$XXX", false, GTIbb.window[1])

function viewBuilderGUI( option)
	local visibility = guiGetVisible( GTIbb.window[1])
	if option == true then
		if visibility == false then
			guiSetVisible( GTIbb.window[1], true)
			showCursor( true)
		end
	elseif option == false then
		if visibility == true then
			guiSetVisible( GTIbb.window[1], false)
			showCursor( false)
		end
	end
end

function loadBuilderDefaults()
	guiGridListClear(GTIbb.gridlist[1])
	for i, building in pairs (buildings) do
		local row = guiGridListAddRow(GTIbb.gridlist[1])
		--
		guiGridListSetItemText(GTIbb.gridlist[1], row, 1, building.name, false, false)
		guiGridListSetItemData(GTIbb.gridlist[1], row, 1, building.id)
		guiGridListSetItemText(GTIbb.gridlist[1], row, 2, building.id, false, false)
		guiGridListSetItemData(GTIbb.gridlist[1], row, 2, building.id)
	end
end

--[[
function loadBuilderDefaults()
	for name, category in pairs (buildings) do
		local row = guiGridListAddRow(GTIbb.gridlist[1])
		guiGridListSetItemText(GTIbb.gridlist[1], row, 1, name, true, false)
		for index, bookmark in pairs (category) do
			local srow = guiGridListAddRow(GTIbb.gridlist[1])
			--
			guiGridListSetItemText(GTIbb.gridlist[1], srow, 1, bookmark.name, false, false)
			guiGridListSetItemData(GTIbb.gridlist[1], srow, 1, bookmark.id)
			guiGridListSetItemText(GTIbb.gridlist[1], srow, 2, bookmark.id, false, false)
			guiGridListSetItemData(GTIbb.gridlist[1], srow, 2, bookmark.id)
		end
	end
end
--]]

addEventHandler( "onClientMouseEnter", resourceRoot,
	function()
		if source == GTIbb.label[2] then
			guiLabelSetColor( source, 97, 255, 92)
		end
	end
)

addEventHandler( "onClientMouseLeave", resourceRoot,
	function()
		if source == GTIbb.label[2] then
			guiLabelSetColor( source, 255, 255, 255)
		end
	end
)

selectedZone = 0
maxDown = 0
tempObj = {}

function moveObject( key, state)
	if not isElement( tempObj[tonumber(selectedZone)]) then return end
	local x, y, z = getElementPosition( tempObj[tonumber(selectedZone)])
	local rotX,rotY,rotZ = getElementRotation( tempObj[tonumber(selectedZone)])
	if state ~= "down" then return end
	if key == "arrow_u" then
		if getKeyState( "lshift") then
			setElementPosition( tempObj[tonumber(selectedZone)], x+0.75, y, z)
		elseif getKeyState( "lctrl") then
			setElementPosition( tempObj[tonumber(selectedZone)], x+.05, y, z)
		else
			setElementPosition( tempObj[tonumber(selectedZone)], x+.25, y, z)
		end
	elseif key == "arrow_d" then
		if getKeyState( "lshift") then
			setElementPosition( tempObj[tonumber(selectedZone)], x-0.75, y, z)
		elseif getKeyState( "lctrl") then
			setElementPosition( tempObj[tonumber(selectedZone)], x-.05, y, z)
		else
			setElementPosition( tempObj[tonumber(selectedZone)], x-.25, y, z)
		end
	elseif key == "arrow_l" then
		if getKeyState( "lshift") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y+0.75, z)
		elseif getKeyState( "lctrl") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y+0.05, z)
		else
			setElementPosition( tempObj[tonumber(selectedZone)], x, y+0.25, z)
		end
	elseif key == "arrow_r" then
		if getKeyState( "lshift") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y-0.75, z)
		elseif getKeyState( "lctrl") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y-0.05, z)
		else
			setElementPosition( tempObj[tonumber(selectedZone)], x, y-0.25, z)
		end
	elseif key == "mouse_wheel_up" then
		if getKeyState( "lshift") then
			setElementRotation( tempObj[tonumber(selectedZone)], rotX, rotY, rotZ+3)
		elseif getKeyState( "lctrl") then
			setElementRotation( tempObj[tonumber(selectedZone)], rotX, rotY, rotZ+0.25)
		else
			setElementRotation( tempObj[tonumber(selectedZone)], rotX, rotY, rotZ+1.25)
		end
	elseif key == "mouse_wheel_down" then
		if getKeyState( "lshift") then
			setElementRotation( tempObj[tonumber(selectedZone)], rotX, rotY, rotZ-3)
		elseif getKeyState( "lctrl") then
			setElementRotation( tempObj[tonumber(selectedZone)], rotX, rotY, rotZ-0.25)
		else
			setElementRotation( tempObj[tonumber(selectedZone)], rotX, rotY, rotZ-1.25)
		end
	elseif key == "i" then
		if getKeyState( "lshift") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y, z+0.75)
		elseif getKeyState( "lctrl") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y, z+0.05)
		else
			setElementPosition( tempObj[tonumber(selectedZone)], x, y, z+0.25)
		end
	elseif key == "k" then
		if getKeyState( "lshift") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y, z-0.75)
		elseif getKeyState( "lctrl") then
			setElementPosition( tempObj[tonumber(selectedZone)], x, y, z-0.05)
		else
			setElementPosition( tempObj[tonumber(selectedZone)], x, y, z-0.25)
		end
	end
end

function toggleObjectMovement( toggle)
	if toggle == true then
		bindKey( "arrow_u", "down", moveObject)
		bindKey( "arrow_d", "down", moveObject)
		bindKey( "arrow_l", "down", moveObject)
		bindKey( "arrow_r", "down", moveObject)
		bindKey( "mouse_wheel_up", "down", moveObject)
		bindKey( "mouse_wheel_down", "down", moveObject)
		bindKey( "i", "down", moveObject)
		bindKey( "k", "down", moveObject)
	elseif toggle == false then
		unbindKey( "arrow_u", "down", moveObject)
		unbindKey( "arrow_d", "down", moveObject)
		unbindKey( "arrow_l", "down", moveObject)
		unbindKey( "arrow_r", "down", moveObject)
		unbindKey( "mouse_wheel_up", "down", moveObject)
		unbindKey( "mouse_wheel_down", "down", moveObject)
		unbindKey( "i", "down", moveObject)
		unbindKey( "k", "down", moveObject)
	end
end

addEventHandler( "onClientGUIClick", resourceRoot,
	function()
		if source == GTIbb.label[2] then
			viewBuilderGUI( false)
			setCameraTarget( localPlayer)
			setElementFrozen( localPlayer, false)
			toggleObjectMovement( false)
			if isElement( tempObj[tonumber(selectedZone)]) then
				destroyElement( tempObj[tonumber(selectedZone)])
			end
		elseif source == GTIbbc.button[1] then
			if isElement( tempObj[tonumber(selectedZone)]) then
				local model = getElementModel( tempObj[tonumber(selectedZone)])
				local x, y, z = getElementPosition( tempObj[tonumber(selectedZone)])
				local rX, rY, rZ = getElementRotation( tempObj[tonumber(selectedZone)])
				triggerServerEvent( "GTIbusiness.createBuilding", localPlayer, tonumber(selectedZone), model, x, y, z, rZ)
				destroyElement( tempObj[tonumber(selectedZone)])
				--
				viewBuilderGUI( false)
				setCameraTarget( localPlayer)
				setElementFrozen( localPlayer, false)
				toggleObjectMovement( false)
			end
		elseif source == GTIbb.gridlist[1] then
			local selectedRow, selectedColumn = guiGridListGetSelectedItem( source)
			if selectedRow and selectedColumn then
				local id = guiGridListGetItemData( source, selectedRow, selectedColumn)
				if not isElement( tempObj[tonumber(selectedZone)]) then
					--
					local post = objectPoss[tonumber(selectedZone)]
					local data = split( post, ";")
					local x, y, z, rotZ = data[1], data[2], data[3], data[4]
					--
					tempObj[tonumber(selectedZone)] = createObject( id, x, y, z, 0, 0, rotZ)
				else
					setElementModel( tempObj[tonumber(selectedZone)], id)
				end
			end
		end
	end
)

--[[
addCommandHandler( "bus-pos",
	function( command, id)
		triggerServerEvent( "GTIbusiness.verifyBusinessOwnership", localPlayer, id, "getObject")
	end
)
--]]

--[[
addCommandHandler( "build-bus",
	function( command, id)
		triggerServerEvent( "GTIbusiness.verifyBusinessOwnership", localPlayer, id, true)
	end
)

addEvent( "GTIbb.viewBuilder", true)
addEventHandler( "GTIbb.viewBuilder", root,
	function( id)
		triggerServerEvent( "GTIbusiness.verifyBusinessOwnership", localPlayer, id, true)
	end
)
--]]

--function getBusinessObject( id, x, y, z)
function getBusinessObject( id)
	if isElement( tempObj[tonumber(id)]) then
		local x, y, z = getElementPosition( tempObj[tonumber(id)])
		local rX, rY, rZ = getElementRotation( tempObj[tonumber(id)])
		outputChatBox( x..", "..y..", "..z.." "..rZ)
	end
end
addEvent( "GTIbb.pushData", true)
addEventHandler( "GTIbb.pushData", root, getBusinessObject)

function viewBusinessEditor( name, loc, id, cost)
	viewBuilderGUI( true)
	loadBuilderDefaults()
	toggleObjectMovement( true)
	--
	selectedZone = id
	--
	guiSetText( GTIbb.label[4], name)
	guiSetText( GTIbb.label[7], loc)
	guiSetText( GTIbb.label[9], id)
	guiSetText( GTIbb.label[11], formatNumber( cost))
	--
	local matrix = matrixes[tonumber(id)]
	local data = split( matrix, ";")
	local x, y, z, lx, ly, lz = data[1], data[2], data[3], data[4], data[5], data[6]
	setElementFrozen( localPlayer, true)
	setCameraMatrix( x, y, z, lx, ly, lz)
	local maxDown = z
end
addEvent( "GTIbb.viewEditor", true)
addEventHandler( "GTIbb.viewEditor", root, viewBusinessEditor)
