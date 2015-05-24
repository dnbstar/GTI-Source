local screenW, screenH = guiGetScreenSize()
local upgrades = {
	--{ name, cost, accel, decel, maxvel, driveType, traction, mass} - NOTE: Each value is not the value, it is an added value to the handling
	{ "Default Package", 500, "default", "default", "default", "default", "default", "default"},
	{ "Drift Package", 5000, 15, 15, 20, "rwd", 1.400, "default"},
	{ "Speed Package", 15000, 25, 65, 60, "awd", 0.200, 2850},
	{ "Offroad Package", 7500, "default", "default", "default", "awd", 7.500, 5225},
}

local showHandling = {
	{ "Acceleration", "engineAcceleration"},
	{ "Deceleration", "brakeDeceleration"},
	{ "Total Speed", "maxVelocity"},
	{ "Drive Type", "driveType"},
	{ "Traction", "tractionLoss"},
	{ "Mass", "mass"},
}

local nameNumbers = {
	[3] = "Acceleration",
	[4] = "Deceleration",
	[5] = "Total Speed",
	[6] = "Drive Type",
	[7] = "Traction",
	[8] = "Mass",
}

GTImodshop = {
    gridlist = {},
    window = {},
    button = {},
    label = {},
	change = {},
	scrollpane = {},
}

local textOffSet = 15

GTImodshop.window[1] = guiCreateWindow((screenW - 507) / 2, (screenH - 204) / 2, 507, 204, "GTi - Performance Modder", false)
guiWindowSetSizable(GTImodshop.window[1], false)
--guiSetVisible( GTImodshop.window[1], false)

GTImodshop.gridlist[1] = guiCreateGridList(10, 25, 191, 165, false, GTImodshop.window[1])
guiGridListAddColumn(GTImodshop.gridlist[1], "Performance Mod", 0.9)
GTImodshop.label[1] = guiCreateLabel(296, 138, 182, 15, "Cost: $", false, GTImodshop.window[1])
GTImodshop.button[1] = guiCreateButton(374, 163, 123, 31, "Add Upgrade to Cart", false, GTImodshop.window[1])
guiSetProperty(GTImodshop.button[1], "NormalTextColour", "FFAAAAAA")
GTImodshop.button[2] = guiCreateButton(296, 163, 68, 31, "Close", false, GTImodshop.window[1])
guiSetProperty(GTImodshop.button[2], "NormalTextColour", "FFAAAAAA")
--GTImodshop.gridlist[2] = guiCreateGridList(211, 25, 286, 113, false, GTImodshop.window[1])
--GTImodshop.gridlist[2] = guiCreateGridList(211, 25, 199, 113, false, GTImodshop.window[1])
--guiGridListAddColumn(GTImodshop.gridlist[2], "Handling Setting", 0.3)
--guiGridListAddColumn(GTImodshop.gridlist[2], "Old", 0.3)
--guiGridListAddColumn(GTImodshop.gridlist[2], "New", 0.3)

--GTImodshop.scrollpane[1] = guiCreateScrollPane(410, 45, 68, 113, false, GTImodshop.window[1])
GTImodshop.scrollpane[1] = guiCreateScrollPane(211, 25, 267, 113, false, GTImodshop.window[1])

theChange = {
	{ "=", 60},
	{ "+", 50},
	{ "-", 40},
	{ "=", 30},
	{ "+", 20},
	{ "-", 10},
}

local ccolors = {
	["+"] = "133,255,133",
	["-"] = "255,133,133",
	["="] = "255,255,133",
}

customListItems = {
	slot1 = {},
	slot2 = {},
	elements = {},
}
lastID = 0

for i, changing in ipairs (theChange) do
	local theType = changing[1]
	local theAmount = changing[2]
	local theData = split( ccolors[theType], ",")
	local r, g, b = theData[1], theData[2], theData[3]

	customListItems.slot1[tostring(i)] = guiCreateLabel(4, 3+(i*textOffSet), 198, 15, "Text "..i, false, GTImodshop.scrollpane[1])
	customListItems.slot2[tostring(i)] = guiCreateLabel(205, 3+(i*textOffSet), 58, 15, tostring("  "..theType.." "..theAmount), false, GTImodshop.scrollpane[1])
	guiLabelSetColor(customListItems.slot2[tostring(i)], r, g, b)
	table.insert(customListItems.elements, {customListItems.slot1[tostring(i)], customListItems.slot2[tostring(i)], i})
	lastID = lastID+1
