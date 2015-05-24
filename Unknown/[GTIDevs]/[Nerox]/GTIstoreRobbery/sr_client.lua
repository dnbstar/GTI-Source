local allowedWeapons ={
    [24] = true,
    [25] = true,
    [27] = true,
    [29] = true,
    [30] = true,
    [31] = true
}
local mx, my = 1440, 900
local sx, sy = guiGetScreenSize()
local ax, ay = (sx/mx), (sy/my)
local isFunctionCalled = false
local robberyTimer
local roundTimer
local maxRounds = 4
local moneyBag
local colshape
function showTimeLeftForRobbery()
    if isTimer(robberyTimer) and isFunctionCalled then
	local mtimeLeft,_,_ = getTimerDetails ( robberyTimer )
	local stimeLeft, _, _ = getTimerDetails ( roundTimer )
	local minutes, seconds	= math.floor((mtimeLeft / 60000))
	local seconds = math.floor((stimeLeft / 1000))
	if minutes < 10 then
	minutes = "0"..minutes
	end
	if seconds < 10 then
	seconds = "0"..seconds
	end
    exports.GTIhud:drawStat("GTIstorerobbery.timeleftstat", "Time left for robbery", ""..minutes..":"..seconds.."", 255, 255, 255, 1000)
	local currentRound = getElementData(localPlayer, "GTIstorerobbery.currentRound") or 0
    exports.GTIhud:drawStat("GTIstorerobbery.roundsleftstat", "Round", ""..currentRound.."/"..maxRounds.."", 75, 24, 89, 1000)
end
end
function checkPlayerTarget()
    if exports.GTIemployment:getPlayerJob() == "Criminal" and getElementData(localPlayer, "GTIstorerobbery.isPlayerReadyForSR") then
    if getPedTarget(localPlayer) and getElementType(getPedTarget(localPlayer)) == "ped" then
	if isPedDoingTask (localPlayer, "TASK_SIMPLE_USE_GUN" ) and allowedWeapons[getPedWeapon(localPlayer)] then
	if getElementData(getPedTarget(localPlayer), "GTIstorerobbery.isStorePed") and not isFunctionCalled then
	if getElementData(localPlayer, "GTIstorerobbery.preventRobberyAbuse") then return exports.GTIhud:drawStat("GTIstorerobbery.limiterror", "You can only rob 1 store every 3 minutes", "", 255, 0, 0, 50) end
	targetPed = getPedTarget(localPlayer)
	isFunctionCalled = true
	triggerServerEvent("GTIstorerobbery.onPlayerStartRobbery", localPlayer, targetPed, colshape)
	robberyTimer = setTimer(function()
	triggerServerEvent("GTIstorerobbery.onPlayerFinishRobbery", localPlayer, targetPed, colshape)
	removeEventHandler("onClientRender", root, showTimeLeftForRobbery)
	isFunctionCalled = false
    end, 240000, 1)
	roundTimer = setTimer(function()
	triggerServerEvent("GTIstorerobbery.onPlayerFinishRound", localPlayer)
	end, 60000, 4)
	addEventHandler("onClientRender", root, showTimeLeftForRobbery)
end
end
end
end
end
function checkForTarget(theColshape)
    addEventHandler("onClientRender", root, checkPlayerTarget)
	colshape = theColshape
end
addEvent("GTIstorerobbery.checkForTarget", true)
addEventHandler("GTIstorerobbery.checkForTarget", root, checkForTarget)
function onClientPlayerLeaveColShape()
    removeEventHandler("onClientRender", root, checkPlayerTarget)
	removeEventHandler("onClientRender", root, showTimeLeftForRobbery)
	isFunctionCalled = false
	if isTimer(robberyTimer) then
	killTimer(robberyTimer)
	end
	if isTimer(roundTimer) then
	killTimer(roundTimer)
	end
end
addEvent("GTIstorerobbery.onClientPlayerLeaveColShape", true)
addEventHandler("GTIstorerobbery.onClientPlayerLeaveColShape", root, onClientPlayerLeaveColShape)
addEvent("GTIstorerobbery.onClientFinishRobbery", true)
addEventHandler("GTIstorerobbery.onClientFinishRobbery", root, onClientPlayerLeaveColShape)
function cancelPedDamage ( attacker )
    if getElementData(source, "GTIstorerobbery.isStorePed") then
	cancelEvent()
end
end
addEventHandler ( "onClientPedDamage", getRootElement(), cancelPedDamage )
local stX, stY, stZ
function getPlayerPositionToStore()
    local x, y, z = getElementPosition(localPlayer)
	local distance = getDistanceBetweenPoints3D ( x, y, z, stX, stY, stZ )
	if distance >= 160 then
	triggerServerEvent("GTIstorerobbery.rewardCriminal", localPlayer)
	removeEventHandler("onClientRender", root, getPlayerPositionToStore)
	end
end
function checkPositionStore(x, y, z)
    stX, stY, stZ = x, y, z
    addEventHandler("onClientRender", root, getPlayerPositionToStore)
end
addEvent("GTIstorerobbery.checkPositionStore", true)
addEventHandler("GTIstorerobbery.checkPositionStore", root, checkPositionStore)
function cancelRobbery(jobname) -- Cancel the robbery when the criminal resign.
    if jobname == "Criminal" then
	removeEventHandler("onClientRender", root, checkPlayerTarget)
	removeEventHandler("onClientRender", root, showTimeLeftForRobbery)
	if isTimer(robberyTimer) and isTimer(roundTimer) then
	killTimer(robberyTimer)
	killTimer(roundTimer)
	end
end
end
addEventHandler("onClientPlayerQuitJob", root, cancelRobbery)