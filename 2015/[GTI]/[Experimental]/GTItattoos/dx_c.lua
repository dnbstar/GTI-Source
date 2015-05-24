local sW, sH = guiGetScreenSize()

colName = "Categories"

sname = ""
selected = 1
selShow = 1

offs = 30
show = 10

data = {
	visn = {},
	name = {},
	text = {},
	pos = {},
}

showing = {}

vTable = showing

animRT = false

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		changeShowcase( categories)
		--vTable = categories
	end
)
selpos = 269
idir = "images/"
udmove = 3

move = 0
moved_up = 0
maxed = false

local anim_pos = 0

addEventHandler("onClientPreRender", root,
    function()
		if not render then return end
		--if getPlayerName( localPlayer) ~= "LilDolla" then return end
		dxDrawRectangle(65, 150, 312, 79, tocolor(217, 168, 50, 255), false) -- Color
		dxDrawImageSection( 65, 150, 312, 79, -anim_pos, -(anim_pos+2), 128, 128, idir.."ttile.png", 0, 0, 0, tocolor( 255, 255, 255, 55), false)
		anim_pos = anim_pos + 0.25
        dxDrawRectangle(65, 229, 312, 336, tocolor(0, 0, 0, 198), false) -- Back
		dxDrawRectangle(65, 565, 312, 34, tocolor(0, 0, 0, 220), false) -- Up/Down
		dxDrawRectangle(65, 229, 312, 34, tocolor(0, 0, 0, 127), false) -- Outlining
        dxDrawText( selShow.." / "..(#vTable), 276, 236, 367, 256, tocolor(255, 255, 255, 255), 1.25, "default", "right", "center", false, false, false, false, false)
        dxDrawText( colName, 75, 236, 266, 256, tocolor(255, 255, 255, 255), 1.25, "default", "left", "center", false, false, false, false, false)
		if selected ~= 1 then
			dxDrawImage( 203, 571, 16, 16, idir.."u.png", 0, 0, 0, tocolor(255, 255, 255, 200), false)
		else
			dxDrawImage( 203, 571, 16, 16, idir.."u.png", 0, 0, 0, tocolor(255, 255, 255, 55), false)
		end
		if selShow ~= #vTable then
			dxDrawImage(219, 571, 16, 16, idir.."d.png", 0, 0, 0, tocolor(255, 255, 255, 200), false)
		else
			dxDrawImage(219, 571, 16, 16, idir.."d.png", 0, 0, 0, tocolor(255, 255, 255, 55), false)
		end

		--dxDrawImage( 65, 150, 312, 79, "face.png", 0, 0, 0, tocolor(255, 255, 255), false)
        dxDrawText("Tattoo", 151, 147, 291, 206, tocolor(0, 0, 0, 205), 2.00, "diploma", "left", "center", false, false, false, false, false) -- Main Title
		dxDrawText("Body Arts", 215, 196, 306, 216, tocolor(255, 255, 205, 225), 1.25, "sans", "center", "center", false, false, false, false, false) -- Sub Title

		--dxDrawRectangle(68, selpos, 306, 23, tocolor(255, 254, 254, 200), false) -- Selection Bar
		dxDrawRectangle(68, selpos, 306, 23, tocolor(255, 254, 254, 255), false) -- Selection Bar
		for i, tattoo in ipairs ( vTable) do
			local name = tattoo[1]
			local price = tattoo[2]

			local color = split( data.text[i], ";") or { 255, 255, 255}
			local r, g, b = color[1], color[2], color[3]

			local restriction = tonumber((209+move)+((offs*i)*2))
			if restriction >= 269 and restriction <= 809 then
				dxDrawText( name, 75, (209+move)+((offs*i)*2), 266, 289, tocolor(r, g, b, 255), 1.15, "default-bold", "left", "center", false, false, false, false, false)
				if price == "-" then
					--dxDrawText( "", 276, (209+move)+((offs*i)*2), 367, 289, tocolor(r, g, b, 255), 1.15, "default-bold", "right", "center", false, false, false, false, false)
					dxDrawImage( 342, (234+move)+(offs*i), 32, 32, idir.."ttile.png", 0, 0, 0, tocolor( 255, 255, 255, 200), false)
				elseif price and type(items[price]) == "table" then
					--dxDrawText( (#items[price]).." Items", 276, (209+move)+((offs*i)*2), 367, 289, tocolor(r, g, b, 255), 1.15, "default-bold", "right", "center", false, false, false, false, false)
					dxDrawText( (#items[price]), 276, (209+move)+((offs*i)*2), 337, 289, tocolor(r, g, b, 255), 1.15, "default-bold", "right", "center", false, false, false, false, false)
					if i == selShow then
						dxDrawImage( 342, (234+move)+(offs*i), 32, 32, idir.."t2ile.png", 0, 0, 0, tocolor( 255, 255, 255, 190), false)
					else
						dxDrawImage( 342, (234+move)+(offs*i), 32, 32, idir.."ttile.png", 0, 0, 0, tocolor( 255, 255, 255, 190), false)
					end
				else
					if tattoo[3] ~= true then
						dxDrawText( "$"..price, 276, (209+move)+((offs*i)*2), 367, 289, tocolor(r, g, b, 255), 1.15, "default-bold", "right", "center", false, false, false, false, false)
					else
						dxDrawImage( 342, (234+move)+(offs*i), 32, 32, idir.."ttile.png", 0, 0, 0, tocolor( 255, 255, 255, 190), false)
					end
				end
			end
		end
    end
)

-- Camera Rotation
local facing = 0

function rotateCamera()
    local x, y, z = getElementPosition(localPlayer)

	local camX = x + math.cos( facing / math.pi * 180 ) * 2.4
	local camY = y + math.sin( facing / math.pi * 180 ) * 2.4
	setCameraMatrix( camX, camY, z+1, x, y, z )
	facing = facing + 0.0002
end
--addEventHandler( "onClientPreRender", root, rotateCamera)
