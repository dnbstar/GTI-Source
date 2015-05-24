----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 24 Jan 2014
-- Resource: GTIhud/drawStat.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local DXStats = {}
local DXStatsSorted = {}

local sX,sY = guiGetScreenSize()
local fontA = "default-bold"
local fontB = "default-bold"

local Z_OFFSET = 35

addEventHandler("onClientResourceStart", resourceRoot, function()
	local Cambria = dxCreateFont("fonts/Cambria.ttf", 12)
	if (Cambria) then fontA = Cambria end
	local Calibri = dxCreateFont("fonts/Calibri.ttf", 20)
	if (Calibri) then fontB = Calibri end
end)

-- Draw Stats
-------------->>

function drawStat(id, columnA, columnB, r, g, b, timer)
	if (type(id) ~= "string" or type(columnA) ~= "string" or type(columnB) ~= "string" or 
		type(r) ~= "number" or type(g) ~= "number" or type(b) ~= "number") then return false end
	if (timer and type(timer) ~= "number") then return false end
	if (r > 255 or g > 255 or b > 255) then return false end
	
	local iNotes = #DXStatsSorted
	
	if (columnA == "") then
		DXStats[id] = nil
		for i,v in ipairs(DXStatsSorted) do
			if (v == id) then
				table.remove(DXStatsSorted, i)
				break
			end
		end
		return true
	end
	
	if (not DXStats[id]) then
		DXStats[id] = {columnA, columnB, r, g, b}
		if (timer) then
			local tick = getTickCount()+timer
			DXStats[id][6] = tick
		end
		table.insert(DXStatsSorted, id)
	else
		DXStats[id][1] = columnA
		DXStats[id][2] = columnB
		DXStats[id][3] = r
		DXStats[id][4] = g
		DXStats[id][5] = b
		if (timer) then
			local tick = getTickCount()+timer
			DXStats[id][6] = tick
		end
	end
	
	if (iNotes == 0) then
		addEventHandler("onClientRender", root, renderDXStat)
	end
	return true
end
addEvent("GTIhud.drawStat", true)
addEventHandler("GTIhud.drawStat", root, drawStat)

-- Render Notification
----------------------->>

function renderDXStat()
	if (#DXStatsSorted == 0) then
		removeEventHandler("onClientRender", root, renderDXStat)
	end
	
	local aX,aY = sX*0.95, sY*0.27
	if (getPlayerWantedLevel() > 0) then
		aY = sY*0.32
	end
	
	local xOffset = 0
	for i,id in ipairs(DXStatsSorted) do
		local v = DXStats[id]
		xOffsetTest = dxGetTextWidth(v[2], 1, fontB)+10
		if (xOffset < xOffsetTest) then
			xOffset = xOffsetTest
		end
	end
	
	for i,id in ipairs(DXStatsSorted) do
		local v = DXStats[id]
		if (not v[6] or v[6] > getTickCount()) then
				-- Column B Outline
			dxDrawText(v[2], aX-1, aY+( (i-1)*Z_OFFSET)-1+4, aX-1, aY+( (i-1)*Z_OFFSET)-1+4, tocolor(0, 0, 0, 255), 1, fontB, "right", "bottom")
			dxDrawText(v[2], aX+1, aY+( (i-1)*Z_OFFSET)-1+4, aX+1, aY+( (i-1)*Z_OFFSET)-1+4, tocolor(0, 0, 0, 255), 1, fontB, "right", "bottom")
			dxDrawText(v[2], aX-1, aY+( (i-1)*Z_OFFSET)+1+4, aX-1, aY+( (i-1)*Z_OFFSET)+1+4, tocolor(0, 0, 0, 255), 1, fontB, "right", "bottom")
			dxDrawText(v[2], aX+1, aY+( (i-1)*Z_OFFSET)+1+4, aX+1, aY+( (i-1)*Z_OFFSET)+1+4, tocolor(0, 0, 0, 255), 1, fontB, "right", "bottom")
				-- Column B Text
			dxDrawText(v[2], aX, aY+( (i-1)*Z_OFFSET)+4, aX, aY+( (i-1)*Z_OFFSET)+4, tocolor(v[3], v[4], v[5], 255), 1, fontB, "right", "bottom")
			
			-- Column A Outline
			dxDrawText(v[1], aX-1-xOffset, aY+( (i-1)*Z_OFFSET)-1, aX-1-xOffset, aY+( (i-1)*Z_OFFSET)-1, tocolor(0, 0, 0, 255), 1, fontA, "right", "bottom")
			dxDrawText(v[1], aX+1-xOffset, aY+( (i-1)*Z_OFFSET)-1, aX+1-xOffset, aY+( (i-1)*Z_OFFSET)-1, tocolor(0, 0, 0, 255), 1, fontA, "right", "bottom")
			dxDrawText(v[1], aX-1-xOffset, aY+( (i-1)*Z_OFFSET)+1, aX-1-xOffset, aY+( (i-1)*Z_OFFSET)+1, tocolor(0, 0, 0, 255), 1, fontA, "right", "bottom")
			dxDrawText(v[1], aX+1-xOffset, aY+( (i-1)*Z_OFFSET)+1, aX+1-xOffset, aY+( (i-1)*Z_OFFSET)+1, tocolor(0, 0, 0, 255), 1, fontA, "right", "bottom")
				-- Column A Text
			dxDrawText(v[1], aX-xOffset, aY+( (i-1)*Z_OFFSET), aX-xOffset, aY+( (i-1)*Z_OFFSET), tocolor(v[3], v[4], v[5], 255), 1, fontA, "right", "bottom")
		else
			DXStats[id] = nil
			table.remove(DXStatsSorted, i)
		end
	end
end
