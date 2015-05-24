function notAllowedToUse(daPlayah)
    exports.GTIhelp:dm(daPlayah,"You need to be working as a farmer in order to use the spawner", 255, 255, 0)
end
addEvent("farmerVehicleMessage",true)
addEventHandler("farmerVehicleMessage", getRootElement(), notAllowedToUse)

function notAllowedToUse2(daPlayah)
    exports.GTIhelp:dm(daPlayah,"You need to be working as a farmer in order to buy seeds", 255, 255, 0)
end
addEvent("farmerSeedMessage",true)
addEventHandler("farmerSeedMessage", getRootElement(), notAllowedToUse2)

function sendFinishMessage(thePlayer, amount)
    amount = math.floor(amount)
    exports.GTIhelp:dm(thePlayer,"* Farmer * You successfully delivered it. Here is your payment: "..amount.."$", 0, 255, 0)

    for k, v in ipairs({"accelerate","enter_exit","handbrake"}) do
        toggleControl(thePlayer,v,false)
    end
    setControlState(thePlayer,"handbrake",true)
    fadeCamera(thePlayer,false,1)
    setTimer(restoreControl,1000,1,thePlayer)
end
addEvent("farmerFinish",true)
addEventHandler("farmerFinish", getRootElement(), sendFinishMessage)


function restoreControl(thePlayer)
    for k, v in ipairs({"accelerate","enter_exit","handbrake"}) do
        toggleControl(thePlayer,v,true)
    end
    local vehicle = getPedOccupiedVehicle ( thePlayer )
    if ( vehicle ) then
        setElementFrozen ( vehicle, false )
    end
    setControlState(thePlayer,"handbrake",false)
    fadeCamera(thePlayer,true)
end

function onLogin (_,account)
	if getElementData( source, "job") == "Farmer" then
		--setElementData(source, "farmerRank", getAccountData(account, "farmerRank") or "0")
		--setElementData(source, "farmerXP", getAccountData(account, "farmerXP") or "0")
	end
end
addEventHandler ("onPlayerLogin", getRootElement(), onLogin)

function saveData(_, theAccount)
    if (theAccount and not isGuestAccount(theAccount)) then
		if getElementData( source, "job") == "Farmer" then
			--setAccountData (theAccount, "farmerRank", getElementData(source, "farmerRank"))
			--setAccountData (theAccount, "farmerXP", getElementData(source, "farmerXP"))
		end
    end
end

addEventHandler ("onPlayerQuit", getRootElement(),
function ()
    saveData(source, getPlayerAccount(source))
end)

addEventHandler ("onPlayerLogout", getRootElement(),
function (prev)
    saveData(source, prev)
end)

function sendPromotionMessage(thePlayer)
    exports.GTIhelp:dm(thePlayer,"* Farmer * You are eligible for a promotion. You may go recieve it", 255, 255, 0)
end
addEvent("readyForFPromotion",true)
addEventHandler("readyForFPromotion", getRootElement(), sendPromotionMessage)

function makePlayerFarmer(jobName, newJob)
    --exports.GTIhelp:dm(source,"** You are now employed as a farmer", 255, 255, 0)
	triggerClientEvent( source, "fixFarmerLogin", source, newJob)
end
--addEvent("makeFarmer",true)
--addEventHandler("makeFarmer",getRootElement(),makePlayerFarmer)
addEventHandler("onPlayerGetJob",getRootElement(),makePlayerFarmer)

function removeFarmer(jobName, resignJob)
    --setElementData(thePlayer,"job","Unemployed")
    --setElementModel(thePlayer,78)
    --exports.GTIhelp:dm(thePlayer,"** You are now unemployed.", 255, 255, 0)
	triggerClientEvent( source, "fixFarmerLogin", source, resignJob)
end
--addEvent("removeFarmer",true)
--addEventHandler("removeFarmer",getRootElement(),removeFarmer)
addEventHandler("onPlayerQuitJob",getRootElement(),removeFarmer)


local fcars = { }
local fcarsTrailer = { }

