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

function makePlayerFarmer(jobName, newJob)
	triggerClientEvent( source, "fixFarmerLogin", source, newJob)
end
addEventHandler("onPlayerGetJob",getRootElement(),makePlayerFarmer)

function removeFarmer(jobName, resignJob)
	triggerClientEvent( source, "fixFarmerLogin", source, resignJob)
end
addEventHandler("onPlayerQuitJob",getRootElement(),removeFarmer)


local fcarsTrailer = { }
local fcarsTrucks = { }

addEventHandler ( "onVehicleEnter", root,
    function ( thePlayer, seat, jacked)
	local x,y,z = getElementPosition ( thePlayer )
	local job = getElementData( thePlayer, "job")
	local theVehicle = getElementModel( source)
	if ( job == "Farmer" ) then
		if theVehicle == 531 then
			fcarsTrailer [ thePlayer ] = createVehicle( 610, x, y, z+1 )
			attachTrailerToVehicle( source, fcarsTrailer [ thePlayer ])
			setTimer(attachTrailerToVehicle, 100, 1, source, fcarsTrailer[thePlayer])
			timer1 = setTimer( attachTrailerToVehicle, 500, 0, source, fcarsTrailer [ thePlayer ])
			timer2 = setTimer( triggerClientEvent, 500, 0, root, "noTrailerCollide", root, fcarsTrailer[thePlayer], source)
			triggerClientEvent( thePlayer, "getFarmTrailer", thePlayer, fcarsTrailer[thePlayer])
		elseif theVehicle == 403 then
			fcarsTrucks [ thePlayer ] = createVehicle( 435, x, y, z+1)
			attachTrailerToVehicle( source, fcarsTrucks [ thePlayer ])
			setTimer(attachTrailerToVehicle, 100, 1, source, fcarsTrucks[thePlayer])
			timer1 = setTimer( attachTrailerToVehicle, 500, 0, source, fcarsTrucks [ thePlayer ])
			timer2 = setTimer( triggerClientEvent, 500, 0, root, "noTrailerCollide", root, fcarsTrucks[thePlayer], source)
		else
			if isTimer( timer1) then
				killTimer( timer1)
				killTimer( timer2)
			end
		end
	end
	if theVehicle == 532 then
		local planted = getElementData( thePlayer, "planted")
		if planted == true then
			if planted == false then
				destroyElement( source)
			end
		else
			destroyElement( source)
			if isTimer( timer1) then
				killTimer( timer1)
				killTimer( timer2)
			end
			exports.GTIhelp:dm(thePlayer,"Your crops aren't ready for harvesting", 255, 0, 0)
		end
	end
end
)

--[[
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
		local job = getElementData( source, "job")
		exports.GTIsocial:logSocialMessage( name, "You spawned a job vehicle for "..tostring(job), "brief", 4, "Briefing", "Job Vehicle Destroyed", "player")
        if ( fcars [ source ] ) then
            setVehicleColor ( fcars [ source ], 120, 120, 120 )
			if rotZ then
				setElementRotation ( fcars [ source ], 0, 0, rotZ)
			else
				setElementRotation ( fcars [ source ], 0, 0, 86)
			end
			if vehID == 531 then
				fcarsTrailer [ source ] = createVehicle( 610, x, y, z+1 )
				attachTrailerToVehicle( fcars [ source ], fcarsTrailer [ source ])
				setTimer(attachTrailerToVehicle, 100, 1, fcars[source], fcarsTrailer[source])
				timer1 = setTimer( attachTrailerToVehicle, 500, 0, fcars [ source ], fcarsTrailer [ source ])
				timer2 = setTimer( triggerClientEvent, 500, 0, root, "noTrailerCollide", root, fcarsTrailer[source], fcars[source])
				triggerClientEvent(source, "getFarmTrailer", source, fcarsTrailer[source])
			elseif vehID == 403 then
				fcarsTrucks [ source ] = createVehicle( 435, x, y, z+1)
				attachTrailerToVehicle( fcars [ source ], fcarsTrucks [ source ])
				setTimer(attachTrailerToVehicle, 100, 1, fcars[source], fcarsTrucks[source])
				timer1 = setTimer( attachTrailerToVehicle, 500, 0, fcars [ source ], fcarsTrucks [ source ])
				timer2 = setTimer( triggerClientEvent, 500, 0, root, "noTrailerCollide", root, fcarsTrucks[source], fcars[source])
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
--]]

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
	if isTimer( timer1) then
		killTimer( timer1)
		killTimer( timer2)
	end
	if (isElement( fcarsTrailer[source])) then
		destroyElement( fcarsTrailer[source])
	elseif (isElement( fcarsTrucks[source])) then
		destroyElement( fcarsTrucks[source])
	end
