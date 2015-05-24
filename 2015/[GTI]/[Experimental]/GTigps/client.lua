local floor = math.floor

dX, dY, dID, start, reach = 0, 0, 0, false, false
node = {}

local function getAreaID(x, y)
	return math.floor((y + 3000)/750)*8 + math.floor((x + 3000)/750)
end

local function getNodeByID(db, nodeID)
	local areaID = floor(nodeID / 65536)
	return db[areaID][nodeID]
end

function hitPoint( elem)
	local data = split( getElementData( source, "gpsc"), ",")
	local lastMarker = getElementData( source, "last")
	local x, y, id = data[1], data[2], data[3]
	destroyElement( source)
	removeLinePoint( x, y)
	local miles = getDistanceBetweenPoints2D(x, y, dX, dY)/1609
	if not lastMarker then
		--outputChatBox( "You are "..string.format("%.3f", miles).." mi away from your destination")
		if not isTimer( sayTimer) then
			exports.GTIassistant:queryAssistantSound( "You are "..string.format("%.3f", miles).." mi away from your destination")
			sayTimer = setTimer( function() end, 10000, 1)
		end
	elseif lastMarker and start == true and reach == false then
		exports.GTIassistant:queryAssistantSound( "You have reached your destination.")
		start = false
		reach = true
		removeLinePoints()
		table.each(getElementsByType('colshape'), destroyElement)
	end
end

--[[
addCommandHandler('path',
	function(command, node1, node2)
		if not tonumber(node1) or not tonumber(node2) then
			outputChatBox("Usage: /path node1 node2", 255, 0, 0)
			return
		end
		local path = server.calculatePathByNodeIDs(tonumber(node1), tonumber(node2))
		if not path then
			outputConsole('No path found')
			return
		end
		server.spawnPlayer(getLocalPlayer(), path[1].x, path[1].y, path[1].z)
		dX, dY = path[1].x, path[1].y
		fadeCamera(true)
		setCameraTarget(getLocalPlayer())

		removeLinePoints ( )
		table.each(getElementsByType('marker'), destroyElement)
		for i,node in ipairs(path) do
			--createMarker(node.x, node.y, node.z, 'corona', 5, 50, 0, 255, 200)
			node[i] = createColSphere( node.x, node.y, node.z, 8)
			setElementData( node[i], "gpsc", node.x..","..node.y)
			if node.x == path[1].x  and node.y == path[1].y then
				setElementData( node[i], "last", true)
			else
				setElementData( node[i], "last", false)
			end
			addEventHandler( "onClientColShapeHit", node[i], hitPoint, false)
			addLinePoint ( node.x, node.y )
		end
	end
)
--]]

addCommandHandler('path2',
	function(command, tox, toy, toz)
		dX, dY = 0, 0
		reach = false
		start = false
		if not tonumber(tox) or not tonumber(toy) then
			outputChatBox("Usage: /path2 x y z (z is optional)", 255, 0, 0)
			return
		end
		local x,y,z = getElementPosition( localPlayer)
		local path = server.calculatePathByCoords(x, y, z, tox, toy, toz)
		dX, dY, dID = tox, toy, getAreaID( tox, toy)
		if not path then
			outputConsole('No path found')
			return
		end
		--server.spawnPlayer(getLocalPlayer(), path[1].x, path[1].y, path[1].z)
		--fadeCamera(true)
		--setCameraTarget(getLocalPlayer())

		removeLinePoints ( )
		table.each(getElementsByType('colshape'), destroyElement)
		for i,node in ipairs(path) do
			outputChatBox( tostring( #node))
			--createMarker(node.x, node.y, node.z, 'corona', 5, 50, 0, 255, 200)
			if dID == getAreaID( node.x, node.y) then
				node[i] = createColSphere( node.x, node.y, node.z, 10)
				setElementData( node[i], "gpsc", node.x..","..node.y..","..getAreaID(node.x, node.y).."."..i)
				setElementData( node[i], "last", true)
			else
				node[i] = createColSphere( node.x, node.y, node.z, 5)
				setElementData( node[i], "gpsc", node.x..","..node.y..","..getAreaID(node.x, node.y).."."..i)
				setElementData( node[i], "last", false)
			end
			addEventHandler( "onClientColShapeHit", node[i], hitPoint, false)
			addLinePoint ( node.x, node.y )
		end
		start = true
	end
)

--[[
addEventHandler('onClientRender', getRootElement(),
	function()
		local db = vehicleNodes

		local camX, camY, camZ = getCameraMatrix()
		local x, y, z = getElementPosition(getLocalPlayer())
		local areaID = getAreaID(x, y)
		local drawn = {}
		for id,node in pairs(db[areaID]) do
			if getDistanceBetweenPoints3D(x, y, z, node.x, node.y, z) < 300 then
				--[/[
				local screenX, screenY = getScreenFromWorldPosition(node.x, node.y, node.z)
				if screenX then
					dxDrawText(tostring(id), screenX - 10, screenY - 5)
				end
				--]/]
				--[/[
				for neighbourid,distance in pairs(node.neighbours) do
					if not drawn[neighbourid .. '-' .. id] then
						local neighbour = getNodeByID(db, neighbourid)
						dxDrawLine3D(node.x, node.y, node.z + 1, neighbour.x, neighbour.y, neighbour.z + 1, tocolor(0, 0, 200, 255), 3, false)
						drawn[id .. '-' .. neighbourid] = true
					end
				end
				--]/]
			end
		end
	end
)
--]]

