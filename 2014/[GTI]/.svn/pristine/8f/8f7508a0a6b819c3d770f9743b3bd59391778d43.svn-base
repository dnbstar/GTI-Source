local screenW, screenH = guiGetScreenSize()
local localPlayer = getLocalPlayer()
local root = getRootElement()
local soundFile1 = "call.ogg"
local soundFile2 = "get.ogg"

skype = {
	window = {},
    tab = {},
    tabpanel = {},
    edit = {},
    button = {},
    label = {},
    gridlist = {},
	combobox = {},
}

skype.window[1] = guiCreateWindow((screenW - 1199) / 2, (screenH - 693) / 2, 1199, 693, "GTI  - Social Club Interactions", false)
guiWindowSetSizable(skype.window[1], false)
guiSetVisible(skype.window[1], false)

skype.tabpanel[1] = guiCreateTabPanel(9, 21, 183, 662, false, skype.window[1])

skype.tab[1] = guiCreateTab("Players", skype.tabpanel[1])

skype.gridlist[1] = guiCreateGridList(5, 37, 173, 590, false, skype.tab[1])
playerColumn = guiGridListAddColumn(skype.gridlist[1], "Players", 0.9)
skype.edit[1] = guiCreateEdit(5, 6, 173, 24, "", false, skype.tab[1])

skype.label[1] = guiCreateLabel(202, 31, 419, 15, "Name: ", false, skype.window[1])
--skype.button[2] = guiCreateButton(1136, 21, 53, 25, "Call", false, skype.window[1])
--skype.button[3] = guiCreateButton(1068, 21, 58, 25, "End Call", false, skype.window[1])
skype.button[4] = guiCreateButton(1068, 49, 121, 24, "Admin Options", false, skype.window[1])
skype.edit[2] = guiCreateEdit(1068, 21, 121, 24, "", false, skype.window[1])
--skype.combobox[1] = guiCreateCombobox(768, 21, 121, 24, "", false)
guiSetVisible( skype.edit[2], false)
guiSetVisible( skype.button[4], false)
skype.tabpanel[3] = guiCreateTabPanel(202, 56, 987, 627, false, skype.window[1])

--guiSetEnabled( skype.button[3], false)

function setUpBind()
	bindKey("N","down",
	function()
		guiSetVisible(skype.window[1],not guiGetVisible(skype.window[1]))
		showCursor(guiGetVisible(skype.window[1]))
		if guiGetVisible(skype.window[1]) == true then mode = "no_binds_when_editing" else mode = "allow_binds" end
		guiSetInputMode(mode or "allow_binds")
	end)
end

function createFailWindow()
	fSkype = {
		window = {},
		gridlist = {},
		button = {},
		label = {}
	}
	fSkype.window[1] = guiCreateWindow(648, 363, 266, 131, "Incoming Call", false)
	guiWindowSetSizable(fSkype.window[1], false)
	guiSetVisible(fSkype.window[1], false)

	fSkype.label[1] = guiCreateLabel(10, 27, 246, 43, "", false, fSkype.window[1])
	guiLabelSetHorizontalAlign(fSkype.label[1], "center", true)
	guiLabelSetVerticalAlign(fSkype.label[1], "center")
	fSkype.button[1] = guiCreateButton(10, 80, 72, 32, "Answer Call", false, fSkype.window[1])
	fSkype.button[2] = guiCreateButton(184, 80, 72, 32, "Decline Call", false, fSkype.window[1])
	setUpBind()
end
addEventHandler ( "onClientResourceStart", resourceRoot, createFailWindow)

--[[Colors:
	Blue
	Green
	Red

	Types:
	Limited
	Regular(syntax skip)
--]]

channels = {
	"Social Club",
	"Main",
	"Team",
	--"Teams",
	"Local/PM",
	"Interactions",
	"Briefing",
	"Misc",
	--"History",
	--"Staff",
}
channel = {}
logChannels = { ['Main']=true, ['Team']=true, ['Local/PM']=true, ['Interactions']=true, ['Briefing']=true, ['Misc']=true}

