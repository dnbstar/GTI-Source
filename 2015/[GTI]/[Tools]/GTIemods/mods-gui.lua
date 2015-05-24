local screenW, screenH = guiGetScreenSize()

GTIemods = {
    gridlist = {},
    window = {},
    button = {},
    label = {},
}

GTIemods.window[1] = guiCreateWindow((screenW - 438) / 2, (screenH - 368) / 2, 438, 368, "Grand Theft International - Element Mods", false)
guiWindowSetSizable(GTIemods.window[1], false)
guiSetVisible( GTIemods.window[1], false)

GTIemods.gridlist[1] = guiCreateGridList(10, 26, 177, 332, false, GTIemods.window[1])
guiGridListAddColumn(GTIemods.gridlist[1], "Mods", 0.9)

GTIemods.label[1] = guiCreateLabel(197, 36, 226, 15, "Mod: ", false, GTIemods.window[1])
GTIemods.label[2] = guiCreateLabel(197, 55, 226, 15, "Mod Type: ", false, GTIemods.window[1])
GTIemods.label[3] = guiCreateLabel(197, 74, 226, 15, "Replacement Vehicle: ", false, GTIemods.window[1])
GTIemods.label[4] = guiCreateLabel(197, 93, 226, 15, "Mod Size: ", false, GTIemods.window[1])
GTIemods.label[5] = guiCreateLabel(197, 108, 226, 15, "_________________________________", false, GTIemods.window[1])
GTIemods.label[6] = guiCreateLabel(197, 133, 226, 15, "Downloaded: ", false, GTIemods.window[1])
GTIemods.label[7] = guiCreateLabel(197, 152, 226, 15, "Status: ", false, GTIemods.window[1])
GTIemods.label[8] = guiCreateLabel(244, 341, 184, 17, "Right-click window to close.", false, GTIemods.window[1])

GTIemods.button[1] = guiCreateButton(247, 177, 125, 31, "Download Mod", false, GTIemods.window[1])
GTIemods.button[2] = guiCreateButton(247, 218, 125, 31, "Toggle Mod", false, GTIemods.window[1])
GTIemods.button[3] = guiCreateButton(247, 259, 125, 31, "Delete Mod", false, GTIemods.window[1])

modSizeCache = {}
local currentID = ""
local currentFiles = ""
local currentVehicle = 0

function cacheFileSizes( modName, fileSize)
	modSizeCache[modName] = fileSize
end
addEvent( "GTIemods.cacheFileSizes", true)
addEventHandler( "GTIemods.cacheFileSizes", root, cacheFileSizes)

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		for i, button in ipairs ( GTIemods.button) do
			guiSetEnabled( button, false)
		end
		for name, category in pairs ( modtable) do
			for i, tmod in pairs (category) do
				local name = tmod.info[4]
				local txd, dff = tmod.files[1], tmod.files[2]
				triggerServerEvent( "GTIemods.getAllFileSizes", localPlayer, name, txd..","..dff)
			end
		end
	end
)

function showModsWindow( status)
	if status then
		guiGridListClear( GTIemods.gridlist[1])
		guiSetVisible( GTIemods.window[1], true)
		showCursor( true)
	else
		guiSetVisible( GTIemods.window[1], false)
		showCursor( false)
	end
end

--[[ Layouts:
	0: Nothing Selected
	1: DL
	2: DLed
--]]

filesDownloading = {}
enabledMods = {}

function setButtonLayout( theLayout)
	if theLayout == 0 then
		guiSetEnabled( GTIemods.button[1], false)
		guiSetEnabled( GTIemods.button[2], false)
		guiSetEnabled( GTIemods.button[3], false)
	elseif theLayout == 1 then
		guiSetEnabled( GTIemods.button[1], true)
		guiSetEnabled( GTIemods.button[2], false)
		guiSetEnabled( GTIemods.button[3], false)
	elseif theLayout == 2 then
		guiSetEnabled( GTIemods.button[1], false)
		guiSetEnabled( GTIemods.button[2], true)
		guiSetEnabled( GTIemods.button[3], true)
	end
end

function isModInstalled( theFiles)
	local data = split( theFiles, ",")
	local txd = data[1]
	local dff = data[2]

	if fileExists( path..txd) and fileExists( path..dff) then
		return true
	else
		return false
	end
end

function isModEnabled( theMod)
	if enabledMods[theMod] then
		return true
	else
		return false
	end
end

--[[
function getModSize( theFiles)
	local data = split( theFiles, ",")
	local txd = data[1]
	local txd = fileOpen( path..txd)
	local dff = data[2]
	local dff = fileOpen( path..dff)

	local stxd = fileGetSize( txd)
	local sdff = fileGetSize( dff)
	local mb = (stxd+sdff)/1024/1024
	local mb = string.format( "%.2f", mb)
	return mb
end
--]]

function getModSize( theName)
	return modSizeCache[theName]
end

function isFileDownloading( theFile)
	if filesDownloading[theFile] then
		return true
	else
		return false
	end
end

function downloadMod( theFiles)
	local data = split( theFiles, ",")
	local txd = data[1]
	local dff = data[2]

	filesDownloading[txd] = true
	filesDownloading[dff] = true

	downloadFile( path..txd)
	downloadFile( path..dff)
	--outputChatBox( path..txd)
	--outputChatBox( path..dff)
