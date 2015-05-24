local farmerBailQuotaLimit = {
    [0] = 250,
    [1] = 300,
    [2] = 350,
    [3] = 400,
    [4] = 450,
    [5] = 500,
    [6] = 550,
    [7] = 600,
    [8] = 650,
    [9] = 700,
    [10] = 1000,
}

function getFarmerMaximumQuota(theFarmer)
    local level = exports.GTIemployment:getPlayerJobLevel(theFarmer, "Farmer")
    local qtuota = farmerBailQuotaLimit[level]
    return qtuota
end

function notAllowedToUse(daPlayah)
    exports.GTIhud:dm("You need to be working as a farmer in order to use the spawner", daPlayah, 255, 255, 0)
end
addEvent("farmerVehicleMessage", true)
addEventHandler("farmerVehicleMessage", root, notAllowedToUse)

function notAllowedToUse2(daPlayah)
    exports.GTIhud:dm("You need to be working as a farmer in order to buy seeds", daPlayah, 255, 255, 0)
end
addEvent("farmerSeedMessage", true)
addEventHandler("farmerSeedMessage", root, notAllowedToUse2)

local fcarsTrailer = { }
local fcarsTrucks = { }

function attach(elem, em)
    if not isElement(em) then
        if isTimer(timer1) then
            killTimer(timer1)
        end
        if isTimer(timer2) then
            killTimer(timer2)
        end
    else
        if not isElement(elem) then
            killTimer(timer1)
            killTimer(timer2)
            destroyElement(em)
        else
            attachTrailerToVehicle(elem, em)
        end
    end
end

addEventHandler ("onVehicleEnter", root,
    function (thePlayer, seat, jacked)
    local x, y, z = getElementPosition (thePlayer )
    local job = getElementData(thePlayer, "job")
    local theVehicle = getElementModel(source)
    if (job == "Farmer" ) then
        if theVehicle == 531 then
            if isElement(fcarsTrailer[thePlayer]) then
                destroyElement(fcarsTrailer[thePlayer])
            end
            fcarsTrailer [ thePlayer ] = createVehicle(610, x, y, z+1 )
            attachTrailerToVehicle(source, fcarsTrailer [ thePlayer ])
            setTimer(attachTrailerToVehicle, 100, 1, source, fcarsTrailer[thePlayer])
            --timer1 = setTimer(attachTrailerToVehicle, 500, 0, source, fcarsTrailer [ thePlayer ])
            timer1 = setTimer(attach, 1500, 0, source, fcarsTrailer [ thePlayer ])
            timer2 = setTimer(triggerClientEvent, 1500, 0, root, "noTrailerCollide", root, fcarsTrailer[thePlayer], source)
            triggerClientEvent(thePlayer, "getFarmTrailer", thePlayer, fcarsTrailer[thePlayer])
        elseif theVehicle == 403 then
            fcarsTrucks [ thePlayer ] = createVehicle(435, x, y, z+1)
            attachTrailerToVehicle(source, fcarsTrucks [ thePlayer ])
            setTimer(attachTrailerToVehicle, 1500, 1, source, fcarsTrucks[thePlayer])
            timer1 = setTimer(attachTrailerToVehicle, 1000, 0, source, fcarsTrucks [ thePlayer ])
            timer2 = setTimer(triggerClientEvent, 1000, 0, root, "noTrailerCollide", root, fcarsTrucks[thePlayer], source)
        else
            if isTimer(timer1) then
                killTimer(timer1)
                killTimer(timer2)
            end
        end
    end
    if theVehicle == 532 then
        local planted = getElementData(thePlayer, "planted")
        if planted == true then
            if planted == false then
                destroyElement(source)
            end
        else
            destroyElement(source)
            if isTimer(timer1) then
                killTimer(timer1)
                killTimer(timer2)
            end
            exports.GTIhud:dm("Your crops aren't ready for harvesting", thePlayer, 255, 0, 0)
        end
    end
end
)

addEvent ("plantedSeeds", true )
addEventHandler ("plantedSeeds", root,
    function(player, chk)
        if chk == true then
            setElementData(player, "planted", true)
            exports.GTIhud:dm("Your crops are ready for harvesting", player, 0, 255, 0)
        elseif chk == false then
            setElementData(player, "planted", false)
        end
    end
)

