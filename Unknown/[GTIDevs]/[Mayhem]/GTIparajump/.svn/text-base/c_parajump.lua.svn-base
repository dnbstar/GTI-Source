--Grand Theft International
local blipImageLocation = "images/parachute2.png"
local open = true

local isParajumping = false
local location = nil
local hoopsDone = 1
local timerOn = false

local inpickup = false

local parajump = {
    pickup = {},

    blipsAndPickups = {
        [1] = { ["x"] = 1779.836, ["y"] = -2542.198, ["z"] = 13.547, ["LOCATION"] = "LSAP"},
        [2] = { ["x"] = -1806.686, ["y"] = 532.409, ["z"] = 35.167, ["LOCATION"] = "SFTOWER"},
    },

    hoops = {
        ["hoop"] = nil,
        ["blip"] = nil,

        ["LSAP"] = {
            ["startingloc"] = { 1532.006, -2647.447, 1060.471 },

            [1] = {1632.307, -2515.842, 781.198},
            [2] = {1696.231, -2633.049, 664.336},
            [3] = {1795.808, -2596.676, 573.302},
            [4] = {1799.583, -2487.822, 464.251},
            [5] = {1927.102, -2412.727, 329.778},
            [6] = {1977.363, -2450.514, 279.040},
            [7] = {2005.418, -2468.753, 252.826},
            [8] = {1955.147, -2547.818, 147.191},
            [9] = {1901.439, -2545.539, 105.063},
            [10] = {1844.527, -2544.232, 60.467},
            [11] = {1783.322, -2542.791, 12.547},
        },

        ["SFTOWER"] = {
            ["startingloc"] = { -1790.794, 568.072, 332.805 },

            [1] = {-1878.234, 510.397, 218.354},
            [2] = {-1923.488, 477.211, 196.839},
            [3] = {-1944.254, 428.689, 176.029},
            [4] = {-1973.868, 404.450, 160.134},
            [5] = {-2020.110, 397.702, 142.003},
            [6] = {-2075.356, 378.371, 114.718},
            [7] = {-2099.212, 379.793, 94.881},
            [8] = {-2143.394, 394.136, 74.123},
            [9] = {-2166.847, 401.749, 64.674},
            [10] = {-2172.085, 403.450, 62.564},
        }
    },
}

function loadBlipsAndPickups()
	if (not getResourceFromName("GTIblips") or getResourceState(getResourceFromName("GTIblips")) ~= "running") then return end
    for i=1, #parajump.blipsAndPickups do
        exports.GTIblips:createCustomBlip(1779.836, -2542.198, 16, 16, blipImageLocation, 300)
        exports.GTIblips:createCustomBlip(-1806.686, 532.409, 16, 16, blipImageLocation, 300)
        
        parajump.pickup[i] = createPickup(parajump.blipsAndPickups[i]["x"], parajump.blipsAndPickups[i]["y"], parajump.blipsAndPickups[i]["z"], 3, 1310)
        parajump.pickup[parajump.pickup[i]] = parajump.blipsAndPickups[i]["LOCATION"]
        addEventHandler("onClientPickupHit", parajump.pickup[i], pickupHit) 
        addEventHandler("onClientPickupLeave", parajump.pickup[i], pickupLeft) 
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(), loadBlipsAndPickups)

function reloadBlips(resource)
    if (getResourceName(resource) == "GTIblips") then
        for i=1, #parajump.blipsAndPickups do
            exports.GTIblips:createCustomBlip(1779.836, -2542.198, 16, 16, blipImageLocation, 300)
            exports.GTIblips:createCustomBlip(-1806.686, 532.409, 16, 16, blipImageLocation, 300)
        end
    end
end
addEventHandler("onClientResourceStart", getRootElement(), reloadBlips)

function pickupHit(hitEle)
    if (hitEle == localPlayer and not isPedInVehicle ( localPlayer ) ) then
        inpickup = true
        location = parajump.pickup[source]
        exports.GTIhud:drawNote("GTIparajump.pressN", "Press 'N' to start a parachute jump mission!", 159, 19, 19, 7000)
    end
