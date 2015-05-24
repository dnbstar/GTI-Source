lastpaths = {}
paths = {},

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
	end
)

local offSet = 18

addEventHandler( "onClientRender", root,
	function()
		--dxDrawImage(351, 0, 900, 900, "map.jpg", 0, 0, 0, tocolor(255, 255, 255, 200), false)
		for i, point in pairs ( lastpaths) do
			local x1, y1, z1 = point[1], point[2], point[3]
			local x2, y2, z2 = point[4], point[5], point[6]
			dxDrawLine3D( x1, y1, z1, x2, y2, z2, tocolor( 255, 255, 255, 75), 2, false)
		end
		for i, point in pairs ( paths) do
			local x1, y1, z1 = point[1], point[2], point[3]
			local x2, y2, z2 = point[4], point[5], point[6]
			local color = split(point[7] or "255,255,255", ",")
			local r, g, b = color[1], color[2], color[3]
			dxDrawLine3D( x1, y1, z1, x2, y2, z2, tocolor( r, g, b, 75), 2, false)

			--dxDrawLine( pX1, pY1, pX2, pY2, 2, tocolor( r, g, b, 255), true)

			--dxDrawText( "#"..i.."| "..x1..", "..y1..", "..z1.." - "..x2..", "..y2..", "..z2, 1262, (i*18)+314, 1461, 346, tocolor(r, g, b, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		end
		dxDrawText( #paths.." formed paths", 1262, 314, 1461, 346, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
	end
)

local lastX, lastY, lastZ = getElementPosition( localPlayer)
local lastX, lastY, lastZ = string.format( "%.3f", lastX), string.format( "%.3f", lastY), string.format( "%.3f", lastZ)

function checkPath()
	local curX, curY, curZ = getElementPosition( localPlayer)
	local curX, curY, curZ = string.format( "%.3f", curX), string.format( "%.3f", curY), string.format( "%.3f", curZ)
	if curX == lastX and curY == lastY and curZ == lastZ then
	else
		if isPedInVehicle( localPlayer) then
			theColor = "255,50,50"
		else
			if isElementInWater( localPlayer) then
				theColor = "50,50,255"
			else
				if doesPedHaveJetPack( localPlayer) then
					theColor = "255,150,0"
				else
					theColor = "50,255,50"
				end
			end
		end
		table.insert( paths, {lastX, lastY, lastZ, curX, curY, curZ, theColor})
		lastX, lastY, lastZ = curX, curY, curZ
	end
end
setTimer( checkPath, 150, 0)
