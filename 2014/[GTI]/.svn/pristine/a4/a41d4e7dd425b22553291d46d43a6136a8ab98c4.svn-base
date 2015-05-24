----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 01 Jan 2014
-- Resource: GTIinteriors/interiorMarkers.slua
-- Type: Server Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

addEvent("onClientInteriorEnter", true)
addEvent("onClientInteriorExit", true)

-- Animate Markers
------------------->>

local timer = setTimer(function() end, 1000, 0)
function animateMarkers()
	for i,marker in ipairs(getElementsByType("marker", resourceRoot, true)) do
		local orgZ = getElementData(marker, "originalZ")
		local zT = getTimerDetails(timer)
		if (zT > 500) then
			z2 = (zT-500)/500*0.75
		else
			z2 = (500-zT)/500*0.75
		end
		local x,y,z = getElementPosition(marker)
		setElementPosition(marker, x, y, orgZ+z2)
	end
end
addEventHandler("onClientRender", root, animateMarkers)