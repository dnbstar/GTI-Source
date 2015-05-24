----------------------------------------->>
-- GTI: Grand Theft International Network
-- Date: 25 July 2013
-- Resource: GTIclothing/elements.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Objects
----------->>

local objects = {
-- Binco
{ id=2877, pos={216.75069, -97.37305, 1005.43011}, int=15, dim={151,154} },
-- Sub Urban
{ id=2664, pos={213.85506, -39.89096, 1002.19574}, int=1, dim={155,157} },
-- ProLaps
{ id=2876, pos={201.23894, -130.5576, 1003.68011}, int=3, dim={158,159} },
-- Zip
{ id=2875, pos={180.66693, -86.05277, 1002.203}, int=18, dim={160,163} },
{ id=2875, pos={182.14928, -90.07962, 1002.15295, 180}, int=18, dim={160,163} },
-- Victim
{ id=2878, pos={208.08972, -3.03606, 1001.39008}, int=5, dim={164,166} },
-- Didier Sachs
{ id=2879, pos={215.14714, -154.30023, 1000.69574}, int=14, dim={167,167} },
{ id=2879, pos={216.608, -158.0755, 1000.69574, 180}, int=14, dim={167,167} },
-- Wardrobe
{ id=2877, pos={257.411, -39.074, 1002.195}, int=14, dim={150,150} },
}

for i,v in ipairs(objects) do
	for dim=v.dim[1],v.dim[2] do
		local object = createObject(v.id, v.pos[1], v.pos[2], v.pos[3], 0, 0, v.pos[4] or 0)
		setElementInterior(object, v.int)
		setElementDimension(object, dim)
	end
end

-- Peds
-------->>

local peds = {
-- Binco
{ pos={208.8298, -98.54066, 1005.25781, 180}, int=15, dim={151,154} },
{ pos={206.30449, -98.60042, 1005.25781, 180}, int=15, dim={151,154} },
	-- Ganton
	{ pos={2239.195, -1679.173, 15.479, 0}, int=0, dim={0,0} },
	{ pos={2241.679, -1679.794, 15.479, 0}, int=0, dim={0,0} },
-- Sub Urban
{ pos={204.9996, -41.27419, 1001.80469, 270}, int=1, dim={155,157} },
{ pos={203.18968, -41.73854, 1001.80469, 180}, int=1, dim={155,157} },
{ pos={202.53249, -40.08551, 1001.80469, 90}, int=1, dim={155,157} },
	-- Idlewood
	{ pos={2111.595, -1199.561, 23.988, 90}, int=0, dim={0,0} },
	{ pos={2112.057, -1201.501, 23.988, 180}, int=0, dim={0,0} },
	{ pos={2113.755, -1200.833, 23.988, 270}, int=0, dim={0,0} },
-- ProLaps
{ pos={206.39038, -127.7263, 1003.50781, 180}, int=3, dim={158,159} },
{ pos={207.74017, -127.75143, 1003.50781, 180}, int=3, dim={158,159} },
	-- Market
	{ pos={490.432, -1381.096, 16.392, 315}, int=0, dim={0,0} },
-- Zip
{ pos={159.759, -81.06325, 1001.80469, 180}, int=18, dim={160,163} },
{ pos={162.73361, -81.032, 1001.80469, 180}, int=18, dim={160,163} },
	-- Downtown Los Santos
	{ pos={1444.831, -1125.515, 23.933, 225}, int=0, dim={0,0} },
	{ pos={1446.690, -1123.955, 23.933, 225}, int=0, dim={0,0} },
-- Victim
{ pos={204.88594, -8.39831, 1001.21094, 270}, int=5, dim={164,166} },
	-- Rodeo
	{ pos={438.460, -1504.562, 18.459, 270}, int=0, dim={0,0} },
-- Didier Sachs
--{ pos={204.17407, -157.79323, 1000.52344, 180}, int=14, dim={167,167} },  
	-- Rodeo
	{ pos={465.430, -1474.030, 30.860, 107.5}, int=0, dim={0,0} },
-- Sex Shop
{ pos={-103.863, -24.177, 1000.718, 0}, int=3, dim={168,168} }, 
}

for i,v in ipairs(peds) do
	for dim=v.dim[1],v.dim[2] do
		local model = math.random(2)
		if model == 1 then id = 211 else id = 217 end
		local ped = createPed(id, v.pos[1], v.pos[2], v.pos[3], v.pos[4] or 0)
		setElementFrozen(ped, true)
		setElementInterior(ped, v.int)
		setElementDimension(ped, dim)
	end
end

addEventHandler("onClientPedDamage", resourceRoot, function()
	cancelEvent()
end)
