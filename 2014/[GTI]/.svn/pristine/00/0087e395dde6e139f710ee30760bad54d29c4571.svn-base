local screenW, screenH = guiGetScreenSize()

GTIbe = {
    scrollpane = {},
    label = {},
    window = {},
    edit = {},
    memo = {}
}

GTIbe.window[1] = guiCreateWindow((screenW - 287) / 2, (screenH - 529) / 2, 287, 529, "GTI - Business Manager", false)
guiWindowSetMovable(GTIbe.window[1], false)
guiWindowSetSizable(GTIbe.window[1], false)
guiSetVisible(GTIbe.window[1], false)

GTIbe.scrollpane[1] = guiCreateScrollPane(10, 32, 267, 171, false, GTIbe.window[1])

GTIbe.label[1] = guiCreateLabel(10, 0, 247, 15, "Current Business Information", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[1], "default-bold-small")
guiLabelSetColor(GTIbe.label[1], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbe.label[1], "center", false)

GTIbe.label[2] = guiCreateLabel(10, 33, 38, 15, "Name: ", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[2], "default-bold-small")
guiLabelSetColor(GTIbe.label[2], 97, 255, 92)

GTIbe.label[3] = guiCreateLabel(51, 33, 206, 15, "XXX Name", false, GTIbe.scrollpane[1])

GTIbe.label[4] = guiCreateLabel(10, 15, 18, 15, "ID: ", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[4], "default-bold-small")
guiLabelSetColor(GTIbe.label[4], 97, 255, 92)

GTIbe.label[5] = guiCreateLabel(31, 15, 38, 15, "XXX ID", false, GTIbe.scrollpane[1])

GTIbe.label[6] = guiCreateLabel(10, 83, 38, 15, "Price: ", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[6], "default-bold-small")
guiLabelSetColor(GTIbe.label[6], 97, 255, 92)

GTIbe.label[7] = guiCreateLabel(51, 83, 206, 15, "$XXX Price", false, GTIbe.scrollpane[1])

GTIbe.label[8] = guiCreateLabel(10, 58, 51, 15, "Location: ", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[8], "default-bold-small")
guiLabelSetColor(GTIbe.label[8], 97, 255, 92)

GTIbe.label[9] = guiCreateLabel(65, 58, 192, 15, "XXX Location", false, GTIbe.scrollpane[1])

GTIbe.label[10] = guiCreateLabel(10, 108, 38, 15, "Type: ", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[10], "default-bold-small")
guiLabelSetColor(GTIbe.label[10], 97, 255, 92)

GTIbe.label[11] = guiCreateLabel(51, 108, 206, 15, "XXX Type", false, GTIbe.scrollpane[1])

GTIbe.label[12] = guiCreateLabel(10, 128, 38, 15, "Level:", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[12], "default-bold-small")
guiLabelSetColor(GTIbe.label[12], 97, 255, 92)

GTIbe.label[13] = guiCreateLabel(51, 128, 206, 15, "XXX Level", false, GTIbe.scrollpane[1])

GTIbe.label[14] = guiCreateLabel(10, 153, 28, 15, "Pay:", false, GTIbe.scrollpane[1])
guiSetFont(GTIbe.label[14], "default-bold-small")
guiLabelSetColor(GTIbe.label[14], 97, 255, 92)

GTIbe.label[15] = guiCreateLabel(41, 153, 206, 15, "XXX Pay", false, GTIbe.scrollpane[1])

GTIbe.label[16] = guiCreateLabel(10, 213, 267, 16, "New Business Information", false, GTIbe.window[1])
guiSetFont(GTIbe.label[16], "default-bold-small")
guiLabelSetColor(GTIbe.label[16], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbe.label[16], "center", false)

GTIbe.label[17] = guiCreateLabel(10, 239, 42, 15, "Name:", false, GTIbe.window[1])
guiSetFont(GTIbe.label[17], "default-bold-small")
guiLabelSetColor(GTIbe.label[17], 97, 255, 92)

GTIbe.label[18] = guiCreateLabel(10, 264, 32, 15, "Price:", false, GTIbe.window[1])
guiSetFont(GTIbe.label[18], "default-bold-small")
guiLabelSetColor(GTIbe.label[18], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbe.label[18], "right", false)

GTIbe.edit[1] = guiCreateEdit(52, 232, 191, 22, "", false, GTIbe.window[1])

GTIbe.edit[2] = guiCreateEdit(52, 264, 191, 22, "", false, GTIbe.window[1])

