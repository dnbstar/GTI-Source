local Blip1 = {}
Blip = 0
ext = 0
extinguished = 0
function applydff()
    local fire = engineLoadDFF("fire.dff",1)
    engineReplaceModel(fire,2023)
end
addEventHandler("onClientResourceStart", resourceRoot,applydff)

function ExtinguishEmpty(weapon,_,_,hitX,hitY,hitZ,hitElement)
    if weapon ~= 42 then return end
    if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") and getPedTotalAmmo(localPlayer) == 2 then
		toggleControl("fire", false)
		GetAfiretruck()
	end
end
addEventHandler("onClientPlayerWeaponFire",localPlayer,ExtinguishEmpty)

function GetAfiretruck()
	local vehs = getElementsByType ( "vehicle" )
	local mx,my,mz = getElementPosition(localPlayer)
	for k,theVeh in ipairs(vehs) do
		if ( getElementModel(theVeh) == 407 or getElementModel(theVeh) == 544 or getElementModel(theVeh) == 563 ) and not isElement(refmarker) then 
			local vx,vy,vz = getElementPosition(theVeh)
			if getDistanceBetweenPoints2D(mx,my,vx,vy) < 100 and not isElement(refmarker) then
				theDestroyedVeh = theVeh
				addEventHandler("onClientElementDestroy", root, delelem1)
				refillMarker(vx,vy,vz,theVeh)
				exports.GTIhud:dm("Your extinguisher is empty, go refill it.", 255, 255, 0)
			end
		end
	end
	if not isElement(theDestroyedVeh) then
		toggleControl("fire", true)
	end
end
addEvent("GTIfirefighter.firesound", true)
addEventHandler("GTIfirefighter.firesound", root, function(sound)
	if exports.GTIemployment:getPlayerJob(true) == "Firefighter" and firesound then
		setSoundVolume(firesound, sound)
	end
end )
function refillMarker(SX,SY,SZ,theVeh)
	refmarker = createMarker (SX, SY, SZ, "cylinder", 1, 255, 255, 0 )
	freezemarker = createColSphere(SX,SY,SZ,3)
	if getElementModel(theVeh) == 407 or 544 then
		attachElements(refmarker,theVeh,1.3,0,-1,1,0,0)
		attachElements(freezemarker,theVeh,1.3,0,-1,1,0,0)
		refblip = createBlipAttachedTo(refmarker, 41)
	elseif getElementModel(theVeh) == 563 then
		attachElements(refmarker,theVeh,1.5,0,-1.5,1,0,0)
		attachElements(freezemarker,theVeh,1.5,0,-1.5,1,0,0)
		refblip1 = createBlipAttachedTo(refmarker, 41)
	end
end
function freeze(theElement)
    if ( source == freezemarker ) and ( theElement == localPlayer) then
		destroyElement(freezemarker)
		triggerServerEvent("GTIfirefighter.freeze", resourceRoot, theDestroyedVeh, true)
	end
end
addEventHandler ( "onClientColShapeHit", root, freeze)


function startprogress(thePlayer)
    if ( source == refmarker ) and ( thePlayer == localPlayer ) and not ( isPedInVehicle ( localPlayer ) ) then
		toggleControl("sprint", false)
		toggleControl("jump", false)
		toggleControl("aim_weapon", false)
		toggleControl("enter_exit", false)
		destroyElement(refmarker)
		if isElement(refblip) then destroyElement(refblip) end
		if isElement(refblip1) then destroyElement(refblip1) end
		exports.GTIhud:drawProgressBar("FirePro", "Refilling...", 255, 200, 0, 7000)
		rTimer = setTimer(refillTheExtinguisher, 7000, 1)
		triggerServerEvent("GTIfirefighter.anim", resourceRoot)
    end
end
addEventHandler("onClientMarkerHit",getRootElement(),startprogress)

function refillTheExtinguisher()
	toggleControl("sprint", true)
	toggleControl("jump", true)
	toggleControl("enter_exit",true)
	toggleControl("aim_weapon", true)
	triggerServerEvent("GTIfirefighter.refillit", resourceRoot)
	removeEventHandler("onClientElementDestroy", root, delelem1)
	toggleControl("fire", true)
	triggerServerEvent("GTIfirefighter.freeze", resourceRoot, theDestroyedVeh, false)
	theDestroyedVeh = false
end