function destroyVehicle()
    if isTimer(timer1) then
        killTimer(timer1)
        killTimer(timer2)
    end
    if (isElement(fcarsTrailer[source])) then
        destroyElement(fcarsTrailer[source])
    elseif (isElement(fcarsTrucks[source])) then
        destroyElement(fcarsTrucks[source])
    end
end
addEventHandler("onPlayerWasted", root, destroyVehicle)
addEventHandler("onPlayerLogout", root, destroyVehicle)
addEventHandler("onPlayerQuit", root, destroyVehicle)

function getRidOfFCar(daPlayah)
    if isTimer(timer1) then
        killTimer(timer1)
        killTimer(timer2)
    end
    if (isElement(fcarsTrailer[daPlayah])) then
        destroyElement (fcarsTrailer[daPlayah])
    elseif (isElement(fcarsTrucks[daPlayah])) then
        destroyElement(fcarsTrucks[daPlayah])
    end
end
addEvent("destroyTheFCar", true)
addEventHandler("destroyTheFCar", root, getRidOfFCar)

addEventHandler("onVehicleExit", root,
    function(player)
        local job = getElementData(player, "job")
        local theVehicle = getElementModel(source)
        if job == "Farmer" then
            if theVehicle == 531 then
                if isElement(fcarsTrailer[player]) then
                    destroyElement(fcarsTrailer[player])
                end
            end
        end
    end
)

addEventHandler("onPlayerCommand", root,
    function(cmd)
        if cmd == "hide" then
            local theVehicle = getPedOccupiedVehicle (source )
            if (theVehicle) then
                local vehId = getVehicleModelFromName (getVehicleName(theVehicle))
            end
            if (vehId == 532 or vehId == 478) then return end
            if getElementData(source, "job") == "Farmer" then
                if (isElement(fcarsTrailer[source]) or isElement(fcarsTrucks[source])) then
                    if isElement(fcarsTrailer[source]) then
                        speedx, speedy, speedz = getElementVelocity(fcarsTrailer[source])
                    elseif isElement(fcarsTrucks[source]) then
                        speedx, speedy, speedz = getElementVelocity(fcarsTrucks[source])
                    end
                    local actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)*180
                    if actualspeed < 0 then
                        exports.GTIhud:dm("Job vehicle destroyed! Thanks for being tidy.", source, 0, 255, 0)
                        local name = getPlayerName(source)
                        --exports.GTIsocial:logSocialMessage(name, "Job vehicle destroyed! Thanks for being tidy.", "brief", 4, "Briefing", "Job Vehicle Destroyed", "player")
                        if isTimer(timer1) or isTimer(timer2) then
                            killTimer(timer1)
                            killTimer(timer2)
                        end
                        if isElement(fcarsTrailer[source]) then
                            destroyElement(fcarsTrailer[source])
                        elseif (isElement(fcarsTrucks[source])) then
                            destroyElement(fcarsTrucks[source])
                        end
                    else
                        exports.GTIhud:dm("Slow down to less than 50 KPH first in order to use /hide", source, 255, 255, 0)
                    end
                    elseif (not isElement(fcarsTrailer[source]) or not isElement(fcarsTrucks[source])) then
                    exports.GTIhud:dm("You currently don't have a job vehicle to destroy!", source, 255, 0, 0)
                end
            end
        end
    end
)

----------------------------------------------------------------------------------------------------------------------------

addEvent("checkFarmer", true)
addEventHandler("checkFarmer", root,
function(elem, state)
    if (elem) then
        if (state == "Yes") then
            local occ = getElementData(elem, "job")
            if occ == "Farmer" then
                triggerClientEvent(elem, "showSeedsView", elem)
            end
        elseif (state == "No") then
            triggerClientEvent(elem, "hideSeedsView", elem)
        end
    end
end
)

addEvent("checkFarmerSeeds", true)
addEventHandler("checkFarmerSeeds", root,
function(player)
    if (player) then
        local account = getPlayerAccount(player)
        if (account) then
            local seeds = exports.GTIaccounts:invGet(account, "farmer.seeds") or 0
            local quota = exports.GTIaccounts:invGet(account, "farmer.quota") or 0
            local qtuota = getFarmerMaximumQuota(player)
            local seeds = tonumber(seeds)
            local quota = tonumber(quota)
            triggerClientEvent(player, "placeSeeds", player, seeds)
            triggerClientEvent(source, "setBailQuota", source, quota, qtuota)
        end
    end
end
)

