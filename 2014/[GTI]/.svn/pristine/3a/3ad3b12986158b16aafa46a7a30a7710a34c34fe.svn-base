local screenW, screenH = guiGetScreenSize()

GTIb = {
    window = {},
    scrollpane = {},
    label = {}
}

GTIb.window[1] = guiCreateWindow((screenW - 478) / 2, (screenH - 327) / 2, 478, 327, "GTI Franchise Panel", false)
guiWindowSetSizable(GTIb.window[1], false)
guiWindowSetMovable(GTIb.window[1], false)
guiSetVisible(GTIb.window[1], false)

GTIb.label[1] = guiCreateLabel(10, 21, 458, 15, "XXX Business - XXX Level", false, GTIb.window[1])
guiSetFont(GTIb.label[1], "default-bold-small")
guiLabelSetColor(GTIb.label[1], 97, 255, 92)
guiLabelSetHorizontalAlign(GTIb.label[1], "center", false)
guiLabelSetVerticalAlign(GTIb.label[1], "center")

GTIb.label[2] = guiCreateLabel(441, 21, 27, 15, "Close", false, GTIb.window[1])
guiSetFont(GTIb.label[2], "default-small")
guiLabelSetHorizontalAlign(GTIb.label[2], "center", false)
guiLabelSetVerticalAlign(GTIb.label[2], "center")

GTIb.label[3] = guiCreateLabel(10, 31, 458, 15, "Medium Venture II - $XXX Cost", false, GTIb.window[1])
guiSetFont(GTIb.label[3], "default-small")
guiLabelSetColor(GTIb.label[3], 92, 179, 255)
guiLabelSetHorizontalAlign(GTIb.label[3], "center", false)
guiLabelSetVerticalAlign(GTIb.label[3], "center")

GTIb.label[4] = guiCreateLabel(10, 56, 123, 15, "Development Status: ", false, GTIb.window[1])
guiSetFont(GTIb.label[4], "default-bold-small")
guiLabelSetColor(GTIb.label[4], 97, 255, 92)
guiLabelSetVerticalAlign(GTIb.label[4], "center")

GTIb.label[5] = guiCreateLabel(248, 56, 84, 15, "Business Type: ", false, GTIb.window[1])
guiSetFont(GTIb.label[5], "default-bold-small")
guiLabelSetColor(GTIb.label[5], 97, 255, 92)
guiLabelSetVerticalAlign(GTIb.label[5], "center")

GTIb.label[6] = guiCreateLabel(137, 56, 107, 15, "XXX Status", false, GTIb.window[1])
guiLabelSetVerticalAlign(GTIb.label[6], "center")

GTIb.label[7] = guiCreateLabel(335, 56, 133, 15, "XXX Type", false, GTIb.window[1])
guiLabelSetVerticalAlign(GTIb.label[7], "center")

GTIb.label[8] = guiCreateLabel(10, 81, 98, 15, "Average Payout: ", false, GTIb.window[1])
guiSetFont(GTIb.label[8], "default-bold-small")
guiLabelSetColor(GTIb.label[8], 92, 179, 255)
guiLabelSetVerticalAlign(GTIb.label[8], "center")

GTIb.label[9] = guiCreateLabel(113, 81, 107, 15, "$XXX,XXX Payout", false, GTIb.window[1])
guiLabelSetVerticalAlign(GTIb.label[9], "center")

GTIb.label[10] = guiCreateLabel(10, 106, 71, 15, "Description: ", false, GTIb.window[1])
guiSetFont(GTIb.label[10], "default-bold-small")
guiLabelSetColor(GTIb.label[10], 92, 179, 255)
guiLabelSetVerticalAlign(GTIb.label[10], "center")

GTIb.scrollpane[1] = guiCreateScrollPane(85, 106, 246, 114, false, GTIb.window[1])

GTIb.label[11] = guiCreateLabel(5, 5, 236, 163, "N/A", false, GTIb.scrollpane[1])
guiSetFont(GTIb.label[11], "default-small")

GTIb.label[12] = guiCreateLabel(228, 81, 92, 15, "Business Owner: ", false, GTIb.window[1])
guiSetFont(GTIb.label[12], "default-bold-small")
guiLabelSetColor(GTIb.label[12], 92, 179, 255)
guiLabelSetVerticalAlign(GTIb.label[12], "center")

GTIb.label[13] = guiCreateLabel(321, 81, 147, 15, "XXX Owner", false, GTIb.window[1])
guiLabelSetVerticalAlign(GTIb.label[13], "center")

GTIb.label[14] = guiCreateLabel(341, 106, 60, 15, "Buy Business", false, GTIb.window[1])
guiSetFont(GTIb.label[14], "default-small")
guiLabelSetHorizontalAlign(GTIb.label[14], "center", false)
guiLabelSetVerticalAlign(GTIb.label[14], "center")

GTIb.label[15] = guiCreateLabel(341, 121, 76, 15, "Manage Business", false, GTIb.window[1])
guiSetFont(GTIb.label[15], "default-small")
guiLabelSetHorizontalAlign(GTIb.label[15], "center", false)
guiLabelSetVerticalAlign(GTIb.label[15], "center")
guiSetVisible( GTIb.label[15], false)

