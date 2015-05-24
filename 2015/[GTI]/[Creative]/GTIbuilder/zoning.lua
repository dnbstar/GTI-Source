local lineWidth = 8
local xOnset = 50
local yOnset = 20
local yOffset = 0
hzones = {}
zdata = {
	data = {},
}

houseZones = {
	-- { X, Y, Z, Zone Size, "Columns,Rows", "xRoadsize,yRoadsize", cost},
	{ 2969.701, -1559.420, 10.569, 50, "8,13", "10,10", 750000},
}

--[
function generateZones()
	for k, loc in pairs (houseZones) do
		local fX, fY, fZ = loc[1], loc[2], loc[3]
		local fSize = loc[4]
		local gridData = split( loc[5], ",")
		local columns = gridData[1]
		local rows = gridData[2]
		local roadData = split( loc[6], ",")
		local xOnset = roadData[1]
		local yOnset = roadData[2]
		for index = 1, columns do
			for sIndex = 1, rows do
				local fX, fY = ((fSize+xOnset)*index)+(fX-(fSize+xOnset)), ((fSize+yOnset)*sIndex)+(fY-(fSize+(yOnset)))
				local col = createColRectangle( fX, fY, fSize, fSize)
				local propertyEditorMarker = createMarker( fX+2, fY+2, fZ-1, "cylinder", 2, 255, 255, 255, 175)
				local area = createRadarArea( fX, fY, fSize, fSize, 255, 255, 255, 175)
				table.insert( hzones, {fX, fY, fZ, fSize})
			end
		end
	end
end
--]]

function setzoneData( zone, key, data)
	if not zdata.data[zone] then
		zdata.data[zone] = {}
	end
	zdata.data[zone][key] = data
end

function getzoneData( zone, key)
	if zdata.data[zone] then
		local data = zdata.data[zone][key]
		if data then
			return data
		else
			return false
		end
	else
		return false
	end
end

function generateZones( pos, size, owner, color, i, cost, viewname, id)
	local pos = split( pos, ",")
	local fX, fY, fZ = pos[1], pos[2], pos[3]
	local fSize = size

	local colord = split( color, ",")
	local r, g, b = colord[1], colord[2], colord[3]

	local col = createColRectangle( fX, fY, fSize, fSize)
	local propertyEditorMarker = createMarker( fX+2, fY+2, fZ-1, "cylinder", 2, r, g, b, 175)
	local pEcol = createColTube( fX+2, fY+2, fZ-1, 1, 2)
	local area = createRadarArea( fX, fY, fSize, fSize, r, g, b, 175)
	table.insert( hzones, {fX, fY, fZ, fSize, color})

	setzoneData( col, "zoneStatus", status)
	setzoneData( col, "zoneName", viewname)
	setzoneData( col, "zonePrice", cost)
	setzoneData( col, "zoneNumber", i)
	setzoneData( col, "zoneOwner", owner)
	setzoneData( col, "zoneColor", color)
	setzoneData( col, "zoneSize", fSize)
	setzoneData( col, "zoneID", id)
	addEventHandler( "onClientColShapeHit", col, onZoneEnter)
	addEventHandler( "onClientColShapeLeave", col, onZoneLeave)
end
--addEvent( "GTIbuilder.pushZoneDataToClient", true)
--addEventHandler( "GTIbuilder.pushZoneDataToClient", root, generateZones)

--[[ Zone Status Colors:

	Blue: Sold ( 0, 153, 204)
	Green: For Sale ( 0, 153, 0)
--]]

local renderCol = {}

function getZoneCenter( id)
	if type(renderCol[id]) == "table" then
		for i, data in pairs ( renderCol[id]) do
			local fX, fY, fZ = data[1], data[2]
			local fSize = data[4]

			local cX, cY = fX+(fSize/2), fY+(fSize/2)

			return cX, cY
		end
	end
end

