-----------------------------------------------
-- What		: policeRadio_c.lua(c)
-- Type		: Client
-- For		: Grand Theft International
-- Author	: Diego aka diegonese
-- All rights reserved to GTI 2014/2015 (C)
-----------------------------------------------
radioState = true
lastPlayed = getRealTime().timestamp

---------------------
--Call for backup sound
----------------------->>>
function call4backupC()
	if (isElement(sound1)) then
		destroyElement(sound1)
	end
	
	if not radioState then return end
	
	sound1 = playSound("police_radio/need_astn.mp3",false)
	setSoundVolume(sound1,0.2)
	lastPlayed = getRealTime().timestamp
end
addEvent("call4backupE", true)
addEventHandler("call4backupE", root, call4backupC)

---------------------
--Crime reports dispatch sound
----------------------->>>
function crimeReport()
	if (isElement(sound2)) then
		destroyElement(sound2)
	end
	
	if not radioState then return end
	sound2 = playSound("police_radio/rpt_ast.mp3",false)
	setSoundVolume(sound2,0.2)
end
addEvent("crimeReportE", true)
addEventHandler("crimeReportE", root, crimeReport)

---------------------
--Radio stuff
----------------------->>>
addEvent("Lawmisc.disableSound", true)
addEventHandler("Lawmisc.disableSound", root, function () radioState = nil exports.GTIhud:dm("Police radio sounds have been turned off.", 225, 0, 0) end)
addEvent("Lawmisc.enableSound", true)
addEventHandler("Lawmisc.enableSound", root, function () radioState = true exports.GTIhud:dm("Police radio sounds have been turned on.", 0, 225, 0)  end)