local sW, sH = guiGetScreenSize()
local screen = dxCreateScreenSource(sW, sH)
local blur = 12
local bar_offset = 175

--local ucp_title = "Multi Theft Auto - "..getPlayerName( localPlayer)
local ucp_title = "Grand Theft International - User Control Panel"
local options = {
	{ "Map"},
	--{ "Brief"},
	--{ "Stats"},
	--{ "Settings"},
	{ "Game"}
}

local sel = {
	[1] = "Map",
	--[2] = "Brief",
	--[3] = "Stats",
	--[4] = "Settings",
	[5] = "Game",
}

resX, resY = 1600, 900
current_view = ucp_title
menu_num = {}
tag_colors = {}

function aToR( X, Y, sX, sY)
	local xd = X/resX or X
	local yd = Y/resY or Y
	local xsd = sX/resX or sX
	local ysd = sY/resY or sY
	return xd*sW, yd*sH, xsd*sW, ysd*sH
end

_dxDrawRectangle = dxDrawRectangle
function dxDrawRectangle( x, y, w, h, color, post)
	local x, y, w, h = aToR( x, y, w, h)

	_dxDrawRectangle( x, y, w, h, color, post)
end

_dxDrawText = dxDrawText
function dxDrawText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wbreak, post, colorcode, sPP, fR, fRCX, fRCY)
	local x, y, w, h = aToR( x, y, w, h)

	_dxDrawText( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wbreak, post, colorcode, sPP, fR, fRCX, fRCY)
end

_dxDrawImageSection = dxDrawImageSection
function dxDrawImageSection( x, y, w, h, u, v, us, uz, image, rot, rotcox, rotcoy, color, post)
	local x, y, w, h = aToR( x, y, w, h)

	_dxDrawImageSection( x, y, w, h, u, v, us, uz, image, rot, rotcox, rotcoy, color, post)
end

function isCursorOverRectangle (x, y, w, h)
	local cX, cY = getCursorPosition()
	if isCursorShowing() then
		return ((cX*sW > x) and (cX*sW < x + w)) and ( (cY*sH > y) and (cY*sH < y + h))
	else
		return false
	end
end

addEventHandler("onClientResourceStart", resourceRoot,
function()
	blurShader, blurTex = dxCreateShader("blur.fx")

	for i, item in ipairs (options) do
		--table.insert( menu_num, { 189+(bar_offset*i), 178, 173, 44, item[1]})
		table.insert( menu_num, { (189+(bar_offset*i)), (((189+(bar_offset*i))+189)-16), item[1]})
		tag_colors[i] = "255,255,255"
	end
end)

--[[
addEventHandler("onClientPreRender", root,
function()
	if not getPlayerName( localPlayer) == "LilDolla" then return end
    if (blurShader) then
        dxUpdateScreenSource(screen)

        dxSetShaderValue(blurShader, "ScreenSource", screen)
        dxSetShaderValue(blurShader, "BlurStrength", blur)
		dxSetShaderValue(blurShader, "UVSize", sW, sH)

        dxDrawImage(-1, -1, sW+1, sH+1, blurShader)
		--dxDrawImage( 364, 105, 873, 593, blurShader)
    end
end
)
--]]

function changeViewTitle( text, gti)
	if not gti then
		current_view = text
	else
		current_view = text.." - GTi"
	end
end



function changeViewColor( i, r, g, b)
	if tag_colors[i] then
		tag_colors[i] = r..","..g..","..b
	end
end

function getViewColor( i, r, g, b)
	if tag_colors[i] then
		local col = split( tag_colors[i], ",")
		local cr, cg, cb = col[1], col[2], col[3]
		if cr == r and cg == g and cb == b then
			return true
		else
			return false
		end
	else
		return false
	end
end

function checkColors()
	if not getViewColor( 1, 255, 255, 255) then
		changeViewColor( 1, 255, 255, 255)
	end
	if not getViewColor( 2, 255, 255, 255) then
		changeViewColor( 2, 255, 255, 255)
	end
	if not getViewColor( 3, 255, 255, 255) then
		changeViewColor( 3, 255, 255, 255)
	end
	if not getViewColor( 4, 255, 255, 255) then
		changeViewColor( 4, 255, 255, 255)
	end
	if not getViewColor( 5, 255, 255, 255) then
		changeViewColor( 5, 255, 255, 255)
	end