function onZoneEnter( hitElement)
	if getElementType( hitElement) == "vehicle" then
		hitElement = getVehicleController( hitElement)
	else
		hitElement = hitElement
	end
	if not hitElement == localPlayer then return end
	--
	local fX, fY, fZ = getElementPosition( source)
	local fZ = 9.8
	local fSize = getzoneData( source, "zoneSize")
	--
	local num = getzoneData( source, "zoneNumber")
	local name = getzoneData( source, "zoneName")
	local price = getzoneData( source, "zonePrice")
	local owner = getzoneData( source, "zoneOwner")
	local color = getzoneData( source, "zoneColor")
	local id = getzoneData( source, "zoneID")
	local color = split( color, ",")
	local r, g, b = color[1], color[2], color[3]
	local r, g, b = tonumber(r), tonumber(g), tonumber(b)
	if owner then
		if r ~= 255 or g ~= 255 or b ~= 255 then
			triggerServerEvent( "GTIbuilder.viewZoneNotice", localPlayer, hitElement, "zoneShowName", "#"..num.." - "..name.." ( Owner: "..owner..")", r, g, b, id)
		else
			triggerServerEvent( "GTIbuilder.viewZoneNotice", localPlayer, hitElement, "zoneShowName", "#"..num.." - "..name.." ( Owner: "..owner..")", 0, 153, 204, id)
		end
	else
		triggerServerEvent( "GTIbuilder.viewZoneNotice", localPlayer, hitElement, "zoneShowPrice", "For Sale. Price: $"..exports.GTIutil:tocomma(price), 0, 153, 0)
		triggerServerEvent( "GTIbuilder.viewZoneNotice", localPlayer, hitElement, "zoneShowName", "#"..num.." - "..name, 0, 153, 0)
	end
	if not renderCol[tostring(num)] then
		renderCol[tostring(num)] = {}
		table.insert( renderCol[tostring(num)], {fX, fY, fZ, fSize})
	end
end

function onZoneLeave( leaveElement)
	if not leaveElement == localPlayer then return end
	local id = getzoneData( source, "zoneID")
	triggerServerEvent( "GTIbuilder.viewZoneNotice", localPlayer, leaveElement, "zoneShowName", "", 255, 255, 255)
	triggerServerEvent( "GTIbuilder.viewZoneNotice", localPlayer, leaveElement, "zoneShowPrice", "", 255, 255, 255, id)
	if renderCol[source] then
		renderCol[source] = nil
	end
end

function addZoneToDatabase()
	for i, zoneData in ipairs ( hzones) do
		local x, y, z = zoneData[1], zoneData[2], zoneData[3]
		local size = zoneData[4]
		--
		local owner = "false"
		local color = "255,255,255"
		local id = zoneData[5]
		--
		triggerServerEvent( "GTIbuilder.addZoneToDatabase", resourceRoot, x, y, z, size, owner, color, i)
	end
end

--[
addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		generateZones()
	end
)
--]]

local emodeS = 0.5
local bold = 2
local row = 10

addEventHandler( "onClientRender", root,
	function()
		local pX, pY, pZ = getElementPosition( localPlayer)
		for i, zone in ipairs ( hzones) do
			local fX, fY, fZ = zone[1], zone[2], zone[3]
			--local fL, fW, fH = zone[4], zone[5], zone[6]
			local fSize = zone[4]
			local fZ = fZ-0.85

			local color = split( zone[5], ",")
			local r, g, b = color[1], color[2], color[3]

			local d1 = getDistanceBetweenPoints2D( pX, pY, fX, fY)
			local d2 = getDistanceBetweenPoints2D( pX, pY, fX+fSize, fY)
			local d3 = getDistanceBetweenPoints2D( pX, pY, fX+fSize, fY+fSize)
			local d4 = getDistanceBetweenPoints2D( pX, pY, fX, fY+fSize)

			if d1 <= maximumStreamDist or d2 <= maximumStreamDist or d3 <= maximumStreamDist or d4 <= maximumStreamDist then
			--if distance <= maximumStreamDist then
				dxDrawLine3D( fX, fY, fZ, fX+fSize, fY, fZ, tocolor( r, g, b, 200), lineWidth) -- Start X
				dxDrawLine3D( fX+fSize, fY, fZ, fX+fSize, fY+fSize, fZ, tocolor( r, g, b, 200), lineWidth) -- Start Y
				dxDrawLine3D( fX, fY, fZ, fX, fY+fSize, fZ, tocolor( r, g, b, 200), lineWidth) -- End X
				dxDrawLine3D( fX, fY+fSize, fZ, fX+fSize, fY+fSize, fZ, tocolor( r, g, b, 200), lineWidth) -- End Y
			end
		end
	end
)