addEvent("GTIfirefighter.blip", true)
addEventHandler("GTIfirefighter.blip", root, function(FX,FY,FZ,sound)
	if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") and FX then 
		fireblip = exports.GTIblips:createCustomBlip(FX, FY, 25, 25, "fire.png", 9999)
		Blip = 1
		firesound = playSound3D("fire.mp3", FX, FY, FZ, true)
		setSoundMaxDistance( firesound, 150 )
		setSoundVolume(firesound, sound)
		local location = getZoneName(FX,FY,FZ)
		local city = getZoneName(FX,FY,FZ,true)
		exports.GTIhud:dm("A fire has been reported in ".. location .." (".. city ..")", 255, 255, 0)
    end
end )

addEvent("GTIfirefighter.noVoice", true)
addEventHandler("GTIfirefighter.noVoice", root, function(ped,obj)
  setPedVoice(ped, "PED_TYPE_DISABLED", "n/a")
  setElementStreamable(obj,true)
end )
addEvent("GTIfirefighter.doneDX", true)
addEventHandler("GTIfirefighter.doneDX", root, function()
	if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") then 
		if extinguished > 0 then
			triggerServerEvent("GTIfirefighter.pay", resourceRoot, extinguished)
			extinguished = 0 
		end
		exports.GTIhud:dm("The fire has been extinguished. Please wait while a new fire is declared.", 255, 255, 0)
		if firesound then stopSound(firesound) end
		firesound = false
		if Blip == 1 then exports.GTIblips:destroyCustomBlip(fireblip) end
		Blip = 0
	end
end )
addEvent("GTIfirefighter.doneVeh", true)
addEventHandler("GTIfirefighter.doneVeh", root, function(x,y,z)
	if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") then 
		for i, vblip in ipairs(Blip1) do
			local blipX, blipY = exports.GTIblips:getCustomBlipPosition(vblip)
			if ( getDistanceBetweenPoints2D(x, y, blipX, blipY) < 1 ) then
				exports.GTIblips:destroyCustomBlip(vblip)
				table.remove(Blip1,i)
			end
		end
	local mx,my,mz = getElementPosition(localPlayer)
	if (getDistanceBetweenPoints3D(mx,my,mz,x,y,z) < 350) then 
		setTimer( function()
		exports.GTIhud:dm("The fire has been extinguished.", 255, 255, 0)
		end, 1500, 1)
	end
end
end ) 
addEvent("GTIfirefighter.destroyedVehMission", true)
addEventHandler("GTIfirefighter.destroyedVehMission", root, function(x,y,z,veh)
	if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") then 
		local vehfireblip = exports.GTIblips:createCustomBlip(x, y, 35, 35, "vehfire.png", 9999)    
		table.insert(Blip1,vehfireblip)
		local location = getZoneName(x,y,z)
		local city = getZoneName(x,y,z,true)
		if veh == "Automobile" then
			cor = "An"
		else
			cor = "A"
		end
		exports.GTIhud:dm(cor.." "..veh.." has exploded in ".. location .." (".. city ..") and the place needs to be extinguished.", 255, 255, 0)
	end
end )
addEvent("GTIfirefighter.whereVehMission", true)
addEventHandler("GTIfirefighter.whereVehMission", root, function(x,y,z)
	if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") then 
		local vehfireblip = exports.GTIblips:createCustomBlip(x, y, 35, 35, "vehfire.png", 9999)
		table.insert(Blip1,vehfireblip)
	end
end )

function noDamage ( attacker, weapon, bodypart, loss )
	if weapon == 42 then
		cancelEvent()
    end
end
addEventHandler ( "onClientPlayerDamage", localPlayer, noDamage )
function ExtinguishSys ( attacker, weapon )
    if ( getElementModel(source) == 137 or getElementModel(source) == 138 ) and getElementType (source) == "ped" then
		cancelEvent()
		if weapon == 42 and (exports.GTIemployment:getPlayerJob(true) == "Firefighter") and attacker == localPlayer then
			ext = ext + 1
			if (ext == 66) then
				ext = 0
				triggerServerEvent("GTIfirefighter.flameToExtinguish", resourceRoot, source)
				if getElementModel(source) == 137 then
					extinguished = extinguished + 1
				elseif getElementModel(source) == 138 then
					triggerServerEvent("GTIfirefighter.vehpay", resourceRoot)
				end
			end
		end
	end
