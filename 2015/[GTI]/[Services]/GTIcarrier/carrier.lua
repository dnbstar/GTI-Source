local GTIPhone = exports.GTIdroid:getGTIDroid()
local screenW, screenH = guiGetScreenSize()
local resX, resY = 1366, 768
--local X_OFF,Y_OFF = -110, -135
local X_OFF,Y_OFF = 0, 0

function aToR( X, Y, sX, sY)
    local sW, sH = guiGetScreenSize()
    local xd = X/resX or X
    local yd = Y/resY or Y
    local xsd = sX/resX or sX
    local ysd = sY/resY or sY
    return xd*sW, yd*sH, xsd*sW, ysd*sH
end

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		font = dxCreateFont(":GTIdroid/fonts/Roboto.ttf")
	end
)

-->> Contain Blinking
local blink = false
function onBlink()
	if not blink then
		blink = false
	else
		blink = true
	end
end
setTimer( onBlink, 5000, 0)

--->> Carrier DX
addEventHandler( "onClientRender", root,
	function()
		local signalStrength = getElementData( localPlayer, "droidSignalStrength") or 0
		local gdx, gdy = guiGetPosition(GTIPhone, false)
		local x, y = gdx+25-2, gdy+58+1

		if exports.GTIdroid:isGTIDroidOpen() then
			-->> Phone Carrier Nametag

			local carrier = getElementData( localPlayer, "droidCarrier") or "No Carrier"
			if signalStrength == 0 then carrier = "No Signal" end
			--dxDrawText( carrier, cvX1, cvY1, cvSX1, cvSY1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
			--dxDrawText( carrier, cvX2, cvY2, cvSX2, cvSY2, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, true, false, false)
			dxDrawText( carrier, x, y, x, y, tocolor(0, 0, 0, 255), 1.00, "default", "left", "center", false, false, true, false, false)
			dxDrawText( carrier, x, y-2, x, y-2, tocolor(0, 0, 0, 255), 1.00, "default", "left", "center", false, false, true, false, false)
			dxDrawText( carrier, x+1, y, x+1, y, tocolor(0, 0, 0, 255), 1.00, "default", "left", "center", false, false, true, false, false)
			dxDrawText( carrier, x-1, y, x-1, y, tocolor(0, 0, 0, 255), 1.00, "default", "left", "center", false, false, true, false, false)
			dxDrawText( carrier, x, y-1, x, y-1, tocolor(255, 255, 255, 255), 1.00, "default", "left", "center", false, false, true, false, false)

			-->> Phone Carrier Signal Bars

			local offsbX, offsbY = 12, -3
			local sbX1, sbY1, sbSX1, sbSY1 = aToR( 1109+(offsbX+4), 218+(gdy-157)+offsbY, 2, 4)
			local sbX2, sbY2, sbSX2, sbSY2 = aToR( 1113+(offsbX+4), 216+(gdy-157)+offsbY, 2, 6)
			local sbX3, sbY3, sbSX3, sbSY3 = aToR( 1117+(offsbX+4), 214+(gdy-157)+offsbY, 2, 8)
			if signalStrength <= 40 and signalStrength >= 15 then
				dxDrawRectangle( sbX1, sbY1, sbSX1, sbSY1, tocolor(255, 255, 255, 255), true)
			elseif signalStrength <= 60 and signalStrength >= 40 then
				dxDrawRectangle( sbX1, sbY1, sbSX1, sbSY1, tocolor(255, 255, 255, 255), true)
				dxDrawRectangle( sbX2, sbY2, sbSX2, sbSY2, tocolor(255, 255, 255, 255), true)
			elseif signalStrength <= 120 and signalStrength >= 60 then
				dxDrawRectangle( sbX1, sbY1, sbSX1, sbSY1, tocolor(255, 255, 255, 255), true)
				dxDrawRectangle( sbX2, sbY2, sbSX2, sbSY2, tocolor(255, 255, 255, 255), true)
				dxDrawRectangle( sbX3, sbY3, sbSX3, sbSY3, tocolor(255, 255, 255, 255), true)
			elseif signalStrength == 0 then
				if blink then
					dxDrawRectangle( sbX1, sbY1, sbSX1, sbSY1, tocolor(100, 100, 100, 170), true)
					dxDrawRectangle( sbX2, sbY2, sbSX2, sbSY2, tocolor(100, 100, 100, 170), true)
					dxDrawRectangle( sbX3, sbY3, sbSX3, sbSY3, tocolor(100, 100, 100, 170), true)
				end
			end
		end

		-->> Debug Shit
		local cdX1, cdY1, cdSX1, cdSY1 = aToR( 851, 460, 994, 474)
		local doffset = 14
		dxDrawText("Location - Carriers: ", 851, 460, 994, 474, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
		for i, tower in ipairs (cell_tower_locations) do
			local cdX2, cdY2, cdSX2, cdSY2 = aToR( 851, (i*doffset)+463, 994, 492)
			local x, y, z = tower.pos[1], tower.pos[2], tower.pos[3]
			local owners = tower.owner
			if #owners == 1 then
				sowners = "Zone exclusive to ".."#"..tower.owner[1]
			else
				sowners = table.concat( owners, ", ")
			end
			dxDrawText( getZoneName( x, y, z, false)..", "..getZoneName( x, y, z, true).." - Carriers: "..sowners, cdX2, cdY2, cdSX2, cdSY2, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, true, false)
		end
	end
)