function check(key,press)
	if ( key == "enter" or key =="num_enter" ) and press then
		if spec then
			onMsg()
		end
	end
end

function onMsg(withEdit,text)
	local tab = guiGetSelectedTab(skype.tabpanel[3])
	local chanName = guiGetText(tab)
	local edit = channel[chanName]["Edit"]
	if withEdit ~= false then
		editText = guiGetText(edit)
	else
		editText = text
	end
	if ( editText ~= "" ) then
		--triggerServerEvent("onPlayerChatMessage",localPlayer,tabName,editText,Log)
		if not logChannels[chanName] then
			guiSetText(edit,"")
			outputMessage( editText, "yellow")
			local player = getPlayerName( localPlayer)
			triggerServerEvent( "logSocialClubMessage", getLocalPlayer(), player, editText, "SocialClub", 3, chanName)
		else
			outputMessage( "You can't talk in this channel because this channel is only meant for logging.", "red", "limited")
		end
	end
end

function manageButton(button)
	if not button then return end
	addEventHandler("onClientGUIClick",root,function()
	if source == button then
		onMsg()
	end
	end )
end

function manageEdit(edit)
	addEventHandler("onClientGUIChanged",root,function()
		if source == edit then
			local text = guiGetText(edit)
			if text and text ~= "" then
				if not spec then
					spec = true
					addEventHandler("onClientKey",root,check)
				end
			else
				if spec then
					spec = false
					removeEventHandler("onClientKey",root,check)
				end
			end
		end
	end )
end

function manageGrid(grid)
	addEventHandler("onClientGUIDoubleClick",root,function()
		if source == grid then
			local a,b = guiGridListGetSelectedItem ( source )
			if a and b then
				local time = guiGridListGetItemText ( source, a,1 )
				local text = guiGridListGetItemText ( source, a,2 )
				if text and text ~= "" then
					setClipboard(time.." | "..text)
				end
			end
		end
	end )
end

if (channels and type(channels) == "table" ) then
	for k,v in ipairs ( channels) do
		local channelName = v
		newChannel = guiCreateTab(tostring(v), skype.tabpanel[3])
		--
		channel[channelName] = {}
		channel[channelName]["Grid"] = guiCreateGridList(4, 3, 977, 557,false,newChannel)
		channel[channelName]["Column1"] = guiGridListAddColumn(channel[channelName]["Grid"],"Time",0.2)
		channel[channelName]["Column2"] = guiGridListAddColumn(channel[channelName]["Grid"],"Message",0.7)
		channel[channelName]["Edit"] = guiCreateEdit(4, 570, 879, 22,"",false,newChannel)
		channel[channelName]["Button1"] = guiCreateButton(893, 570, 88, 21,"Send",false,newChannel)
			--
		manageButton(channel[channelName]["Button1"])
		manageEdit(channel[channelName]["Edit"])
		manageGrid(channel[channelName]["Grid"])
			--
		setElementData(localPlayer,"Chan"..channelName,false)
		guiGridListSetSortingEnabled ( channel[channelName]["Grid"], false )
	end
end

restrictedChannels = { ['History']=true}
knownChannels = { ['Social Club']=true, ['Main']=true, ['Team']=true, ['Local/PM']=true, ['Interactions']=true, ['Briefing']=true, ['Misc']=true, ['History']=true}

--[[
addEventHandler( "onClientGUITabSwitched", root,
	function( selectedTab)
		if selectedTab ~= nil then
			local chanName = guiGetText( selectedTab)
			if knownChannels[chanName] then
				if restrictedChannels[chanName] then
					--outputMessage( "You entered a restricted channel ('"..chanName.."')", "red")
					guiGridListClear( channel[chanName]["Grid"])
					triggerServerEvent( "queryHistoryLogs", getLocalPlayer(), chanName)
				else
					if guiGetVisible( skype.button[4]) then
						guiSetVisible( skype.edit[2], false)
						guiSetVisible( skype.button[4], false)
						guiGridListClear( grid)
					end
				end
			end
		end
	end
)
--]]

