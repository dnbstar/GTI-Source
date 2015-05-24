local screenW, screenH = guiGetScreenSize()
local localPlayer = getLocalPlayer()

--[[Suicide Message Syntax
	@r - red color code shortcut (#7B2D31)
	@g - grey color code shortcut (#A1A1A1)
	@b - blue color code shortcut (#317BA0)
	@k - black color code shortcut(#000000)
--]]

local randomDeathMessages = {
	{ " You @bkilled@r yourself "},
	{ " You couldn't @bhandle@r life "},
	{ " Your @blife was cut@r short "},
	{ " You @bfailed@r at life "},
}

--[[Killer Message Syntax
	@killer - Killer's name goes there
	@r - red color code shortcut (#7B2D31)
	@g - grey color code shortcut (#A1A1A1)
	@b - blue color code shortcut (#317BA0)
	@k - black color code shortcut(#000000)
	@egun - the killer's weapon
	@ehp - the killer's health
	@d - the killer's distance from the victim
--]]

local randomKillMessaged = {
	--{ " burst holes#996666 in you"},
	--{ " aired #996666you out"},
	--{ " fired #996666you up "},
	{ "You were @gkilled by@r @b@killer@r (@b@egun @k-@g @ehpHP @k-@g @dm @r)"},
	{ "@b@killer @griddled you@r with holes@r (@b@egun @k-@g @ehpHP @k-@g @dm @r)"},
	{ "@b@killer @glethally perforated@r you (@b@egun @k-@g @ehpHP @k-@g @dm @r)"},
}

--

function getKillString(player, killer, weapon, bodypart)
    local killText = ""

    if player then
        killText = killText .. ""
    end --if

    if killer then
		local msg = math.random(#randomKillMessaged)
		local theDM = tostring(randomKillMessaged[msg][1])
		local gunN = getWeaponNameFromID( weapon)
		local pX, pY, pZ = getElementPosition( player)
		local kX, kY, kZ = getElementPosition( killer)
		local dist = getDistanceBetweenPoints3D( pX, pY, pZ, kX, kY, kZ)
		local dist = math.floor( dist)
		local killerName = getPlayerName(killer)
		local victimName = getPlayerName(player)
		local theDM = string.gsub( theDM, "@killer", killerName)
		local theDM = string.gsub( theDM, "@r", "#7B2D31")
		local theDM = string.gsub( theDM, "@g", "#A1A1A1")
		local theDM = string.gsub( theDM, "@b", "#317BA0")
		local theDM = string.gsub( theDM, "@k", "#000000")
		local theDM = string.gsub( theDM, "@egun", gunN)
		local theDM = string.gsub( theDM, "@ehp", math.floor(getElementHealth(killer)))
		local theDM = string.gsub( theDM, "@d", dist)
		killText = theDM
		killK = killer
    else
		local msg = math.random(#randomDeathMessages)
		local theRandomDM = randomDeathMessages[msg][1]
		local theRandomDM = string.gsub( theRandomDM, "@r", "#7B2D31")
		local theRandomDM = string.gsub( theRandomDM, "@g", "#A1A1A1")
		local theRandomDM = string.gsub( theRandomDM, "@b", "#317BA0")
		local theRandomDM = string.gsub( theRandomDM, "@k", "#000000")
        killText = killText .. theRandomDM
    end

    if weapon then
        local weapName = getWeaponNameFromID(weapon)
        if weapname ~= false then
        end
    end

    return killText, killK
end

local killText = ""
local finalText = ""
local killK

--Kill Text

local font = dxCreateFont( "ARLRDBD.TTF", 14)

a = 255

function text()
	local tick = getTickCount() / 100
	local move = math.sin(tick) * 4
	dxDrawBorderedText("wasted", 1.75, (screenW - 504) / 2+move, (screenH - 44) / 1.05, ((screenW - 504) / 2) + 504, ( (screenH - 44) / 1.05) + 44, tocolor(wColor1, wColor2, wColor3, 255), 2.50, "pricedown", "center", "center", false, false, true, false, false)
	--dxDrawBorderedText("busted", 1.75, (screenW - 504) / 2+move, (screenH - 44) / 1.05, ((screenW - 504) / 2) + 504, ( (screenH - 44) / 1.05) + 44, tocolor(wColor1, wColor2, wColor3, 255), 2.50, "pricedown", "center", "center", false, false, true, false, false)
	dxDrawText(finalText, (screenW - 504) / 2, (screenH - 39) / 1.005, ((screenW - 504) / 2) + 504, ( (screenH - 39) / 1.005) + 39, tocolor(130, 45, 49, 255), 1.00, font, "center", "center", false, false, true, true, false)
end

function setWastedColor()
	if wColor1 == 130 and wColor2 == 45 and wColor3 == 49 then
		wColor1, wColor2, wColor3 = 49, 123, 160
	else
		wColor1, wColor2, wColor3 = 130, 45, 49
	end
end
setTimer( setWastedColor, 250, 0)

function onPlayerWasting( killer, weapon, bodypart)
	killText = getKillString( source, killer, weapon, bodypart)
	finalText = killText
	addEventHandler( "onClientRender", root, text, false)
	--[[
	setTimer( function()
		a = a+51
	end, 100, 5)
	--]]
end
addEventHandler( "onClientPlayerWasted", getLocalPlayer(), onPlayerWasting, false)

function onPlayerSpawning()
	--[[
	setTimer( function()
		a = a-51
	end, 100, 5)

	setTimer( removeEventHandler, 500, 1, "onClientRender", root, text, false)
	--]]
	removeEventHandler( "onClientRender", root, text, false)
end
addEventHandler( "onClientPlayerSpawn", getLocalPlayer(), onPlayerSpawning, false)

function dxDrawBorderedText ( text, wh, x, y, w, h, clr, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	if not wh then wh = 1.5 end
	dxDrawText ( text, x - wh, y - wh, w - wh, h - wh, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true) -- black
	dxDrawText ( text, x + wh, y - wh, w + wh, h - wh, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true)
	dxDrawText ( text, x - wh, y + wh, w - wh, h + wh, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true)
	dxDrawText ( text, x + wh, y + wh, w + wh, h + wh, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true)
	dxDrawText ( text, x - wh, y, w - wh, h, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true)
	dxDrawText ( text, x + wh, y, w + wh, h, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true)
	dxDrawText ( text, x, y - wh, w, h - wh, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true)
	dxDrawText ( text, x, y + wh, w, h + wh, tocolor ( 0, 0, 0, a ), scale, font, alignX, alignY, clip, wordBreak, false, true)
	dxDrawText ( text, x, y, w, h, clr, scale, font, alignX, alignY, clip, wordBreak, postGUI, true)
end
