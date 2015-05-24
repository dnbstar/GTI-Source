--mapImage = dxCreateTexture( "radar.jpg")
local sW, sH = guiGetScreenSize()
alpha = 255
--Blip Stuff
local icons = {}
for k = 1,65 do
	icons[k] = dxCreateTexture("blips/"..k..".png")
end
--
local blips = {}
local healthTimer = setTimer(function() end, 1000, 0)
local oxyTimer = setTimer(function() end, 1000, 0)
resX, resY = 1366, 768

local wCR, wCG, wCB = 110, 158, 204

function aToR( X, Y, sX, sY)
	local xd = X/resX or X
	local yd = Y/resY or Y
	local xsd = sX/resX or sX
	local ysd = sY/resY or sY
	return xd*sW, yd*sH, xsd*sW, ysd*sH
end

currentZoomState = 2
zoom = false

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		mapImage = dxCreateTexture( "world.png")
		width, height = 1200, 1200
		radar = dxCreateRenderTarget( sW*width*2/1440, sH*height*2/900)
		mapRadar = dxCreateRenderTarget( sW*width*2/1440, sH*height*2/900, true)
		--bliparea = dxCreateRenderTarget( sW*width*3/1440, sH*height*3/900, true)
		--radararea = dxCreateRenderTarget( sW*width*3/1440, sH*height*3/900, true)
		--pathmap = dxCreateRenderTarget( sW*width*3/1440, sH*height*3/900, true)
		MimgW,MimgH = dxGetMaterialSize(mapRadar)
		--[[
		setTimer(
		function()
			blips = {}
			for i, v in ipairs( getElementsByType('blip') ) do
				local icon = getBlipIcon(v)
				if icon > 3 then
					local px,py = getElementPosition(v)
					local blip_x = (3000+px)/6000*MimgW
					local blip_y = (3000-py)/6000*MimgH
					local rot = getPedCameraRotation( localPlayer)
					table.insert(blips,{x = blip_x, y = blip_y,icon = icon})
				end
			end
		end,5000,0
		)
		--]]
	end
)

vehZoom = 3
pedZoom = 2

-- Radar Zooming
addEventHandler("onClientPreRender", root,
	function()
		if isPlayerInVehicle( localPlayer) then
			if currentZoomState ~= vehZoom then
				zoom = true
			else
				zoom = false
			end
			if zoom then
				if currentZoomState ~= vehZoom then
					if currentZoomState > vehZoom then
						currentZoomState = currentZoomState - 0.010
					elseif currentZoomState < vehZoom then
						currentZoomState = currentZoomState + 0.010
					end
				end
			end
		else
			if currentZoomState ~= pedZoom then
				zoom = true
			else
				zoom = false
			end
			if zoom then
				if currentZoomState ~= pedZoom then
					if currentZoomState > pedZoom then
						currentZoomState = currentZoomState - 0.010
					elseif currentZoomState < pedZoom then
						currentZoomState = currentZoomState + 0.010
					end
				end
			end
		end
	end
)