addEventHandler("onPlayerLogin", root,
    function()
        setTimer(farmerFixLogin, 1000, 1, source)
    end
)

addEventHandler("onResourceStart", resourceRoot,
    function()
        for i, player in pairs (getElementsByType("player")) do
            if exports.GTIemployment:getPlayerJob(player) == "Farmer" then
                setTimer(farmerFixLogin, 1000, 1, player)
            end
        end
    end
)

function makePlayerFarmer(jobName, newJob)
    setTimer(farmerFixLogin, 250, 1, source)
end
addEventHandler("onPlayerGetJob", root, makePlayerFarmer)

function removeFarmer(jobName, resignJob)
    setTimer(farmerFixLogin, 250, 1, source)
end
addEventHandler("onPlayerQuitJob", root, removeFarmer)

function farmerFixLogin(theElement)
    triggerClientEvent(theElement, "fixFarmerLogin", theElement)
    if getElementData(theElement, "job") == "Farmer" then
        local account = getPlayerAccount(theElement)
        local seeds = exports.GTIaccounts:invGet(account, "farmer.seeds") or 0
        local quota = exports.GTIaccounts:invGet(account, "farmer.quota") or 0
        local division = exports.GTIemployment:getPlayerJobDivision(theElement)
        local quotaLimit = getFarmerMaximumQuota(theElement)
        local seeds = tonumber(seeds)
        local quota = tonumber(quota)
        triggerClientEvent(theElement, "placeSeeds", theElement, seeds)
        triggerClientEvent(theElement, "setBailQuota", theElement, quota, quotaLimit)
        triggerClientEvent(theElement, "setDivisionObject", theElement, tostring(division))
    end
end

addEvent("giveTheSeeds", true)
addEventHandler("giveTheSeeds", root,
function(seeds, cost)
    if (seeds) then
        local account = getPlayerAccount(client)
        local accountName = getAccountName(account)
        if (account) then
            local tseeds = exports.GTIaccounts:invGet(account, "farmer.seeds") or 0
            local tseeds = tonumber(tseeds)
            if tseeds+seeds >= 10000 then
                newSeedCount = 10000
            else
                newSeedCount = tseeds+seeds
            end
            exports.GTIbank:TPM(client, cost, "Farmer: Bought "..tostring(amount).." seeds.")
            exports.GTIaccounts:invSet(account, "farmer.seeds", newSeedCount)
            triggerClientEvent(client, "placeSeeds", client, newSeedCount)
            exports.GTIhud:dm("You bought "..seeds.." seeds", client, 255, 255, 0)
        end
    end
end
)

addEvent("takeTheSeeds", true)
addEventHandler("takeTheSeeds", root,
    function(seeds)
        if (seeds) then
            local account = getPlayerAccount(client)
            if (account) then
                local tseeds = exports.GTIaccounts:invGet(account, "farmer.seeds") or 0
                local tseeds = tonumber(tseeds)
                local cseeds = tseeds-seeds
                if cseeds < 0 then return false end
                exports.GTIaccounts:invSet(account, "farmer.seeds", tseeds-seeds)
                triggerClientEvent(client, "placeSeeds", client, tseeds-seeds)
            end
        end
    end
)

local jobCash = {}
function setsJobCash(bails)
    local payOffset = exports.GTIemployment:getPlayerJobPayment(client, "Farmer")
    local hrPay = exports.GTIemployment:getPlayerHourlyPay(client)
    local hrExp = exports.GTIemployment:getHourlyExperience()
    local pay = math.ceil( bails*payOffset )
    local Exp = math.ceil( (pay/hrPay)*hrExp )

    exports.GTIemployment:modifyPlayerJobProgress(client, "Farmer", 10)
    exports.GTIemployment:modifyPlayerEmploymentExp(client, Exp, "Farmer")

    local account = getPlayerAccount(client)
    local quota = getBailQuota(account)
    if (quota <= getFarmerMaximumQuota(client)) then
        setsBailQuota(xp)
    end
end
addEvent("setsJobCash", true)
addEventHandler("setsJobCash", root, setsJobCash)

function getBailQuota(account)
    if account then
        local bailQuota = exports.GTIaccounts:invGet(account, "farmer.quota") or 0
        local bailQuota = tonumber(bailQuota)
        return bailQuota
    end
