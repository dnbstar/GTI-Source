local screenW, screenH = guiGetScreenSize()

GTIevents = {
    tab = {},
    edit = {},
    window = {},
    label = {},
    tabpanel = {},
    radiobutton = {},
    gridlist = {},
    checkbox = {},
    button = {},
    combobox = {},
	image = {}
}

GTIevents.window[1] = guiCreateWindow((screenW - 562) / 2, (screenH - 385) / 2, 562, 385, "GTI - Event System", false)
guiWindowSetSizable(GTIevents.window[1], false)
guiSetVisible( GTIevents.window[1], false)

GTIevents.tabpanel[1] = guiCreateTabPanel(10, 23, 542, 352, false, GTIevents.window[1])

GTIeventedit = {
    button = {},
    window = {},
    edit = {},
    label = {}
}

GTIeventedit.window[1] = guiCreateWindow((screenW - 314) / 2, (screenH - 123) / 2, 314, 123, "Execute Event Action", false)
guiWindowSetSizable(GTIeventedit.window[1], false)
guiSetVisible( GTIeventedit.window[1], false)
guiSetAlpha(GTIeventedit.window[1], 0.95)
GTIeventedit.label[1] = guiCreateLabel(10, 31, 294, 15, "", false, GTIeventedit.window[1])
guiSetFont(GTIeventedit.label[1], "clear-normal")
guiLabelSetHorizontalAlign(GTIeventedit.label[1], "center", false)
guiLabelSetVerticalAlign(GTIeventedit.label[1], "center")
GTIeventedit.edit[1] = guiCreateEdit(20, 51, 274, 23, "", false, GTIeventedit.window[1])
GTIeventedit.button[1] = guiCreateButton(67, 84, 78, 26, "Execute", false, GTIeventedit.window[1])
GTIeventedit.button[2] = guiCreateButton(155, 84, 78, 26, "Cancel", false, GTIeventedit.window[1])

local entityChecks = {
	{ "Spawner", "v_spawner"},
	{ "Blip", "e_blip"},
	{ "Pickup", "pickup"},
	{ "Object", "object"},
}

function updateElementList()
	if GTIevents.gridlist[1] then
		guiGridListClear( GTIevents.gridlist[1])
		for i, edata in ipairs ( entityChecks) do
			local name = edata[1]
			local echeck = edata[2]
			local entities = getElementsByType( echeck, resourceRoot)
			local row = guiGridListAddRow( GTIevents.gridlist[1])
			local count = #entities
			if echeck == "e_blip" then
				if isElement( sEntBlip) then
					count = count - 1
				end
			end
			guiGridListSetItemText( GTIevents.gridlist[1], row, 1, (count).." "..name.."s", true, false)
			for k, entity in pairs ( entities) do
				if isElement( entity) then
					local row = guiGridListAddRow( GTIevents.gridlist[1])
					if getElementData( entity, "elem_obj") then
						local car = getElementData( entity, "elem_spa")
						guiGridListSetItemText( GTIevents.gridlist[1], row, 1, "["..(getElementData( entity, "creator") or "N/A").."] "..car.." Spawner", false, false)
					--if getElementType( entity) == "vehicle" and getVehicleName( entity) then
						--guiGridListSetItemText( GTIevents.gridlist[1], row, 1, getVehicleName( entity), false, false)
					else
						--if getElementType( entity) == "blip" then
							--if entity ~= sEntBlip then
								--guiGridListSetItemText( GTIevents.gridlist[1], row, 1, name.." "..k, false, false)
							--end
						--else
							if entity ~= sEntBlip then
								if getElementType( entity) == "e_blip" then
									if tonumber( getElementData( entity, "model")) < 10 then
										guiGridListSetItemText( GTIevents.gridlist[1], row, 1, "["..(getElementData( entity, "creator") or "N/A").."] "..bl_def["0"..tonumber( getElementData( entity, "model"))], false, false)
									else
										guiGridListSetItemText( GTIevents.gridlist[1], row, 1, bl_def[getElementModel( entity)], false, false)
									end
								else
									if ob_definitions[getElementModel( entity)] then
										guiGridListSetItemText( GTIevents.gridlist[1], row, 1, "["..(getElementData( entity, "creator") or "N/A").."] "..ob_definitions[getElementModel( entity)], false, false)
									else
										guiGridListSetItemText( GTIevents.gridlist[1], row, 1, "["..(getElementData( entity, "creator") or "N/A").."] "..getElementModel( entity), false, false)
									end
								end
							end
						--end
					end
					guiGridListSetItemData( GTIevents.gridlist[1], row, 1, entity)
				end
			end
		end
	end
