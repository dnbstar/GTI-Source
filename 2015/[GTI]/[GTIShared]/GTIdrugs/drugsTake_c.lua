Cocaine = false
Marijuana = false
Ecstasy = false
Oxycodone = false
Adderall = false

function startDrugEffect(plr, drug)
    if (drug == "Cocaine") then
        setGameSpeed(1.1)
        setTimer(stopCocaine, 60000, 1, plr)
    elseif (drug == "Marijuana") then
        setGameSpeed(0.9)
        setTimer(stopMarijuana, 60000, 1, plr)
    elseif (drug == "Ecstasy") then
        triggerServerEvent("GTIdrugs.Ecstasy", resourceRoot, plr, true)
    elseif (drug == "Oxycodone") then
        triggerServerEvent("GTIdrugs.sethealth", resourceRoot, plr, 1000)
        setTimer(stopOxycodone, 60000, 1, plr)
    elseif (drug == "Adderall") then
        Adderall = true
        setWeaponProperty(30, "poor", "accuracy", 0.44999998807907)
        setWeaponProperty(30, "std", "accuracy", 0.44999998807907)
        setWeaponProperty(30, "pro", "accuracy", 0.44999998807907)
        setTimer(stopAdderall, 60000, 1, plr)
    elseif (drug == "Laughing Gas") then
    elseif (drug == "Bath Salts") then
    elseif (drug == "Shrooms") then
    elseif (drug == "Tylenol") then
        enableBlackWhite()
        setTimer(stopTylenol, 60000, 1, plr)
    elseif (drug == "Morphine") then
    elseif (drug == "Green Goo") then
    elseif (drug == "Acid") then
    end
end

function stopOxycodone(plr)
    triggerServerEvent("GTIdrugs.sethealthBack", resourceRoot, plr, 569) 
end

function stopAdderall(plr)
    setWeaponProperty(30, "poor", "accuracy", 0.40000000596046)
    setWeaponProperty(30, "std", "accuracy", 0.40000000596046)
    setWeaponProperty(30, "pro", "accuracy", 0.40000000596046)
end

function stopTylenol()
    enableBlackWhite()
end    

function stopCocaine(plr)
    triggerServerEvent("GTIdrugs.getServerTime", resourceRoot, plr)
end

function stopMarijuana(plr)
    triggerServerEvent("GTIdrugs.getServerTime", resourceRoot, plr)
end

function setTimePlr(plr, hour, minute)
    setGameSpeed(1)
    setTime(hour, minute)
end
addEvent("GTIdrugs.setTime", true)
addEventHandler("GTIdrugs.setTime", root, setTimePlr)