end

function pickupLeft(leftEle)
    if (leftEle == localPlayer) then
        inpickup = false
    end
end

function onPressN(button, press)
    if (press) then
        if (button == "n") and (inpickup == true) then
            teleportToTheSky(localPlayer)
        end
    end
end
addEventHandler("onClientKey", getRootElement(), onPressN)

function teleportToTheSky(hitEle)
    if (hitEle == localPlayer) and (isParajumping == false) then
        if (open) then
            triggerServerEvent("GTIparajump.startjump", hitEle, parajump.hoops[location]["startingloc"][1], parajump.hoops[location]["startingloc"][2], parajump.hoops[location]["startingloc"][3])
            isParajumping = true
        else
            exports.GTIhud:dm("This is not open to you yet!", 255, 255, 255)
        end
    end
end

function startHoops()
    if (isParajumping) then
        parajump.hoops["hoop"] = createMarker(parajump.hoops[location][hoopsDone][1], parajump.hoops[location][hoopsDone][2], parajump.hoops[location][hoopsDone][3], "ring", 7)
        parajump.hoops["blip"] = createBlip(parajump.hoops[location][hoopsDone][1], parajump.hoops[location][hoopsDone][2], parajump.hoops[location][hoopsDone][3], 41)
        addEventHandler("onClientMarkerHit", parajump.hoops["hoop"], nextHoop)

        hoopCheck()
        setTimer(failedCourse, 500000, 1)
        timerOn = true
    end
end
addEvent("GTIparajump.starthoops", true)
addEventHandler("GTIparajump.starthoops", getRootElement(), startHoops)

function failedCourse()
    if (timerOn == true) then
        isParajumping = false
        hoopsDone = 1
        timerOn = false

        destroyElement(parajump.hoops["hoop"])
        destroyElement(parajump.hoops["blip"])

        exports.GTIhud:dm("Bad luck, you did not manage to complete the course in time or you missed a hoop!", 255, 255, 255)
    end
end

function nextHoop(hitEle)
    if (localPlayer == hitEle) then
        if (hoopsDone >= #parajump.hoops[location]) then

            local money = hoopsDone * 20
            exports.GTIhud:dm("Good job! You managed to complete the course in time and you have earned $"..money, 255, 255, 255)
            isParajumping = false
            hoopsDone = 1
            timerOn = false

            destroyElement(parajump.hoops["hoop"])
            destroyElement(parajump.hoops["blip"])

            triggerServerEvent("GTIparajump.payplayer", localPlayer, money)
        else
            hoopsDone = hoopsDone + 1

            destroyElement(parajump.hoops["hoop"])
            destroyElement(parajump.hoops["blip"])

            parajump.hoops["hoop"] = createMarker(parajump.hoops[location][hoopsDone][1], parajump.hoops[location][hoopsDone][2], parajump.hoops[location][hoopsDone][3], "ring", 7)
            parajump.hoops["blip"] = createBlip(parajump.hoops[location][hoopsDone][1], parajump.hoops[location][hoopsDone][2], parajump.hoops[location][hoopsDone][3], 41)
            addEventHandler("onClientMarkerHit", parajump.hoops["hoop"], nextHoop)
        end
    end
end

function hoopCheck()
    if (isParajumping) then
        setTimer(hoopCheck, 5000, 1)
        local x, y, z = getElementPosition(localPlayer)

        if (z < parajump.hoops[location][hoopsDone][3] - 10) or (doesPlayerHaveJetPack(localPlayer)) then -- -60 to fix a bug 
            failedCourse()
        end
    end
end

function unableToDoMis()
    isParajumping = false
    hoopsDone = 1
    timerOn = false
end
addEvent("GTIparajump.unable", true)
addEventHandler("GTIparajump.unable", getRootElement(), unableToDoMis)