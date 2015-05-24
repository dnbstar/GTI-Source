
local storesPolygon = {
    {1095.133, -1481.321, 1095.133, -1481.321, 1086.573, -1478.654, 1091.932, -1462.622, 1100.459, -1465.282, 19},
	{1099.679, -1509.838, 1099.679, -1509.838, 1095.834, -1499.255, 1084.430, -1503.599, 1088.489, -1514.332, 19.5 },
	--{x, y, x1, y1, x2, y2, x3, y3, x4, y4, maxZ},
}
local storePeds = {
    {147, 1094.492, -1468.138, 15.381, 90} -- Skin ID, X, Y, Z, Rotation
	--{id, x, y, z, rot}
}
local colCuboid
local colPolygon
local peds
function createColsOnResourceStart(res)
    for i=1, #storePeds do
	peds = createPed(storePeds[i][1], storePeds[i][2], storePeds[i][3], storePeds[i][4], storePeds[i][5])
	setPedFrozen(peds, true)
	setElementData(peds, "GTIstorerobbery.isStorePed", true)
	end
	for i=1, #storesPolygon do
	colPolygon =  createColPolygon( storesPolygon[i][1], storesPolygon[i][2], storesPolygon[i][3], storesPolygon[i][4], storesPolygon[i][5], storesPolygon[i][6], storesPolygon[i][7], storesPolygon[i][8], storesPolygon[i][9], storesPolygon[i][10])
	setElementData(colPolygon, "GTIstorerobbery.maxZ", storesPolygon[i][11])
	addEventHandler("onColShapeHit", colPolygon, onPlayerHitColShape)
	addEventHandler("onColShapeLeave", colPolygon, onPlayerLeaveColShape)
	end
end
addEventHandler("onResourceStart", resourceRoot, createColsOnResourceStart)
function onPlayerHitColShape(hitElement, matchingDimension)
    if getElementType(hitElement) == "player" then
	    if exports.GTIemployment:getPlayerJob(hitElement) == "Criminal" then
        local x, y, z = getElementPosition(hitElement)
	        if tonumber(getElementData(source, "GTIstorerobbery.maxZ")) > tonumber(z) then
                if getElementData(source, "GTIstorerobbery.IsStoreBeingRobbed") then
                exports.GTIhud:drawNote("GTIstorerobbery.CannotRobStore", "This store is being robbed by "..tostring(getElementData(source, "GTIstorerobbery.IsStoreBeingRobbed")).."", hitElement, 215, 70, 45, 5000)
                return false end
	        setElementData(hitElement, "GTIstorerobbery.isPlayerReadyForSR", true)
	        triggerClientEvent(hitElement, "GTIstorerobbery.checkForTarget", hitElement, source)
            end
        end
    end
end
function onPlayerLeaveColShape(hitElement, matchingDimension)
    if getElementType(hitElement) == "player" then
	triggerClientEvent(hitElement, "GTIstorerobbery.onClientPlayerLeaveColShape", hitElement)
	if getElementData(source, "GTIstorerobbery.IsStoreBeingRobbed") == getAccountName(getPlayerAccount(hitElement)) then
	removeElementData(source, "GTIstorerobbery.IsStoreBeingRobbed")
	end
	setElementData(hitElement, "GTIstorerobbery.currentRound", 0)
	removeElementData(hitElement, "GTIstorerobbery.isPlayerReadyForSR")
end
end
function onPlayerStartRobbery(ped, colshape)
    setElementData(client, "GTIstorerobbery.currentRound", 0)
	exports.GTIpoliceWanted:chargePlayer(client, 24)
	setElementData(colshape, "GTIstorerobbery.IsStoreBeingRobbed", getAccountName(getPlayerAccount(client)))
	setPedAnimation(ped, "ped", "handsup", -1, false, false, false)
end
addEvent("GTIstorerobbery.onPlayerStartRobbery", true)
addEventHandler("GTIstorerobbery.onPlayerStartRobbery", root, onPlayerStartRobbery)
local moneyBag = {}
local antiAbuseTimer = {}
function onPlayerFinishRobbery(ped, colshape)
	setElementData(client, "GTIstorerobbery.preventRobberyAbuse", true)
	setElementData(client, "GTIstorerobbery.currentRound", 0)
	removeElementData(colshape, "GTIstorerobbery.IsStoreBeingRobbed")
	antiAbuseTimer[client] = setTimer(removeElementData, 420000, 1, client, "GTIstorerobbery.preventRobberyAbuse")
	setPedAnimation(ped, false)
	local x, y, z = getElementPosition(client)
	moneyBag[client] = createObject(1550, x, y, z-10)
	exports.bone_attach:attachElementToBone(moneyBag[client],client,3,0,-0.3,0,0,0,90)
	triggerClientEvent(client, "GTIstorerobbery.checkPositionStore", client, x, y, z)
end
addEvent("GTIstorerobbery.onPlayerFinishRobbery", true)
addEventHandler("GTIstorerobbery.onPlayerFinishRobbery", root, onPlayerFinishRobbery)
function onPlayerFinishRound()
	setElementData(client, "GTIstorerobbery.currentRound", (getElementData(client, "GTIstorerobbery.currentRound") or 0)+1)
end
addEvent("GTIstorerobbery.onPlayerFinishRound", true)
addEventHandler("GTIstorerobbery.onPlayerFinishRound", root, onPlayerFinishRound)
function rewardCriminal()
    if isElement(moneyBag[client]) then
	destroyElement(moneyBag[client])
	end
	local amount = math.random(2000, 2500)
    exports.GTIcriminals:givePlayerTaskMoney(client, "Store Robbery", amount)
    exports.GTIcriminals:modifyPlayerCriminalRep(client, 1000, "Store Robbery")
    exports.GTIcriminals:modifyPlayerTaskProgress(client, "Store Robbery", 1)
end
addEvent("GTIstorerobbery.rewardCriminal", true)
addEventHandler("GTIstorerobbery.rewardCriminal", root, rewardCriminal)
--
addEventHandler("onPlayerQuit", root, function()
    if isTimer(antiAbuseTimer[source]) then
	killTimer(antiAbuseTimer[source])
	antiAbuseTimer[source] = nil
	end
end)