end

function addItem( theIdentifier, text1, text2, color)
	if not theIdentifier and text1 and text2 then return false end
	if color then
		color = split( color, ",")
		r, g, b = color[1], color[2], color[3]
	end
end

function removeItem( theID)
	local theID = tostring(theID)
	if isElement(customListItems.slot1[theID]) then
		--destroyElement(customListItems.slot1[theID])
		--destroyElement(customListItems.slot2[theID])
		guiSetVisible(customListItems.slot1[theID], false)
		guiSetVisible(customListItems.slot2[theID], false)
		for i, slotData in ipairs ( customListItems.elements) do
			local slot1 = slotData[1]
			local slot2 = slotData[2]
			local slotID = slotData[3]
			local x1, y1 = guiGetPosition( slot1, false)
			local x2, y2 = guiGetPosition( slot2, false)

			for k=0, i do
				guiSetPosition( slot1, x1, y1+15, false)
				guiSetPosition( slot2, x2, y2+15, false)
			end
		end
	else
		return false
	end
end

local dValues = {}

function addPerformanceUpgrades()
	guiGridListClear( GTImodshop.gridlist[1])
	for i, setting in ipairs (upgrades) do
		local name = setting[1]
		local cost = setting[2]
		local row = guiGridListAddRow( GTImodshop.gridlist[1])
		guiGridListSetItemText( GTImodshop.gridlist[1], row, 1, name, false, false)
	end
end

--[[
function updateHandlingGrid()
	guiGridListClear( GTImodshop.gridlist[2])
	local vehicle = getPedOccupiedVehicle( localPlayer)
	for i, handler in ipairs (showHandling) do
		local name = handler[1]
		local handleName = handler[2]
		local handleValue = getVehicleHandling( vehicle)[handleName]
		if type(handleValue) == "number" then
			handleValue = string.format( "%.2f", handleValue)
		end
		table.insert( dValues, handleName..";"..handleValue)
		local row = guiGridListAddRow( GTImodshop.gridlist[2])
		guiGridListSetItemText( GTImodshop.gridlist[2], row, 1, name, false, false)
		guiGridListSetItemData( GTImodshop.gridlist[2], row, 1, row)
		guiGridListSetItemText( GTImodshop.gridlist[2], row, 2, handleValue, false, false)
		guiGridListSetItemText( GTImodshop.gridlist[2], row, 3, handleValue, false, false)
	end
end
--]]

function previewPackageSettings( thePackage)
	guiGridListClear( GTImodshop.gridlist[2])
	local vehicle = getPedOccupiedVehicle( localPlayer)
	for i, setting in ipairs (upgrades) do
		local name = setting[1]
		if name == thePackage then
			for s, handler in ipairs (showHandling) do
				local row = guiGridListAddRow( GTImodshop.gridlist[2])
				--
				local handleName = handler[2]
				local handleValue = getVehicleHandling( vehicle)[handleName]
				if type(handleValue) == "number" then
					defaultValue = string.format( "%.2f", handleValue)
				end
				if s > 2 then
					guiGridListSetItemText( GTImodshop.gridlist[2], row, 1, nameNumbers[s], false, false)
					guiGridListSetItemText( GTImodshop.gridlist[2], row, 2, defaultValue, false, false)
					if type(setting[s]) == "number" then
						guiGridListSetItemText( GTImodshop.gridlist[2], row, 3, defaultValue+setting[s], false, false)
					else
						guiGridListSetItemText( GTImodshop.gridlist[2], row, 3, setting[s], false, false)
					end
				end
			end
		end
	end
end

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTImodshop.gridlist[1] then
			if guiGridListGetSelectedItem( GTImodshop.gridlist[1]) then
				local row, col = guiGridListGetSelectedItem( GTImodshop.gridlist[1])
				if row and col then
					local name = guiGridListGetItemText( GTImodshop.gridlist[1], row, col)
					if name ~= "" then
						previewPackageSettings( name)
					end
				end
			end
		end
	end
)

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		addPerformanceUpgrades()
		if isPedInVehicle( localPlayer) then
			--updateHandlingGrid()
			removeItem( "2")
		else
			guiSetVisible( GTImodshop.window[1], false)
		end
	end
)
