local ctrlsheli = {
{"w","accelerate"}, 
{"s","brake_reverse"}, 
{"arrow_l","vehicle_left"}, 
{"arrow_r","vehicle_right"}, 
{"arrow_u","steer_forward"},
{"arrow_d", "steer_back"},
{"q","vehicle_look_left"},
{"e","vehicle_look_right"},
}
local ctrls = {
{"forwards","accelerate"}, 
{"backwards","brake_reverse"}, 
{"left","vehicle_left"}, 
{"right","vehicle_right"}, 
}
local cars = {
[564] = true,
[594] = true,
[441] = true
}
local helis = {
[501] = true,
[465] = true,
[464] = true
}
batterycapacity = 1000
addEvent("GTIRCvehicle.start", true) 
addEventHandler("GTIRCvehicle.start", root, function(veh,ped) 
	if isRemote then return end
	isRemote = true
	rcped = ped
	rcveh = veh
	id = getElementModel(veh)
	if helis[id] then
		addEventHandler("onClientPreRender",root,checkCtrlsHeli)
		addEventHandler("onClientPlayerWeaponSwitch",root,check1)
	elseif cars[id] then
		addEventHandler("onClientPreRender",root,checkCtrlsCar)
		addEventHandler("onClientPlayerWeaponSwitch",root,check1)
	end
	batterylvl = batterycapacity
	exports.GTIhud:drawStat("RCid","Battery","100%",0,255,0)
	bindKey("fire","down",check)
end)

function checkCtrlsHeli()
	local mx,my,mz = getElementPosition(localPlayer)
	local px,py,pz = getElementPosition(rcped)
	local cx,cy,cz,_,_,_ = getCameraMatrix()
	setCameraMatrix(cx,cy,cz,px,py,pz,0,180)
	if getDistanceBetweenPoints3D(mx,my,mz,px,py,pz) > 50 then
		exports.GTIhud:drawStat("RCid","Battery","Out of range",255,0,0)
		for i,key in ipairs(ctrlsheli) do 
			setPedControlState(rcped,key[2],false)
		end
		return
	end
	for i,key in ipairs(ctrlsheli) do 
		local state = getKeyState(key[1])
		setPedControlState(rcped,key[2],state)
		if state then
			speedx, speedy, speedz = getElementVelocity (rcveh)
			actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
			mps = actualspeed * 50
			batterylvl = batterylvl - 0.01*mps
			local percent = math.ceil(batterylvl/batterycapacity*100)
			if percent > 60 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",0,255,0)
			elseif percent > 20 and percent < 60 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",245,255,0)
			elseif percent < 20 and percent > 1 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",255,0,0)
			elseif percent < 0 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",255,0,0)
				stop()
			end
		end
	end
end
function checkCtrlsCar()
	local mx,my,mz = getElementPosition(localPlayer)
	local px,py,pz = getElementPosition(rcped)
	local cx,cy,cz,_,_,_ = getCameraMatrix()
	setCameraMatrix(cx,cy,cz,px,py,pz,0,180)
	if getDistanceBetweenPoints3D(mx,my,mz,px,py,pz) > 50 then
		exports.GTIhud:drawStat("RCid","Battery","Out of range",255,0,0)
		for i,key in ipairs(ctrls) do 
			setPedControlState(rcped,key[2],false)
		end
		return
	end
	for i,key in ipairs(ctrls) do 
		local state = getControlState(key[1])
		setPedControlState(rcped,key[2],state)
		if state then
			speedx, speedy, speedz = getElementVelocity (rcveh)
			actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
			mps = actualspeed * 50
			batterylvl = batterylvl - 0.01*mps
			local percent = math.ceil(batterylvl/batterycapacity*100)
			if percent > 60 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",0,255,0)
			elseif percent > 20 and percent < 60 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",245,255,0)
			elseif percent < 20 and percent > 1 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",255,0,0)
			elseif percent < 0 then
				exports.GTIhud:drawStat("RCid","Battery",percent.."%",255,0,0)
				stop()
			end
		end
	end
end

function stop()
	setCameraTarget(localPlayer)
	exports.GTIhud:drawStat("RCid","","",255,0,0)
	triggerServerEvent("GTIRCvehicle.destroy",resourceRoot)
	if helis[id] then
		removeEventHandler("onClientPreRender",root,checkCtrlsHeli)
		removeEventHandler("onClientPlayerWeaponSwitch",root,check1)
	elseif cars[id] then
		removeEventHandler("onClientPreRender",root,checkCtrlsCar)
		removeEventHandler("onClientPlayerWeaponSwitch",root,check1)
	end
	unbindKey("fire","down",check)
	isRemote = false
end
addCommandHandler("rcvehs",stop)

function checkfire()
		if isRemote then
		if getPedWeapon(localPlayer) == 40 then
			if helis[id] then
				removeEventHandler("onClientPreRender",root,checkCtrlsHeli)
			elseif cars[id] then
				removeEventHandler("onClientPreRender",root,checkCtrlsCar)
			end
			removeEventHandler("onClientPlayerWeaponSwitch",root,check1)
			triggerServerEvent("GTIRCvehicle.anim",resourceRoot,0)
			exports.GTIhud:drawStat("RCid","","",255,0,0)
			isRemote = false
			setCameraTarget(localPlayer)
		end
		else
			if helis[id] then
				addEventHandler("onClientPreRender",root,checkCtrlsHeli)
			elseif cars[id] then
				addEventHandler("onClientPreRender",root,checkCtrlsCar)
			end
			addEventHandler("onClientPlayerWeaponSwitch",root,check1)
			triggerServerEvent("GTIRCvehicle.anim",resourceRoot,1)
			isRemote = true
		end
    end
	
function check()
	if isTimer(checkTimer) then return end
	checkTimer = setTimer(checkfire,500,1)
end
function check1(prev,new)
		if isRemote and getPedWeapon(localPlayer,new) ~= 40 then
			if helis[id] then
				removeEventHandler("onClientPreRender",root,checkCtrlsHeli)
			elseif cars[id] then
				removeEventHandler("onClientPreRender",root,checkCtrlsCar)
			end
			removeEventHandler("onClientPlayerWeaponSwitch",root,check1)
			triggerServerEvent("GTIRCvehicle.anim",resourceRoot,2)
			exports.GTIhud:drawStat("RCid","","",255,0,0)
			isRemote = false
			setCameraTarget(localPlayer)
    end
end
