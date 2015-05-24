------------------------------------------------->>
-- PROJECT:			Grand Theft International
-- RESOURCE: 		GTIdailyChallenge/dailyChallenge_c.lua
-- DESCRIPTION:		Completing a challenge everyday in order to win an amount of money.
-- AUTHOR:			Nerox
-- RIGHTS:			All rights reserved to author
------------------------------------------------->>
local screenW, screenH = guiGetScreenSize()
local loadingElement = false
local isOnLoading = false
local titleBarText = "Daily Challenge"
local isMainPanelShowed = false
local isChooseTaskShowed = false
local isAbleToOpenPanel = true
local isDailyChallengeCompleted = false
local drawChallengeUtils = {
    firstColumn = {taskName = "", progress=0, maxProgress = 0},
	secondColumn = {taskName = "", progress=0, maxProgress = 0},
	thirdColumn = {taskName = "", progress=0, maxProgress = 0},
	timeLeft = {hours=0, minutes=0, seconds=0},
}
local missionJobs = {}
local selectedTask = false
function dxDrawGifImage ( x, y, w, h, path, iStart, iType, effectSpeed )
	local gifElement = createElement ( "dx-gif" )
	if ( gifElement ) then
		setElementData (
			gifElement,
			"gifData",
			{
				x = x,
				y = y,
				w = w,
				h = h,
				imgPath = path,
				startID = iStart,
				imgID = iStart,
				imgType = iType,
				speed = effectSpeed,
				tick = getTickCount ( )
			},
			false
		)
		return gifElement
	else
		return false
	end
end

