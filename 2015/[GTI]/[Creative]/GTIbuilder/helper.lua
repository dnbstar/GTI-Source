local sW, sH = guiGetScreenSize()

local resX, resY = 1600, 900

function aToR( X, Y, sX, sY)
	local xd = X/resX or X
	local yd = Y/resY or Y
	local xsd = sX/resX or sX
	local ysd = sY/resY or sY
	return xd*sW, yd*sH, xsd*sW, ysd*sH
end

local keys = {
	{ 9650, "Move +X;Arrow U", "arrow_u"}, -- Up
	{ 9660, "Move -X;Arrow D", "arrow_d"}, -- Down
	{ 9664, "Move +Y;Arrow L", "arrow_l"}, -- Left
	{ 9654, "Move +Y;Arrow R", "arrow_r"}, -- Right
	{ 8657, "Rotate+;Scroll U", "mouse_wheel_up"}, -- Page Up
	{ 8659, "Rotate-;Scroll D", "mouse_wheel_down"}, -- Page Down
	{ 8679, "Faster;L Shift", "lshift"}, -- Fast Object
	{ 8984, "Slower;L Alt", "lalt"}, -- Slow Object
	{ 9003, "Delete;Delete", "delete"}, -- Delete Object
	{ 9111, "Move +Z;Page U", "pgup"}, -- Height +
	{ 9112, "Move -Z;Page D", "pgdn"}, -- Height -
}

colors = {}

local sZ = -350
local offX = 89
local offY = 81

function insertKeyGuide( theGuide)
	colors = {}
	if type( theGuide) == "table" then
		keys = theGuide
		for i, letter in ipairs (theGuide) do
			local bind = letter[3]
			colors[bind] = "127,127,127"
		end
	end
end

--[[
addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		insertKeyGuide( keys)
	end
)

addEventHandler( "onClientKey", root,
	function( key, press)
		if colors[key] then
			if press then
				colors[key] = "255,255,255"
			else
				colors[key] = "127,127,127"
			end
		end
	end
)

addEventHandler( "onClientRender", root,
    function()
		for i, letter in ipairs (keys) do
			local key = letter[1]
			if type(key) == "number" and utfLen( key) == 4 then
				key = utfChar( key)
			else
				key = key
			end

			local data = split(letter[2], ";")
			local description = data[1]
			local kbKey = data[2]

			local clr = split( colors[letter[3]], ",")
			local r, g, b = clr[1], clr[2], clr[3]

			local text1Size = (sW/1244) * 2
			local text2Size = (sW/1240) * 0.90

			if tonumber(i) < 10 then
				local bX, bY, bSX, bSY = aToR( (i*offX)+((1240+sZ)-offX), 462, 45, 41)
				local bT1X, bT1Y, bT1SX, bT1SY = aToR( (i*offX*2)+((1244+(sZ*2))-(offX*2)), 462, 1281, 503)
				local bT2X, bT2Y, bT2SX, bT2SY = aToR( (i*offX*2)+((1240+(sZ*2))-(offX*2)), 533, 1284, 514)

				dxDrawRectangle( bX, bY, bSX, bSY, tocolor(25, 25, 25, 255), false)
				dxDrawText( key, bT1X, bT1Y, bT1SX, bT1SY, tocolor(r, g, b, 255), text1Size, "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText( description.."\n"..kbKey, bT2X, bT2Y, bT2SX, bT2SY, tocolor(255, 255, 255, 255), text2Size, "default-bold", "center", "center", false, false, false, false, false)
			else
				local bX, bY, bSX, bSY = aToR( ((i-9)*offX)+((1240+sZ)-offX), (10*offY)-(462-(offY*2.5)), 45, 41)
				local bT1X, bT1Y, bT1SX, bT1SY = aToR( ((i-9)*offX*2)+((1244+(sZ*2))-(offX*2)), (10*(offY))-(462-(offY*3.5)), 1281, 503)
				local bT2X, bT2Y, bT2SX, bT2SY = aToR( ((i-9)*offX*2)+((1240+(sZ*2))-(offX*2)), (10*(offY))-(533-(offY*5.3)), 1284, 514)

				dxDrawRectangle( bX, bY, bSX, bSY, tocolor(25, 25, 25, 255), false)
				dxDrawText( key, bT1X, bT1Y, bT1SX, bT1SY, tocolor(r, g, b, 255), text1Size, "default-bold", "center", "center", false, false, false, false, false)
				dxDrawText( description.."\n"..kbKey, bT2X, bT2Y, bT2SX, bT2SY, tocolor(255, 255, 255, 255), text2Size, "default-bold", "center", "center", false, false, false, false, false)
			end
		end
    end
)
--]]
