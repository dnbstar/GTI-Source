------------------------------------------------------------------------------------
--  PROJECT:     Grand Theft International
--  RIGHTS:      All rights reserved by developers
--  FILE:        GTIpoliceBarriers/draw/barrierDraw_c.lua
--  PURPOSE:     Police Barriers, client part.
--  DEVELOPERS:  Tomas Caram (Ares)
------------------------------------------------------------------------------------
function setObjectBreakable_f(object)
setObjectBreakable(object,false)
end
addEvent("GTIpoliceBarriers.setObjectBreakable",true)
addEventHandler("GTIpoliceBarriers.setObjectBreakable",resourceRoot,setObjectBreakable_f)
Display = false
Barrier = false
function onClientPlayerTarget(element)
	if (element) then
		if getControlState("aim_weapon") then
			if getPedWeaponSlot(source) == 1 then return end
				if getElementModel(element) == 1228 or getElementModel(element) == 1459 or getElementModel(element) == 1423 or getElementModel(element) == 1427 then
					if getElementData(element,"GTIpoliceBarriers.isABarrier") then
					Display = true
					Barrier = element
					setTimer(function () Display = false Barrier = false end,3500,1)
					end
				else
				Display = false
				Barrier = false
			end
		end
	end
end
addEventHandler("onClientPlayerTarget",root,onClientPlayerTarget)

local font = dxCreateFont("font/radio.ttf",16)

function draw()
	if isElement(Barrier) then
		if Display then
			local xb,yb,zb = getElementPosition(Barrier)
			local xp,yp,zp = getElementPosition (localPlayer)
			local sx, sy = getScreenFromWorldPosition (xb, yb, zb+1)
				if sx and sy then
					local theDistance = getDistanceBetweenPoints3D(xb, yb, zb, xp, yp, zp)
						if theDistance < 25 then
							dxDrawText ( "Placed by : "..getPlayerName(getElementData(Barrier,"GTIpoliceBarriers.owner")), sx+2, sy+2, sx, sy, tocolor(255,255,255, 255), 0.6, font, "center", "center" )
						end
				end
		end 
	end
end
addEventHandler("onClientPreRender",root,draw)