addEvent ( "spawnFCar", true )
addEventHandler ( "spawnFCar", root,
    function ( vehID, rotZ, r1,g1,b1,r2,g2,b2 )
     if ( isElement ( fcars [ source ] ) ) then
            destroyElement ( fcars [ source ] )
			destroyElement ( fcarsTrailer [ source ] )
            killTimer( timer1)
            killTimer( timer2)
        end
		local x,y,z = getElementPosition ( source )
		fcars [ source ] = createVehicle ( vehID, x, y, z+1 )
        if ( fcars [ source ] ) then
            setVehicleColor ( fcars [ source ], 120, 120, 120 )
            setElementRotation ( fcars [ source ], 0, 0, rotZ )
            --setVehicleColor ( fcars [ source ], r1,g1,b1,r2,g2,b2 )
			if vehID == 531 then
				--exports.GTIhelp:dm( source,"Spawned Tractor", 255, 255, 0)
				--fcarsTrailer [ source ] = createVehicle( 610, x, y, z+1 )
				fcarsTrailer [ source ] = createVehicle( 606, x, y, z+1 )
				--attachTrailerToVehicle( fcars [ source ], fcarsTrailer [ source ])
				setTimer(attachTrailerToVehicle, 100, 1, fcars[source], fcarsTrailer[source])
				timer1 = setTimer( attachTrailerToVehicle, 500, 0, fcars [ source ], fcarsTrailer [ source ])
				timer2 = setTimer( triggerClientEvent, 500, 0, root, "noTrailerCollide", root, fcarsTrailer[source], fcars[source])
				triggerClientEvent(source, "getFarmTrailer", source, fcarsTrailer[source])
			else
				if isTimer( timer1) then
					killTimer( timer1)
					killTimer( timer2)
				end
			end
        end
		if vehID ~= 532 then
			setTimer ( warpPedIntoVehicle, 50, 1, source, fcars [ source ] )
		else
			local planted = getElementData( source, "planted")
			if planted == true then
				setTimer ( warpPedIntoVehicle, 50, 1, source, fcars [ source ] )
				if planted == false then
					destroyElement( fcars [ source ])
				end
			else
				destroyElement( fcars [ source])
				if isTimer( timer1) then
					killTimer( timer1)
					killTimer( timer2)
				end
				exports.GTIhelp:dm(source,"Your crops aren't ready for harvesting", 255, 0, 0)
			end
		end
        triggerClientEvent ( source, "closeFCarWindow", root )
end
)

addEvent ( "plantedSeeds", true )
addEventHandler ( "plantedSeeds", root,
	function( player, chk)
        if chk == true then
            setElementData( player, "planted", true)
            exports.GTIhelp:dm(player,"Your crops are ready for harvesting", 0, 255, 0)
        elseif chk == false then
            setElementData( player, "planted", false)
        end
    end
)

function destroyVehicle()
    if ( isElement ( fcars [ source ] ) ) then
		killTimer( timer1)
        killTimer( timer2)
        destroyElement ( fcars [ source ] )
		if ( isElement ( fcarsTrailer [ source ] ) ) then
			destroyElement( fcarsTrailer [ source ] )
		end
    end
end
addEventHandler("onPlayerWasted", getRootElement(), destroyVehicle)
addEventHandler("onPlayerLogout",getRootElement(),destroyVehicle)
addEventHandler("onPlayerQuit",getRootElement(),destroyVehicle)

function getRidOfFCar(daPlayah)
    if ( isElement ( fcars [ daPlayah ] ) ) then
		killTimer( timer1)
        killTimer( timer2)
        destroyElement ( fcars [ daPlayah ] )
		destroyElement ( fcarsTrailer [ daPlayah ] )
    end
end
addEvent("destroyTheFCar",true)
addEventHandler("destroyTheFCar", getRootElement(), getRidOfFCar)

function destroyMyOwnVehicle(player)
    if getElementData(player,"job") == "Farmer" then
        if (isElement(fcars[player])) then
            local speedx, speedy, speedz = getElementVelocity(fcars[player])
            local actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)*180
            if actualspeed < 50 then
                exports.GTIhelp:dm(player,"Job vehicle destroyed! Thanks for being tidy.", 0, 255, 0)
				if isTimer( timer1) or isTimer( timer2) then
					killTimer( timer1)
					killTimer( timer2)
				end
                destroyElement(fcars[player])
				if isElement(fcarsTrailer[player]) then
					destroyElement(fcarsTrailer[player])
				end
                --exports.GTIhelp:dm(player,"Slow down to less than 10 KPH first in order to use /djv", 255, 255, 0)
            else
                exports.GTIhelp:dm(player,"Slow down to less than 50 KPH first in order to use /djv", 255, 255, 0)
            end
        elseif (not isElement(fcars[player])) then
            exports.GTIhelp:dm(player,"You currently don't have a job vehicle to destroy!", 255, 0, 0)
        end
    end
end
addCommandHandler("djv", destroyMyOwnVehicle)

----------------------------------------------------------------------------------------------------------------------------

