------------------------------------------------------------------------------------
--  PROJECT:     GTI Demo 1.0
--  RIGHTS:      All rights reserved by developers
--  FILE:        GTIMechanic/Server.lua
--  PURPOSE:     Mechanic Job
--  DEVELOPERS:  Aboud aka. iTaX
------------------------------------------------------------------------------------

-- NPC Mission
pos = {
	{2176.0322265625,-1259.9482421875,23.97682762146,165.60223388672},
	{970.958984375,-1301.7978515625,13.5546875,181.87867736816},
	{2862.912109375,-1994.921875,10.932863235474,357.86587524414},
	{1266.2763671875,-413.556640625,2.5556926727295,178.681640625},
	{1117.3095703125,-2394.955078125,11.535538673401,230.8949432373},
	{2845.271484375,-343.5341796875,7.9397964477539,7.7702026367188},
	{405.921875,-578.1318359375,38.412506103516,77.792633056641},
}
vehs = {
{602},
{474},
{480},
{411},
{409},
{551},
{550}
}

themarker = {}
thestar = {}
theTimer = {}
txTimer = {}
NPCTimer = {}

function handleRepairStart (hitElement,_)
	if getElementType (hitElement) == "player" and getElementData (hitElement,"Occupation") == "Mechanic" and (not getPedOccupiedVehicle ( hitElement )) then
	if getElementData (source,"Type") == "NPC" and getElementData (source,"ParentPlayer") == hitElement or getElementData (source,"Type") == "Player" then
		showCursor (hitElement,true)
		setElementFrozen(hitElement,true)
		setPedAnimation(hitElement,false)
		setPedAnimation(hitElement, "RYDER", "RYD_Beckon_03")
		txTimer[hitElement] = setTimer (handleRepairFinish, getElementHealth(getElementData (source,"ParentVehicle"))*10, 1, hitElement,getElementData (source,"ParentVehicle"))	
		if isTimer(theTimer[getVehicleOccupant(getElementData (source,"ParentVehicle"))]) then killTimer (theTimer[getVehicleOccupant(getElementData (source,"ParentVehicle"))]) end	end
end
end

function NPCMissionEnd (theP,theVehicle)
	if getElementData (theP,"Occupation") == "Mechanic" and ((getElementData (theP,"isBusy") == true) and getElementData (theP,"isWaiting") == false) or isTimer (NPCTimer[theP]) then
	    setElementData (theP,"isBusy",false)
	    setElementData (theP,"isWaiting",true)
		local theVehicle = getElementData (theP,"ParentVehicle")
		if isTimer (NPCTimer[theP]) then
		killTimer (NPCTimer[theP])
		end
        if isElement(theVehicle) and getElementData (theVehicle,"ParentBlip") and getElementData (theVehicle,"ParentMarker") then
		destroyElement (getElementData (theVehicle,"ParentBlip"))
		destroyElement (getElementData (theVehicle,"ParentMarker"))
		destroyElement (theVehicle)
		else return end
		outputChatBox ("You have stopped your NPC Mission!",theP,0,255,0,true)
		end
end

