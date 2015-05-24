----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 29 Nov 2014
-- Resource: GTIprison/prison.lua
-- Type: Server Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

function renderBusted()
	local x,y = guiGetScreenSize()
	local x,y = x/2, y/2
	dxDrawText("Busted", x+2, y+2, x+2, y+2, tocolor(0,0,0), 3, "pricedown", "center", "center")
	dxDrawText("Busted", x-2, y+2, x-2, y+2, tocolor(0,0,0), 3, "pricedown", "center", "center")
	dxDrawText("Busted", x+2, y-2, x+2, y-2, tocolor(0,0,0), 3, "pricedown", "center", "center")
	dxDrawText("Busted", x-2, y-2, x-2, y-2, tocolor(0,0,0), 3, "pricedown", "center", "center")
	dxDrawText("Busted", x, y, x, y, tocolor(50,200,255), 3, "pricedown", "center", "center")
end