end

function isCursorWithItem( x, w)
	local mX, mY = getCursorPosition()
	local mX, mY = mX * sW, mY * sH
	local mX, mY = math.ceil( mX), math.ceil( mY)

	if mX >= x and mX <= w then
		return true
	else
		return false
	end
end

addEventHandler("onClientPreRender", root,
    function()
		--if not getPlayerName( localPlayer) == "LilDolla" then return end

		local team = getPlayerTeam( localPlayer)
		local tR, tG, tB = getTeamColor( team)

        dxDrawRectangle(364, 105, 873, 593, tocolor(0, 0, 0, 100), false) -- Back Window
		dxDrawText( current_view, 374, 114, 527, 162, tocolor(255, 255, 255, 255), 2.00, "arial", "left", "center", false, false, false, false, false)

		for i, item in ipairs ( options) do
			dxDrawRectangle( 189+(bar_offset*i), 177, 173, 39, tocolor(0, 0, 0, 200), false)

			--dxDrawText( string.upper( item[1]) .. "("..(189+(bar_offset*i))..","..(((189+(bar_offset*i))+189)-16)..")", (189-bar_offset)+((bar_offset*2)*i), 177, 537, 216, tocolor( 255, 255, 255, 255), 1.15, "default-bold", "center", "center", false, false, false, false, false)
			dxDrawText( string.upper( item[1]), (189-bar_offset)+((bar_offset*2)*i), 177, 537, 216, tocolor( 255, 255, 255, 255), 1.15, "default-bold", "center", "center", false, false, false, false, false)
			local clr = split( tag_colors[i], ",")
			local r, g, b = clr[1], clr[2], clr[3]
			dxDrawRectangle( 189+(bar_offset*i), 172, 173, 5, tocolor( r, g, b, 255), false) -- Small Bar
		end

		local x, y, z = getElementPosition( localPlayer)
		local x, y, z = string.format( "%.3f", x), string.format( "%.3f", y), string.format( "%.3f", z)

		if not isCursorShowing() then
			dxDrawText( x..", "..y..", "..z, 1052, 673, 1225, 688, tocolor(255, 255, 255, 255), 0.75, "sans", "right", "center", false, false, false, false, false)
			checkColors()
			changeViewTitle( ucp_title)
			return
		else
			local mX, mY = getCursorPosition()
			local mX, mY = mX * sW, mY * sH
			local mX, mY = math.ceil( mX), math.ceil( mY)

			dxDrawText( mX..", "..mY.." | "..x..", "..y..", "..z, 1052, 673, 1225, 688, tocolor(255, 255, 255, 255), 0.75, "sans", "right", "center", false, false, false, false, false)
		end

		local mXr, mYr = getCursorPosition()
		local mXc, mYc = mXr * sW, mYr * sH
		local mX, mY = math.ceil( mXc), math.ceil( mYc)

		dxDrawRectangle( mX - 86.5, mY - 19.5, 173, 39, tocolor( 255, 0, 0, 200), false)

		if mY >= 172 and mY <= 216 then
			local options = unpack( options)
			if isCursorWithItem( 364, 537) then
				viewNum = 1
				vR, vG, vB = 51, 102, 204
			elseif isCursorWithItem( 539, 712) then
				viewNum = 2
				vR, vG, vB = 51, 102, 204
			elseif isCursorWithItem( 714, 887) then
				viewNum = 3
				vR, vG, vB = 51, 102, 204
			elseif isCursorWithItem( 889, 1062) then
				viewNum = 4
				vR, vG, vB = 51, 102, 204
			elseif isCursorWithItem( 1064, 1237) then
				viewNum = 5
				vR, vG, vB = 51, 102, 204
			else
				viewNum = false
			end
			if tonumber( viewNum) then
				changeViewTitle( "View "..sel[viewNum], false)
				changeViewColor( viewNum, vR, vG, vB)
			else
				changeViewTitle( ucp_title)
				checkColors()
			end
		else
			changeViewTitle( ucp_title)
			checkColors()
		end
    end
)
