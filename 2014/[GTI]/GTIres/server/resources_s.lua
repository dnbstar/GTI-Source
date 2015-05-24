resources = {}

function getAllResources()
	--Fetching All Resources and Information
	local account = getAccountName( getPlayerAccount( source))
	for index, res in ipairs(getResources()) do
		local name = getResourceName(res)
		local state = getResourceState(getResourceFromName(name))
		local author = getResourceInfo(getResourceFromName(name), "author")
		local description = getResourceInfo(getResourceFromName(name), "description")
		local version = getResourceInfo(getResourceFromName(name), "version")
		local theType = getResourceInfo(getResourceFromName(name), "type")
		local fullName = getResourceInfo(getResourceFromName(name), "name")
		--
		local lastStart = getResourceLastStartTime( getResourceFromName(name))
		--
		table.insert(resources, {name, state, author, description, version, theType, fullName, lastStart})
	end
	if isObjectInACLGroup( "user."..account, aclGetGroup("Dev")) then
		triggerClientEvent(source, "GTIres.addResources", source, resources, true)
	else
		triggerClientEvent(source, "GTIres.addResources", source, resources, false)
	end
	resources = {}
end
addEvent("GTIres.getAllResources", true)
addEventHandler("GTIres.getAllResources", root, getAllResources)

function selectedResourceOption( theResource, theOption)
	if theResource then
		if theOption then
			local resource = getResourceFromName( theResource)
			if theOption == "start" then
				startResource( resource)
			elseif theOption == "restart" then
				restartResource( resource)
			elseif theOption == "stop" then
				stopResource( resource)
			end
		end
		getAllResources()
		triggerClientEvent(source, "GTIres.getResourceInfo", source, theResource)
	end
end
addEvent("GTIres.selectedResourceOption", true)
addEventHandler("GTIres.selectedResourceOption", root, selectedResourceOption)