GTIb.label[16] = guiCreateLabel(341, 136, 76, 15, "Business Builder", false, GTIb.window[1])
guiSetFont(GTIb.label[16], "default-small")
guiLabelSetHorizontalAlign(GTIb.label[16], "center", false)
guiLabelSetVerticalAlign(GTIb.label[16], "center")
guiSetVisible( GTIb.label[16], false)

function viewBusinessGUI( option)
	local visibility = guiGetVisible( GTIb.window[1])
	if option == true then
		if visibility == false then
			guiSetVisible( GTIb.window[1], true)
			showCursor( true)
		end
	elseif option == false then
		if visibility == true then
			guiSetVisible( GTIb.window[1], false)
			showCursor( false)
		end
	end
end

addEventHandler( "onClientMouseEnter", resourceRoot,
	function()
		if source == GTIb.label[2] then
			guiLabelSetColor( source, 97, 255, 92)
		elseif source == GTIb.label[14] then
			guiLabelSetColor( source, 92, 175, 97)
		elseif source == GTIb.label[15] then
			guiLabelSetColor( source, 92, 179, 255)
		elseif source == GTIb.label[16] then
			guiLabelSetColor( source, 255, 179, 92)
		end
	end
)

addEventHandler( "onClientMouseLeave", resourceRoot,
	function()
		if source == GTIb.label[2] then
			guiLabelSetColor( source, 255, 255, 255)
		elseif source == GTIb.label[14] then
			guiLabelSetColor( source, 255, 255, 255)
		elseif source == GTIb.label[15] then
			guiLabelSetColor( source, 255, 255, 255)
		elseif source == GTIb.label[16] then
			guiLabelSetColor( source, 255, 255, 255)
		end
	end
)

local bEvents = {
	['Buy Business'] = "buy",
	['Sell Business'] = "sell",
}

addEventHandler( "onClientGUIClick", resourceRoot,
	function()
		if source == GTIb.label[2] then
			viewBusinessGUI( false)
		elseif source == GTIb.label[14] then
			local text = bEvents[guiGetText(GTIb.label[14])]
			local id = getElementData( GTIb.label[14], "theID")
			viewBusinessGUI( false)
			triggerServerEvent( "GTIbusiness.executeBusinessOption", localPlayer, text, id)
		elseif source == GTIb.label[15] then
			local text = bEvents[guiGetText(GTIb.label[14])]
			local id = getElementData( GTIb.label[14], "theID")
			viewBusinessGUI( false)
			triggerServerEvent( "GTIbusiness.getBusinessDetails", localPlayer, id, "e")
		elseif source == GTIb.label[16] then
			local text = bEvents[guiGetText(GTIb.label[14])]
			local id = getElementData( GTIb.label[14], "theID")
			viewBusinessGUI( false)
			triggerServerEvent( "GTIbusiness.verifyBusinessOwnership", localPlayer, id, true)
		end
	end
)

singleValue = {
	[false] = true,
	["false"] = true,
	[true] = false,
}

typeConvert = {
	['asset'] = "Property",
	['franchise'] = "Business",
	['diy'] = "Buildable Business",
}

numConvert = {
	[0] = "I",
	[1] = "II",
	[2] = "III",
	[3] = "IV",
	[4] = "V",
	[5] = "VI",
}

addEvent( "GTIbb.showAdvanced", true)
addEventHandler( "GTIbb.showAdvanced", root,
	function( toggle)
		if toggle == true then
			guiSetVisible( GTIb.label[15], true)
			guiSetVisible( GTIb.label[16], true)
		else
			guiSetVisible( GTIb.label[15], false)
			guiSetVisible( GTIb.label[16], false)
		end
	end
)

addEvent( "GTIbusiness.inputInformation", true)
addEventHandler( "GTIbusiness.inputInformation", root,
	function( id, owned, owner, cost, name, busType, busLevel, buildable, location, payout, desc, playerAcc)
		local levelName = levels[busLevel]
		guiSetText( GTIb.label[1], location.." "..name.." "..numConvert[busLevel])
		guiSetText( GTIb.label[3], levelName.." - $"..formatNumber(cost))
		guiSetText( GTIb.label[7], typeConvert[busType])
		guiSetText( GTIb.label[9], "$"..formatNumber(payout))
		--local desc = string.gsub( desc, "!#", "\n")
		guiSetText( GTIb.label[11], "Business #"..id.."\n\n"..desc)
		if not singleValue[owner] then
			guiSetText( GTIb.label[13], owner)
		else
			guiSetText( GTIb.label[13], "None - For Sale")
		end
		setElementData( GTIb.label[14], "theID", id)
		if buildable == true or buildable == "true" then
			guiSetText( GTIb.label[6], "Available")
		elseif buildable == false or buildable == "false" then
			guiSetText( GTIb.label[6], "Unavailable")
		end
		if not singleValue[owned] then
			--if owner == playerAcc then
			if string.find( owner, playerAcc) then
				guiSetText( GTIb.label[14], "Sell Business")
				if buildable == true or buildable == "true" then
					guiSetVisible( GTIb.label[16], true)
				elseif buildable == false or buildable == "false" then
					guiSetVisible( GTIb.label[16], false)
				end
			else
				guiSetVisible( GTIb.label[14], false)
			end
		else
			if not guiGetVisible( GTIb.label[14]) then
				guiSetVisible( GTIb.label[14], true)
			end
			guiSetText( GTIb.label[14], "Buy Business")
		end
	end
)
