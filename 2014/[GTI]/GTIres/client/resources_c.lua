srcList = {}
srcAccess = {}

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIres.label[9] then
			if not isTimer( fresh1Timer) then
				guiGridListClear( GTIres.gridlist[1])
				triggerServerEvent( "GTIres.getAllResources", localPlayer)
				fresh1Timer = setTimer( function() end, 5000, 1)
			else
				if not isTimer( antiSpam1Timer) then
					outputChatBox( "You can only fetch the resource list every 5 seconds", 255, 0, 0)
					antiSpam1Timer = setTimer( function() end, 2500, 1)
				end
			end
		elseif source == GTIres.button[1] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem(GTIres.gridlist[1])
			if selectedRow then
				local selectedResource = guiGridListGetItemData( GTIres.gridlist[1], selectedRow, selectedCol)
				if selectedResource then
					triggerServerEvent( "GTIres.selectedResourceOption", localPlayer, selectedResource, "start")
					exports.CRPhelp:dm( "You started the '"..selectedResource.."' resource", 255, 255, 0)
					--
					guiSetEnabled( GTIres.button[1], false)
					guiSetEnabled( GTIres.button[2], true)
					guiSetEnabled( GTIres.button[3], true)
				end
			else
				exports.CRPhelp:dm( "You haven't selected a resource to start.", 255, 0, 0)
			end
		elseif source == GTIres.button[2] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem(GTIres.gridlist[1])
			if selectedRow then
				local selectedResource = guiGridListGetItemData( GTIres.gridlist[1], selectedRow, selectedCol)
				if selectedResource then
					triggerServerEvent( "GTIres.selectedResourceOption", localPlayer, selectedResource, "restart")
					exports.CRPhelp:dm( "You restarted the '"..selectedResource.."' resource", 255, 255, 0)
					--
					guiSetEnabled( GTIres.button[1], true)
					guiSetEnabled( GTIres.button[2], false)
					guiSetEnabled( GTIres.button[3], false)
				end
			else
				exports.CRPhelp:dm( "You haven't selected a resource to restart.", 255, 0, 0)
			end
		elseif source == GTIres.button[3] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem(GTIres.gridlist[1])
			if selectedRow then
				local selectedResource = guiGridListGetItemData( GTIres.gridlist[1], selectedRow, selectedCol)
				if selectedResource then
					triggerServerEvent( "GTIres.selectedResourceOption", localPlayer, selectedResource, "stop")
					exports.CRPhelp:dm( "You stopped the '"..selectedResource.."' resource", 255, 255, 0)
					--
					guiSetEnabled( GTIres.button[1], true)
					guiSetEnabled( GTIres.button[2], false)
					guiSetEnabled( GTIres.button[3], false)
				end
			else
				exports.CRPhelp:dm( "You haven't selected a resource to stop.", 255, 0, 0)
			end
		elseif source == GTIres.gridlist[1] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem(GTIres.gridlist[1])
			local selectedResource = guiGridListGetItemData( GTIres.gridlist[1], selectedRow, selectedCol)
			if not selectedResource then return end
			--
			getInfo( selectedResource)
		elseif source == GTIres.edit[4] then
			local currentSearch = guiGetText( GTIres.edit[4])
			if currentSearch == "Search..." then
				guiSetText( GTIres.edit[4], "")
			end
		end
	end
)

addEventHandler( "onClientGUIChanged", root,
	function( element)
		if source == GTIres.edit[4] then
			guiSetInputMode( "no_binds_when_editing")
			guiGridListClear(GTIres.gridlist[1])
			for index, resl in pairs(srcList) do
				local resourceName = resl[1]
				local resourceState = resl[2]
				if string.find( string.lower(resourceName), string.lower( guiGetText( GTIres.edit[4]))) then
					listRow = guiGridListAddRow( GTIres.gridlist[1])
					guiGridListSetItemText(GTIres.gridlist[1], listRow, nameColumn, resourceName, false, false)
					guiGridListSetItemData(GTIres.gridlist[1], listRow, nameColumn, resourceName)
					guiGridListSetItemText(GTIres.gridlist[1], listRow, stateColum, resourceState, false, false)
				end
			end
		end
	end
)

