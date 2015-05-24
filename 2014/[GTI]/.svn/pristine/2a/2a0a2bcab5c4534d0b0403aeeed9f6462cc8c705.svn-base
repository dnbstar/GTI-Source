----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 28 Jan 2014
-- Resource: GTIhud/drawAttachedText.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local DXText = {}
local DXTextNumber = 0

local FONT = "default-bold"
local MAX_VEIW_DISTANCE = 75

-- Draw Notification
--------------------->>

function drawTextOnPlayer(attachedTo, text, r, g, b, timer)
	if (not isElement(attachedTo) or type(text) ~= "string" or 
		type(r) ~= "number" or type(g) ~= "number" or type(b) ~= "number") then return false end
	if (timer and type(timer) ~= "number") then return false end
	if (r > 255 or g > 255 or b > 255) then return false end
	
	if (text == "") then
		DXText[attachedTo] = nil
		return true
	end
	
	local oldNumber = DXTextNumber
	DXTextNumber = DXTextNumber + 1
	
	if (not DXText[attachedTo]) then
		DXText[attachedTo] = {text, r, g, b}
		if (timer) then
			local tick = getTickCount()+timer
			DXText[attachedTo][5] = tick
		end
	else
		DXText[attachedTo][1] = text
		DXText[attachedTo][2] = r
		DXText[attachedTo][3] = g
		DXText[attachedTo][4] = b
		if (timer) then
			local tick = getTickCount()+timer
			DXText[attachedTo][5] = tick
		end
	end
	
	if (oldNumber == 0) then
		addEventHandler("onClientRender", root, renderTextOnPlayer)
	end
	return true
end
addEvent("GTIhud.drawTextOnPlayer", true)
addEventHandler("GTIhud.drawTextOnPlayer", root, drawTextOnPlayer)

-- Render Attached Text
------------------------>>

function renderTextOnPlayer()
	if (DXTextNumber == 0) then
		removeEventHandler("onClientRender", root, renderTextOnPlayer)
	end

	local px, py, pz = getCameraMatrix()
    for player,v in pairs(DXText) do
		if (isElement(player)) then
			if (isElementStreamedIn(player)) then
				local tx, ty, tz = getElementPosition(player)
				local dist = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
				if (dist < MAX_VEIW_DISTANCE) then
					if (isLineOfSightClear(px, py, pz, tx, ty, tz, true, false, false, true, false, false, false)) then
						local bx, by, bz = getPedBonePosition(player, 5)
						local x,y = getScreenFromWorldPosition(bx, by, bz + 0.3)
						if (x) then
							if (not v[5] or v[5] > getTickCount()) then
								local text, r, g, b = v[1], v[2], v[3], v[4]
								dxDrawText(text, x+1, y+1, x+1, y+1, tocolor(0,0,0,255), 1, FONT, "center", "center")
								dxDrawText(text, x+1, y-1, x+1, y-1, tocolor(0,0,0,255), 1, FONT, "center", "center")
								dxDrawText(text, x-1, y+1, x-1, y+1, tocolor(0,0,0,255), 1, FONT, "center", "center")
								dxDrawText(text, x-1, y-1, x-1, y-1, tocolor(0,0,0,255), 1, FONT, "center", "center")
								
								dxDrawText(text, x, y, x, y, tocolor(r,g,b,255), 1, FONT, "center", "center")
							else
								DXText[player] = nil
							end
						end
					end
				end
			end
		else
			DXText[player] = nil
		end
	end
end