function NPCMissionStart (p)
	if getElementData (p,"Occupation") == "Mechanic" and (getElementData (p,"isWaiting") == true) and (getElementData (p,"isBusy") == false) then
		local r = math.random(#pos)
		local rv = math.random(#vehs)
		local marker = createMarker(pos[r][1], pos[r][2], pos[r][3], "cylinder", 3, 100, 200, 50,0)
		local blip = createBlipAttachedTo(marker, 51)
		local theveh = createVehicle (vehs[rv][1],pos[r][1], pos[r][2], pos[r][3])
		local thehealth = setElementHealth (theveh,math.random (400,700))
		local thehealths = getElementHealth (theveh)
		setElementVisibleTo ( marker, getRootElement(), false )
		setElementVisibleTo ( blip, getRootElement(), false )
		setElementVisibleTo ( blip, p, true )
		setElementVisibleTo ( marker, p, true )
		setElementFrozen(theveh, true)
		setVehicleLocked (theveh,true)
		setVehicleDamageProof ( theveh,true )
		setElementData (p,"ParentVehicle",theveh)
		setElementData (marker,"ParentVehicle",theveh)
		setElementData (theveh,"ParentBlip",blip)
		setElementData (theveh,"ParentMarker",marker)
		setElementData (marker,"ParentPlayer",p)
		setElementData (marker,"Type","NPC")
		setElementData (p,"isBusy",true)
		setElementData (p,"isWaiting",false)
		addEventHandler ("onMarkerHit",marker,handleRepairStart)
		bonus = false
		if marker then outputChatBox ("NPC Mission started, head to the 'Silver Van' blip",p,0,255,0,true) end
	end
end

function handleRepairFinish(player,  vehicle)
        if getElementType(player) == "player" and getElementType(vehicle) == "vehicle" then
                if getVehicleOccupant(vehicle) then
                    local amount = getElementHealth(vehicle)
                        setPedAnimation(player, false)
                        givePlayerMoney(player, amount)
                        takePlayerMoney(getVehicleOccupant(vehicle), amount)
                        outputChatBox("You paid $"..tonumber(amount).." for your vehicle repair!", getVehicleOccupant(vehicle), 0, 255, 0)
                        showCursor(player, false)
                        showCursor(getVehicleOccupant(vehicle), false)
                        setElementFrozen(player, false)
                        fixVehicle(vehicle)
                        setVehicleDamageProof(vehicle, false)
                        local p = getVehicleOccupant(vehicle)
                        destroyElement(themarker[p])
                        destroyElement(thestar[p])
                        setElementFrozen(vehicle, false)
                        setVehicleLocked(vehicle, false)
                        return
                end
                local amount = getElementHealth(vehicle)
                setPedAnimation(player, false)
                if getElementModel(vehicle) == 411 or getElementModel(vehicle) == 480 or getElementModel(vehicle) == 409 then
                        amount = amount + 1000
                        bonus = true
                end
                givePlayerMoney(player, amount)
                outputChatBox("Good work! A new vehicle will appear on your map in 60 seconds...", player, 0, 255, 0)
                if bonus then
                        outputChatBox("You have been awarded an extra $1,000!",  player, 0, 255, 0)
                end
                destroyElement(getElementData(vehicle, "ParentBlip"))
                destroyElement(getElementData(vehicle, "ParentMarker"))
                destroyElement(vehicle)
                showCursor(player, false)
                setElementFrozen(player, false)
				setElementData (player,"isWaiting",true)
				setElementData (player,"isBusy",false)
                NPCTimer[player] = setTimer(NPCMissionStart, 10000, 1, player)
        end
end

function unFixMe (player)
	local theveh = getPedOccupiedVehicle (player)
	outputChatBox ("There are no nearby mechanics at this moment!",player,20,20,20)
	destroyElement (themarker[player])
	destroyElement (thestar[player])
	setVehicleLocked (theveh,false)
	showCursor (player,false)
	setElementFrozen (theveh,false)
	setVehicleDamageProof (theveh,false)
end

addCommandHandler ("fixme",
function (player)
	local theveh = getPedOccupiedVehicle (player)
		if theveh and getElementType (player) == "player" and getElementHealth(theveh) <= 999.0 then
			if getPlayerMoney (player) > 0 and getPlayerMoney (player) >= (getElementHealth (theveh)) then
				local x,y,z = getElementPosition (player)
				thestar[player]  = createObject(1247,x,y,z)
				setElementCollisionsEnabled ( thestar[player], false )
				setVehicleDamageProof (theveh,true)
				setVehicleLocked (theveh,true)
				showCursor (player,true)
				attachElements (thestar[player],player,0,0,1.5)
					for i, da in ipairs( getElementsByType ( "player" ) ) do
						if getElementData (player,"Occupation") == "Mechanic" then
							outputChatBox (getPlayerName (player).." needs a mechanic in: "..getElementZoneName(player, true)..", "..getElementZoneName(player, false),da,255,255,0)
						end
					end
				themarker[player] = createMarker (x,y,z,"cylinder", 3, 100, 200, 50,0)
				setElementData (themarker[player],"Type","Player")
				setElementData (themarker[player],"ParentVehicle",theveh)
				addEventHandler ("onMarkerHit",themarker[player],handleRepairStart)
				setElementFrozen (theveh,true)
			else return 
				outputChatBox ("You can't afford this action, you need $"..(getElementHealth (theveh)),player,255,0,0,true) end
			else return
				outputChatBox ("Your vehicle doesn't need a mechanic!",player,255,0,0)
	    end
	end
)

local theJob = "Mechanic" -- Job name
local theTeam = "Services" -- the Team
local theSkin = 50 -- the Skin
addEvent ("set"..theJob,true)
addEventHandler ("set"..theJob,root,function (p) -- giveJobToPlayer Function
setPlayerTeam ( p, getTeamFromName( theTeam ) )
setElementModel ( p, theSkin )
setElementData( p, "Occupation", theJob )
setElementData( p, "isWaiting", true )
setElementData( p, "isBusy", false )
end
)

addCommandHandler ("startmission",NPCMissionStart)
addCommandHandler ("stopmission",NPCMissionEnd)