------------------------------------------------------------------------------------
--  PROJECT:     Grand Theft International
--  RIGHTS:      All rights reserved by developers
--  FILE:        GTIfisherman/core/fisherman_s.lua
--  PURPOSE:     Fisherman job, server part.
--  DEVELOPERS:  Tomas Caram (Ares)
------------------------------------------------------------------------------------

function Pay (payment,progress)
	if not payment and progress then
		exports.GTIemployment:modifyPlayerJobProgress(client, "Fisherman", math.ceil(progress))
	else
		local pay = exports.GTIemployment:getPlayerJobPayment(client, "Fisherman")
		local hrPay = exports.GTIemployment:getPlayerHourlyPay(client)
		local hrExp = exports.GTIemployment:getHourlyExperience()
	
		local pay = math.ceil( pay*payment )
		local Exp = math.ceil( (pay/hrPay)*hrExp )
	
		exports.GTIemployment:modifyPlayerEmploymentExp(client, Exp, "Fisherman")
		exports.GTIemployment:givePlayerJobMoney(client, "Fisherman", pay)
	end
end
addEvent("GTIfisherman.pay",true)
addEventHandler("GTIfisherman.pay",resourceRoot,Pay)

addEventHandler("onPlayerQuitJob",root,
	function(jobname)
		if jobname == "Fisherman" then
			triggerClientEvent(source,"GTIfisherman.destroyStuff",resourceRoot)
			exports.GTIhud:drawStat("Fisherman","","",source)
			exports.GTIhud:drawStat("Fisherman_tosell","","",source)
			toggleAllControls(source,true)
		end
	end
)

function removePedFromVehicle_f()
	removePedFromVehicle(client)
	local thePlayer = client
		setTimer ( function()
			exports.GTIanims:setJobAnimation(thePlayer, "CARRY", "crry_prtial", 1, false, true, false, true)
			toggleControl(thePlayer,"sprint",false)
			toggleControl(thePlayer,"jump",false)
			toggleControl(thePlayer,"aim_weapon",false)
			toggleControl(thePlayer,"crouch",false)
			toggleControl(thePlayer,"next_weapon",false)
			toggleControl(thePlayer,"previous_weapon",false)
			exports.GTIhud:dm("Go to the market to sell your fish.",thePlayer,255,255,0)
			triggerClientEvent(thePlayer,"GTIfisherman.destroyStuff",resourceRoot,"hello world","hello world")
		end, 1000,1)
end
addEvent("GTIfisherman.removePedFromVehicle",true)
addEventHandler("GTIfisherman.removePedFromVehicle",resourceRoot,removePedFromVehicle_f)