end
addEvent("getBailQuota", true)
addEventHandler("getBailQuota", root, getBailQuota)

function setsBailQuota(quota)
    if tonumber(quota) then
        local account = getPlayerAccount(source)
        if account then
            local bailQuota = getBailQuota(account)
            local maxQuota = getFarmerMaximumQuota(source)
            local difference = maxQuota - bailQuota
            if (difference < 50) then
                exports.GTIaccounts:invSet(account, "farmer.quota", bailQuota+difference)
                triggerClientEvent(source, "setBailQuota", source, bailQuota+difference, getFarmerMaximumQuota(source))
            else
                exports.GTIaccounts:invSet(account, "farmer.quota", bailQuota+quota)
                triggerClientEvent(source, "setBailQuota", source, bailQuota+quota, getFarmerMaximumQuota(source))
            end
        end
    end
end
addEvent("setsBailQuota", true)
addEventHandler("setsBailQuota", root, setsBailQuota)

function removeBailQuota(thePlayer, quota)
    if isElement(thePlayer) then
        if tonumber(quota) then
            local acc = getPlayerAccount(thePlayer)
            local quota = exports.GTIaccounts:invGet(account, "farmer.quota") or 0
            local bailQuota = tonumber(quota)
            exports.GTIaccounts:invSet(acc, "farmer.quota", bailQuota-quota)
            triggerClientEvent(source, "setBailQuota", source, bailQuota-quota, getFarmerMaximumQuota(thePlayer))
        end
    end
end
addEvent("removeBailQuota", true)
addEventHandler("removeBailQuota", root, removeBailQuota)

--Quota Purchase
function sendStartMessage(thePlayer, x, y, z)
    local location = getZoneName (x, y, z )
    local city = getZoneName (x, y, z, true)
    local account = getPlayerAccount(thePlayer)
    local quota = exports.GTIaccounts:invGet(account, "farmer.quota") or 0
    local bailQuota = tonumber(quota)
    if bailQuota == 0 then
        triggerClientEvent(thePlayer, "farmerRemoveMission", thePlayer, "you don't have enough quota")
    else
        exports.GTIhud:dm("Drive up to "..location..", "..city.." to sell all your quota", thePlayer, 255, 255, 0)
    end
end
addEvent("farmerDeliver", true)
addEventHandler("farmerDeliver", root, sendStartMessage)

function restoreControl(thePlayer)
    for k, v in ipairs({"accelerate", "enter_exit", "handbrake"}) do
        toggleControl(thePlayer, v, true)
    end
    local vehicle = getPedOccupiedVehicle (thePlayer )
    if (vehicle ) then
        setElementFrozen (vehicle, false )
    end
    setControlState(thePlayer, "handbrake", false)
    fadeCamera(thePlayer, true)
end

function sendFinishMessage(thePlayer)
    local account = getPlayerAccount(thePlayer)
    local quota = exports.GTIaccounts:invGet(account, "farmer.quota") or 0
    local theQuota = tonumber(quota)
    removeBailQuota(thePlayer, theQuota)

    local payOffset = exports.GTIemployment:getPlayerJobPayment(client, "Farmer")
    local pay = math.ceil( theQuota*payOffset )

    exports.GTIhud:dm("You sold all of your quota. Return to the farm for more work.", thePlayer, 0, 255, 0)
    exports.GTIemployment:givePlayerJobMoney(thePlayer, "Farmer", pay)

    for k, v in ipairs({"accelerate", "enter_exit", "handbrake"}) do
        toggleControl(thePlayer, v, false)
    end
    setControlState(thePlayer, "handbrake", true)
    fadeCamera(thePlayer, false, 1)
    setTimer(restoreControl, 2500, 1, thePlayer)
end
addEvent("farmerDelivered", true)
addEventHandler("farmerDelivered", root, sendFinishMessage)

function sendCancelledMessage(thePlayer, reason)
    if not reason then
        exports.GTIhud:dm("Your delivery was cancelled", thePlayer, 255, 255, 0)
    else

        if reason and type(reason) == "string" then
            exports.GTIhud:dm("Your delivery was cancelled because "..reason, thePlayer, 255, 255, 0)
        else
            exports.GTIhud:dm("Your delivery was cancelled", thePlayer, 255, 255, 0)
        end
    end
end
addEvent("farmerCancel", true)
addEventHandler("farmerCancel", root, sendCancelledMessage)
