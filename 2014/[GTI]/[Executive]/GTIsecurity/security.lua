----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 06 Feb 2013
-- Resource: GTIsecurity/security.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

function isMapBeingUsedOnGTI()
	if (getElementData(root, "mapSecurity") == "G32MdAZtHJ9Ajmm9GkuvtFQh") then
		return true
	end
	return false
end

-- Record All Screenshots
-------------------------->>

function recordScreenshot(button, pressed)
	local btn = getKeyBoundToCommand("screenshot")
	if (btn == button and pressed) then
		outputDebugString(getPlayerName(localPlayer).." took a screenshot!")
	end
end
addEventHandler("onClientKey", root, recordScreenshot)
