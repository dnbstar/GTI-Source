local screenW, screenH = guiGetScreenSize()

function createUI()
	GTI = {
		window = {},
		label = {},
		button = {},
	}
	GTI.window[1] = guiCreateWindow((screenW - 563) / 2, (screenH - 194) / 2, 563, 194, "GTI Serial - Information", false)
	guiWindowSetSizable(GTI.window[1], false)
	guiSetVisible( GTI.window[1], false)

	GTI.label[1] = guiCreateLabel(10, 28, 543, 15, "Your MTA Serial: ", false, GTI.window[1])
	guiLabelSetColor(GTI.label[1], 221, 32, 32)
	GTI.label[2] = guiCreateLabel(10, 58, 543, 15, "Your GTI Account: ", false, GTI.window[1])
	guiLabelSetColor(GTI.label[2], 126, 126, 126)
	GTI.label[3] = guiCreateLabel(10, 43, 543, 15, "Your GTI Serial: ", false, GTI.window[1])
	guiLabelSetColor(GTI.label[3], 32, 126, 222)
	GTI.button[1] = guiCreateButton(215, 148, 134, 36, "Close", false, GTI.window[1])
	GTI.button[2] = guiCreateButton(227, 117, 112, 26, "Copy to Clipboard", false, GTI.window[1])

	for i=1,3  do
		if GTI.label[i] then
			guiLabelSetHorizontalAlign( GTI.label[i], "center", true)
			guiLabelSetVerticalAlign( GTI.label[i], "center")
		end
	end
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),createUI)

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTI.button[1] then
			if guiGetVisible( GTI.window[1]) == true then
				guiSetVisible( GTI.window[1], false)
				showCursor( false)
			end
		elseif source == GTI.button[2] then
			local tC = guiGetText( GTI.label[3])
			theCerial = string.sub( tC, 18, 50)
			--outputChatBox( "Your Copied Cerial: "..theCerial1)
			setClipboard( theCerial)
			outputChatBox( "Your cerial has been copied to the clipboard!", 32, 126, 222)
		end
	end
)

function viewInfo( mS, cS, cA)
	if guiGetVisible( GTI.window[1]) == false then
		guiSetVisible( GTI.window[1], true)
		showCursor( true)
		local info1 = guiGetText( GTI.label[1])
		local info2 = guiGetText( GTI.label[2])
		local info3 = guiGetText( GTI.label[3])
		if string.len(info1) == 17 then
				guiSetText( GTI.label[1], info1..mS)
		else
			guiSetText( GTI.label[1], "Your MTA Serial: "..mS)
		end
		if string.len(info2) == 18 then
			guiSetText( GTI.label[2], info2..cA)
		else
			guiSetText( GTI.label[2], "Your GTI Account: "..cA)
		end
		if string.len(info3) == 17 then
			guiSetText( GTI.label[3], info3..cS)
		else
			guiSetText( GTI.label[3], "Your GTI Serial: "..cS)
		end
	end
end
addEvent( "getInfo", true)
addEventHandler( "getInfo", root, viewInfo)
