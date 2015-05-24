--[[
	Serial system using Lua and inbuilt Account functions
	Author: Mathias Berntsen (LilDolla)
	For use by the Whoever has this
	You are permitted to modify this work as the main point was for flexibility between users
	You are not permitted to remove this message, take credit, redistribute or profit for this work
]]--

--Settings Start Here
local SERIAL_SYSTEM_NAME = "Cerial"
local Command = "cerial"
local BANNER = "CerialBot"
local ACCOUNT_DATA_NAME = "Cerial"
local ACCOUNT_DATA_BACKUP_NAME = "CerialCheck"
--local DATABASE_LOC = ":/cerials.db"
--Settings End Here

local cers = {
	{ "sjtaowsn"},
	{ "asdvsadf"},
	{ "asvasdfa"},
	{ "bolaskas"},
	{ "vaklwlja"},
	{ "csankdln"},
	{ "vsfsakls"},
	{ "bsadajfk"},
	{ "asjdsdwe"},
	{ "dgsdfsdad"},
	{ "adsfscasa"},
	{ "safasdcasd"},
	{ "sadcscsd"},
	{ "scsdadca"},
	{ "cadscsdf"},
	{ "ferf34f"},
	{ "e3wccesf"},
	{ "34fdsv 43fv dv"},
	{ "4fsvsdvs"},
	{ "egbgsbsge"},
	{ "b sbret4gb"},
	{ "ergtdfbd"},
	{ "e4sgdbgdsgsdrf"},
	{ "dsbsdhsdsbsdb"},
	{ "bsbbcxvbdfghewsbsb"},
	{ "sbcxbxsdv "},
	{ "savxvcvsa"},
	{ "vxvxvsedv"},
	{ "sxvsdvx"},
	{ "svxcvsvx"},
	{ "xzvdvxvzxv"},
	{ "v vdssv sdsd"},
	{ "vsvxvsefvs"},
	{ "svsefsdvsdgsdvsd"},
	{ "bbfgsdv sfgs"},
	{ "bdsbxbdsgbzdgv"},
	{ "nbdbdbxcbdf"},
	{ "zbcbsdgreg@^$fsdvs"},
	{ "segvbsvsegv"},
	{ "sdngdb dghn"},
	{ "sbnxcbbdsvcxb"},
	{ "bcxnbcxntdb x"},
	{ "xncdfvncxfhxcn"},
	{ "ncvjtydt4hb4j "},
	{ "b4b443b563b43b56"},
	{ "34beyey"},
	{ "ydyhshesrt4bg"},
	{ "gsagbbcxgrfhfxc"},
	{ "bdfghresfbdsfvb"},
	{ "cvbxfrghhnxbhc"},
	{ "fhxnchhxnhfhx"},
	{ "bcvnhfcvbnfcxb"},
	{ "nn bvcgcnb cvnbg"},
	{ "dhfdnvn cfhhdgdsg"},
	{ "sdghndshgsdggds"},
	{ "fgjfutredhbndhf"},
	{ "57dhfjtddngdtd"},
	{ "5u5754yhnhd"},
	{ "xnhrey5hbdh"},
	{ "fdnfgncxcn"},
	{ "dfhdfndfh"},
	{ "gfjfdjfdtrhn"},
	{ "fncvvjfcgjng"},
	{ "tfdjdfdjdfj"},
	{ "7rtjndfxjgujfdt"},
	{ "fhdrt5rtnfh"},
	{ "5hdffhdfhgh"},
	{ "ehgdfhbxfh"},
	{ "dfhdhgn"},
	{ "xcxntg5 5yegre"},
	{ "n xfrhn "},
	{ "xcnxcnhxfhn"},
	{ "xnchfhb c"},
	{ "cxncvxncfhxcnbxncfhb "},
	{ "dsfdsivfsajrl;sdxc zs"},
}

function getCerial( _, theCurrentAccount)
	local accName = getAccountName( theCurrentAccount)
	local source = getAccountPlayer( theCurrentAccount)
	local name = getPlayerName( source)
	if accName then
		local serial = getAccountData( theCurrentAccount, ACCOUNT_DATA_NAME)
		local serialCheck = getAccountData( theCurrentAccount, ACCOUNT_DATA_BACKUP_NAME)
		if not serial then
			createPlayerCerial( source, true)
		else
			if string.len(serial) == 32 then
				if serial == serialCheck then
					--outputChatBox( "Your Server "..SERIAL_SYSTEM_NAME.." has been identified as clean", source, 255, 255, 0)
					exports.GTIsocial:logSocialMessage( name, "logged in with a valid Custom "..SERIAL_SYSTEM_NAME, "misc", 5, "Misc", "Join", "Custom Cerial identified", "world")
				else
					if string.len(serialCheck) == 32 then
						--outputChatBox( getPlayerName(source).." has been banned by "..BANNER.." for "..SERIAL_SYSTEM_NAME.." hacking.(Permanent)", root)
						--banPlayer( source, false, false, true, BANNER, "Cerial is not the same as the given one.", 0)
						exports.GTIsocial:logSocialMessage( name, " logged in with an invalid Custom "..SERIAL_SYSTEM_NAME, "misc", 5, "Misc", "Join", "Custom Cerial identified", "world")
					else
						exports.GTIsocial:logSocialMessage( name, "logged in with an invalid Custom "..SERIAL_SYSTEM_NAME, "misc", 5, "Misc", "Join", "Custom Cerial identified", "world")
						createPlayerCerial( source)
					end
				end
			else
				outputChatBox( "Invalid "..SERIAL_SYSTEM_NAME.." length", source, 255, 0, 0)
				exports.GTIsocial:logSocialMessage( name, "You have an invalid Custom "..SERIAL_SYSTEM_NAME, "brief", 4, "Briefing", "Cerial Recieving", "player")
				createPlayerCerial( source, true)
			end
		end
	end
