------------------------------------------------->>
-- PROJECT:			Grand Theft International
-- RESOURCE: 		GTIcorrectional/correctional_c.lua
-- DESCRIPTION:		Correctional Division (Clientside)
-- AUTHOR:			Nerox, Diego Hernandez (diegonese)
-- RIGHTS:			All rights reserved to authors
------------------------------------------------->>
--[[local policeStations = {
	{1535.770, -1667.539, 12.383}, -- LSPD
}

local peds = {
	{1539.629, -1669.053, 13.549, 90}, -- LSPD
}

local x
local offset = 1
local mX, mY, mZ, rot

for i, v in ipairs (peds) do
	mX, mY, mZ, rot = v[1], v[2], v[3], v[4]
end

for i = 1, 7 do
	if not x then x = mX end
	x = x + offset
	thePeds = createPed(128, x, mY, mZ, rot)
	--setElementFrozen(thePeds, true)
	addEventHandler("onClientPedDamage", thePeds, cancelEvent)
	setPedAnalogControlState (thePeds, 'enter_passenger ', 1)
end--]]

	