GTIbe.label[19] = guiCreateLabel(241, 507, 36, 12, "Change", false, GTIbe.window[1])
guiSetFont(GTIbe.label[19], "default-small")
guiLabelSetHorizontalAlign(GTIbe.label[19], "center", false)
guiLabelSetVerticalAlign(GTIbe.label[19], "center")

GTIbe.label[20] = guiCreateLabel(253, 22, 24, 12, "Close", false, GTIbe.window[1])
guiSetFont(GTIbe.label[20], "default-small")
guiLabelSetHorizontalAlign(GTIbe.label[20], "center", false)
guiLabelSetVerticalAlign(GTIbe.label[20], "center")

GTIbe.label[21] = guiCreateLabel(10, 296, 71, 15, "Description:", false, GTIbe.window[1])
guiSetFont(GTIbe.label[21], "default-bold-small")
guiLabelSetColor(GTIbe.label[21], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIbe.label[21], "right", false)

GTIbe.memo[1] = guiCreateMemo(10, 321, 267, 181, "", false, GTIbe.window[1])


function viewEditorGUI( option)
	local visibility = guiGetVisible( GTIbe.window[1])
	if option == true then
		if visibility == false then
			guiSetVisible( GTIbe.window[1], true)
			showCursor( true)
		end
	elseif option == false then
		if visibility == true then
			guiSetVisible( GTIbe.window[1], false)
			showCursor( false)
		end
	end
end

addEventHandler( "onClientMouseEnter", resourceRoot,
	function()
		if source == GTIbe.label[19] then
			guiLabelSetColor( source, 97, 255, 92)
		elseif source == GTIbe.label[20] then
			guiLabelSetColor( source, 92, 179, 255)
		end
	end
)

addEventHandler( "onClientMouseLeave", resourceRoot,
	function()
		if source == GTIbe.label[19] then
			guiLabelSetColor( source, 255, 255, 255)
		elseif source == GTIbe.label[20] then
			guiLabelSetColor( source, 255, 255, 255)
		end
	end
)

theID = 0
theCost = 0

addEventHandler( "onClientGUIClick", resourceRoot,
	function()
		if source == GTIbe.label[19] then
			viewEditorGUI( false)
			--
			local newName = tostring( guiGetText( GTIbe.edit[1])) or 0
			local newCost = tonumber( guiGetText( GTIbe.edit[2])) or 0
			local newDesc = tostring( guiGetText( GTIbe.memo[1])) or 0
			triggerServerEvent( "GTIbusiness.editBusiness", localPlayer, theID, newName, newCost, newDesc)
		elseif source == GTIbe.label[20] then
			viewEditorGUI( false)
		end
	end
)

addEventHandler("onClientGUIChanged", root,
	function()
		if source == GTIbe.edit[3] then
			guiSetText( source, guiGetText(source):gsub("[^0-5]",""))
		elseif source == GTIbe.edit[2] then
			guiSetText( source, guiGetText(source):gsub("[^0-9]",""))
		end
	end
)

--[[
addCommandHandler( "edit-bus",
	function( command, tid)
		triggerServerEvent( "GTIbusiness.getBusinessDetails", localPlayer, tid, "e")
	end
)
--]]

typeConvert = {
	['franchise'] = "Business",
	['diy'] = "Buildable",
	['asset'] = "Property",
}

typeIndex = {
	['franchise'] = 0,
	['diy'] = 1,
	['asset'] = 2,
}

addEvent( "GTIbusiness.getOldInformation", true)
addEventHandler( "GTIbusiness.getOldInformation", root,
	function( id, owned, owner, cost, name, busType, busLevel, buildable, location, pay, desc)
		viewEditorGUI( true)
		theID = id
		theCost = cost
		--
		local theType = typeConvert[busType]
		--
		guiSetText( GTIbe.label[3], name)
		guiSetText( GTIbe.label[5], id)
		guiSetText( GTIbe.label[9], location)
		guiSetText( GTIbe.label[7], "$"..formatNumber(cost))
		guiSetText( GTIbe.label[11], theType)
		guiSetText( GTIbe.label[13], levels[busLevel].." ("..busLevel..")")
		guiSetText( GTIbe.label[15], "$"..formatNumber(pay))
		--
		guiSetText( GTIbe.edit[1], name)
		guiSetText( GTIbe.edit[2], cost)
		--
		guiSetText( GTIbe.memo[1], desc)
	end
)