--[[
function logSearching()
	local grid = channel["History"]["Grid"]
	local mRow = guiGridListAddRow( grid)
	if guiGetText(source) ~= "" then
		guiGridListClear( grid)
		for k,v in ipairs ( getElementsByType("player")) do
			local name = string.lower(getPlayerName(v))
			if name then
				if string.find(name,string.lower(guiGetText(source))) then
					if name ~= getPlayerName( localPlayer) then
						--guiGridListSetItemText ( grid, mRow, channel["History"]["Column2"], getPlayerName(v), false, false)
						triggerServerEvent( "queryHistoryLogs", getLocalPlayer(), "History", name)
					end
				end
			end
		end
	end
end
addEventHandler("onClientGUIChanged", skype.edit[2], logSearching)
--]]

function giveAdminFunctions( toggle, name, acc, time, text, type, msgType, chanName, color)
	if toggle == true then
		if not guiGetVisible( skype.button[4]) then
			guiSetVisible( skype.edit[2], true)
			guiSetVisible( skype.button[4], true)
		end
	end
	addHistoryLog( name, acc, time, text, type, msgType, chanName, color)
end
addEvent( "outputGlobalHistory", true)
addEventHandler( "outputGlobalHistory", root, giveAdminFunctions)

local rows = {}

playerHistoryHidden = { [1]=true, [3]=true, [5]=true}

--playerName, accountName, logTime, msg, messageType, msgType, chanName
function addHistoryLog( name, acc, time, text, type, msgType, chanName, color)
	local grid = channel[chanName]["Grid"]
	local mRow = guiGridListAddRow( grid)
	table.insert(rows, {mRow})
	for i=1, 2 do
		if type == 0 then
			messageType = "Main Chat"
		elseif type == 1 then
			messageType = "Interaction (/me)"
		elseif type == 2 then
			messageType = "Team Chat"
		elseif type == 3 then
			messageType = "Social Club"
		elseif type == 4 then
			messageType = "Briefing"
		elseif type == 5 then
			messageType = "Misc"
		elseif type == 6 then
			messageType = "Local Chat"
		else
			messageType = "Misc"
		end
		guiGridListSetItemText ( grid, mRow, channel[chanName]["Column1"], time, false, false)
		--guiGridListSetItemText ( grid, mRow, channel[chanName]["Column2"], "Account:'"..acc.."' MSG:'"..text.."' Type:'"..messageType.."' Proper Purpose:'"..msgType.."'", false, false)
		guiGridListSetItemText ( grid, mRow, channel[chanName]["Column2"], "Acc:'"..acc.."' Name:'"..name.."' Msg:'"..text.."'  Purpose:'"..msgType.."'", false, false)
		if color == "green" then
			gr, gg, gb = 120, 231, 128
		elseif color == "blue" then
			gr, gg, gb = 120, 162, 231
		elseif color == "red" then
			gr, gg, gb = 255, 135, 132
		elseif color == "purple" then
			gr, gg, gb = 199, 119, 230
		else
			gr, gg, gb = 255, 135, 132
		end
		guiGridListSetItemColor( grid, mRow, i, gr, gg, gb)
	end
end

function outputMessage( text, color, type)
	if not text then return end
	if not isTimer( antiCall) then
		if color == "red" then
			outputChatBox( "(GTI Social): "..text, 143, 0, 36)
		elseif color == "green" then
			outputChatBox( "(GTI Social): "..text, 36, 143, 0)
		elseif color == "blue" then
			outputChatBox( "(GTI Social): "..text, 0, 107, 143)
		elseif color == "yellow" then
			outputChatBox( "(GTI Social): "..text, 143, 107, 0)
		end
		if type == "limited5" then
			antiCall = setTimer( function() end, 5000, 1)
		elseif type == "limited" then
			antiCall = setTimer( function() end, 1000, 1)
		end
	end
end

function generateList()
	if skype.gridlist[1] then
		guiGridListClear( skype.gridlist[1])
		for i, v in ipairs(getElementsByType("player")) do
			local pRow = guiGridListAddRow(skype.gridlist[1])
			if getPlayerName(v) ~= getPlayerName(localPlayer) then
				guiGridListSetItemText(skype.gridlist[1], pRow, playerColumn, getPlayerName(v), false, false)
			end
		end
	end