end

function deleteMod( theFiles)
	local data = split( theFiles, ",")
	local txd = data[1]
	local dff = data[2]

	if fileExists( path..txd) then
		--local txd = fileOpen( path..txd)
		fileDelete( path..txd)
	end
	if fileExists( path..dff) then
		--local dff = fileOpen( path..dff)
		fileDelete( path..dff)
	end
	checkSelectedMod()
end

function toggleMod( theMod, theToggle)
	if not enabledMods[theMod] then
		enabledMods[theMod] = theToggle
	else
		enabledMods[theMod] = theToggle
	end

	local data = split( currentFiles, ",")
	local txd = data[1]
	local dff = data[2]
	if theToggle then
		local txd = engineLoadTXD( path..txd, true)
		engineImportTXD( txd, currentVehicle)
		local dff = engineLoadDFF( path..dff, 0)
		engineReplaceModel( dff, currentVehicle)
	else
		engineRestoreModel( currentVehicle)
	end
end

addEventHandler( "onClientFileDownloadComplete", resourceRoot,
	function( fileName, success)
		filesDownloading[fileName] = false
		outputChatBox( "Mod File "..fileName.." Download Complete.")
		checkSelectedMod()
	end
)

function loadAllMods()
	for name, category in pairs ( modtable) do
		local crow = guiGridListAddRow( GTIemods.gridlist[1])
		guiGridListSetItemText( GTIemods.gridlist[1], crow, 1, name, true, false)
		for i, tmod in pairs (category) do
			local crow = guiGridListAddRow( GTIemods.gridlist[1])

			local name = tmod.info[1]
			local replacer = tmod.info[2]
			local mid = tmod.info[3]
			local idid = tmod.info[4]
			local txd, dff = tmod.files[1], tmod.files[2]

			guiGridListSetItemText( GTIemods.gridlist[1], crow, 1, tmod.info[1], false, false)
			guiGridListSetItemData( GTIemods.gridlist[1], crow, 1, name..";"..replacer..";"..mid..";"..idid..";"..txd..","..dff)
		end
	end
end

function placeData( name, replacer, theType, theSize)
	guiSetText( GTIemods.label[1], "Mod: "..name)
	guiSetText( GTIemods.label[2], "Mod Type: "..replacer)
	guiSetText( GTIemods.label[3], "Replacement Vehicle: "..theType)
	if theSize then
		guiSetText( GTIemods.label[4], "Mod Size: "..theSize.." MB")
	else
		guiSetText( GTIemods.label[4], "Mod Size: ")
	end
end

function setModStatus( dlStatus, status)
	if dlStatus then
		guiSetText( GTIemods.label[6], "Downloaded: "..dlStatus)
	end
	if status then
		guiSetText( GTIemods.label[7], "Status: "..status)
	end
end

function checkSelectedMod()
	local installed = isModInstalled(currentFiles)
	if installed then
		setModStatus( "Yes")
		setButtonLayout( 2)
		if isModEnabled( currentID) then
			setModStatus( _, "Enabled")
		else
			setModStatus( _, "Disabled")
		end
	else
		setModStatus( "No", "Disabled")
		setButtonLayout( 1)
	end
end

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIemods.gridlist[1] then
			local sRow, sCol = guiGridListGetSelectedItem( source)
			local data = guiGridListGetItemData( source, sRow, sCol)
			if data then
				local data = split( data, ";")
				local name = data[1]
				local rep = data[2]
				local id = tonumber(data[3])
				local tid = inumber[id]

				local files = data[5]

				local idid = data[4]
				local size = getModSize( idid)

				currentFiles = files
				currentID = idid
				currentVehicle = rep
				placeData( name, getVehicleNameFromModel(rep), tid, size)

				local installed = isModInstalled(files)
				if installed then
					setButtonLayout( 2)
					setModStatus( "Yes")
					if isModEnabled( idid) then
						setModStatus( _, "Enabled")
					else
						setModStatus( _, "Disabled")
					end
				else
					setButtonLayout( 1)
					setModStatus( "No", "Disabled")
				end
			else
				setButtonLayout( 0)
				placeData( "", "", "", "")
				currentFiles = ""
				currentID = ""
			end
		elseif source == GTIemods.button[1] then
			local installed = isModInstalled( currentFiles)
			if not installed then
				downloadMod( currentFiles)
			end
		elseif source == GTIemods.button[2] then
			local installed = isModInstalled( currentFiles)
			if installed then
				if not isModEnabled( currentID) then
					toggleMod( currentID, true)
				else
					toggleMod( currentID, nil)
				end
			end
			checkSelectedMod()
		elseif source == GTIemods.button[3] then
			local installed = isModInstalled( currentFiles)
			if installed then
				if isModEnabled( currentID) then
					toggleMod( currentID, nil)
				end
				deleteMod( currentFiles)
				checkSelectedMod()
			end
		end
	end
)

addCommandHandler( "mods",
	function( commandName)
		if not guiGetVisible( GTIemods.window[1]) then
			showModsWindow( true)
			loadAllMods()
		else
			showModsWindow( false)
		end
	end
)