end
addEventHandler( "onPlayerLogin", root, getCerial)


function createPlayerCerial( thePlayer, op)
	if isElement(thePlayer) then
		local theAccount = getPlayerAccount( thePlayer)
		local name = getPlayerName( thePlayer)
		if theAccount then
			local source = getAccountPlayer( theAccount)
			local name = getPlayerName( source)
			--
			local randomCerial1 = math.random(#cers)
			local randomCerial2 = math.random(#cers)
			local cSerial1 = cers[randomCerial1][1]
			local cSerial2 = cers[randomCerial2][1]
			local cSerial3 = getPlayerName( source)
			local cSerial = cSerial1..cSerial2..cSerial3
			local nSerial = sha256(md5(cSerial)..cSerial)
			local cSerial = string.sub( nSerial, 0, 32)
			setAccountData( theAccount, ACCOUNT_DATA_NAME, cSerial)
			setAccountData( theAccount, ACCOUNT_DATA_BACKUP_NAME, cSerial)
			if op == true then
				outputChatBox( "Your New Custom "..SERIAL_SYSTEM_NAME.." is: "..cSerial, source, 255, 255, 0)
				exports.GTIsocial:logSocialMessage( name, "Your new Custom "..SERIAL_SYSTEM_NAME.." is: "..cSerial, "brief", 4, "Briefing", "Cerial Recieving", "player")
			end
		end
	end
end

function getPlayerCerial( thePlayer)
	if isElement( thePlayer) then
		local acc = getPlayerAccount( thePlayer)
		if acc then
			local source = getAccountPlayer( acc)
			local se1 = getAccountData( acc, ACCOUNT_DATA_NAME)
			if se1 then
				return se1
			else
				return false
			end
		end
	end
end

function getPCerial( thePlayer)
	if isElement( thePlayer) then
		local acc = getPlayerAccount( thePlayer)
		if acc then
			local source = getAccountPlayer( acc)
			local se1 = getAccountData( acc, ACCOUNT_DATA_NAME)
			local se2 = getAccountData( acc, ACCOUNT_DATA_BACKUP_NAME)
			local se3 = getAccountName( acc)
			if se1 and se2 then
				return se1, se2, se3
			else
				return false, false, false
			end
		end
	end
end

function outputCerial( player, command)
	local crps, crpsC, crpsA = getPCerial( player)
	if crps ~= false then
		if string.len(crps) ~= 32 then
			--outputChatBox( "#FFFFFF"..getPlayerName(player).." has been banned by "..BANNER.." for "..SERIAL_SYSTEM_NAME.." hacking.(Permanent)", root, 255, 0, 0, true)
			--banPlayer( player, false, false, true, BANNER, SERIAL_SYSTEM_NAME.." is not the same as the given one.", 0)
		end
		if crpsC == crps then
		else
			if string.len(crpsC) == 32 then
				--outputChatBox( "#FFFFFF"..getPlayerName(player).." has been banned by "..BANNER.." for "..SERIAL_SYSTEM_NAME.." hacking.(Permanent)", root, 255, 0, 0, true)
				----banPlayer( player, false, true, true, BANNER, SERIAL_SYSTEM_NAME.." is not the same as the given one.", 0)
			else
				createPlayerCerial( player)
			end
		end
		local mtaS = getPlayerSerial( player)
		triggerClientEvent( player, "getInfo", root, mtaS, crpsC, crpsA)
	else
		outputChatBox( "You don't have a "..SERIAL_SYSTEM_NAME.."", player)
		createPlayerCerial( player, true)
	end
end
addCommandHandler( "cerial", outputCerial)

function onRes()
	for i, v in ipairs ( getElementsByType( "player")) do
		local crps, crpsC,scA = getPCerial( v)
		--outputChatBox( scA.." "..SERIAL_SYSTEM_NAME..": "..crps,v, 255, 255, 0)
		if crps ~= false then
			if string.len(crps) ~= 32 then
				--banPlayer( v, false, false, true, BANNER, SERIAL_SYSTEM_NAME.." is not the same as the given one.", 0)
			end
			if crpsC == crps then
			else
				if string.len(crpsC) == 32 then
					--banPlayer( v, false, true, true, BANNER, SERIAL_SYSTEM_NAME.." is not the same as the given one.", 0)
				else
					createPlayerCerial( v)
				end
			end
		else
			outputChatBox( "You don't have a "..SERIAL_SYSTEM_NAME.."", v)
			createPlayerCerial( v, true)
		end
	end
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),onRes)