end
addEventHandler( "onClientResourceStart", root, generateList)
addEventHandler( "onClientPlayerJoin", root, generateList)

addEventHandler( "onClientGUIChanged", root,
	function()
		if source == skype.edit[1] then
			guiGridListClear(skype.gridlist[1])
			for k,v in ipairs ( getElementsByType("player")) do
				local name = string.lower(getPlayerName(v))
				if name then
					if string.find(name,string.lower(guiGetText(skype.edit[1]))) then
						if name ~= getPlayerName( localPlayer) then
							playerRow = guiGridListAddRow(skype.gridlist[1])
							guiGridListSetItemText (skype.gridlist[1], playerRow, playerColumn, getPlayerName(v), false, false)
						end
					end
				end
			end
		end
	end
)

--[[Message Types:
	0 = Normal Message
	1 = Action Message (/me)
	2 = Team Message
--]]

hiddenTeams = { ["Staff"]=true}

function outputSocialMessage( name, time, text, type, msgType, chanName, color)
	if name then
		grid = channel[chanName]["Grid"]
		mRow = guiGridListAddRow( grid)
		--
		for i=1, 2 do
			if msgType == 0 then
				local plr = getPlayerFromName( name)
				local city = getPlayerCity( plr)
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column1"], time, false, false)
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column2"], "("..city..") "..name..": "..text, false, false)
				if type == "Staff" then
					guiGridListSetItemColor( grid, mRow, i, 255, 0, 0)
				elseif type == "Dev" then
					guiGridListSetItemColor( grid, mRow, i, 255, 255, 0)
				elseif type == "Mod" then
					guiGridListSetItemColor( grid, mRow, i, 0, 255, 0)
				elseif type == "Head" then
					guiGridListSetItemColor( grid, mRow, i, 90, 0, 200)
				end
			elseif msgType == 1 then
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column1"], time, false, false)
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column2"], text, false, false)
				guiGridListSetItemColor( grid, mRow, i, 206, 0, 183)
			elseif msgType == 2 then
				local player = getPlayerFromName( name)
				local team = getPlayerTeam( player)
				local teamName = getTeamName( team)
				local tC1, tC2, tC3 = getTeamColor( team)
				if not hiddenTeams[teamName] then
					guiGridListSetItemText ( grid, mRow, channel[chanName]["Column1"], time, false, false)
					guiGridListSetItemText ( grid, mRow, channel[chanName]["Column2"], "("..teamName..") "..name..": "..text, false, false)
					guiGridListSetItemColor( grid, mRow, i, tC1, tC2, tC3)
				end
			elseif msgType == 3 then
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column1"], time, false, false)
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column2"], name..": "..text, false, false)
				if type == "Staff" then
					guiGridListSetItemColor( grid, mRow, i, 255, 0, 0)
				elseif type == "Dev" then
					guiGridListSetItemColor( grid, mRow, i, 255, 255, 0)
				elseif type == "Mod" then
					guiGridListSetItemColor( grid, mRow, i, 0, 255, 0)
				elseif type == "Head" then
					guiGridListSetItemColor( grid, mRow, i, 90, 0, 200)
				end
			else
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column1"], time, false, false)
				guiGridListSetItemText ( grid, mRow, channel[chanName]["Column2"], text, false, false)
				if color then
					if color == "red" then
						gr, gg, gb = 255, 0, 0
					elseif color == "yellow" then
						gr, gg, gb = 255, 255, 0
					elseif color == "green" then
						gr, gg, gb = 0, 255, 0
					elseif color == "purple" then
						gr, gg, gb = 142, 120, 231
					end
					guiGridListSetItemColor( grid, mRow, i, gr, gg, gb)
				else
					guiGridListSetItemColor( grid, mRow, i, 255, 255, 0)
				end
			end
		end
	end
