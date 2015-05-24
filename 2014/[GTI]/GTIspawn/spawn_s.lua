hospitals = {
	--{ x, y, z, rot},
	--LS
	{ 1178.7457275391, -1323.8264160156, 14.135261535645, 270, "All Saints"}, --All Saints
	{ 2032.7645263672, -1416.2613525391, 16.9921875, 132, "Jefferson"}, --Jefferson
	{ 1242.409, 327.797, 19.755, 332, "Montgomery"}, --Montgomery
	{ 2269.598, -75.157, 26.772, 181, "Palimino Creek"}, --Palimino Creek
	--{ 854.338, -603.009, 17.421, 0, "Dillimore"}, --Dillimore
	--SF
	{ -2201.1604003906, -2307.6457519531, 30.625, 320, "Whetstone"}, --Whetstone
	{ -2655.1650390625, 635.66253662109, 14.453125, 180, "Santa Flora"}, --Santa Flora
	--LV
	{ 1607.2800292969, 1818.4868164063, 10.8203125, 360, "Las Venturas"}, --LV Airport
	{ -1514.902, 2525.023, 55.783, 0, "El Quebrados"}, --El Quebrados
	{ -254.074, 2603.394, 62.858, 270, "Las Payasadas"}, --Las Payasadas
	{ -320.331, 1049.375, 20.340, 360, "Fort Carson"}, --Fort Carson
}

function test( source)
	local posX, posY, posZ = getElementPosition( source)
	local rotX, rotY, rotZ = getElementRotation( source)
	outputChatBox( posX..", "..posY..", "..posZ..", "..math.floor(rotZ), source, 255, 255, 0)
end
addCommandHandler( "pos", test)

--[[
    setTimer (
        function ( )
            for _,v in ipairs ( hospitals) do
                local blipX, blipY, blipZ = unpack ( v )
				createBlip( blipX, blipY, blipZ, 22, 1, 255, 0, 0, 255, 0, 200)
            end
        end, 1000, 1
    )
--]]

function findNearestHostpital(thePlayer)
  local nearest = nil
  local min = 999999
  for key,val in pairs(hospitals) do
    local xx,yy,zz=getElementPosition(thePlayer)
    local x1=val[1]
    local y1=val[2]
    local z1=val[3]
	local pR=val[4]
	local hN=val[5]
    local dist = getDistanceBetweenPoints2D(xx,yy,x1,y1)
    if dist<min then
      nearest = val
      min = dist
    end
  end
  return nearest[1],nearest[2],nearest[3],nearest[4],nearest[5],nearest[6],nearest[7],nearest[8]
end

function postSpawn( player, hospitalName)
	if isElement( player) then
		local name  = getPlayerName( player)
		if name then
			--exports.GTIhud:dqm( "hospitalSpawn", "You were revived at the "..hospitalName.." Hospital", player, 255, 232, 133, 2500)
			--exports.GTIhud:dm( "You were revived at the "..hospitalName.." Hospital", player, 255, 232, 133)
			exports.GTIsocial:logSocialMessage( name, "You were revived at the "..hospitalName.." Hospital", "brief", 4, "Briefing", "Player Movement", "player")
			setCameraTarget( player)
		end
	end
end

--[[
addEvent( "onKillerInteriorChange", true)
addEventHandler( "onKillerInteriorChange", root,
function ( killer, victim)
	killCamIntChange = setTimer(
		function()
			local killerInt = getElementInterior( killer)
			local victimInt = getElementInterior( victim)
			local killerDim = getElementDimension( killer)
			local victimDim = getElementDimension( victim)
			if victimInt ~= killerInt then
				if isPedDead( victim) then
					setElementInterior( victim, killerInt)
					setElementDimension( victim, killerDim)
				else
					if isTimer( killCamIntChange) then
						killTimer( killCamIntChange)
					end
				end
			end
		end, 1000, 0
	)
end
)

function updateInterior( killer)
	local int = getCameraInterior( killer)
	setCameraInterior( killer, int)
	outputChatBox( "test", killer)
end
--]]

addEventHandler("onPlayerWasted", root,
	function(totalAmmo, killer, killerWeapon, bodypart)
		local xx,yy,zz,rot, hName = findNearestHostpital(source)
		if killer then
			setTimer( fadeCamera, 2000, 1, source, false, 1, 0, 0, 0)
			setTimer( fadeCamera, 3000, 1, source, true, 2)
			setTimer( setCameraTarget, 3000, 1, source, killer)
			spawnTime = 11000 --15000
			fadeTime1 = 10000 --14000
			fadeTime2 = 11000 --15000
			--triggerEvent( "onKillerInteriorChange", source, killer, source)
		else
			spawnTime = 5000
			fadeTime1 = 4000
			fadeTime2 = 5000
			--setTimer( setCameraTarget, 3000, 1, source)
		end
		setTimer( spawnPlayer, spawnTime, 1, source,xx,yy,zz, rot, getElementModel (source), 0, 0, getPlayerTeam(source))
		setTimer( postSpawn, spawnTime, 1, source, hName)
		setTimer( fadeCamera, fadeTime1, 1, source, false, 1, 0, 0, 0)
		setTimer( fadeCamera, fadeTime2, 1, source, true, 2)
	end
)
