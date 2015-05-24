entries = {}
blip = {}
pickup = {}
ids = {}

--[[Colors
	Blue: 92, 179, 255
	DX Green: 92, 145, 96
	GUI Green: 97, 255, 92
	Red: 145, 92, 92
--]]

hID = nil

levels = {
	[0] = "Small Venture I",
	[1] = "Small Venture II",
	[2] = "Medium Venture I",
	[3] = "Medium Venture II",
	[4] = "High Roller I",
	[5] = "High Roller II",
}

addEvent( "GTIbusiness.addBusiness", true)
addEventHandler( "GTIbusiness.addBusiness", root,
	function( id, name, status, owner, x, y, z, cost, type, level, plrAcc)
		hID = id
		guiSetInputMode( "no_binds_when_editing")
		table.insert(entries, {id, name, x, y, z, status, owner, cost, type})
		--guiSetText( memo, "[tr][td]"..v[2].."[/td][td][color=green]$"..formatNumber(v[8]).."[/color][/td][/tr]")
		--outputChatBox( "[tr][td]"..getZoneName( x, y, z).." "..name.."[/td][td][color=green]$"..formatNumber(cost).."[/color][/td][/tr]")
		--col = createColSphere( x, y, z+1, 1.5)
		pickup[tonumber(id)] = createPickup( x, y, z+1, 3, 1274)
		if name then
			if status == "false" then
				setElementData( pickup[tonumber(id)], "bname", name)
				setElementData( pickup[tonumber(id)], "name", getZoneName( x, y, z).." "..name.."\n $"..formatNumber(cost).." - For Sale")
				setElementData( pickup[tonumber(id)], "ownership", "true;false")
			elseif status == "true" then
				setElementData( pickup[tonumber(id)], "bname", name)
				setElementData( pickup[tonumber(id)], "name", getZoneName( x, y, z).." "..name.."\n $"..formatNumber(cost).." - Owned")
				setElementData( pickup[tonumber(id)], "ownership", "false;"..owner)
			end
		end
		setElementData( pickup[tonumber(id)], "id", id)
		setElementData( pickup[tonumber(id)], "cost", cost)
		--[[
		if status == "false" then
			blip[tonumber(id)] = exports.customblips:createCustomBlip( x, y, 16, 16, "files/business.png", 450)
			ids[tonumber(id)] = blip[tonumber(id)]
		elseif status == "true" then
			blip[tonumber(id)] = exports.customblips:createCustomBlip( x, y, 16, 16, "files/bowned.png", 450)
			ids[tonumber(id)] = blip[tonumber(id)]
		end
		--]]
		addEventHandler( "onClientPickupHit", pickup[tonumber(id)], businessEntry)
		addEventHandler( "onClientPickupLeave", pickup[tonumber(id)], businessLeave)
	end
)

function editBusiness( option, id, namer, bX, bY, bZ, cost, owner, desc)
	if not option and id then return end
	if option == "bought" then
		--[[
		exports.customblips:destroyCustomBlip( blip[tonumber(id)])
		blip[tonumber(id)] = nil
		blip[tonumber(id)] = exports.customblips:createCustomBlip( bX, bY, 16, 16, "files/bowned.png", 450)
		--]]
		setElementData( pickup[tonumber(id)], "name", getZoneName( bX, bY, bZ).." "..namer.."\n $"..formatNumber(cost).." - Owned")
		setElementData( pickup[tonumber(id)], "ownership", "false;"..owner)
	elseif option == "sold" then
		--[[
		exports.customblips:destroyCustomBlip( blip[tonumber(id)])
		blip[tonumber(id)] = nil
		blip[tonumber(id)] = exports.customblips:createCustomBlip( bX, bY, 16, 16, "files/business.png", 450)
		--]]
		setElementData( pickup[tonumber(id)], "name", getZoneName( bX, bY, bZ).." "..namer.."\n $"..formatNumber(cost).." - For Sale")
		setElementData( pickup[tonumber(id)], "ownership", "true;false")
	elseif option == "edited" then
		local sdata = getElementData(pickup[tonumber(id)], "ownership")
		local status = split(sdata, ";")
		if status[1] == "true" then
			setElementData( pickup[tonumber(id)], "name", getZoneName( bX, bY, bZ).." "..namer.."\n $"..formatNumber(cost).." - For Sale")
		elseif status[1] == "false" then
			setElementData( pickup[tonumber(id)], "name", getZoneName( bX, bY, bZ).." "..namer.."\n $"..formatNumber(cost).." - Owned")
		end
	end