addEvent("checkFarmer",true)
addEventHandler("checkFarmer", root,
function(elem, state)
    if (elem) then
		if (state == "Yes") then
			local occ = getElementData( elem, "job")
			if occ == "Farmer" then
				triggerClientEvent(elem, "showSeedsView", elem)
			end
		elseif (state == "No") then
			triggerClientEvent(elem, "hideSeedsView", elem)
		end
    end
end
)

addEvent("checkFarmerSeeds",true)
addEventHandler("checkFarmerSeeds", root,
function( player)
	if (player) then
		local account = getPlayerAccount(player)
		if (account) then
			local seeds = getAccountData( account, "GTIfarmer.seeds") or 0
			triggerClientEvent( player, "placeSeeds", player, seeds)
		end
	end
end
)

addEventHandler("onPlayerLogin", root,
function()
    setTimer(farmerFixLogin, 1000, 1, source)
end
)

function farmerFixLogin(source)
    if getElementData(source, "job") == "Farmer" then
        local account = getPlayerAccount(source)
        local seeds = getAccountData( account, "GTIfarmer.seeds") or 0
        local money = getAccountData( account, "GTIfarmer.cash") or 0
        triggerClientEvent( source, "placeSeeds", source, seeds)
        triggerClientEvent( source, "fixFarmerLogin", source)
    end
end

addEvent("giveTheSeeds",true)
addEventHandler("giveTheSeeds", root,
function(seeds)
	if (seeds) then
		local account = getPlayerAccount(client)
		local accountName = getAccountName(account)
		if (account) then
			local tseeds = tonumber(getAccountData( account, "GTIfarmer.seeds")) or 0
			setAccountData(account, "GTIfarmer.seeds", tseeds+seeds)
			triggerClientEvent(client, "placeSeeds", client, seeds+tseeds)
			exports.GTIhelp:dm( client, "You bought "..seeds.." seeds", 255, 255, 0)
		end
	end
end
)

addEvent("takeTheSeeds",true)
addEventHandler("takeTheSeeds", root,
function(seeds)
	if (seeds) then
		local account = getPlayerAccount(client)
		local accountName = getAccountName(account)
		if (account) then
			local tseeds = tonumber(getAccountData( account, "GTIfarmer.seeds")) or 0
            local cseeds = tseeds-seeds
            if cseeds < 0 then return false end

            setAccountData(account, "GTIfarmer.seeds", tseeds-seeds)
            triggerClientEvent(client, "placeSeeds", client, tseeds-seeds)
		end
	end
end
)

local jobCash = {}
function setsJobCash()
	local farmerLevel = exports.GTIpromotions:getPlayerJobLevel( source, "Farmer")
	--[[
	if tonumber(farmerLevel) == 0 then
		money = 150
	elseif tonumber(farmerLevel) == 1 then
		money = 160
	elseif tonumber(farmerLevel) == 2 then
		money = 170
	elseif tonumber(farmerLevel) == 3 then
		money = 180
	elseif tonumber(farmerLevel) == 4 then
		money = 190
	elseif tonumber(farmerLevel) == 5 then
		money = 200
	elseif tonumber(farmerLevel) == 6 then
		money = 210
	elseif tonumber(farmerLevel) == 7 then
		money = 220
	elseif tonumber(farmerLevel) == 8 then
		money = 230
	elseif tonumber(farmerLevel) == 9 then
		money = 240
	elseif tonumber(farmerLevel) == 10 then
		money = 250
	elseif tonumber(farmerLevel) == 11 then
		money = 270
	end
    if tonumber(money) then
	--]]
		--local money = math.floor(money/4)
		local jobMoney = exports.GTIpromotions:getPlayerJobPayment( source, "Farmer")
		local jobProgress = exports.GTIpromotions:getPlayerJobProgress( source, "Farmer")
		local civXPprogress = exports.GTIpromotions:getPlayerCivilianExp( source, "Farmer")
		--exports.GTIpromotions:givePlayerJobMoney( source, "Farmer", money)
		--exports.GTIpromotions:modifyPlayerJobProgress( source, "Farmer", 1)
		--exports.GTIpromotions:modifyPlayerCivilianExp( source, 1, "Farmer")
		outputChatBox("CXP: +1 JProg: +1 Money: $"..tostring(jobMoney), source, 255, 255, 0)
    --end
end
addEvent("setsJobCash",true)
addEventHandler("setsJobCash",root,setsJobCash)

--[[
addCommandHandler("seeds",
function(player, cmd, number)
    amount = tonumber(number)
    if amount then
        local account = getPlayerAccount(player)
        if account then
            setAccountData(account, "GTIfarmer.seeds", amount)
            triggerClientEvent(player, "placeSeeds", player, amount)
        end
    end
end
)
--]]
