------------------------------------------------------------------------------------
--	PROJECT:	CRP Project
--	RIGHTS:		All rights reserved by developers
--	DEVELOPERS:	JR10, LilDolla(Edited)
------------------------------------------------------------------------------------

local screenWidth, screenHeight = guiGetScreenSize()

local dxMessages = {}
local dxMessagesY = {-50, -50, -50, -50}
local dxMessagesTick = {}

local isMoving = false

function drawMessages()
	for index, messageData in pairs(dxMessages) do
		--dxDrawRectangle((screenWidth / 1100) * 250, (screenHeight / 900) * dxMessagesY[index], (screenWidth / 1440) * 760, (screenHeight / 900) * 25, tocolor(0, 0, 0, 200))
		dxDrawBText(messageData[1], (screenWidth / 1100) * 250, (screenHeight / 900) * (dxMessagesY[index] * 2), (screenWidth / 1440) * 1100, (screenHeight / 900) * 25, tocolor(messageData[2], messageData[3], messageData[4], 255), (screenWidth / 1440) * 1, "default-bold", "center", "center", false, true, false)
	end
end
addEventHandler("onClientRender", root, drawMessages)

function dxDrawBText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
	local wh = 1
	dxDrawText ( text, x - wh, y - wh, w - wh, h - wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false ) -- black
	dxDrawText ( text, x + wh, y - wh, w + wh, h - wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - wh, y + wh, w - wh, h + wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + wh, y + wh, w + wh, h + wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x - wh, y, w - wh, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x + wh, y, w + wh, h, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y - wh, w, h - wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y + wh, w, h + wh, tocolor ( 0, 0, 0, 255 ), scale, font, alignX, alignY, clip, wordBreak, false )
	dxDrawText ( text, x, y, w, h, color, scale, font, alignX, alignY, clip, wordBreak, postGUI )
end

function dm(message, r, g, b)
	if dxGetTextWidth(message, (screenWidth / 1440) * 1, "default-bold") > 750 then dm("Invalid Length", 255, 0, 0) return end
	r, g, b = r or 255, g or 255, b or 255
	if #dxMessages == 4 or isMoving then setTimer(dm, 1000, 1, message, r, g, b) return end
	table.insert(dxMessages, {message, r, g, b})
	dxMessagesTick[#dxMessages] = getTickCount()
	addEventHandler("onClientRender", root, addMessage)
	isMoving = true
end
addEvent("GTIhelp.dm", true)
addEventHandler("GTIhelp.dm", root, dm)

function addMessage()
	local index = #dxMessages
	local difference = (screenHeight / 900) * 2
	dxMessagesY[index] = dxMessagesY[index] + difference
	if dxMessagesY[index] >= (index - 1) * 25 then
		dxMessagesY[index] = (index - 1) * 25
		if #dxMessages == 4 then
			isMoving = true
			addEventHandler("onClientRender", root, removeMessage)
			removeEventHandler("onClientRender", root, addMessage)
		else
			isMoving = false
			removeEventHandler("onClientRender", root, addMessage)
		end
	end
end

function removeMessage()
	local difference = (screenHeight / 900) * 2
	for index = 1, #dxMessages do
		dxMessagesY[index] = dxMessagesY[index] - difference
	end
	if dxMessagesY[1] <= -25 then
		for index = 1, #dxMessages do
			dxMessages[index] = dxMessages[index + 1]
			dxMessagesTick[index] = dxMessagesTick[index + 1]
			dxMessagesY[index] = (index - 1) * 25
		end
		isMoving = false
		removeEventHandler("onClientRender", root, removeMessage)
		for index = 1, #dxMessagesY do
			if not dxMessages[index] then dxMessagesY[index] = -25 end
		end
	end
end

function removeReadMessages()
	for index, message in pairs(dxMessages) do
		local currentTick = getTickCount()
		if currentTick - dxMessagesTick[index] >= 15000 then
			removeMessage()
		end
	end
end
addEventHandler("onClientRender", root, removeReadMessages)

function giveMoney(player, amount)
	if player and amount then
		if tonumber(amount) then
			triggerServerEvent("giveMoney", root, player, tonumber(amount))
			return true
		else
			return false
		end
	else
		return false
	end
end
addEvent("GTIhelp.gm", true)
addEventHandler("GTIhelp.gm", root, giveMoney)

function takeMoney(player, amount)
	if player and amount then
		if tonumber(amount) then
			triggerServerEvent("takeMoney", root, player, tonumber(amount))
			return true
		else
			return false
		end
	else
		return false
	end
end
addEvent("GTIhelp.tm", true)
addEventHandler("GTIhelp.tm", root, takeMoney)

function setMoney(player, amount)
	if player and amount then
		if tonumber(amount) then
			triggerServerEvent("setMoney", root, player, tonumber(amount))
			return true
		else
			return false
		end
	else
		return false
	end
end

function formatNumber(v)
	v = tonumber(v)
	if v then
		local s = string.format("%d", math.floor(v))
		local pos = string.len(s) % 3
		if pos == 0 then pos = 3 end
		return string.sub(s, 1, pos)
			.. string.gsub(string.sub(s, pos+1), "(...)", ",%1")
	else
		return false
	end
end