end
addEvent( "GTIbusiness.updateClientData", true)
addEventHandler( "GTIbusiness.updateClientData", root, editBusiness)

function businessEntry( hitElement, matchingDim)
	if isElement( hitElement) and isPlayerInVehicle( hitElement) == false and isPedOnGround( hitElement) then
		if hitElement ~= localPlayer then return end
		local name = getElementData( source, "bname")
		local sname = getElementData( source, "name")
		local id = getElementData( source, "id")
		viewBusinessGUI( true)
		triggerServerEvent( "GTIbusiness.getBusinessDetails", hitElement, id)
		triggerServerEvent( "GTIbusiness.verifyBusinessOwnership", localPlayer, id)
	end
end

function businessLeave( thePlayer, matchingDim)
	if isElement( thePlayer) and isPlayerInVehicle( thePlayer) == false and isPedOnGround( thePlayer) then
		if thePlayer ~= localPlayer then return end
		viewBusinessGUI( false)
	end
end

function renderPickupNames()
	for i,pickup in ipairs(getElementsByType("pickup", resourceRoot, true)) do
		local px, py, pz = getCameraMatrix()
		if not isElement( pickup) then return end
		local name = getElementData(pickup, "name")
		local sdata = getElementData(pickup, "ownership")
		local status = split(sdata, ";")
		local cost = getElementData( pickup, "cost")
		--
		local tx, ty, tz = getElementPosition(pickup)
		local tick = getTickCount()/350
		local hover = math.sin(tick) * 10
		--
		if (name) then
			tz = tz + 0.55
			local dist = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
			if (dist < 10) then
				local money = getPlayerMoney( localPlayer)
				if status[1] == "true" then
					if money >= cost then
						color1, color2, color3 = 92, 145, 96
					else
						color1, color2, color3 = 145, 92, 92
					end
				elseif status[1] == "false" then
					color1, color2, color3 = 92, 179, 255
				end
				if (isLineOfSightClear(px, py, pz, tx, ty, tz, true, true, false, true, true, false, false)) then
					local x,y = getScreenFromWorldPosition(tx, ty, tz)
					if (x) then
						local width = dxGetTextWidth(name,1,"clear")
						--
						--dxDrawRectangle( x-45, y-15, 100, 2, tocolor( 255, 255, 20))
						dxDrawRectangle( x-(width/1.8), y-18+hover, width+16, 34, tocolor( 0, 0, 0, 150), false) -- Box
						dxDrawRectangle( x-(width/1.8), y-18+hover, width+16, 2, tocolor( color1-25, color2-25, color3-25, 255), false) -- Line
						--
						dxDrawText(name, x+1, y+1+(hover*2), x+1, y+1, tocolor(0,0,0), 1, "clear", "center", "center", false, false, false, false, false)
						dxDrawText(name, x, y+(hover*2), x, y, tocolor(color1,color2,color3), 1, "clear", "center", "center", false, false, false, false, false)
						--
					end
				end
			end
		end
	end
end
addEventHandler("onClientRender", root, renderPickupNames)

function formatNumber(v)
	v = tonumber(v)
	if v then
		local s = string.format("%d", math.floor(v))
		local pos = string.len(s) % 3
		if pos == 0 then pos = 3 end
		return string.sub(s, 1, pos)
			.. string.gsub(string.sub(s, pos+1), "(...)", ",%1")
	else
		return false
	end
end