function toggleEditorMode( state)
	if state then
		addEventHandler( "onClientRender", root, renderEditorFrame)
	else
		removeEventHandler( "onClientRender", root, renderEditorFrame)
	end
end
addEvent( "GTIbuilder.toggleEditorMode", true)
addEventHandler( "GTIbuilder.toggleEditorMode", root, toggleEditorMode)

function renderEditorFrame()
		local pX, pY, pZ = getElementPosition( localPlayer)
		for name, category in pairs ( renderCol) do
			for i, zone in pairs ( category) do
				local fX, fY, fZ = zone[1], zone[2], zone[3]
				--local fL, fW, fH = zone[4], zone[5], zone[6]
				local fSize = zone[4]

				local d1 = getDistanceBetweenPoints2D( pX, pY, fX, fY)
				local d2 = getDistanceBetweenPoints2D( pX, pY, fX+fSize, fY)
				local d3 = getDistanceBetweenPoints2D( pX, pY, fX+fSize, fY+fSize)
				local d4 = getDistanceBetweenPoints2D( pX, pY, fX, fY+fSize)
				if d1 <= 50 or d2 <= 50 or d3 <= 50 or d4 <= 50 then
					--Halfway Points
					dxDrawLine3D( fX+(fSize/2), fY+(fSize/2)+emodeS, fZ, fX+(fSize/2), fY+(fSize/2)-emodeS, fZ, tocolor( 255, 0, 0, 200), lineWidth) -- Start X
					dxDrawLine3D( fX+(fSize/2)+emodeS, fY+(fSize/2), fZ, fX+(fSize/2)-emodeS, fY+(fSize/2), fZ, tocolor( 255, 0, 0, 200), lineWidth) -- Start Y
					for col = 1, (row)-1 do
						dxDrawLine3D( fX, fY, fZ+col, fX+fSize, fY, fZ+col, tocolor( 255, 255, 255, 100), (lineWidth/2))
						dxDrawLine3D( fX, fY, fZ+col, fX, fY+fSize, fZ+col, tocolor( 255, 255, 255, 100), (lineWidth/2))
						dxDrawLine3D( fX, fY+fSize, fZ+col, fX+fSize, fY+fSize, fZ+col, tocolor( 255, 255, 255, 100), (lineWidth/2))
						dxDrawLine3D( fX+fSize, fY, fZ+col, fX+fSize, fY+fSize, fZ+col, tocolor( 255, 255, 255, 100), (lineWidth/2))
					end
					for col = 0, row*5 do
						dxDrawLine3D( fX+col, fY, fZ, fX+col, fY, fZ+(row-1), tocolor( 255, 255, 255, 100), (lineWidth/2))
						dxDrawLine3D( fX+fSize, fY+col, fZ, fX+fSize, fY+col, fZ+(row-1), tocolor( 255, 255, 255, 100), (lineWidth/2))
						dxDrawLine3D( fX, fY+col, fZ, fX, fY+col, fZ+(row-1), tocolor( 255, 255, 255, 100), (lineWidth/2))
						dxDrawLine3D( fX+col, fY+fSize, fZ, fX+col, fY+fSize, fZ+(row-1), tocolor( 255, 255, 255, 100), (lineWidth/2))
						-- Ground Mesh
						dxDrawLine3D( fX+col, fY, fZ, fX+col, fY+fSize, fZ, tocolor( 255, 0, 0, 100), (lineWidth/2))
						dxDrawLine3D( fX, fY+col, fZ, fX+fSize, fY+col, fZ, tocolor( 255, 0, 0, 100), (lineWidth/2))
					end
				end
			end
		end
end
