local mainBinds = {"aim_weapon", "fire", "previous_weapon", "next_weapon"}
local offsetType = nil
local offsetAmount = 0.030
local totalOffsetAmount = 0
local tempObj = nil

local screenX, screenY = guiGetScreenSize()
function onCursorMove(cursorX, cursorY)
    if (tempObj and isElement(tempObj)) then
        if (isCursorShowing()) then
            local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
            local px, py, pz = getCameraMatrix()
            local dist = getElementDistanceFromCentreOfMassToBaseOfModel(tempObj)
            local hit, x, y, z, elementHit = processLineOfSight(px, py, pz, worldx, worldy, worldz, true, true, false, true, true, false, false, false)
            if (hit) then
                local px, py, pz = getElementPosition(localPlayer)
                local distance = getDistanceBetweenPoints3D(px, py, pz, x, y, z)
                setElementPosition(tempObj, x, y, (z + dist + totalOffsetAmount))
            end
        end
    end
end
addEventHandler("onClientCursorMove", root, onCursorMove)

function startMovement( oid)
	showEventPanel( false, true)
	tempObj = createObject( tonumber(oid), 0, 0, 0, 0, 0, 0)
    setElementCollisionsEnabled(tempObj, false)
    setElementDoubleSided(tempObj, true)
    setElementDimension(tempObj, getElementDimension(localPlayer))
    setElementInterior(tempObj, getElementInterior(localPlayer))
	-- Configure New Controls
    bindKey("mouse_wheel_up", "down", rotateObject)
    bindKey("mouse_wheel_down", "down", rotateObject)
    bindKey("mouse1", "down", placeObject)
    bindKey("mouse2", "down", cancelObject)
    for i, v in pairs(mainBinds) do
        toggleControl(tostring(v), false)
    end
end

function placeObject()
    if (not tempObj) then return end
	showEventPanel( true)
    local x, y, z = getElementPosition(tempObj)
    local rx, ry, rz = getElementRotation(tempObj)
    local id = getElementModel(tempObj)
    local dim = getElementDimension(localPlayer)
    local int = getElementInterior(localPlayer)
    if (getElementType(tempObj) == "object") then
        triggerServerEvent( "GTIevents.spawnObject", localPlayer, id, x..","..y..","..z, rx..","..ry..","..rz, localPlayer, dim, int)
		updateElementList()
    end
    destroyElement(tempObj)
    unbindKey("mouse2", "down", cancelObject)
    unbindKey("mouse1", "down", placeObject)
    unbindKey("mouse_wheel_up", "down", rotateObject)
    unbindKey("mouse_wheel_down", "down", rotateObject)
    totalOffsetAmount = 0
    --guiSetEnabled(placeBtn, true)
    for i, v in pairs(mainBinds) do
        toggleControl(tostring(v), true)
    end
end

function cancelObject()
	showEventPanel( true)
	updateElementList()
    destroyElement(tempObj)
    unbindKey("mouse2", "down", cancelObject)
    unbindKey("mouse1", "down", placeObject)
    unbindKey("mouse_wheel_up", "down", rotateObject)
    unbindKey("mouse_wheel_down", "down", rotateObject)
    totalOffsetAmount = 0
    --guiSetEnabled(placeBtn, true)
    for i, v in pairs(mainBinds) do
        toggleControl(tostring(v), true)
    end
end

function rotateObject(key)
    local rX, rY, rZ = getElementRotation(tempObj)
    if (key == "mouse_wheel_up") then
        if (isElement(tempObj)) then
            if (not getKeyState("lctrl") and not getKeyState("lshift")) then
                setElementRotation(tempObj, rX, rY, rZ + 5)
            end
            if (getKeyState("lctrl") and not getKeyState("lshift")) then
                setElementRotation(tempObj, rX, rY + 5, rZ)
            end
            if (getKeyState("lctrl") and getKeyState("lshift")) then
                setElementRotation(tempObj, rX + 5, rY, rZ)
            end
        end
    elseif (key == "mouse_wheel_down") then
        if (not getKeyState("lctrl") and not getKeyState("lshift")) then
            setElementRotation(tempObj, rX, rY, rZ - 5)
        end
        if (getKeyState("lctrl") and not getKeyState("lshift")) then
            setElementRotation(tempObj, rX, rY - 5, rZ)
        end
        if (getKeyState("lctrl") and getKeyState("lshift")) then
            setElementRotation(tempObj, rX - 5, rY, rZ)
        end
    end
end

function toggleOffsets(key, state)
    if (state == "up") then
        offsetType = nil
        return
    end
    if (key == "arrow_u") then
        offsetType = "up"
    elseif (key == "arrow_d") then
        offsetType = "down"
    end
end
bindKey("arrow_u", "both", toggleOffsets)
bindKey("arrow_d", "both", toggleOffsets)


function clientPreRender()
    if (offsetType and tempObj and isElement(tempObj)) then
        local addition = 0
        if (getKeyState("lalt")) then
            addition = offsetAmount*100
        end
        local x, y, z = getElementPosition(tempObj)
        if (offsetType == "up") then
            setElementPosition(tempObj, x, y, z + offsetAmount + addition)
            totalOffsetAmount = totalOffsetAmount + offsetAmount + addition
        elseif (offsetType == "down") then
            setElementPosition(tempObj, x, y, z - offsetAmount - addition)
            totalOffsetAmount = totalOffsetAmount - offsetAmount - addition
        end
    end
end
addEventHandler("onClientPreRender", root, clientPreRender)
