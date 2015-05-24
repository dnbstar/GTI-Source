--------------------------------------------
-- What: client.luac
-- By: Diego
-- For: Grand Theft International
-- Description: Misc. client sided scripts as well as bug fixes.
---------------------------------------------

--breakableObjects:
function setOjectsNotBreakable ()
	for i,objects in ipairs(getElementsByType("object")) do
		if (objects) then
			model = getElementModel (objects)
				if model == 3280 or model == 2942 then
					setObjectBreakable(objects, false)
				elseif model == 3872 then
					setElementCollisionsEnabled(objects, false)
			end
		end
	end
end
addEventHandler ("onClientResourceStart", resourceRoot, setOjectsNotBreakable) 

--Airport Ambience sound:
--[[addEventHandler("onClientRender", root, 
	function ()
		local dM = getElementDimension(localPlayer)
		local int = getElementInterior(localPlayer)
			if (dM == 144 or dM == 145 or dM == 146) and (int == 14) then -- If He's inside the airport interior.
				ambience = playSound("http://www.sounddogs.com/previews/36/mp3/291370_SOUNDDOGS__ai.mp3", true)
			elseif (dM = 0) and (int = 0) and isElement(ambience) then
					destroyElement(ambience)
		end
	end
end)]]--
	
	