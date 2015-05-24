------------------------------------------------------------------------------------
--  PROJECT:     Grand Theft International
--  RIGHTS:      All rights reserved by developers
--  FILE:        GTIpoliceBarriers/core/barrierCore_c.lua
--  PURPOSE:     Police Barriers, client part.
--  DEVELOPERS:  Tomas Caram (Ares)
------------------------------------------------------------------------------------
--[[function setObjectBreakable_f(object)
setObjectBreakable(object,false)
local players = getElementsByType("player")
local crimteam = getTeamFromName("Criminals")
	for key,value in ipairs (players) do
		if getPlayerTeam(value) == crimteam then
			setElementCollidableWith(object,value,true)
		else
			setElementCollidableWith(object,value,true)
		end
	end
end
addEvent("GTIpoliceBarriers.setObjectBreakable",true)
addEventHandler("GTIpoliceBarriers.setObjectBreakable",resourceRoot,setObjectBreakable_f)]]

function onClientClickABarrier(button,state,_,_,_,_,_,element)
	if button == "left" and state == "down" then
		if element then
			if getElementModel(element) == 1228 or getElementModel(element) == 1459 or getElementModel(element) == 1423 or getElementModel(element) == 1427 then
				if getElementData(element,"GTIpoliceBarriers.isABarrier") then 
					if exports.GTIutil:isPlayerInTeam(localPlayer,"Government") then
						triggerServerEvent("GTIpoliceBarriers.destroyElement",resourceRoot,element)
					else
						if getElementData(element,"GTIpoliceBarriers.owner") == localPlayer then
							triggerServerEvent("GTIpoliceBarriers.destroyElement",resourceRoot,element)
							else
							exports.GTIhud:dm("You only can remove your own barriers",255,0,0)
						end
					end	
				end
			end
		end
	end
end
addEventHandler("onClientClick",root,onClientClickABarrier)