end
addEvent( "outputSocialClubMessage", true)
addEventHandler( "outputSocialClubMessage", root, outputSocialMessage)

addEventHandler( "onClientGUIClick", root,
	function()
		if source == skype.gridlist[1] then
			local pRow, pCol = guiGridListGetSelectedItem(skype.gridlist[1])
			local target = tostring(guiGridListGetItemText(skype.gridlist[1], pRow, 1))
			if target then
				if target ~= getPlayerName( localPlayer) then
					local nameLabel = guiGetText( skype.label[1])
					guiSetText( skype.label[1], "Name: "..target)
				end
			end
		elseif source == skype.button[2] then
			local pRow, pCol = guiGridListGetSelectedItem(skype.gridlist[1])
			local target = tostring(guiGridListGetItemText(skype.gridlist[1], pRow, 1))
			local player = getPlayerName( localPlayer)
			if target then
				if target ~= player then
					local nameLabel = guiGetText( skype.label[1])
					if nameLabel ~= "Name: " then
						if not isTimer( callTimer) then
							triggerServerEvent( "callRecipient", getLocalPlayer(), target, player)
							guiSetEnabled( skype.button[2], false)
							guiSetEnabled( skype.button[3], true)
							callTimer = setTimer( function() end, 10000, 1)
							setTimer( guiSetEnabled, 10000, 1, skype.button[2], true)
							setTimer( guiSetEnabled, 10000, 1, skype.button[3], false)
						end
					else
						outputMessage( "You can't call a non-existing player", "red", "limited5")
					end
				end
			end
		elseif source == skype.button[3] then
		end
	end
)

function setOption(theText, theEvent, theTime, data1, data2, data3)
	if theText then
		if theEvent then
			theShowTime = setTimer( stopOptionWindow, theTime, 1, data2, data1)
			guiSetVisible( fSkype.window[1], true)
			if not guiGetVisible( skype.window[1]) then
				showCursor( true)
			end
			guiSetText( fSkype.label[1], theText)
			function tempFunction()
				if source == fSkype.button[1] then
					removeEventHandler( "onClientGUIClick", root, tempFunction)
					guiSetVisible( fSkype.window[1], false)
					triggerServerEvent( theEvent, getLocalPlayer(), data1, data2, data3)
					generateList()
				elseif source == fSkype.button[2] then
					removeEventHandler( "onClientGUIClick", root, tempFunction)
					guiSetVisible( fSkype.window[1], false)
					triggerServerEvent( theEvent, getLocalPlayer(), data1, data2, "no")
					generateList()
				end
				if not guiGetVisible( skype.window[1]) then
					showCursor( false)
				end
			end
			addEventHandler( "onClientGUIClick", root, tempFunction)
		end
	end
end

function stopOptionWindow( caller, reciever)
	triggerServerEvent( "hideOWindow", getLocalPlayer(), caller, reciever)
end

function hideOptionWindow()
	guiSetVisible( fSkype.window[1], false)
	guiSetText( fSkype.label[1], "")
end
addEvent( "hideOptionWindow", true)
addEventHandler( "hideOptionWindow", root, hideOptionWindow)

function prepareCall( caller)
	prepCSound = playSound( soundFile1, false)
end
addEvent( "prepCallPlayerSound", true)
addEventHandler( "prepCallPlayerSound", root, prepareCall)

function recieveCall( caller)
	recCSound = playSound( soundFile2, false)
	setOption( caller.." is calling you.", "callDecision", 10000, caller, getPlayerName(localPlayer), "yes")
end
addEvent( "callPlayerSound", true)
addEventHandler( "callPlayerSound", root, recieveCall)

function recieverAnswered()
	stopSound( recCSound)
	if isTimer( theShowTime) then
		killTimer( theShowTime)
	end
end
addEvent( "stopRCallSound", true)
addEventHandler( "stopRCallSound", root, recieverAnswered)

function senderSound()
	stopSound( prepCSound)
	if isTimer( theShowTime) then
		killTimer( theShowTime)
	end
end
addEvent( "stopSCallSound", true)
addEventHandler( "stopSCallSound", root, senderSound)
