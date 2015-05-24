------------------------------------------------------------------------------------
--	PROJECT:	GTI Gun Range Project
--	RIGHTS:		All rights reserved by developers
--	DEVELOPERS:	LilDolla
------------------------------------------------------------------------------------

local screenWidth, screenHeight = guiGetScreenSize()

local dx1Messages = {}
local dx1MessagesY = {25, 25, 25, 25}
local dx1MessagesTick = {}

local isMoving = false

function drawMessages()
	for index, messageData in pairs(dx1Messages) do
		--dxDrawRectangle((screenWidth / 1100) * 950, (screenHeight / 900) * dx1MessagesY[index] * 10, 175, 25, tocolor(0, 0, 0, 180), false)
		dxDrawText(messageData[1], (screenWidth / 1100) * 950, (screenHeight / 900) * (dx1MessagesY[index] * 2), ((screenWidth / 1100) * 950) + 175, ( (screenHeight / 900) * (780 * 2)) + 25, tocolor(messageData[2], messageData[3], messageData[4], 255), 1.4, "default-bold", "center", "center", false, true, false, false, false)
	end
end
addEventHandler("onClientRender", root, drawMessages)

function showPoint(message, r, g, b)
	if dxGetTextWidth(message, (screenWidth / 900) * 1, "default-bold") > 850 then showPoint("Invalid Length", 255, 0, 0) return end
	r, g, b = r or 255, g or 255, b or 255
	if #dx1Messages == 4 or isMoving then setTimer(showPoint, 50, 1, message, r, g, b) return end
	table.insert(dx1Messages, {message, r, g, b})
	dx1MessagesTick[#dx1Messages] = getTickCount()
	addEventHandler("onClientRender", root, addMessage)
	isMoving = true
end
addEvent("GTIgun.showPoint", true)
addEventHandler("GTIgun.showPoint", root, showPoint)

function addMessage()
	local index = #dx1Messages
	local difference = (screenHeight / 450) * 2
	dx1MessagesY[index] = dx1MessagesY[index] + difference
	if dx1MessagesY[index] >= (index - 1) * 25 then
		dx1MessagesY[index] = (index - 1) * 25
		if #dx1Messages == 4 then
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
	local difference = (screenHeight / 450) * 2
	for index = 1, #dx1Messages do
		dx1MessagesY[index] = dx1MessagesY[index] - difference
	end
	if dx1MessagesY[1] <= -25 then
		for index = 1, #dx1Messages do
			dx1Messages[index] = dx1Messages[index + 1]
			dx1MessagesTick[index] = dx1MessagesTick[index + 1]
			dx1MessagesY[index] = (index - 1) * 25
		end
		isMoving = false
		removeEventHandler("onClientRender", root, removeMessage)
		for index = 1, #dx1MessagesY do
			if not dx1Messages[index] then dx1MessagesY[index] = -25 end
		end
	end
end

function removeReadMessages()
	for index, message in pairs(dx1Messages) do
		local currentTick = getTickCount()
		if currentTick - dx1MessagesTick[index] >= 5000 then
			removeMessage()
		end
	end
end
addEventHandler("onClientRender", root, removeReadMessages)
