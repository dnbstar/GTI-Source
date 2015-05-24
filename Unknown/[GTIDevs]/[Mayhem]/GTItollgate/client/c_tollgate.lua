--[[
    Grand Theft International
    Author: MagicMayhem
--]]
screenW, screenH = guiGetScreenSize()
text = nil
toll = false

function respawnBarrier(obj, state)
	if isElement(tempcol) and isElementWithinColShape(localPlayer,tempcol) then
		setTimer(respawnBarrier, 3000, 1, obj, state) 
	return end
    respawnObject(obj)
	if isElement(tempcol) then destroyElement(tempcol) end
    if (state) then
   		toll = false
   	end
end

function barrierBroken(attacker)
    if (not isElement(attacker)) then return end
    if (getElementType(attacker) == "vehicle") then
        if (getElementModel(source) == 2920) then
            local driver = getVehicleOccupant(attacker)
    
            if (driver) then
            if (toll == false) then 
                toll = true
				local x,y,z = getElementPosition(source)
				tempcol = createColSphere(x,y,z,7)
     
                setTimer(respawnBarrier, 5000, 1, source, true)
                triggerServerEvent("GTItollgate.barrierbroken", driver, driver) -- Pass through driver, since predefined "client" is buggy with onClientObjectBreak
            else
                setTimer(respawnBarrier, 3000, 1, source)
            end
        end
        end
    else
        setTimer(respawnBarrier, 1500, 1, source)
    end   
end
addEventHandler("onClientObjectBreak", root, barrierBroken)

function TollGateSpeak(tollText, state)
    if (state) then
        if (text == nil) then
            text = tollText
            addEventHandler("onClientRender", root, drawDXText)
        else
            text = tollText
        end
    else
        removeEventHandler("onClientRender", root, drawDXText)
        text = nil
    end
end
addEvent("GTItollgate.tollgatespeak", true)
addEventHandler("GTItollgate.tollgatespeak", root, TollGateSpeak)

function drawDXText()
        dxDrawRectangle(0.744*screenW, 0.161*screenH, 0.246*screenW, 0.093*screenH, tocolor(0, 0, 0, 147), true)
        dxDrawText("Toll Worker: " .. text, (772/1024)*screenW, (134/768)*screenH, (1009/1024)*screenW, (182/768)*screenH, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, true, true, false, false)
end

function sayThankYou() -- plays the "thank you for waiting" sound.
    playSound("sounds/thanks.wav")
end
addEvent("GTItollgate.saythankyou", true)
addEventHandler("GTItollgate.saythankyou", root, sayThankYou)