function setResourceButtons( enable)
	if enable == true then
		if srcAccess[localPlayer] == true then
			guiSetEnabled( GTIres.button[1], false)
			guiSetEnabled( GTIres.button[2], true)
			guiSetEnabled( GTIres.button[3], true)
		else
			guiSetEnabled( GTIres.button[1], false)
			guiSetEnabled( GTIres.button[2], false)
			guiSetEnabled( GTIres.button[3], false)
		end
	elseif enable == false then
		if srcAccess[localPlayer] == true then
			guiSetEnabled( GTIres.button[1], true)
			guiSetEnabled( GTIres.button[2], false)
			guiSetEnabled( GTIres.button[3], false)
		else
			guiSetEnabled( GTIres.button[1], false)
			guiSetEnabled( GTIres.button[2], false)
			guiSetEnabled( GTIres.button[3], false)
		end
	end
end

function getInfo( resource)
	if resource then
		local state = translation[resState[resource]]
		local author = resAuthor[resource]
		local desc = resDecription[resource]
		local version = resVersion[resource]
		local resType = resType[resource]
		local resFName = resName[resource]
		local resStart = resLastStart[resource]
		--
		if state == "Running" then
			setResourceButtons( true)
		end
		if state == "Loaded" then
			setResourceButtons( false)
		end
		--
		guiSetText( GTIres.label[2], "Name: "..resFName)
		guiSetText( GTIres.label[3], "Author: "..author)
		guiSetText( GTIres.label[4], "Version: "..version)
		guiSetText( GTIres.label[6], "Resource Type: "..resType)
		guiSetText( GTIres.label[7], "Resource State: "..state)
		guiSetText( GTIres.memo[1], desc)
	end
end

function getResourceInfo( resourceName)
	if resourceName then
		local state = translation[resState[resourceName]]
		local author = resAuthor[resourceName]
		local desc = resDecription[resourceName]
		local version = resVersion[resourceName]
		local resType = resType[resourceName]
		local resFName = resName[resourceName]
		local resStart = resLastStart[resourceName]
		--
		guiSetText( GTIres.label[2], "Name: "..resFName)
		guiSetText( GTIres.label[3], "Author: "..author)
		guiSetText( GTIres.label[4], "Version: "..version)
		guiSetText( GTIres.label[6], "Resource Type: "..resType)
		guiSetText( GTIres.label[7], "Resource State: "..state)
		guiSetText( GTIres.memo[1], desc)
	end
end
addEvent("GTIres.getResourceInfo", true)
addEventHandler("GTIres.getResourceInfo", root, getResourceInfo)

addEvent( "GTIres.addResources", true)
addEventHandler( "GTIres.addResources", root,
	function( resources, access)
		guiGridListClear(GTIres.gridlist[1])
		addResourcesToList(resources)
		if access == true then
			srcAccess[source] = true
		else
			srcAccess[source] = false
		end
	end
)

function addResourcesToList(resources)
	for index, res in pairs(resources) do
		if (res[2] == "stopping") then
			state = "stopped"
		else
			state = res[2]
		end
		if not res[3] then
			auth = "No Author"
		else
			auth = res[3]
		end
		if not res[4] then
			dec = "No Description"
		else
			dec = res[4]
		end
		if not res[5] then
			ver = "N/A"
		else
			ver = res[5]
		end
		if not res[6] then
			tp = "N/A"
		else
			tp = res[6]
		end
		if not res[7] then
			fn = res[1]
		else
			fn = res[7]
		end
		if (res[8] == "never") then
			std = "Never"
		else
			stf = res[8]
		end
		resState[res[1]] = state
		resAuthor[res[1]] = auth
		resDecription[res[1]] = dec
		resVersion[res[1]] = ver
		resType[res[1]] = tp
		resName[res[1]] = fn
		resLastStart[res[1]] = std
		table.insert( srcList, {res[1], state})
		local row = guiGridListAddRow(GTIres.gridlist[1])
		guiGridListSetItemText(GTIres.gridlist[1], row, nameColumn, res[1], false, false)
		guiGridListSetItemData(GTIres.gridlist[1], row, nameColumn, res[1])
		guiGridListSetItemText(GTIres.gridlist[1], row, stateColum, state, false, false)
	end
end
