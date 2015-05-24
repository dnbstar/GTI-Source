local screenW, screenH = guiGetScreenSize()

GTIbcr = {
    label = {},
    window = {},
    combobox = {},
    edit = {},
	memo = {},
}

GTIbcr.window[1] = guiCreateWindow((screenW - 367) / 2, (screenH - 182) / 2, 367, 448, "GTI - Business Creation Interface", false)
guiWindowSetSizable(GTIbcr.window[1], false)
guiSetVisible( GTIbcr.window[1], false)

GTIbcr.label[1] = guiCreateLabel(10, 23, 37, 15, "ID: XXX", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[1], "default-small")

GTIbcr.label[2] = guiCreateLabel(320, 23, 37, 15, "close", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[2], "default-small")
guiLabelSetHorizontalAlign(GTIbcr.label[2], "center", false)
guiLabelSetVerticalAlign(GTIbcr.label[2], "center")

GTIbcr.label[3] = guiCreateLabel(10, 48, 38, 15, "Name: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[3], "default-bold-small")
guiLabelSetColor(GTIbcr.label[3], 97, 255, 92)

GTIbcr.edit[1] = guiCreateEdit(48, 45, 229, 21, "", false, GTIbcr.window[1])

GTIbcr.label[4] = guiCreateLabel(10, 79, 48, 15, "Position: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[4], "default-bold-small")
guiLabelSetColor(GTIbcr.label[4], 97, 255, 92)

GTIbcr.label[5] = guiCreateLabel(235, 79, 63, 15, "dump position", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[5], "default-small")
guiLabelSetHorizontalAlign(GTIbcr.label[5], "center", false)
guiLabelSetVerticalAlign(GTIbcr.label[5], "center")

GTIbcr.label[6] = guiCreateLabel(68, 79, 157, 15, "X: ", false, GTIbcr.window[1])

GTIbcr.label[7] = guiCreateLabel(68, 94, 157, 15, "Y: ", false, GTIbcr.window[1])

GTIbcr.label[8] = guiCreateLabel(68, 109, 157, 15, "Z:", false, GTIbcr.window[1])

GTIbcr.label[9] = guiCreateLabel(10, 158, 38, 15, "Type: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[9], "default-bold-small")
guiLabelSetColor(GTIbcr.label[9], 97, 255, 92)

GTIbcr.label[10] = guiCreateLabel(82, 183, 23, 15, "(0-5)", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[10], "default-small")
guiLabelSetHorizontalAlign(GTIbcr.label[10], "center", false)
guiLabelSetVerticalAlign(GTIbcr.label[10], "center")

GTIbcr.label[11] = guiCreateLabel(280, 425, 77, 15, "Create Business", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[11], "default-small")
guiLabelSetHorizontalAlign(GTIbcr.label[11], "center", false)
guiLabelSetVerticalAlign(GTIbcr.label[11], "center")

GTIbcr.label[12] = guiCreateLabel(10, 183, 38, 15, "Level: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[12], "default-bold-small")
guiLabelSetColor(GTIbcr.label[12], 97, 255, 92)

GTIbcr.label[13] = guiCreateLabel(10, 208, 38, 15, "Cost: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[13], "default-bold-small")
guiLabelSetColor(GTIbcr.label[13], 97, 255, 92)

GTIbcr.edit[2] = guiCreateEdit(48, 208, 138, 21, "", false, GTIbcr.window[1])

GTIbcr.label[14] = guiCreateLabel(10, 233, 38, 15, "Owner: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[14], "default-bold-small")
guiLabelSetColor(GTIbcr.label[14], 97, 255, 92)

GTIbcr.edit[3] = guiCreateEdit(48, 233, 138, 21, "", false, GTIbcr.window[1])

GTIbcr.label[15] = guiCreateLabel(186, 233, 112, 15, "Optional (Account Name)", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[15], "default-small")
guiLabelSetHorizontalAlign(GTIbcr.label[15], "center", false)
guiLabelSetVerticalAlign(GTIbcr.label[15], "center")

GTIbcr.combobox[1] = guiCreateComboBox(48, 155, 170, 126, "", false, GTIbcr.window[1])

GTIbcr.edit[4] = guiCreateEdit(48, 183, 34, 21, "", false, GTIbcr.window[1])
guiEditSetMaxLength(GTIbcr.edit[4], 1)

GTIbcr.label[16] = guiCreateLabel(10, 256, 43, 15, "Payout: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[16], "default-bold-small")
guiLabelSetColor(GTIbcr.label[16], 97, 255, 92)

GTIbcr.edit[5] = guiCreateEdit(53, 258, 138, 21, "", false, GTIbcr.window[1])
guiEditSetMaxLength(GTIbcr.edit[5], 4)

GTIbcr.label[17] = guiCreateLabel(196, 258, 63, 13, "Max 5k payout", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[17], "default-small")
guiLabelSetVerticalAlign(GTIbcr.label[17], "center")

GTIbcr.label[18] = guiCreateLabel(10, 291, 69, 15, "Description: ", false, GTIbcr.window[1])
guiSetFont(GTIbcr.label[18], "default-bold-small")
guiLabelSetColor(GTIbcr.label[18], 97, 255, 92)

--GTIbcr.memo[1] = guiCreateMemo(10, 306, 249, 132, "", false, GTIbcr.window[1])

function viewCreatorGUI( option)
	local visibility = guiGetVisible( GTIbcr.window[1])
	if option == true then
		if visibility == false then
			guiSetVisible( GTIbcr.window[1], true)
			showCursor( true)
		end
	elseif option == false then
		if visibility == true then
			guiSetVisible( GTIbcr.window[1], false)
			showCursor( false)
			clearGUI()
		end
	end
end

function clearGUI()
	guiSetText( GTIbcr.edit[1], "")
	guiSetText( GTIbcr.edit[2], "")
	guiSetText( GTIbcr.label[1], "ID: ")
	guiSetText( GTIbcr.label[6], "")
	guiSetText( GTIbcr.label[7], "")
	guiSetText( GTIbcr.label[8], "")
end

function loadCreationDefaults()
	guiComboBoxClear( GTIbcr.combobox[1])
	for i, v in ipairs (options) do
		local name, description = v[1], v[2]
		guiComboBoxAddItem( GTIbcr.combobox[1], name)
	end
end

addCommandHandler( "cbusiness",
	function()
		viewCreatorGUI( true)
		loadCreationDefaults()
		guiSetText( GTIbcr.label[1], "ID: "..hID)
	end
)

addEventHandler( "onClientMouseEnter", root,
	function()
		if source == GTIbcr.label[2] then
			guiLabelSetColor( source, 97, 255, 92)
		elseif source == GTIbcr.label[5] then
			guiLabelSetColor( source, 92, 179, 255)
		elseif source == GTIbcr.label[11] then
			guiLabelSetColor( source, 92, 179, 255)
		end
	end
)

addEventHandler( "onClientMouseLeave", root,
	function()
		if source == GTIbcr.label[2] then
			guiLabelSetColor( source, 255, 255, 255)
		elseif source == GTIbcr.label[5] then
			guiLabelSetColor( source, 255, 255, 255)
		elseif source == GTIbcr.label[11] then
			guiLabelSetColor( source, 255, 255, 255)
		end
	end
)

dbConvertion = {
	['Business'] = "franchise",
	['Buildable'] = "diy",
	['Property'] = "asset",
}


build = {
	['Business'] = "false",
	['Buildable'] = "true",
	['Property'] = "false",
}
--[[
build = {
	['franchise'] = "false",
	['diy'] = "true",
	['asset'] = "false",
}
--]]

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIbcr.label[2] then
			viewCreatorGUI( false)
		elseif source == GTIbcr.label[5] then
			local x, y, z = getElementPosition( localPlayer)
			guiSetText( GTIbcr.label[6], "X: "..x)
			guiSetText( GTIbcr.label[7], "Y: "..y)
			guiSetText( GTIbcr.label[8], "Z: "..z-1)
		elseif source == GTIbcr.label[11] then
			local name = guiGetText( GTIbcr.edit[1])
			if name ~= "" then
				local selection = guiComboBoxGetSelected( GTIbcr.combobox[1])
				local theType = guiComboBoxGetItemText( GTIbcr.combobox[1], selection)
				local x, y, z = getElementPosition( localPlayer)
				local level = tonumber(guiGetText( GTIbcr.edit[4])) or "0"
				local cost = tonumber(guiGetText( GTIbcr.edit[2])) or "0"
				local owner = tostring(guiGetText( GTIbcr.edit[3])) or ""
				local pay = tonumber(guiGetText( GTIbcr.edit[5])) or "0"
				local option = dbConvertion[theType]
				--[[
				local desc = guiGetText( GTIbcr.memo[1])
				if desc == "" or desc == " " then
					desc1 = "No Description"
				elseif desc ~= "" or desc ~= " " then
					desc1 = desc
				end
				--]]
				viewCreatorGUI( false)
				setElementPosition( localPlayer, x+1, y+1, z)
				if owner == "" then
					if theType and dbConvertion[theType] then
						triggerServerEvent( "GTIbusiness.createBusiness", root, true, hID+1, name, "false", "false", x, y, z-1, cost, option, level, build[theType], pay, "No Description")
					end
				else
					if theType and dbConvertion[theType] then
						triggerServerEvent( "GTIbusiness.createBusiness", root, true, hID+1, name, "true", owner, x, y, z-1, cost, option, level, build[option], pay, "No Description")
					end
				end
			end
		end
	end
)

addEventHandler("onClientGUIChanged", root,
	function()
		if source == GTIbcr.edit[4] then
			guiSetText( source, guiGetText(source):gsub("[^0-5]",""))
		elseif source == GTIbcr.edit[2] then
			guiSetText( source, guiGetText(source):gsub("[^0-9]",""))
		elseif source == GTIbcr.edit[5] then
			local numbers = tonumber(guiGetText( source))
			guiSetText( source, guiGetText(source):gsub("[^0-9]",""))
		end
	end
)
