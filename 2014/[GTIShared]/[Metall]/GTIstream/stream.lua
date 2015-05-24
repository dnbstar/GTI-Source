local defaultDist = 100
local streamingFrom = false
local radius = 100
local x, y, z = 0, 0, 0
local usingEle = false
local timer = false
local predefined = {
	["Power181"] = "http://www.181.fm/winamp.pls?station=181-power&style=mp3&description=Power%20181%20(Top%2040)&file=181-power.pls",
}


streamWindow1 = guiCreateWindow(188,129,641,522,"Metall's music box",false)
streamButton1 = guiCreateButton(13,475,87,32,"Start Stream",false,streamWindow1)
streamButton2 = guiCreateButton(119,475,87,32,"Stop Stream",false,streamWindow1)
streamButton3 = guiCreateButton(221,475,87,32,"Set Distance",false,streamWindow1)
streamButton4 = guiCreateButton(325,475,87,32,"Clear",false,streamWindow1)
streamButton5 = guiCreateButton(437,475,87,32,"Close",false,streamWindow1)
streamGrid1 = guiCreateGridList(16,36,263,424,false,streamWindow1)
guiGridListSetSelectionMode(streamGrid1,1)
streamCol = guiGridListAddColumn(streamGrid1,"URLs",0.85)
streamEdit1 = guiCreateEdit(388,48,244,32,"",false,streamWindow1)
streamLabel1 = guiCreateLabel(283,53,31,16,"URL:",false,streamWindow1)
streamEdit2 = guiCreateEdit(386,98,69,42,defaultDist or "",false,streamWindow1)
streamLabel2 = guiCreateLabel(283,105,98,24,"Stream Distance: ",false,streamWindow1)
guiSetVisible(streamWindow1, false)

for a,b in pairs(predefined) do
	local row = guiGridListAddRow(streamGrid1)
	guiGridListSetItemText(streamGrid1, row, streamCol, a, false, false)
end

function openWindow()
	if (guiGetVisible(streamWindow1)) then
		guiSetVisible(streamWindow1, false)
		showCursor(false)
		guiSetInputMode("allow_binds")
	else
		guiSetVisible(streamWindow1, true)
		showCursor(true)
		guiSetInputMode("no_binds_when_editing")
	end
end
addEvent("openGUI", true)
addEventHandler("openGUI", localPlayer, openWindow)

function clearFunc()
	guiSetText(streamEdit1, "")
	guiSetText(streamEdit2, defaultDist or "")
end
addEventHandler("onClientGUIClick", streamButton4, clearFunc, false)
addEventHandler("onClientGUIClick", streamButton5, openWindow, false)

function sendDistToServer()
	triggerServerEvent("setDistance", localPlayer, tonumber(guiGetText(streamEdit2)) or "")
end
addEventHandler("onClientGUIClick", streamButton3, sendDistToServer, false)

function stStr()
	local url = tostring(guiGetText(streamEdit1)) or ""
	local gridUrl = guiGridListGetItemText(streamGrid1, guiGridListGetSelectedItem(streamGrid1), 1)
	local low = string.lower(url)
	if (url ~= "" and not string.find(low, ".mp3") and not string.find(low, ".pls") and not string.find(low, ".wav") and not string.find(low, ".ogg") and not string.find(low, ".riff") and not string.find(low, ".mod") and not string.find(low, ".xm") and not string.find(low, ".it") and not string.find(low, ".s3m")) then
		outputChatBox("Non-supported stream")
		return false
	end
	if (url ~= "") then
		triggerServerEvent("startStream", localPlayer, url)
	elseif (gridUrl ~= "") then
		triggerServerEvent("startStream", localPlayer, predefined[gridUrl])
	else
		return false
	end
end
addEventHandler("onClientGUIClick", streamButton1, stStr, false)

function stoStr()
	triggerServerEvent("stopStream", localPlayer)
end
addEventHandler("onClientGUIClick", streamButton2, stoStr, false)

function stStream(streamm, radius, x, y, z, int, dim, veh2)
	setCameraClip (false, false)
	if (stream) then return end
	stream = playSound3D(streamm, x, y, z, true)
	setElementInterior(stream, int)
	setElementDimension(stream, dim)
	setSoundVolume(stream, 1.0)
	setSoundMaxDistance(stream, radius)
	if (veh2) then
		veh = veh2
		timer = setTimer(updatePos, 100, 0)
	end
end
addEvent("startClientStream", true)
addEventHandler("startClientStream", localPlayer, stStream)

function setDis(v)
	if (isElement(stream)) then
		setSoundMaxDistance(stream, tonumber(v) or 100)
	end
end
addEvent("recvDist", true)
addEventHandler("recvDist", localPlayer, setDis)

function stoStream()
	if (stream) then
		if (isElement(stream)) then
			destroyElement(stream)
		end
		stream = nil
		if (isElement(timer)) then
			killTimer(timer)
		end
		veh = nil
		x,y,z = 0, 0, 0
	end
end
addEvent("stopClientStream", true)
addEventHandler("stopClientStream", localPlayer, stoStream)

function moveStream(x2, y2, z2)
	if (stream and isElement(stream)) then
		setElementPosition(stream, x2, y2, z2)
		x = x2
		y = y2
		z = z2
	end
end
addEvent("updateClientStream", true)
addEventHandler("updateClientStream", localPlayer, moveStream)

function updatePos()
	if (not stream) then killTimer(timer) return end
	if (not isElement(veh)) then killTimer(timer) return end
	if (not isElement(veh)) then return false end
	if (not isElement(stream)) then return false end
	x2,y2,z2 = getElementPosition(veh)
	int = getElementInterior(veh)
	dim = getElementDimension(veh)
	setElementPosition(stream, x2, y2, z2)
	setElementInterior(stream, int)
	setElementDimension(stream, dim)
	x = x2
	y = y2
	z = z2
end