addEventHandler ( "onClientRender", root,
	function ( )
	if not isMainPanelShowed then return false end
		local currentTick = getTickCount ( )
		for index, gif in ipairs ( getElementsByType ( "dx-gif" ) ) do
			local gifData = getElementData ( gif, "gifData" )
			if ( gifData ) then
				if ( currentTick - gifData.tick >= gifData.speed ) then
					gifData.tick = currentTick
					gifData.imgID = ( gifData.imgID + 1 )
					if ( fileExists ( gifData.imgPath .."".. gifData.imgID ..".".. gifData.imgType ) ) then
						gifData.imgID = gifData.imgID
						setElementData ( gif, "gifData", gifData, false )
					else
						gifData.imgID = gifData.startID
						setElementData ( gif, "gifData", gifData, false )
					end
				end
				dxDrawImage ( gifData.x, gifData.y, gifData.w, gifData.h, gifData.imgPath .."".. gifData.imgID ..".".. gifData.imgType, 0, 0, 0, tocolor(255,255,255,255), true )
			end
		end
	end
)
local submitButtonAlpha = 0
local choooseTaskUtils = {
    Civilian = tocolor(255, 255, 255, 255),
	Criminal = tocolor(255, 255, 255, 255),
	Law = tocolor(255, 255, 255, 255),
	submitButton = tocolor(255, 255, 255, submitButtonAlpha),
}
local isChoosePanelOpened = false
function drawChooseTask() -- The panel where the player chooses what type of tasks he wants to get
    if not isChoosePanelOpened then
		dxDrawLine((screenW * 0.7472) - 1, screenH * 1.0000, screenW * 0.8646, screenH * 1.0000, tocolor(0, 0, 0, 255), 1, false)
   		dxDrawLine(screenW * 0.8646, screenH * 1.0000, screenW * 0.8646, (screenH * 0.9556) - 1, tocolor(0, 0, 0, 255), 1, false)
    	dxDrawRectangle(screenW * 0.7472, screenH * 0.9556, screenW * 0.1174, screenH * 0.0444, tocolor(38, 234, 6, 170), false)
    	dxDrawText("Daily challenge\nChooseTask(F7)", screenW * 0.7472, screenH * 0.9556, screenW * 0.8646, screenH * 1.0000, tocolor(255, 255, 255, 250), (screenH/900)*1.00, "default-bold", "center", "top", false, false, false, false, false)
	end
	if not isChoosePanelOpened then return end
    dxDrawRectangle(screenW * 0.0000, screenH * 0.2656, screenW * 1.0000, screenH * 0.3867, tocolor(0, 0, 0, 189), false)
    dxDrawImage(screenW * 0.0542, screenH * 0.2678, screenW * 0.3000, screenH * 0.3844, "images/chooseTask/Civilian.png", 0, 0, 0, choooseTaskUtils.Civilian, false)
    dxDrawImage(screenW * 0.4069, screenH * 0.2667, screenW * 0.3000, screenH * 0.3844, "images/chooseTask/Criminal.png", 0, 0, 0, choooseTaskUtils.Criminal, false)
    dxDrawRectangle(screenW * 0.3542, screenH * 0.2656, screenW * 0.0528, screenH * 0.3867, choooseTaskUtils.Criminal, false)
    dxDrawRectangle(screenW * 0.0014, screenH * 0.2656, screenW * 0.0528, screenH * 0.3867, choooseTaskUtils.Civilian, false)
    dxDrawRectangle(screenW * 0.7069, screenH * 0.2656, screenW * 0.0528, screenH * 0.3867, choooseTaskUtils.Law, false)
    dxDrawImage(screenW * 0.7597, screenH * 0.2644, screenW * 0.2403, screenH * 0.3878, "images/chooseTask/Law_emergency.png", 0, 0, 0, choooseTaskUtils.Law, false)
    dxDrawRectangle(screenW * 0.3056, screenH * 0.1278, screenW * 0.3889, screenH * 0.1300, tocolor(0, 0, 0, 148), false)
    dxDrawText("Choose challenge type", screenW * 0.3542, screenH * 0.1656, screenW * 0.6465, screenH * 0.2233, tocolor(255, 255, 255, 255), (screenH/900)*3.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("[SUBMIT CHALLENGE TYPE]", screenW * 0.3764, screenH * 0.6756, screenW * 0.6236, screenH * 0.7122, choooseTaskUtils.submitButton, (screenH/900)*2.00, "default-bold", "left", "top", false, false, false, false, false)
end
--[[
    Civilian Column: screenW * 0.0014, screenH * 0.2644, screenW * 0.3528, screenH * 0.6533
    Criminal Column: screenW * 0.3549, screenH * 0.2644, screenW * 0.7063, screenH * 0.6533
	Law/Emergency Column: screenW * 0.7076, screenH * 0.2644, screenW * 1.0590, screenH * 0.6533
--]]
local dailyChallengeUtils = {
    closeButton = tocolor(255, 255, 255, 255)
}
--tocolor(235, 121, 0, 255)
local informationBarUtils = {barText="N/A", x=0, y=0}
local showInfoBar = false
function drawDailyChallenge() -- The main panel
	---
	if isDailyChallengeCompleted then
	    dxDrawRectangle(screenW * 0.2069, screenH * 0.2344, screenW * 0.5868, screenH * 0.5322, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(screenW * 0.2069, screenH * 0.2344, screenW * 0.5868, screenH * 0.0222, tocolor(38, 234, 6, 170), false)
        dxDrawText(titleBarText, screenW * 0.4694, screenH * 0.2344, screenW * 0.5306, screenH * 0.2556, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
	    dxDrawText("Congratulations!\nYou have completed your daily challenge\n \n \n \nAnd you've earned your\n8000$", screenW * 0.2174, screenH * 0.2689, screenW * 0.7819, screenH * 0.5700, tocolor(255, 255, 255, 255), (screenH/900)*2.00, "default-bold", "center", "top", false, false, false, false, false)
	    dxDrawText("Close (F7)", screenW * 0.7521, screenH * 0.7433, screenW * 0.7937, screenH * 0.7644, dailyChallengeUtils.closeButton, (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
	    dxDrawText("Time left for the end of the day\nH : M : S\n"..drawChallengeUtils.timeLeft.hours.." : "..drawChallengeUtils.timeLeft.minutes.." : "..drawChallengeUtils.timeLeft.seconds.."", screenW * 0.3389, screenH * 0.5722, screenW * 0.6819, screenH * 0.6856, tocolor(255, 255, 255, 255), (screenH/900)*1.50, "default-bold", "center", "top", false, false, false, false, false)
	   return
	end
    dxDrawRectangle(screenW * 0.2069, screenH * 0.2344, screenW * 0.5868, screenH * 0.5322, tocolor(0, 0, 0, 170), false)
    dxDrawRectangle(screenW * 0.2069, screenH * 0.2344, screenW * 0.5868, screenH * 0.0222, tocolor(38, 234, 6, 170), false)
    dxDrawText(titleBarText, screenW * 0.4694, screenH * 0.2344, screenW * 0.5306, screenH * 0.2556, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
    --
	if isOnLoading then return false end
	--
	dxDrawText(""..(drawChallengeUtils.firstColumn.taskName).."   ("..drawChallengeUtils.firstColumn.progress.."/"..drawChallengeUtils.firstColumn.maxProgress..")", screenW * 0.2194, screenH * 0.2767, screenW * 0.5611, screenH * 0.4178, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
	dxDrawRectangle(screenW * 0.2194, screenH * 0.3100, screenW * 0.5604, screenH * 0.0222, tocolor(255, 255, 255, 255), false)
    --0%:  screenW * 0.0056, 100%: screenW * 0.5500
	firstColumnProgress = ((screenW * 0.5500)/100)*((drawChallengeUtils.firstColumn.progress/drawChallengeUtils.firstColumn.maxProgress)*100)
	if firstColumnProgress == 0 then
	    firstColumnProgress = 10
	end
	dxDrawRectangle(screenW * 0.2243, screenH * 0.3122, firstColumnProgress, screenH * 0.0167, tocolor(0, 0, 0, 195), false)
    dxDrawText(""..((drawChallengeUtils.firstColumn.progress/drawChallengeUtils.firstColumn.maxProgress)*100).."%", screenW * 0.4986, screenH * 0.3367, screenW * 0.5167, screenH * 0.3533, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
    ---
	secondColumnProgress = ((screenW * 0.5500)/100)*((drawChallengeUtils.secondColumn.progress/drawChallengeUtils.secondColumn.maxProgress)*100)
	if secondColumnProgress == 0 then
	    secondColumnProgress = 10
	end
	dxDrawText(""..(drawChallengeUtils.secondColumn.taskName).."   ("..drawChallengeUtils.secondColumn.progress.."/"..drawChallengeUtils.secondColumn.maxProgress..")", screenW * 0.2194, screenH * 0.3989, screenW * 0.5611, screenH * 0.4178, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawRectangle(screenW * 0.2194, screenH * 0.4256, screenW * 0.5604, screenH * 0.0222, tocolor(255, 255, 255, 255), false)
    dxDrawRectangle(screenW * 0.2243, screenH * 0.4289, secondColumnProgress, screenH * 0.0167, tocolor(0, 0, 0, 195), false)
    dxDrawText(""..((drawChallengeUtils.secondColumn.progress/drawChallengeUtils.secondColumn.maxProgress)*100).."%", screenW * 0.4986, screenH * 0.4556, screenW * 0.5167, screenH * 0.4722, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
	---
	thirdColumnProgress = ((screenW * 0.5500)/100)*((drawChallengeUtils.thirdColumn.progress/drawChallengeUtils.thirdColumn.maxProgress)*100)
	if thirdColumnProgress == 0 then
	    thirdColumnProgress = 10
	end
	dxDrawText(""..(drawChallengeUtils.thirdColumn.taskName).."   ("..drawChallengeUtils.thirdColumn.progress.."/"..drawChallengeUtils.thirdColumn.maxProgress..")", screenW * 0.2194, screenH * 0.5144, screenW * 0.5611, screenH * 0.5333, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawRectangle(screenW * 0.2194, screenH * 0.5422, screenW * 0.5604, screenH * 0.0222, tocolor(255, 255, 255, 255), false)
    dxDrawRectangle(screenW * 0.2243, screenH * 0.5444, thirdColumnProgress, screenH * 0.0167, tocolor(0, 0, 0, 195), false)
    dxDrawText(""..((drawChallengeUtils.thirdColumn.progress/drawChallengeUtils.thirdColumn.maxProgress)*100).."%", screenW * 0.4986, screenH * 0.5711, screenW * 0.5167, screenH * 0.5878, tocolor(255, 255, 255, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
	---
	dxDrawRectangle(screenW * 0.2194, screenH * 0.6211, screenW * 0.5611, screenH * 0.1056, tocolor(255, 255, 255, 170), false)
    dxDrawText("Information", screenW * 0.4271, screenH * 0.6244, screenW * 0.5729, screenH * 0.6444, tocolor(0, 0, 0, 255), (screenH/900)*1.00, "default-bold", "center", "top", false, false, false, false, false)
    dxDrawText("*You have 3 missions to do, you choose the type of missions you want to get either Civilian, Criminal or Law/Emergency services", screenW * 0.2229, screenH * 0.6467, screenW * 0.7764, screenH * 0.6667, tocolor(0, 0, 0, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, true, false)
    dxDrawText("*Once you finish your 3 missions, you recieve 8000$", screenW * 0.2229, screenH * 0.6822, screenW * 0.7694, screenH * 0.7067, tocolor(0, 0, 0, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
	dxDrawText("Time left for the end of the day:      "..drawChallengeUtils.timeLeft.hours.."   :   "..drawChallengeUtils.timeLeft.minutes.."", screenW * 0.5576, screenH * 0.7000, screenW * 0.7215, screenH * 0.7167, tocolor(0, 0, 0, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("H   :   M", screenW * 0.6903, screenH * 0.6789, screenW * 0.7160, screenH * 0.7000, tocolor(0, 0, 0, 255), (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
	---
	dxDrawText("Close (F7)", screenW * 0.7521, screenH * 0.7433, screenW * 0.7937, screenH * 0.7644, dailyChallengeUtils.closeButton, (screenH/900)*1.00, "default-bold", "left", "top", false, false, false, false, false)
    ---
	if showInfoBar then
        --dxDrawLine((screenW * 0.2965) - 1, screenH * 0.4478, screenW * 0.4021, screenH * 0.4478, tocolor(0, 0, 0, 255), 1, false)
        --dxDrawLine(screenW * 0.4021, screenH * 0.4478, screenW * 0.4021, (screenH * 0.4211) - 1, tocolor(0, 0, 0, 255), 1, false)
        --dxDrawRectangle(screenW * 0.2965, screenH * 0.4211, screenW * 0.1056, screenH * 0.0267, tocolor(255, 255, 255, 255), false)
		dxDrawLine((informationBarUtils.x) - 1, informationBarUtils.y+0.0267, (informationBarUtils.x)+0.1056, informationBarUtils.y+0.0267, tocolor(0, 0, 0, 255), 1, false)
		dxDrawLine((informationBarUtils.x)+0.1056, informationBarUtils.y+0.0267, (informationBarUtils.x)+0.1056, informationBarUtils.y - 1, tocolor(0, 0, 0, 255), 1, false)
		dxDrawRectangle(informationBarUtils.x, informationBarUtils.y, screenW * 0.1056, screenH * 0.0267, tocolor(255, 255, 255, 255), false)
        dxDrawText("     Job name: "..informationBarUtils.barText.."", informationBarUtils.x-0.119, informationBarUtils.y+0.0045, screenW * 0.3979, screenH * 0.4411, tocolor(0, 0, 0, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
	end
end
--792
--8.064
local loadTime = 5000
function showChooseTask(state)
    if state then
	    if not isChooseTaskShowed then
		    --showCursor(true)
		    isChooseTaskShowed = true
			isChoosePanelOpened = false
			loadTime = 5000
			triggerServerEvent("GTIdailyChallenge.setPlayerOnChoosePanel", localPlayer, true)
		    addEventHandler("onClientRender", root, drawChooseTask)
		end
	else
	    if isChooseTaskShowed then
		    showCursor(false)
		    isChooseTaskShowed = false
			isChoosePanelOpened = false
			triggerServerEvent("GTIdailyChallenge.setPlayerOnChoosePanel", localPlayer, false)
		    removeEventHandler("onClientRender", root, drawChooseTask)
		end
	end
end
addEvent("GTIdailyChallenge.choooseTask", true)
addEventHandler("GTIdailyChallenge.choooseTask", root, showChooseTask)
function showChooseTaskWithBind()
    if isChooseTaskShowed and not isChoosePanelOpened then
	    isChoosePanelOpened = true
		showCursor(true)
	end
end
bindKey("F7", "up", showChooseTaskWithBind)
function isMouseInPosition ( x, y, width, height, cx, cy )
    if ( not isCursorShowing ( ) ) then
        return false
    end
	if ( cx >= x and cx <= width and cy >= y and cy <= height ) then
        return true
    else
        return false
    end
end
function selectClickedElement(_, state, cx, cy, _, _, _, _ )
    if state ~= "up" then return false end
    if isChooseTaskShowed and isChoosePanelOpened then
		if isMouseInPosition(screenW * 0.0014, screenH * 0.2644, screenW * 0.3528, screenH * 0.6533, cx, cy) then -- Civilian column
		    submitButtonAlpha = 255
            hoverElement("Civilian", false)
			selectedTask = "Civilian"
		elseif isMouseInPosition(screenW * 0.3549, screenH * 0.2644, screenW * 0.7063, screenH * 0.6533, cx, cy) then -- Criminal column
		    submitButtonAlpha = 255
	 	    hoverElement("Criminal", false)
			selectedTask = "Criminal"
		elseif isMouseInPosition(screenW * 0.7083, screenH * 0.2633, screenW * 1.0597, screenH * 0.6522, cx, cy) then -- Law column
		    submitButtonAlpha = 255
	  	    hoverElement("Law", false)
			selectedTask = "Law"
		elseif isMouseInPosition(screenW * 0.3764, screenH * 0.6756, screenW * 0.6236, screenH * 0.7122, cx, cy) then -- [SUBMIT CHALLENGE TYPE]
            if selectedTask then
			    showChooseTask(false)
			    submitSelectedTask(selectedTask)
				hoverElement("", false)
				submitButtonAlpha = 0
				isChoosePanelOpened = false
				selectedTask = false
			end
		else
		    hoverElement("", true)
			selectedTask = false
			submitButtonAlpha = 0
		end
	elseif isChooseTaskShowed and not isChoosePanelOpened then
	    if isMouseInPosition(screenW * 0.7472, screenH * 0.9556, screenW * 0.8646, screenH * 1.0000, cx, cy) then -- The button that opens the choose panel
	        isChoosePanelOpened = true
			showCursor(true)
		end
	end
	if isMainPanelShowed then
	    if isMouseInPosition(screenW * 0.7521, screenH * 0.7433, screenW * 0.7937, screenH * 0.7644, cx, cy) then
		    showDailyChallenge(false)
		end
	end
end
addEventHandler("onClientClick", root, selectClickedElement)
function onEnterHoverElement(_, _, cx, cy)
    -- Choosing task menu
	if isChooseTaskShowed then
	    if isMouseInPosition(screenW * 0.3764, screenH * 0.6756, screenW * 0.6236, screenH * 0.7122, cx, cy) then
		    choooseTaskUtils.submitButton = tocolor(247, 92, 0, submitButtonAlpha)
		else
		    choooseTaskUtils.submitButton = tocolor(255, 255, 255, submitButtonAlpha)
		end
	end
	if isChooseTaskShowed and not selectedTask then
		if isMouseInPosition(screenW * 0.0000, screenH * 0.2633, screenW * 0.3542, screenH * 0.6522, cx, cy) then -- Civilian column
	    	hoverElement("Civilian", false)
		elseif isMouseInPosition(screenW * 0.3556, screenH * 0.2633, screenW * 0.7069, screenH * 0.6522, cx, cy) then -- Criminal column
	 	    hoverElement("Criminal", false)
		elseif isMouseInPosition(screenW * 0.7076, screenH * 0.2644, screenW * 1.0590, screenH * 0.6533, cx, cy) then -- Law column
            hoverElement("Law", false)
		else
		    hoverElement("", true)
		end
	end
	if isMainPanelShowed then
	    if isMouseInPosition(screenW * 0.7521, screenH * 0.7433, screenW * 0.7937, screenH * 0.7644, cx, cy) then
		    dailyChallengeUtils.closeButton = tocolor(235, 121, 0, 255)
		else
		    dailyChallengeUtils.closeButton = tocolor(255, 255, 255, 255)
		end
		if isMouseInPosition(screenW * 0.2181, screenH * 0.2733, screenW * 0.3833, screenH * 0.3022, cx, cy) then -- First column
			showInfoBar = true
			informationBarUtils.barText = missionJobs[1]
			informationBarUtils.x = cx
			informationBarUtils.y = cy
	    elseif isMouseInPosition(screenW * 0.2181, screenH * 0.3922, screenW * 0.3833, screenH * 0.4211, cx, cy) then -- Second column
		    showInfoBar = true
			informationBarUtils.barText = missionJobs[2]
			informationBarUtils.x = cx
			informationBarUtils.y = cy
		elseif isMouseInPosition(screenW * 0.2181, screenH * 0.5067, screenW * 0.3833, screenH * 0.5356, cx, cy) then -- Third column
		    showInfoBar = true
			informationBarUtils.barText = missionJobs[3]
			informationBarUtils.x = cx
			informationBarUtils.y = cy
		else
		    showInfoBar = false
		end
	end
end
local hoverElementColors = {
    Civilian = tocolor(255, 255, 0, 90),
	Law = tocolor(0, 200, 200, 160),
	Criminal = tocolor(255, 0, 0, 134),
}
function hoverElement(hElement, removeAll)
    if not removeAll then
	    for k, element in pairs(hoverElementColors) do
		    if k == hElement then
			    choooseTaskUtils[hElement] = element
			else
			    choooseTaskUtils[k] = tocolor(255, 255, 255, 255)
			end
		end
	else
	    for k, element in pairs(hoverElementColors) do
		    choooseTaskUtils[k] = tocolor(255, 255, 255, 255)
		end
	end
end
addEventHandler("onClientCursorMove", getRootElement(), onEnterHoverElement)
function submitSelectedTask(taskName)
    if taskName ~= "Criminal" and taskName ~= "Law" and taskName ~= "Civilian" then return false end
	triggerServerEvent("GTIdailyChallenge.onChooseChallengeType", localPlayer, taskName)
	showDailyChallenge(true)
	makeScreenLoad(true)
	setTimer(makeScreenLoad, 5000, 1, false)
end
function showDailyChallenge(state)
    if state then
	    if not isMainPanelShowed and not isChooseTaskShowed and isPlayerAbleToOpenPanel() then
		    showCursor(true)
		    isMainPanelShowed = true
			triggerServerEvent("GTIdailyChallenge.setPlayerOnPanel", localPlayer, true)
		    addEventHandler("onClientRender", root, drawDailyChallenge)
		end
	else
	    if isMainPanelShowed then
		    showCursor(false)
		    isMainPanelShowed = false
			triggerServerEvent("GTIdailyChallenge.setPlayerOnPanel", localPlayer, false)
		    removeEventHandler("onClientRender", root, drawDailyChallenge)
		end
	end
end
bindKey ( "F7", "up", function()
    showDailyChallenge(not isMainPanelShowed)
end)
function makeScreenLoad(state)
    if state then
	    if not loadingElement then
		    titleBarText = "Loading..."
		    isOnLoading = true
            loadingElement = dxDrawGifImage ( screenW * 0.3396, screenH * 0.3022, screenW * 0.3208, screenH * 0.3967, "images/loading/tmp-", 0, "png", 20 )
		end
	else
	    if loadingElement then
		    titleBarText = "Daily Challenge"
		    isOnLoading = false
	        destroyElement(loadingElement)
			loadingElement = false
		end
	end
end
function recieveData(pData, jobsTable)
    makeScreenLoad(true)
    if pData then
	    local dataTable = split(pData, ";")
		local tasksTable = split(dataTable[2], ",")
		local progressTable = split(dataTable[3], ",")
		local maxProgressTable = split(dataTable[4], ",")
		--- First column
		drawChallengeUtils.firstColumn.taskName = tasksTable[1]
		drawChallengeUtils.firstColumn.progress = progressTable[1]
		drawChallengeUtils.firstColumn.maxProgress = maxProgressTable[1]
		if drawChallengeUtils.firstColumn.progress > drawChallengeUtils.firstColumn.maxProgress then
		    drawChallengeUtils.firstColumn.progress = drawChallengeUtils.firstColumn.maxProgress
		end
		-- Second column
		drawChallengeUtils.secondColumn.taskName = tasksTable[2]
		drawChallengeUtils.secondColumn.progress = progressTable[2]
		drawChallengeUtils.secondColumn.maxProgress = maxProgressTable[2]
		if drawChallengeUtils.secondColumn.progress > drawChallengeUtils.secondColumn.maxProgress then
		    drawChallengeUtils.secondColumn.progress = drawChallengeUtils.secondColumn.maxProgress
		end
		-- Third column
		drawChallengeUtils.thirdColumn.taskName = tasksTable[3]
		drawChallengeUtils.thirdColumn.progress = progressTable[3]
		drawChallengeUtils.thirdColumn.maxProgress = maxProgressTable[3]
		if drawChallengeUtils.thirdColumn.progress > drawChallengeUtils.thirdColumn.maxProgress then
		    drawChallengeUtils.thirdColumn.progress = drawChallengeUtils.thirdColumn.maxProgress
		end
	end
	if jobsTable then
	    missionJobs[1] = jobsTable[1]
		missionJobs[2] = jobsTable[2]
		missionJobs[3] = jobsTable[3]
	end
	setTimer(makeScreenLoad, loadTime, 1, false)
	loadTime = 500
end
addEvent("GTIdailyChallenge.recieveData", true)
addEventHandler("GTIdailyChallenge.recieveData", root, recieveData)
function updateTimeLeft(hours, minutes, seconds)
    if hours < 10 then
	    hours = "0"..hours..""
	end
	if minutes < 10 then
	    minutes = "0"..minutes..""
	end
	if seconds < 10 then
	    seconds = "0"..seconds..""
	end
    drawChallengeUtils.timeLeft.hours = hours
    drawChallengeUtils.timeLeft.minutes = minutes
	drawChallengeUtils.timeLeft.seconds = seconds
end
addEvent("GTIdailyChallenge.updateTimeLeft", true)
addEventHandler("GTIdailyChallenge.updateTimeLeft", root, updateTimeLeft)
function setPlayerAbleToOpenPanel(state)
    if state then
	    isAbleToOpenPanel = true
		showDailyChallenge(false)
	else
	    isAbleToOpenPanel = false
		showDailyChallenge(false)
	end
end
addEvent("GTIdailyChallenge.setPlayerAbleToOpenPanel", true)
addEventHandler("GTIdailyChallenge.setPlayerAbleToOpenPanel", root, setPlayerAbleToOpenPanel)
function isPlayerAbleToOpenPanel()
    if isAbleToOpenPanel then
	    return true
	else
	    return false
	end
end
function setDailyChallengeCompleted(state)
    if state then
	    isDailyChallengeCompleted = true
	else
	    isDailyChallengeCompleted = false
	end
end
addEvent("GTIdailyChallenge.setDailyChallengeCompleted", true)
addEventHandler("GTIdailyChallenge.setDailyChallengeCompleted", root, setDailyChallengeCompleted)