end
setTimer( updateElementList, 1000, 0)

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		for i, gtab in ipairs ( gui_tabs) do
			local tabname = gtab[1]

			GTIevents.tab[i] = guiCreateTab( tabname, GTIevents.tabpanel[1])
		end

		for i, ggrid in ipairs ( gui_gridlists) do
			local gridtab = ggrid[1]
			local gridname = ggrid[2]
			local lX, lY = ggrid[3], ggrid[4]
			local sX, sY = ggrid[5], ggrid[6]

			GTIevents.gridlist[i] = guiCreateGridList( lX, lY, sX, sY, false, GTIevents.tab[gridtab])
			guiGridListAddColumn(GTIevents.gridlist[i], gridname, 0.9)
			guiGridListSetSortingEnabled ( GTIevents.gridlist[i], false)
		end

		-- Place all options
		for i, eaction in ipairs ( entity_actions) do
			local aname = eaction[1]
			local adata = eaction[2]

			local row = guiGridListAddRow( GTIevents.gridlist[2])
			guiGridListSetItemText( GTIevents.gridlist[2], row, 1, aname, false, false)
			guiGridListSetItemData( GTIevents.gridlist[2], row, 1, adata)
		end

		for i, paction in ipairs ( participant_actions) do
			local aname = paction[1]
			local adata = paction[2]

			local row = guiGridListAddRow( GTIevents.gridlist[5])
			guiGridListSetItemText( GTIevents.gridlist[5], row, 1, aname, false, false)
			guiGridListSetItemData( GTIevents.gridlist[5], row, 1, adata)
		end

		for name, category in pairs ( objects) do
			local row = guiGridListAddRow( GTIevents.gridlist[6])
			if #objects[name] > 1 then
				guiGridListSetItemText( GTIevents.gridlist[6], row, 1, name.."["..(#objects[name]).." Objects]", false, false)
				guiGridListSetItemData( GTIevents.gridlist[6], row, 1, name)
			else
				guiGridListSetItemText( GTIevents.gridlist[6], row, 1, name.."["..(#objects[name]).." Object]", false, false)
				guiGridListSetItemData( GTIevents.gridlist[6], row, 1, name)
			end
			--guiGridListSetItemData( GTIevents.gridlist[6], row, 1, objects[name])
		end
		--[[
		for i, o in ipairs ( objects) do
			local id = o[1]
			local oname = o[2]
			local orot = o[3]

			local row = guiGridListAddRow( GTIevents.gridlist[6])
			guiGridListSetItemText( GTIevents.gridlist[6], row, 1, "["..id.."] "..oname, false, false)
			guiGridListSetItemData( GTIevents.gridlist[6], row, 1, id)
		end
		--]]

		-- Place All GUI Elements
		GTIevents.label[1] = guiCreateLabel(10, 10, 156, 15, "Event Creation:", false, GTIevents.tab[1])
		guiSetFont(GTIevents.label[1], "default-bold-small")

		GTIevents.label[2] = guiCreateLabel(20, 30, 29, 15, "Title:", false, GTIevents.tab[1])
		guiSetFont(GTIevents.label[2], "default-small")
		guiLabelSetVerticalAlign(GTIevents.label[2], "center")

		GTIevents.label[3] = guiCreateLabel(20, 60, 29, 15, "Slots:", false, GTIevents.tab[1])
		guiSetFont(GTIevents.label[3], "default-small")
		guiLabelSetVerticalAlign(GTIevents.label[3], "center")

		GTIevents.edit[1] = guiCreateEdit(59, 26, 176, 24, "", false, GTIevents.tab[1])
		GTIevents.edit[2] = guiCreateEdit(59, 55, 91, 24, "10", false, GTIevents.tab[1])
		guiEditSetMaxLength(GTIevents.edit[2], 3)

		GTIevents.label[4] = guiCreateLabel(10, 192, 156, 15, "Event Communication:", false, GTIevents.tab[1])
		guiSetFont(GTIevents.label[4], "default-bold-small")

		GTIevents.label[5] = guiCreateLabel(20, 217, 39, 15, "Message:", false, GTIevents.tab[1])
		guiSetFont(GTIevents.label[5], "default-small")
		guiLabelSetVerticalAlign(GTIevents.label[5], "center")

		GTIevents.edit[3] = guiCreateEdit(65, 212, 239, 25, "", false, GTIevents.tab[1])

		GTIevents.radiobutton[1] = guiCreateRadioButton(65, 247, 66, 15, "Participants", false, GTIevents.tab[1])
		guiSetFont(GTIevents.radiobutton[1], "default-small")

		GTIevents.radiobutton[2] = guiCreateRadioButton(141, 247, 66, 15, "Everyone", false, GTIevents.tab[1])
		guiSetFont(GTIevents.radiobutton[2], "default-small")
		guiRadioButtonSetSelected(GTIevents.radiobutton[1], true)

		GTIevents.button[1] = guiCreateButton(309, 212, 105, 25, "Submit Message", false, GTIevents.tab[1])

		GTIevents.checkbox[1] = guiCreateCheckBox(20, 114, 130, 15, "Freeze On Warp", false, false, GTIevents.tab[1])
		guiSetFont(GTIevents.checkbox[1], "default-small")

		GTIevents.checkbox[2] = guiCreateCheckBox(20, 89, 98, 15, "Team Locked", false, false, GTIevents.tab[1])
		guiSetFont(GTIevents.checkbox[2], "default-small")

		GTIevents.checkbox[3] = guiCreateCheckBox(245, 89, 108, 15, "Event Re-Entry", false, false, GTIevents.tab[1])
		guiSetFont(GTIevents.checkbox[3], "default-small")

		GTIevents.edit[4] = guiCreateEdit(128, 84, 91, 24, "", false, GTIevents.tab[1])
		guiEditSetReadOnly(GTIevents.edit[4], true)

		GTIevents.label[6] = guiCreateLabel(245, 30, 50, 15, "Interior:", false, GTIevents.tab[1])
		guiSetFont(GTIevents.label[6], "default-small")
		guiLabelSetVerticalAlign(GTIevents.label[6], "center")

		GTIevents.edit[5] = guiCreateEdit(281, 26, 56, 24, "0", false, GTIevents.tab[1])
		guiEditSetMaxLength(GTIevents.edit[5], 3)

		GTIevents.button[2] = guiCreateButton(20, 139, 93, 29, "Start Event", false, GTIevents.tab[1])

		GTIevents.button[3] = guiCreateButton(123, 139, 93, 29, "Stop Event", false, GTIevents.tab[1])

		GTIevents.label[7] = guiCreateLabel(347, 30, 50, 15, "Dimension:", false, GTIevents.tab[1])
		guiSetFont(GTIevents.label[7], "default-small")
		guiLabelSetVerticalAlign(GTIevents.label[7], "center")

		GTIevents.edit[6] = guiCreateEdit(404, 26, 56, 24, "0", false, GTIevents.tab[1])
		guiEditSetMaxLength(GTIevents.edit[6], 3)

		GTIevents.label[8] = guiCreateLabel(185, 10, 116, 15, "Vehicle Spawners", false, GTIevents.tab[2])
		guiSetFont(GTIevents.label[8], "default-bold-small")

		GTIevents.combobox[1] = guiCreateComboBox(185, 30, 153, 134, "", false, GTIevents.tab[2])

		GTIevents.button[4] = guiCreateButton(186, 59, 152, 26, "Create Spawner", false, GTIevents.tab[2])

		GTIevents.button[5] = guiCreateButton(10, 289, 165, 29, "No Entity Selected", false, GTIevents.tab[2])

		GTIevents.label[9] = guiCreateLabel(185, 95, 116, 15, "Blip Creation", false, GTIevents.tab[2])
		guiSetFont(GTIevents.label[9], "default-bold-small")

		--GTIevents.button[6] = guiCreateButton(185, 116, 101, 26, "Get Coordinates", false, GTIevents.tab[2])

		GTIevents.button[7] = guiCreateButton(185, 288, 164, 30, "Create Blip", false, GTIevents.tab[2])

		GTIevents.label[10] = guiCreateLabel(358, 10, 174, 15, "Entity Actions", false, GTIevents.tab[2])
		guiSetFont(GTIevents.label[10], "default-bold-small")

		GTIevents.button[8] = guiCreateButton(359, 292, 173, 26, "No Action Selected", false, GTIevents.tab[2])

		GTIevents.edit[7] = guiCreateEdit(370, 8, 162, 26, "", false, GTIevents.tab[3])

		GTIevents.button[9] = guiCreateButton(10, 290, 166, 28, "No Action Selected", false, GTIevents.tab[3])

		GTIevents.image[1] = guiCreateStaticImage( 311, 95, 16, 16, "images/blips/01.png", false, GTIevents.tab[2])

		GTIevents.button[10] = guiCreateButton(10, 289, 190, 29, "Place Object", false, GTIevents.tab[4])

		-- Place all Vehicles
        for i, vdata in ipairs( all_vehicles) do
            guiComboBoxAddItem( GTIevents.combobox[1], vdata.name)
        end

		-- Place all Blips
		for i, vdata in ipairs ( all_blips) do
			local row = guiGridListAddRow( GTIevents.gridlist[3])
			guiGridListSetItemText( GTIevents.gridlist[3], row, 1, vdata.model, false, false)
			guiGridListSetItemData( GTIevents.gridlist[3], row, 1, "images/blips/"..(vdata.model..".png"))
		end
	end
)

function showEventPanel( state, placement)
	if state then
		guiSetVisible( GTIevents.window[1], true)
		showCursor( true)
	else
		guiSetVisible( GTIevents.window[1], false)
		if not placement then
			showCursor( false)
		end
	end
end

function showEditFunction( state)
	if state then
		guiSetVisible( GTIevents.window[1], true)
		showCursor( true)
	else
		guiSetVisible( GTIevents.window[1], false)
		showCursor( false)
	end
end

function outputEM( message, etype)
	triggerServerEvent( "GTIevents.outputEM", localPlayer, message, etype)
end

addEvent( "GTIevents.openPanel", true)
addEventHandler( "GTIevents.openPanel", root,
	function()
		if not guiGetVisible( GTIevents.window[1]) then
			showEventPanel( true)
			outputEM( "Opening Event Panel.")
		else
			showEventPanel( false)
			outputEM( "Closing Event Panel.", true)
		end
	end
)

local event_func = nil
local is_number = nil

function nofnt()
end

function executeFunction(windowText, fuct, isnum)
	guiSetText(GTIeventedit.label[1], windowText)
	guiBringToFront(GTIeventedit.window[1])
	guiSetVisible(GTIeventedit.window[1], true)
	event_func = fuct
	is_number = isnum
	return true
end

function executeFunctionGUI(button, state)
	if (button ~= "left" or state ~= "up") then return end

	local value = guiGetText(GTIeventedit.edit[1])
	if (#value == 0) then
		outputEM( "Enter a value in the box provided.")
		return
	end

	--local player = getSelectedPlayer()
	local player = getSelectedParticipant()
	if (not isElement(player)) then
		outputEM( "No participant found.")
		return
	end

	if (is_number and not tonumber(value)) then
		exports.GTIhud:dm("You must enter a number value to execute this function", 255, 125, 0)
		outputEM( "You must enter a number value.")
		return
	end

	--triggerServerEvent("GTIgovtPanel.executeAdminFunction", resourceRoot, player, event_func, tonumber(value) or value)
	triggerServerEvent( "GTIevents.handleClientAction", localPlayer, event_func, player, tonumber(value) or value)
	guiSetText(GTIeventedit.edit[1], "")
	guiSetVisible(GTIeventedit.window[1], false)
	event_func = nil
	is_number = nil
end
addEventHandler("onClientGUIClick", GTIeventedit.button[1], executeFunctionGUI, false)

addEventHandler("onClientGUIAccepted", GTIeventedit.edit[1], function()
	executeFunctionGUI("left", "up")
end, false)

addEventHandler("onClientGUIClick", GTIeventedit.button[2], function(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetText(GTIeventedit.edit[1], "")
	guiSetVisible(GTIeventedit.window[1], false)
	event_func = nil
	is_number = nil
end, false)