end
addEventHandler ( "onClientPedDamage", root, ExtinguishSys )
function vehFlame()
	if not isElementInWater(source) and source == getPedOccupiedVehicle(localPlayer) and getElementDimension(source) == 0 then
		local dx,dy,dz = getElementPosition(source)
		local newZ = getGroundPosition(dx,dy,dz)
		if newZ and newZ > 0 and newZ < 100 then
			local vehtype = getVehicleType(source)
			triggerServerEvent("GTIfirefighter.createVehFlame",resourceRoot,dx,dy,newZ,vehtype)
		end
	end
end
addEventHandler("onClientVehicleExplode", root, vehFlame)
function onTakeJob( job )
    if ( job == "Firefighter" ) then 
    triggerServerEvent("GTIfirefighter.whereIsTheFire", resourceRoot)
	end
end
addEventHandler ("onClientPlayerGetJob", localPlayer, onTakeJob)

function delelem()
	if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") then
		if isTimer(rTimer) then killTimer(rTimer) end
		toggleControl("sprint", true)
		toggleControl("jump", true)
		toggleControl("aim_weapon", true)
		toggleControl("enter_exit", true)
		setPedAnimation(localPlayer,false)
		toggleControl("fire", true)
		if isElement(refmarker) then destroyElement(refmarker) end
		if isElement(refblip) then destroyElement(refblip) end
		if isElement(refblip1) then destroyElement(refblip1) end
		if isElement(freezemarker) then destroyElement(freezemarker) end
		if isElement(theDestroyedVeh) then
			triggerServerEvent("GTIfirefighter.freeze", resourceRoot, theDestroyedVeh, false)
			theDestroyedVeh = false
		end
	end
end
addEventHandler ("onClientPlayerWasted", localPlayer, delelem)

function delelem1()
	if (exports.GTIemployment:getPlayerJob(true) == "Firefighter") and source == theDestroyedVeh then
		if isTimer(rTimer) then killTimer(rTimer) end
		toggleControl("sprint", true)
		toggleControl("jump", true)
		toggleControl("aim_weapon", true)
		toggleControl("enter_exit", true)
		setPedAnimation(localPlayer,false)
		toggleControl("fire", true)
		if isElement(refmarker) then destroyElement(refmarker) end
		if isElement(refblip) then destroyElement(refblip) end
		if isElement(refblip1) then destroyElement(refblip1) end
		removeEventHandler("onClientElementDestroy", root, delelem1)
		if isElement(freezemarker) then destroyElement(freezemarker) end
		if isElement(theDestroyedVeh) then
			triggerServerEvent("GTIfirefighter.freeze", resourceRoot, theDestroyedVeh, false)
			theDestroyedVeh = false
		end
	end
end
function onJobQuit(job)
    if ( job == "Firefighter" ) then 
if ( Blip == 1 ) then exports.GTIblips:destroyCustomBlip(fireblip) end
destroyAllBlips()
if isElement(refmarker) then destroyElement(refmarker) end
if isElement(refblip) then destroyElement(refblip) end
if isElement(refblip1) then destroyElement(refblip1) end
if isTimer(taketimer) then killTimer(taketimer) end
toggleControl("sprint", true)
if firesound then stopSound(firesound) end
firesound = false
toggleControl("jump", true)
toggleControl("aim_weapon", true)
toggleControl("enter_exit", true)
setPedAnimation(localPlayer,false)
toggleControl("fire", true)
Blip = 0
ext = 0     
if isElement(freezemarker) then destroyElement(freezemarker) end
if isElement(theDestroyedVeh) then
triggerServerEvent("GTIfirefighter.freeze", resourceRoot, theDestroyedVeh, false)
theDestroyedVeh = false
end
if extinguished > 0 then
triggerServerEvent("GTIfirefighter.pay", resourceRoot, extinguished)
extinguished = 0 
end
end
end
addEventHandler ("onClientPlayerQuitJob", localPlayer, onJobQuit)

function destroyAllBlips()
	for i, theBlip in ipairs( Blip1 ) do 
		exports.GTIblips:destroyCustomBlip(theBlip)
		table.remove(Blip1,i) 
	end
	if (#Blip1 > 0) then 
		destroyAllBlips()
	end
end

addEventHandler("onClientResourceStop", resourceRoot, function()
	if extinguished > 0 then
		triggerServerEvent("GTIfirefighter.pay", resourceRoot, extinguished)
		extinguished = 0 
	end
end
)