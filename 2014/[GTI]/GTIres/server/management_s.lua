acls = {}
aclGroups = {}
aclRights = {}
aclGroupObjects = {}
aclGACLs = {}

function accessPanel( source)
	local account = getAccountName( getPlayerAccount( source))
	if isObjectInACLGroup( "user."..account, aclGetGroup("Admin")) then
		triggerClientEvent( source, "GTIres.accessManagementPanel", source)
	elseif isObjectInACLGroup( "user."..account, aclGetGroup("Dev")) then
		triggerClientEvent( source, "GTIres.accessManagementPanel", source)
	end
end
addCommandHandler( "management", accessPanel)
addCommandHandler( "manage", accessPanel)

function getAllACLs()
	local account = getAccountName( getPlayerAccount( source))
	if isObjectInACLGroup( "user."..account, aclGetGroup("Admin")) then
		--Fetching ACLs
		for index, acl in ipairs(aclList()) do
			local aname = aclGetName( acl)
			--
			table.insert( acls, {aname})
		end
		--Fetching Groups
		local group = aclGroupList()
		for index, var in ipairs (group) do
			local gname = aclGroupGetName( var)
			local gACL1 = aclGroupListACL( var)
			local gACL = aclGetName( gACL1)
			--
			table.insert( aclGroups, { gname, gACL})
		end
		triggerClientEvent(source, "GTIres.addACLs", source, acls, aclGroups)
		acls = {}
	else
		triggerClientEvent(source, "GTIres.addACLs", source, nil, nil)
	end
end
addEvent("GTIres.getAllACLs", true)
addEventHandler("GTIres.getAllACLs", root, getAllACLs)

function getGroupObjects( group)
	if group == "" then return end
	local objectTable = aclGroupListObjects( aclGetGroup(group))
	local gACLTable = aclGroupListACL( aclGetGroup(group))
	for index, object in pairs ( objectTable) do
		local name = object
		table.insert( aclGroupObjects, { name})
	end
	for index, gacl in pairs( gACLTable) do
		local aname = aclGetName(gacl)
		table.insert( aclGACLs, { aname})
	end
	triggerClientEvent(source, "GTIres.addACLGroupObjects", source, aclGroupObjects, aclGACLs)
	aclGroupObjects = {}
	aclGACLs = {}
end
addEvent("GTIres.getGroupObjects", true)
addEventHandler("GTIres.getGroupObjects", root, getGroupObjects)

function getRightState( acl, right)
	if acl then
		if acl == "" then return end
		if right then
			if aclGetRight( aclGet(acl), right) == true then
				return 0, 255, 0, true
			else
				return 255, 0, 0, false
			end
		end
	end
end

function getACLRights( acl)
	if acl == "" then return end
	local rights = aclListRights( aclGet(acl))
	for index, list in pairs ( rights) do
		local right = list
		local r, g, b, state = getRightState( acl, right)
		table.insert( aclRights, { right, r, g, b, state})
	end
	triggerClientEvent(source, "GTIres.addACLRights", source, aclRights)
	aclRights = {}
end
addEvent("GTIres.getACLRights", true)
addEventHandler("GTIres.getACLRights", root, getACLRights)

function setRightState( acl, right, state)
	if acl then
		if acl == "" then return end
		if right then
			aclSetRight ( aclGet(acl), right, state)
			aclSave()
			getACLRights( acl)
		end
	end
end
addEvent("GTIres.modifyACLRights", true)
addEventHandler("GTIres.modifyACLRights", root, setRightState)

function modifyACL( data1, data2, option)
	if data1 == "" then return end
	if data1 then
		if data2 then
			if option == "add_object" then
				aclGroupAddObject( aclGetGroup(data1), data2)
				aclSave()
				getGroupObjects( data1)
			elseif option == "remove_object" then
				aclGroupRemoveObject( aclGetGroup(data1), data2)
				aclSave()
				getGroupObjects( data1)
			elseif option == "add_right" then
				aclSetRight( aclGet(data1), data2, true)
				aclSave()
				getACLRights( data1)
			elseif option == "remove_right" then
				aclRemoveRight( aclGet(data1), data2)
				aclSave()
				getACLRights( data1)
			elseif option == "add_acl" then
				aclCreate( data2)
				aclSave()
				getAllACLs()
			elseif option == "remove_acl" then
				aclDestroy( aclGet(data2))
				aclSave()
				getAllACLs()
			elseif option == "add_group" then
				aclCreateGroup( data2)
				aclSave()
				getAllACLs()
			elseif option == "remove_group" then
				aclDestroyGroup( aclGetGroup(data2))
				aclSave()
				getAllACLs()
			elseif option == "add_group_acl" then
				aclGroupAddACL( aclGetGroup(data1), aclGet(data2))
				aclSave()
				getGroupObjects( data1)
			elseif option == "remove_group_acl" then
				aclGroupRemoveACL( aclGetGroup(data1), aclGet(data2))
				aclSave()
				getGroupObjects( data1)
			end
		end
	end
end
addEvent("GTIres.modifyACL", true)
addEventHandler("GTIres.modifyACL", root, modifyACL)
