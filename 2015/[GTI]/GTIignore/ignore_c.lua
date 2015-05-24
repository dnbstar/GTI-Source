local screenW, screenH = guiGetScreenSize()

ignore_table = {}

GTIignore = {
    edit = {},
    button = {},
    window = {},
    label = {},
    gridlist = {}
}

GTIignore.window[1] = guiCreateWindow((screenW - 287) / 2, (screenH - 262) / 2, 287, 262, "GTi - Ignore Management", false)
guiWindowSetSizable(GTIignore.window[1], false)
guiSetVisible( GTIignore.window[1], false)

GTIignore.gridlist[1] = guiCreateGridList(18, 48, 249, 124, false, GTIignore.window[1])
nameColumn = guiGridListAddColumn(GTIignore.gridlist[1], "Name", 0.9)
--guiGridListAutoSizeColumn( GTIignore.gridlist[1], nameColumn)
guiGridListSetSortingEnabled( GTIignore.gridlist[1], false)

GTIignore.button[1] = guiCreateButton(150, 182, 117, 25, "Remove Selected", false, GTIignore.window[1])
GTIignore.button[2] = guiCreateButton(18, 182, 117, 25, "Remove All Ignores", false, GTIignore.window[1])
GTIignore.button[3] = guiCreateButton(200, 227, 67, 26, "Ignore", false, GTIignore.window[1])

GTIignore.label[1] = guiCreateLabel(8, 23, 269, 15, "Ignore List", false, GTIignore.window[1])
GTIignore.label[2] = guiCreateLabel(8, 207, 269, 15, "________________________________________", false, GTIignore.window[1])
GTIignore.label[3] = guiCreateLabel(242, 23, 35, 15, "Close", false, GTIignore.window[1])

GTIignore.edit[1] = guiCreateEdit(18, 227, 172, 26, "", false, GTIignore.window[1])

--->> Label Settings

guiLabelSetHorizontalAlign(GTIignore.label[1], "center", false) -- Label 1

guiLabelSetHorizontalAlign(GTIignore.label[2], "center", false) -- Label 2

guiSetFont(GTIignore.label[3], "default-small")  -- Label 3
guiLabelSetHorizontalAlign(GTIignore.label[3], "center", false)
guiLabelSetVerticalAlign(GTIignore.label[3], "center")

function getIgnoreList()
	return ignore_table
end

function refreshIgnoreList()
	guiGridListClear( GTIignore.gridlist[1])
	--
	for i, data in pairs (ignore_table) do
		local name = data[1]
		local accountName = data[2]

		local row = guiGridListAddRow( GTIignore.gridlist[1])
		guiGridListSetItemText( GTIignore.gridlist[1], row, nameColumn, name, false, false)
		guiGridListSetItemData( GTIignore.gridlist[1], row, nameColumn, accountName..";"..i)
	end
end

function table.empty( a )
    if type( a ) ~= "table" then
        return false
    end

    return not next( a )
end

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		refreshIgnoreList()
	end
)

--->> Abilities
function isPlayerOnIgnoreList( name)
	if table.empty( ignore_table) then return false end
	for i, data in pairs (ignore_table) do
		local loggedname = data[1]
		if string.find( loggedname, name) then
			return true
		else
			return false
		end
	end
end

function clearIgnoreList()
	local list = getIgnoreList()
	for i, data in pairs (ignore_table) do
		setTimer( removeIgnore, 100, #list, i)
	end
end

function saveIgnoreList()
	local ignoreTable = {}
	for i,ignore in pairs(ignore_table) do
		ignoreTable[i] = table.concat(ignore, ",")
	end
	local ignoreString = table.concat(ignoreTable, ";")
	if (ignoreString == "") then ignoreString = nil end
	--
	triggerServerEvent( "GTIignore.sendTableOnline", localPlayer, ignoreString)
end

function removeIgnore( id)
	local id = tonumber( id)
	for i, data in pairs (ignore_table) do
		local loggedname = data[1]
		--if string.find( loggedname, name) then
		if id == i then
			table.remove( ignore_table, i)
		end
		refreshIgnoreList()
		saveIgnoreList()
	end
end

function addIgnore( name, accountName)
	if table.empty( ignore_table) then
		table.insert( ignore_table, { name, accountName})
		refreshIgnoreList()
		exports.GTIhud:dm( "You have added '"..name.."' to your ignore list.", 225, 255, 25)
	elseif not table.empty( ignore_table) then
		if not isPlayerOnIgnoreList( name) then
			table.insert( ignore_table, { name, accountName})
			refreshIgnoreList()
			exports.GTIhud:dm( "You have added '"..name.."' to your ignore list.", 225, 255, 25)
			guiSetText( GTIignore.edit[1], "")
		else
			exports.GTIhud:dm( "'"..name.."' is already on your ignore list.", 225, 25, 25)
			guiSetText( GTIignore.edit[1], "")
		end
	end
	saveIgnoreList()
end
addEvent( "GTIignore.finalizeIgnore", true)
addEventHandler( "GTIignore.finalizeIgnore", root, addIgnore)

function viewIgnoreWindow()
	local visible = guiGetVisible( GTIignore.window[1])
	if not visible then
		guiSetVisible( GTIignore.window[1], true)
		showCursor( true)
		refreshIgnoreList()
	elseif visible then
		guiSetVisible( GTIignore.window[1], false)
		showCursor( false)
	end
end
addCommandHandler( "ignore", viewIgnoreWindow)

--->> Events

addEventHandler( "onClientMouseEnter", root,
	function()
		if source == GTIignore.label[3] then
			guiLabelSetColor( source, 225, 255, 25)
		end
	end
)

addEventHandler( "onClientMouseLeave", root,
	function()
		if source == GTIignore.label[3] then
			guiLabelSetColor( source, 255, 255, 255)
		end
	end
)

addEventHandler( "onClientGUIClick", root,
	function( button, state)
		if source == GTIignore.label[3] then
			if guiGetVisible( GTIignore.window[1]) then
				guiSetVisible( GTIignore.window[1], false)
				showCursor( false)
			end
		elseif source == GTIignore.button[1] then
			if guiGridListGetSelectedItem( GTIignore.gridlist[1]) then
				local row, col = guiGridListGetSelectedItem( GTIignore.gridlist[1])
				if row and col then
					local name = guiGridListGetItemText( GTIignore.gridlist[1], row, col)
					if name ~= "" then
						local data = split( guiGridListGetItemData( GTIignore.gridlist[1], row, col), ";")
						local accountName = data[1]
						local ignoreID = data[2]

						--removeIgnore( name)
						removeIgnore( ignoreID)
						exports.GTIhud:dm( "You removed '"..name.."' from your ignore list.", 25, 255, 25)
					end
				end
				end
		elseif source == GTIignore.button[2] then
			clearIgnoreList()
		elseif source == GTIignore.button[3] then
			if button == "left" then
				local text = guiGetText( GTIignore.edit[1])
				if text ~= "" then
					--addIgnore( text)
					triggerServerEvent( "GTIignore.addIgnore", localPlayer, text)
				else
					exports.GTIhud:dm( "You must enter the name of the person you wish to ignore.", 255, 25, 25)
				end
			end
		end
	end
)

-- Load Ignore Table on Login
addEvent( "getTable", true)
addEventHandler( "getTable", root,
	function( theTable)
		ignore_table = {}
        local ignoreTable = {}
        ignoreTable = split(theTable, ";")
        for i,ignore in pairs(ignoreTable) do
			ignore = split(ignore, ",")
			table.insert( ignore_table, { ignore[1], ignore[2]})
        end
		--ignore_table = ignoreTable
	end
)