end
addEventHandler("onPlayerWasted", getRootElement(), destroyVehicle)
addEventHandler("onPlayerLogout",getRootElement(),destroyVehicle)
addEventHandler("onPlayerQuit",getRootElement(),destroyVehicle)

function getRidOfFCar(daPlayah)
	if isTimer( timer1) then
		killTimer( timer1)
        killTimer( timer2)
	end
	if (isElement(fcarsTrailer[daPlayah])) then
		destroyElement ( fcarsTrailer[daPlayah])
	elseif (isElement(fcarsTrucks[daPlayah])) then
		destroyElement( fcarsTrucks[daPlayah])
	end
end
addEvent("destroyTheFCar",true)
addEventHandler("destroyTheFCar", getRootElement(), getRidOfFCar)

addEventHandler( "onPlayerCommand", root,
	function( cmd)
		if cmd == "hide" then
			if getElementData(source,"job") == "Farmer" then
				if (isElement(fcarsTrailer[source]) or isElement(fcarsTrucks[source])) then
					if isElement(fcarsTrailer[source]) then
						speedx, speedy, speedz = getElementVelocity(fcarsTrailer[source])
					elseif isElement(fcarsTrucks[source]) then
						speedx, speedy, speedz = getElementVelocity(fcarsTrucks[source])
					end
					local actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5)*180
					if actualspeed < 50 then
						exports.GTIhelp:dm(source,"Job vehicle destroyed! Thanks for being tidy.", 0, 255, 0)
						local name = getPlayerName( source)
						exports.GTIsocial:logSocialMessage( name, "Job vehicle destroyed! Thanks for being tidy.", "brief", 4, "Briefing", "Job Vehicle Destroyed", "player")
						if isTimer( timer1) or isTimer( timer2) then
							killTimer( timer1)
							killTimer( timer2)
						end
						if isElement(fcarsTrailer[source]) then
							destroyElement(fcarsTrailer[source])
						elseif (isElement( fcarsTrucks[source])) then
							destroyElement( fcarsTrucks[source])
						end
					else
						exports.GTIhelp:dm(source,"Slow down to less than 50 KPH first in order to use /djv", 255, 255, 0)
					end
				elseif (not isElement(fcarsTrailer[source]) or isElement(fcarsTrucks[source])) then
					exports.GTIhelp:dm(source,"You currently don't have a job vehicle to destroy!", 255, 0, 0)
				end
			end
		end
	end
)

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
			local quota = getAccountData(account, "GTIfarmer.quota") or 0
			triggerClientEvent( player, "placeSeeds", player, seeds)
			triggerClientEvent( source, "setBailQuota", source, quota)
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
		local quota = tonumber(getAccountData(account, "GTIfarmer.quota")) or 0
        triggerClientEvent( source, "placeSeeds", source, seeds)
        triggerClientEvent( source, "fixFarmerLogin", source)
		triggerClientEvent( source, "setBailQuota", source, quota)
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
	--exports.GTIpromotions:givePlayerJobMoney( source, "Farmer", money)
	exports.GTIpromotions:modifyPlayerJobProgress( source, "Farmer", 1)
	exports.GTIpromotions:modifyPlayerCivilianExp( source, 1, "Farmer")
	--outputChatBox("CXP: +1 JProg: +1 Money: $"..tostring(jobMoney), source, 255, 255, 0)
	local quota = getBailQuota()
	if quota <= 250 then
		setsBailQuota( 1)
	end