-- Radar Render Targetting
addEventHandler("onClientPreRender", root,
    function()
		dxSetRenderTarget( mapRadar, true)
		dxDrawRectangle( 0, 0, 3000, 3000, tocolor( wCR, wCG, wCB, 200))
		dxDrawImage( 0, 0, MimgW, MimgH, mapImage)
		--dxSetRenderTarget()
		--dxSetRenderTarget( bliparea, true)
		--[[
		for i, v in ipairs( blips) do
			local rot = getPedCameraRotation( localPlayer)
			dxDrawImage( v.x-20/2, v.y-20/2, 42, 42, icons[v.icon], rot)
		end
		--]]
		for i, v in ipairs (getElementsByType( 'blip')) do
			local icon = getBlipIcon(v)
			if icon > 3 then
				local bx, by = getElementPosition(v)
				local blip_x, blip_y = (3000+bx)/6000*MimgW, (3000-by)/6000*MimgH
				local rot = getPedCameraRotation( localPlayer)
				if getElementInterior( localPlayer) == getElementInterior( v) and getElementDimension( localPlayer) == getElementDimension( v) then
					dxDrawImage( blip_x-20/2, blip_y-20/2, 42, 42, icons[icon], rot)
				end
			end
		end
		for i, v in ipairs( getElementsByType( 'player')) do
			if v ~= localPlayer then
				local team = getPlayerTeam( v)
				local r, g, b = getTeamColor( team)
				--local r, g, b = 255, 255, 255 or getPlayerNametagColor( v)
				local px, py = getElementPosition( v)
				local p_x = (3000+px)/6000*MimgW
				local p_y = (3000-py)/6000*MimgH
				local prot = getPedRotation( v)
				local p_blipsize = 20-currentZoomState

				if getElementInterior( localPlayer) == getElementInterior( v) and getElementDimension( localPlayer) == getElementDimension( v) then
					dxDrawImage ( p_x-20/2, p_y-20/2, 32, 32, icons[3], -prot,0,0,tocolor(r,g,b, 255))
				end
			end
		end
		--[[
		dxSetRenderTarget()
		dxSetRenderTarget( radararea, true)
		--]]
		for i, v in ipairs( getElementsByType( 'radararea')) do
			local r, g, b, a = getRadarAreaColor( v)
			local w, h = getRadarAreaSize( v)
			x,y = getElementPosition( v)
			x = x / ( 6000 / MimgW)  + MimgW/2
			y = y / ( -6000/ MimgH) + MimgH/2
			dxDrawRectangle( x, (y-h) + 4 + (h/2), (w/2), (h/2), tocolor( r, g, b, a))
		end
		dxSetRenderTarget()
		dxSetRenderTarget( radar, true)
		--]]
		--local x,y,z = getElementPosition(localPlayer)
		local x,y,z = getCameraMatrix()
		local rot = getPedCameraRotation( localPlayer)
		local _, _, rX = getElementRotation( localPlayer)
		local mapx = x / (6000/MimgW) + MimgW/2 - width*currentZoomState/2
		local mapy = y / (-6000/MimgH) + MimgH/2 - height*currentZoomState/2
		dxDrawImageSection(0,0, width, height, mapx, mapy, width*currentZoomState, height*currentZoomState, mapRadar, -rot)
		--dxDrawImageSection(0,0, width, height, mapx, mapy, width*currentZoomState, height*currentZoomState, bliparea, -rot)
		--dxDrawImageSection(0,0, width, height, mapx, mapy, width*currentZoomState, height*currentZoomState, radararea, -rot)
		--dxDrawImageSection(0,0, width, height, mapx, mapy, width*currentZoomState, height*currentZoomState, pathmap, -rot)
		dxSetRenderTarget()
	end
)

-- Background
addEventHandler( "onClientRender", root,
	function()
		if isPlayerMapVisible() then return end
		local reX, reY, rseX, rseY = aToR( 78, 563, 250, 160)
		dxDrawImage( reX, reY, rseX, rseY, "render.png", 0, 0, 0, tocolor( 25, 25, 25, 200), false)
	end
)

-- North Compass

