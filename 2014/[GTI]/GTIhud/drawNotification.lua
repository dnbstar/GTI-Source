----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 18 Jan 2014
-- Resource: GTIhud/drawNotification.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local DXNotifications = {}
local DXNoteSorted = {}

local sX,sY = guiGetScreenSize()
local aX,aY = (sX/2), (sY*0.05)+12
local font = "bankgothic"

local Z_OFFSET = 17

-- Draw Notification
--------------------->>

function drawNote(id, text, r, g, b, timer)
	if (type(id) ~= "string" or type(text) ~= "string" or 
		type(r) ~= "number" or type(g) ~= "number" or type(b) ~= "number") then return false end
	if (timer and type(timer) ~= "number") then return false end
	if (r > 255 or g > 255 or b > 255) then return false end
	
	local iNotes = #DXNoteSorted
	
	if (text == "") then
		DXNotifications[id] = nil
		for i,v in ipairs(DXNoteSorted) do
			if (v == id) then
				table.remove(DXNoteSorted, i)
				break
			end
		end
		return true
	end
	
	if (not DXNotifications[id]) then
		DXNotifications[id] = {text, r, g, b}
		if (timer) then
			local tick = getTickCount()+timer
			DXNotifications[id][5] = tick
		end
		table.insert(DXNoteSorted, id)
	else
		DXNotifications[id][1] = text
		DXNotifications[id][2] = r
		DXNotifications[id][3] = g
		DXNotifications[id][4] = b
		if (timer) then
			local tick = getTickCount()+timer
			DXNotifications[id][5] = tick
		end
	end
	
	if (iNotes == 0) then
		addEventHandler("onClientRender", root, renderDXNotification)
	end
	playSoundFrontEnd(11)
	return true
end
addEvent("GTIhud.drawNote", true)
addEventHandler("GTIhud.drawNote", root, drawNote)

-- Render Notification
----------------------->>

function renderDXNotification()
	if (#DXNoteSorted == 0) then
		removeEventHandler("onClientRender", root, renderDXNotification)
	end
	
	for i,id in ipairs(DXNoteSorted) do
		local v = DXNotifications[id]
		if (not v[5] or v[5] > getTickCount()) then
			local shadow = string.gsub(v[1], "#%x%x%x%x%x%x", "")
			dxDrawText(shadow, aX+1, aY+( (i-1)*Z_OFFSET)+1, aX+1, aY+( (i-1)*Z_OFFSET)+1, tocolor(0, 0, 0, 255), 0.6, font, "center", "center", false, false, false, false, true)
			dxDrawText(v[1], aX, aY+( (i-1)*Z_OFFSET), aX, aY+( (i-1)*Z_OFFSET), tocolor(v[2], v[3], v[4], 255), 0.6, font, "center", "center", false, false, false, true, true)
		else
			DXNotifications[id] = nil
			table.remove(DXNoteSorted, i)
		end
	end
end