end
addEvent("setsJobCash",true)
addEventHandler("setsJobCash",root,setsJobCash)

local farmerPay = {
	[0] = 150,
	[1] = 160,
	[2] = 170,
	[3] = 180,
	[4] = 190,
	[5] = 200,
	[6] = 210,
	[7] = 220,
	[8] = 230,
	[9] = 250,
	[10] = 270,
}

function getBailQuota()
    if tonumber(quota) then
        local account = getPlayerAccount(source)
        if account then
            local bailQuota = tonumber(getAccountData(account, "GTIfarmer.quota")) or 0
			return bailQuota
        end
    end
end
addEvent("getBailQuota",true)
addEventHandler("getBailQuota",root,getBailQuota)

function setsBailQuota(quota)
    if tonumber(quota) then
        local account = getPlayerAccount(source)
        if account then
            local bailQuota = tonumber(getAccountData(account, "GTIfarmer.quota")) or 0
            setAccountData(account, "GTIfarmer.quota", bailQuota+quota)
            triggerClientEvent(source, "setBailQuota", source, bailQuota+quota)
        end
    end
end
addEvent("setsBailQuota",true)
addEventHandler("setsBailQuota",root,setsBailQuota)

function removeBailQuota( thePlayer, quota)
	if isElement( thePlayer) then
		if tonumber(quota) then
			local acc = getPlayerAccount(thePlayer)
			local theQuota = tonumber(getAccountData(acc, "GTIfarmer.quota")) or 0
			setAccountData(acc, "GTIfarmer.quota", theQuota-quota)
			triggerClientEvent(source, "setBailQuota", source, theQuota-quota)
		end
	end
end
addEvent("removeBailQuota",true)
addEventHandler("removeBailQuota",root,removeBailQuota)

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

--Quota Purchase
function sendStartMessage(thePlayer, x, y, z)
    local location = getZoneName ( x, y, z )
    local city = getZoneName ( x, y, z, true)
	local account = getPlayerAccount( thePlayer)
	local bailQuota = tonumber(getAccountData(account, "GTIfarmer.quota")) or 0
	if bailQuota == 0 then
		triggerClientEvent( thePlayer, "farmerRemoveMission", thePlayer, "you don't have enough quota")
	else
		exports.GTIhelp:dm(thePlayer,"Drive up to "..location..", "..city.." to sell all your quota", 255, 255, 0)
	end
end
addEvent("farmerDeliver",true)
addEventHandler("farmerDeliver", getRootElement(), sendStartMessage)

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

function sendFinishMessage(thePlayer)
	local account = getPlayerAccount( thePlayer)
	local theQuota = tonumber(getAccountData(account, "GTIfarmer.quota"))
	local jobLevel = exports.GTIpromotions:getPlayerJobLevel( thePlayer, "Farmer")
	local levelBailPay = farmerPay[jobLevel]
	local money = math.floor(levelBailPay/4)
	local amount = theQuota*money
	local theLoss = theQuota
	removeBailQuota(thePlayer, theLoss)
	exports.GTIhelp:dm(thePlayer,"You sold all of your quota for $"..amount, 0, 255, 0)
	exports.GTIpromotions:givePlayerJobMoney( thePlayer, "Farmer", amount)

	for k, v in ipairs({"accelerate","enter_exit","handbrake"}) do
		toggleControl(thePlayer,v,false)
	end
	setControlState(thePlayer,"handbrake",true)
	fadeCamera(thePlayer,false,1)
	setTimer(restoreControl,2500,1,thePlayer)
end
addEvent("farmerDelivered",true)
addEventHandler("farmerDelivered", getRootElement(), sendFinishMessage)

function sendCancelledMessage(thePlayer, reason)
	if not reason then
		exports.GTIhelp:dm(thePlayer,"Your delivery was cancelled", 255, 255, 0)
	else
		exports.GTIhelp:dm(thePlayer,"Your delivery was cancelled because "..reason, 255, 255, 0)
	end
end
addEvent("farmerCancel",true)
addEventHandler("farmerCancel", getRootElement(), sendCancelledMessage)