addEventHandler( "onClientRender", root,
	function()
		if isPlayerMapVisible() then return end
		local camRot = getPedCameraRotation( localPlayer)
		local northRot = camRot*2
		local nRot = math.floor(camRot*1.08)
		if nRot >= 0 and nRot <= 62 then -- Top 1st Radar Half
			local nX, nY, nseX, nseY = aToR( 198+(-nRot*2), 557, 16, 16)
			dxDrawImage(nX, nY, nseX, nseY, "blips/4.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		elseif nRot >= 62 and nRot <= 133 then -- Left Radar Side
			local nX, nY, nseX, nseY = aToR( 72, 435+(nRot*2), 16, 16)
			dxDrawImage(nX, nY, nseX, nseY, "blips/4.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		elseif nRot >= 133 and nRot <= 256 then -- Bottom Radar Side
			local nX, nY, nseX, nseY = aToR( -194+(nRot*2), 702, 16, 16)
			dxDrawImage(nX, nY, nseX, nseY, "blips/4.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		elseif nRot >= 256 and nRot <= 328 then -- Right Radar Side
			local nX, nY, nseX, nseY = aToR( 318, 1213-(nRot*2), 16, 16)
			dxDrawImage(nX, nY, nseX, nseY, "blips/4.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		elseif nRot >= 328 and nRot <= 388 then -- Top 2nd Radar Half
			local nX, nY, nseX, nseY = aToR( 973+(-nRot*2), 557, 16, 16)
			dxDrawImage(nX, nY, nseX, nseY, "blips/4.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		end
	end
)

-- Health, Armor, and Oxygen
addEventHandler( "onClientRender", root,
	function()
		if isPlayerMapVisible() then return end
		--HP
		local health = getElementHealth( localPlayer)
		local maxHealth = getPedStat( localPlayer, 24)
		local maxHealth = (((maxHealth-569)/(1000-569))*100)+100
		local healthStat = health/maxHealth
		local r1, g1, b1, r2, g2, b2, a
		if (healthStat > 0.25) then
			r1,g1,b1 = 85,125,85
			r2,g2,b2 = 25,60,37
			a = 200
		else
			r1,g1,b1 = 200,100,105
			r2,g2,b2 = 80,40,40
			local aT = getTimerDetails(healthTimer)
			if (aT > 500) then
				a = (aT-500)/500*200
			else
				a = (500-aT)/500*200
			end
		end
		local haX, haY, haseX, haseY = aToR( 146, 711, 177, 8)
		local hX, hY, hseX, hseY = aToR( 146, 711, healthStat*177, 8)
		dxDrawRectangle(haX, haY, haseX, haseY, tocolor( r2, g2, b2, 200), false) -- Health Alpha
        dxDrawRectangle(hX, hY, hseX, hseY, tocolor( r1, g1, b1, a), false) -- Health
		--AP
		local armor = getPedArmor( localPlayer)
		local armorStat = armor/100
		local haX, haY, haseX, haseY = aToR( 83, 711, 60, 8)
		local hX, hY, hseX, hseY = aToR( 83, 711, armorStat*60, 8)
		if not isElementInWater( localPlayer) then
			dxDrawRectangle(haX, haY, haseX, haseY, tocolor( 20, 60, 80, 200), false) -- Armor Alpha
			dxDrawRectangle(hX, hY, hseX, hseY, tocolor( 90, 165, 200, 200), false) -- Armor
		end
		--OP
		if isElementInWater( localPlayer) then
			local oxygen = getPedOxygenLevel(localPlayer)
			--if (oxygen >= 1000) then return end
			local oxygenStat = oxygen/1000
			--
			if (oxygenStat > 0.25) then
				or1, og1, ob1 = 58, 100, 128
				or2, og2, ob2 = 145, 205, 240
				oa = 200
			else
				or1, og1, ob1 = 80,40,40
				or2, og2, ob2 = 200,100,105
				local aT = getTimerDetails(oxyTimer)
				if (aT > 500) then
					oa = (aT-500)/500*200
				else
					oa = (500-aT)/500*200
				end
			end
			local saX, saY, saseX, saseY = aToR( 83, 711, 60, 8)
			local sX, sY, sseX, sseY = aToR( 83, 711, oxygenStat*60, 8)
			dxDrawRectangle(saX, saY, saseX, saseY, tocolor( or1, og1, ob1, 200), false) -- Stamina Alpha
			dxDrawRectangle(sX, sY, sseX, sseY, tocolor( or2, og2, ob2, oa), false) -- Stamina
		end
	end
)

-- Radar
addEventHandler("onClientRender", root,
    function()
		if isPlayerMapVisible() then return end
		local x,y,z = getElementPosition( localPlayer)
		local rX, rY, rZ = getElementRotation( localPlayer)
		local camRot = getPedCameraRotation( localPlayer)
		-- Radar Image
		local meX, meY, mseX, mseY = aToR( 83, 568, 240, 140)
		dxDrawImageSection( meX, meY, mseX, mseY, 490, 490, 216, 223, radar, 0, -90, 0, tocolor( 255, 255, 255, 125))
		--dxDrawImageSection( meX, meY, mseX, mseY, 490, 490, 216, 223, pathmap, 0, -90, 0, tocolor( 255, 255, 255, 200))
		-- Radar Player
		local peX, peY, pseX, pseY = aToR( 198, 629, 16, 16)
		dxDrawImage(peX, peY, pseX, pseY, "blips/3.png", -camRot-rZ, 0, 0, tocolor(alpha, alpha, alpha, alpha), false)
		if not isLineOfSightClear( x, y, z, x, y, z+5000, true, false, false, true, false, false) then
			if getElementInterior( localPlayer) == 0 then
				alpha = 155
			else
				alpha = 255
			end
		else
			alpha = 255
		end
    end
)
