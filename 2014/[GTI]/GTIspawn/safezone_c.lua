local zoneName = {}
local zoneSafezone = {}
local zoneProjectiles = {}
local zoneRadar = {}
local zoneAreas = {}
local zoneInterior = {}

local safezones = {
	--{ Name, fX, fY, fZ, fWidth, fHeight, fDepth, Safezone(true|false), Projectiles Allowed(true|false), Radar(true|false), Interior(true|false)}
	--LS
	{ "All Saints General Hospital", 1149.697, -1385.308, 12.826, 40.182, 98.948, 49.794, true, false, true, false}, --All Saints General Hospital - Los Santos
	{ "Los Santos County General Hospital", 1996.958, -1450.887, 12.561, 47.570, 49.159, 56.663, true, false, true, false}, --County General Hospital - Los Santos
	{ "Crippen Medical Center", 1210.718, 294.443, 18.554, 41.054, 42.309, 20.891, true, false, true, false}, --Crippen Memorial, Mongomery - Los Santos
	{ "Palimino Creek Medical Center", 2247.202, -88.334, 25.484, 35.657, 25.493, 33.318, true, false, true, false}, --Palimino Creek Medical Center - Los Santos
	--SF
	--{ "Angel Pine Medical Center", -2254.337, -2312.136, 28.193, 64.507, 13.812, 21.616, true, false, true, false}, --Angel Pine Medical Center - San Fierro
	{ "Angel Pine Medical Center", -2231.469, -2328.802, 29.625, 47.928, 30.128, 1.9, true, false, true, false}, --Angel Pine Medical Center - San Fierro
	{ "San Fierro Medical Center", -2711.034, 579.111, 14.815, 92.999, 58.840, 53.286, true, false, true, false}, --San Fierro Medical Center - San Fierro
	--LV
	{ "El Quebrados Medical Center", -1534.687, 2505.533, 54.958, 38.885, 32.1188, 20.0187, true, false, true, false}, --El Quebrados Medical Center - Las Venturas
	{ "Las Payasadas Medical Center", -286.438, 2583.445, 61.603, 44.413, 29.234, 10.954, true, false, true, false}, --Las Payasadas Medical Center - Las Venturas
	{ "Las Venturas Medical Center", 1577.103, 1723.035, 9.820, 60.545, 140.0616, 31.038, true, false, true, false}, --Las Venturas Medical Centas - Las Venturas
	{ "Fort Carson Medical Center", -326.545, 1049.331, 19.340, 25.014, 10.777, 1.150, true, false, true, false}, --Fort Carson Medical Centas - Las Venturas
	--City Projectile Cols
	--LS
	--{ "Los Santos City Limits", 1042.521, -1567.055, 12.383, 814.211, 536.660, 96.307, false, false, false, false}, --Fort Carson Medical Centas - Las Venturas
	{ "Los Santos City Limits", 99.261, -2095.278, -3.432, 2878.915, 1168.683, 83.884, false, false, false, false}, --Fort Carson Medical Centas - Las Venturas
	--SF
	--{ "San Fierro City Limits", -2140.188, 327.834, 34.320, 527.691, 851.339, 19.171, false, false, false, false}, --Fort Carson Medical Centas - Las Venturas
	{ "San Fierro City Limits", -3128.413, -807.156, 53.935, 1984.321, 2390.746, 19.997, false, false, false, false}, --Fort Carson Medical Centas - Las Venturas
	--LV
	--{ "Las Venturas City Limits", 1814.939, 858.132, 9.667, 725.164, 1660.041, 77.924, false, false, false, false}, --Fort Carson Medical Centas - Las Venturas
	{ "Las Venturas City Limits", 848.174, 625.322, 77.511, 1853.935, 1983.165, -65.791, false, false, false, false}, --Fort Carson Medical Centas - Las Venturas
	--All Interiors
	--24/7 Shops
	{ "24/7", -39.605, -96.407, 998.944, 28.572, 25.087, 9.564, false, false, false, true}, --24/7 Shop 1
	{ "24/7", -40.450, -61.859, 999.711, 25.144, 15.019, 8.297, false, false, false, true}, --24/7 Shop 2
	{ "24/7", -39.437, -38.398, 999.713, 17.314, 38.525, 7.960, false, false, false, true}, --24/7 Shop 3
	--Ammu-Nations
	{ "Ammu-Nation", 282.785, -50.321, 997.545, 18.420, 49.375, 10.174, false, false, false, true}, --Ammu-Nation 1
	{ "Ammu-Nation", 282.650, -92.121, 998.778, 50.364, 37.334, 8.278, false, false, false, true}, --Ammu-Nation 2
	{ "Ammu-Nation", 280.317, -117.220, 999.050, 19.206, 18.123, 7.590, false, false, false, true}, --Ammu-Nation 3
	{ "Ammu-Nation", 267.951, -177.104, 993.930, 55.616, 19.720, 10.218, false, false, false, true}, --Ammu-Nation 4
	{ "Ammu-Nation", 267.229, -151.753, 996.194, 51.114, 28.309, 12.363, false, false, false, true}, --Ammu-Nation 5(2 Story's)
	--Atrium
	{ "The Atrium", 1697.051, -1680.919, 19.202, 45.652, 45.779, 27.763, false, false, false, true}, --Atrium Lobby Entrance/Exit
	--Bars
	{ "The Gaydar Station Bar", 472.429, -30.359, 997.373, 35.647, 30.874, 9.866, false, false, false, true}, --Bar 1 (Gaydar Station)
	{ "The Ten Green Bottle's", 485.666, -90.520, 996.779, 27.347, 26.411, 5.525, false, false, false, true}, --Bar 2 (Ten Green Bottle's)
	{ "The Little Probe Inn", -233.873, 1389.296, 24.952, 18.338, 24.508, 5.362, false, false, false, true}, --Little Probe Inn
	--House Interiors
	{ "Big Smoke's Crack Palace", 2510.265, -1328.065, 1020.129, 82.0913, 69.0892, 50.576, false, false, false, true}, --Big Smoke's Crack Palace
	{ "Big Spread Ranch", 1201.636, -46.953, 997.265, 16.855, 24.933, 6.709, false, false, false, true}, --Big Spread Ranch (Strip Club)
	{ "Brothel", 939.586, -64.965, 997.897, 33.702, 24.773, 6.140, false, false, false, true}, --Brothel (Strip Club)
	{ "Budget Inn Motel", 441.849, 506.195, 997.477, 16.110, 11.088, 8.158, false, false, false, true}, --Budget Inn Motel Room
	{ "Burning Desire", 2317.655, -1189.230, 1024.849, 39.569, 20.175, 11.439, false, false, false, true}, --Burning Desire House
	{ "Colonel Fuhrberger's House", 2802.133, -1178.722, 1022.224, 19.278, 18.539, 11.115, false, false, false, true}, --Colonel Fuhrberger's House
	{ "The Driving School", -2036.622, -124.733, 1032.021, 16.723, 26.138, 6.260, false, false, false, true}, --Driving School
	{ "The Track Betting Station", 818.189, -2.834, 1000.744, 19.229, 15.880, 7.509, false, false, false, true}, --Insnamee Track Betting
	{ "The Chinatown Track Betting Station", -2172.637, 631.922, 1049.656, 16.634, 17.564, 12.457, false, false, false, true}, --Insnamee Track Betting (Chinatown)
	{ "The Jefferson Motel", 2175.307, -1215.896, 1019.118, 80.749, 79.179, 18.159, false, false, false, true}, --Jefferson Motel
	{ "Jizzy's Pleasure Dome", -2695.631, 1374.058, 901.388, 68.218, 60.749, 26.076, false, false, false, true}, --Jizzy's Pleasure Domes
	{ "The LV Planning Department", 314.816, 143.714, 1004.586, 78.411, 76.509, 32.172, false, false, false, true}, --LV Planning Department
	{ "The Johnson House", 2489.405, -1713.931, 1011.636, 12.878, 27.308, 11.805, false, false, false, true}, --Johnson House
	{ "The Madd Dogg Mansion", 1223.006, -841.821, 1078.109, 84.801, 90.428, 20.170, false, false, false, true}, --Madd Dogg Mansion
	{ "Millie's Bedroom", 342.913, 298.401, 996.487, 7.985, 13.002, 8.428, false, false, false, true}, --Millie's Bedroom
	{ "The RC Battlefield", -1154.999, 975.456, 1309.798, 192.221, 128.645, 59.869, false, false, false, true}, --RC Zero's Battlefield
	{ "The RC Shop", -2245.061, 125.866, 1032.250, 27.842, 12.638, 7.523, false, false, false, true}, --RC Zero's Shop
	{ "The Record Label Hallway", 1034.935, -5.908, 999.116, 11.184, 23.179, 5.453, false, false, false, true}, --Record Label Hallway
	{ "The Sex Shop", -116.539, -33.516, 999.125, 18.713, 27.900, 5.015, false, false, false, true}, --Sex Shop
	{ "The Crack Pen", 302.950, 1110.177, 1080.509, 32.886, 23.712, 6.701, false, false, false, true}, --The Crack Den
	{ "The Strip Club", 1199.542, -18.323, 999.067, 26.276, 39.443, 10.145, false, false, false, true}, --The Pig Pen
	{ "The Warehouse", 1356.270, -51.630, 998.414, 65.083, 62.650, 16.324, false, false, false, true}, --Warehouse
	--Stadium's
	{ "The Stadium", -1563.809, 6.847, 1017.047, 323.637, 220.988, 39.065, false, false, false, true}, --Stadium 1
	{ "The Stadium", -1602.719, 859.687, 1011.645, 411.887, 253.455, 105.638, false, false, false, true}, --Stadium 2
	{ "The Stadium", -1567.758, 1494.831, 1042.645, 285.485, 202.291, 48.162, false, false, false, true}, --Stadium 3
	--Safehouses
	{ "The 1st Safehouse", 214.691, 1281.875, 1079.050, 20.262, 12.697, 7.872, false, false, false, true}, --Safehouse 1
	{ "The 2nd Safehouse", 248.336, 1275.214, 1077.706, 21.032, 21.786, 5.043, false, false, false, true}, --Safehouse 2
	{ "The 3rd Safehouse", 132.061, 1361.117, 1078.837, 24.187, 27.576, 14.173, false, false, false, true}, --Safehouse 3
	{ "The 4th Safehouse", 74.741, 1315.929, 1081.643, 24.210, 31.212, 11.645, false, false, false, true}, --Safehouse 4
	{ "The 5th Safehouse", -303.497, 1468.486, 1081.428, 25.594, 14.937, 12.166, false, false, false, true}, --Safehouse 5
	{ "The 6th Safehouse", -281.683, 1444.724, 1082.385, 26.351, 14.095, 9.699, false, false, false, true}, --Safehouse 6
	{ "The 7th Safehouse", -54.043, 1395.728, 1082.646, 20.634, 18.300, 6.481, false, false, false, true}, --Safehouse 7
	{ "The 8th Safehouse", -73.553, 1343.987, 1079.110, 18.147, 24.732, 6.272, false, false, false, true}, --Safehouse 8
	{ "The 9th Safehouse", 2329.218, -1084.870, 1046.831, 17.078, 25.260, 6.102, false, false, false, true}, --Safehouse 9
	{ "The 10th Safehouse", 2223.729, -1120.605, 1048.182, 19.841, 17.850, 7.138, false, false, false, true}, --Safehouse 10
	{ "The 11th Safehouse", 2357.130, -1143.714, 1046.038, 19.697, 25.057, 8.533, false, false, false, true}, --Safehouse 11
	{ "The 12th Safehouse", 2275.109, -1143.265, 1048.379, 14.608, 11.909, 6.012, false, false, false, true}, --Safehouse 12
	{ "The 13th Safehouse", 2180.198, -1229.446, 1044.517, 25.110, 31.168, 8.325, false, false, false, true}, --Safehouse 13
	{ "The 14th Safehouse", 2245.846, -1226.353, 1045.753, 32.920, 21.502, 7.834, false, false, false, true}, --Safehouse 14
	{ "The 15th Safehouse", 2303.373, -1219.442, 1045.557, 19.804, 14.503, 7.602, false, false, false, true}, --Safehouse 15
	{ "The 16th Safehouse", 2201.558, -1080.792, 1047.703, 23.046, 11.623, 7.869, false, false, false, true}, --Safehouse 16
	{ "The 17th Safehouse", 2231.337, -1092.423, 1047.527, 16.082, 29.924, 7.116, false, false, false, true}, --Safehouse 17
	{ "The 18th Safehouse", 2309.598, -1035.722, 1046.901, 23.180, 33.997, 12.503, false, false, false, true}, --Safehouse 18
	--Police Interiors
	{ "The Los Santos Police Department HQ", 212.498, 52.187, 999.759, 58.598, 41.428, 9.785, false, false, false, true}, --LSPD HQ
	{ "The Las Venturas Police Department HQ", 185.754, 135.095, 994.516, 117.022, 64.596, 20.199, false, false, false, true}, --LVPD HQ
	{ "The San Fierro Police Department HQ", 212.964, 103.472, 995.821, 68.392, 28.305, 17.743, false, false, false, true}, --SFPD HQ
	{ "The Police Station", 314.906, 297.910, 996.853, 14.967, 20.693, 6.659, false, false, false, true}, --Police Station 1
	--Casinos
	{ "Caligula Casino", 2259.291, 1617.400, 1081.062, 13.967, 61.624, 13.723, false, false, false, true}, --Caligula's Rooftop Access
	{ "Caligula Casino", 2121.868, 1536.648, 989.269, 174.726, 183.509, 34.592, false, false, false, true}, --Caligula's Casino
	{ "The Casino", 1111.710, -18.521, 996.527, 33.804, 32.494, 12.437, false, false, false, true}, --The Casino
	{ "The Four Dragons Casino", 1922.532, 961.481, 989.753, 102.240, 108.561, 28.274, false, false, false, true}, --The Four Dragons Casino
	--Gyms
	{ "Las Venturas Gym", 755.383, -84.641, 996.943, 22.740, 30.079, 9.703, false, false, false, true}, --LV Gym
	{ "Los Santos Gym", 753.801, -11.805, 997.766, 22.722, 28.851, 7.485, false, false, false, true}, --LS Gym
	{ "San Fierro Gym", 752.004, -55.914, 999.131, 26.978, 47.546, 9.090, false, false, false, true}, --SF Gym
	--Apparal Store's
	{ "Binco Clothing", 198.758, -116.783, 1001.685, 20.856, 22.782, 7.043, false, false, false, true}, --Binco
	{ "Didier Sachs Clothing", 195.300, -173.374, 997.231, 22.404, 24.132, 8.356, false, false, false, true}, --DS
	{ "Sub Urban Clothing", 193.698, -54.745, 999.672, 23.501, 23.800, 10.195, false, false, false, true}, --Sub Urban
	{ "Pro Laps Clothing", 194.808, -145.085, 1000.630, 23.575, 20.459, 6.647, false, false, false, true}, --Pro Laps
	{ "Victim Clothing", 198.457, -16.711, 998.577, 34.224, 16.302, 12.301, false, false, false, true}, --Victim
	{ "ZIP Clothing", 143.880, -100.116, 999.895, 40.033, 31.912, 9.244, false, false, false, true}, --ZIP
	{ "The Barbershop", 415.704, -90.748, 998.504, 8.856, 19.538, 8.460, false, false, false, true}, --Barber Store
	{ "Macisla's Barbershop", 407.103, -60.649, 998.892, 9.675, 13.295, 7.154, false, false, false, true}, --Macisla's Barbershop
	{ "Reece's Barbershop", 409.625, -27.181, 999.271, 7.475, 20.472, 8.182, false, false, false, true}, --Reece's Barbershop
	{ "The Tattoo Parlor", -207.327, -12.958, 999.951, 8.434, 14.519, 5.134, false, false, false, true}, --Tattoo Parlor
	--Food Stores/Locations
	{ "Burger Shot", 358.688, -80.200, 1000.534, 25.702, 24.669, 6.048, false, false, false, true}, --Burger Shot
	{ "Cluckin' Bell", 360.817, -16.011, 999.400, 21.091, 14.030, 6.665, false, false, false, true}, --Cluckin' Bell
	{ "Well Stacked Pizza", 366.023, -139.448, 999.660, 16.855, 28.180, 7.593, false, false, false, true}, --Well Stacked Pizza
	{ "The Diner", 432.226, -93.455, 996.535, 30.046, 15.687, 6.610, false, false, false, true}, --Diner 1
	{ "The Meat Factory", 931.625, 2092.446, 1004.767, 38.618, 87.370, 14.043, false, false, false, true}, --LV Meat Factory
	{ "The Restaurant", 437.473, -25.148, 997.106, 24.576, 21.642, 10.166, false, false, false, true}, --Restaurant 1
	{ "Rusty Ring Donut's", 371.653, -196.905, 998.027, 12.012, 20.644, 7.217, false, false, false, true}, --Rusty Ring Donuts
	--Outdoor Indoor Interior's
	{ "Saint Francis International Airport", -2003.943, -58.690, 1035.881, 286.371, 136.258, 62.450, false, false, false, true}, --Francis International Airport
}

function createSafeZones()
	for index, zones in pairs(safezones) do
		if zones[11] ~= true then
			zone = createColRectangle( zones[2], zones[3], zones[5], zones[6])
		else
			zone = createColCuboid( zones[2], zones[3], zones[4], zones[5], zones[6], zones[7])
		end
		zoneName[zone] = zones[1]
		zoneSafezone[zone] = zones[8]
		zoneProjectiles[zone] = zones[9]
		zoneRadar[zone] = zones[10]
		zoneInterior[zone] = zones[11]
		--
		zoneAreas[zone] = createRadarArea( zones[2], zones[3], zones[5], zones[6], 50, 50, 50, 200)
		local aC1, aC2, aC3, aC4 = getRadarAreaColor( zoneAreas[zone])
		if zoneRadar[zone] == false then
			setRadarAreaColor( zoneAreas[zone], aC1, aC2, aC3, 0)
		end
		addEventHandler("onClientColShapeHit", zone, onCSZEnter)
		addEventHandler("onClientColShapeLeave", zone, onCSZExit)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, createSafeZones)

addEvent( "onClientSafeZoneEnter", true)
addEventHandler( "onClientSafeZoneEnter", root,
function ( zoneName, zoneStatus, weaponStatus, interior)
end
)

addEvent( "onClientSafeZoneExit", true)
addEventHandler( "onClientSafeZoneExit", root,
function ( zoneName, zoneStatus, weaponStatus, interior)
end
)

addEvent( "onClientSafeZoneDamage", true)
addEventHandler( "onClientSafeZoneDamage", root,
function ( attkr, wep, bodypart, dmg)
end
)

function onCSZEnter( player)
	if (player ~= localPlayer) then return end
	local name = zoneName[source]
	local safezoneStatus = zoneSafezone[source]
	local projectileStatus = zoneProjectiles[source]
	local intZone = zoneInterior[source]
	--return name
	--if not isPlayerInVehicle( player) then
		triggerEvent( "onClientSafeZoneEnter", root, player, name, safezoneStatus, projectileStatus, intZone)
		triggerServerEvent( "onSafeZoneEnter", player, name, safezoneStatus, projectileStatus, intZone)
	--end
end

function onCSZExit( player)
	if (player ~= localPlayer) then return end
	local name = zoneName[source]
	local safezoneStatus = zoneSafezone[source]
	local projectileStatus = zoneProjectiles[source]
	local intZone = zoneInterior[source]
	--return name
	--if not isPlayerInVehicle( player) then
		triggerEvent( "onClientSafeZoneExit", root, player, name, safezoneStatus, projectileStatus, intZone)
		triggerServerEvent( "onSafeZoneExit", player, name, safezoneStatus, projectileStatus, intZone)
	--end
end

function eventCancel()
	cancelEvent()
end
--addEvent( "cancelDamage", true)
--addEventHandler( "cancelDamage", root, eventCancel)

local blockedKeys = {
	--['f'] = true,
	--['g'] = true,
	--['enter'] = true,
	['j'] = false,
	['mouse1'] = true,
	['mouse2'] = true,
	['space'] = false,
	['lshift'] = false,
	['lctrl'] = true,
}

function blockedPress( key)
	if blockedKeys[key] then
		eventCancel()
	end
end

function onCSZDamage( attkr, wep, bodypart, dmg)
	triggerEvent( "onClientSafeZoneDamage", root, source, attkr, wep, bodypart, dmg)
	triggerServerEvent( "onSafeZoneDamage", source, attkr, wep, bodypart, dmg)
	eventCancel()
end

local blockedWeapons = {
	--Projectiles
	[16] = true,
	[17] = true,
	[18] = true,
	[39] = true,
	[40] = true, --Detonator
	--Heavy Weapons
	[35] = true,
	[36] = true,
	[37] = true,
	[38] = true,
}

local blockWeaponName = {
	['Bomb'] = "Detonator",
}

function onCSZSwitch( prevSlot, currentSlot)
	weapon = blockedWeapons[getPedWeapon( source, currentSlot)]
	weaponName = getWeaponNameFromID( getPedWeapon( source, currentSlot))
	if weapon then
		toggleControl( "fire", false)
		toggleControl( "aim_weapon", false)
		--eventCancel()
		if not isTimer( blockWepT) then
			local alternative = blockWeaponName[weaponName]
			if alternative then
				exports.GTIhud:dm( alternative.."'s are disabled where you are located.", 255, 0, 0)
			else
				exports.GTIhud:dm( weaponName.."'s are disabled where you are located.", 255, 0, 0)
			end
			blockWepT = setTimer( function() end, 5000, 1)
		end
	else
		toggleControl( "fire", true)
		toggleControl( "aim_weapon", true)
	end
end

function updateTimer()
	if isTimer( exitTimer) then
		local timeRemaining = math.floor(getTimerDetails(exitTimer))
		local tR = timeRemaining / 60000
		local timeLeft = math.floor(tR * 60)
		if tonumber(timeLeft) < 10 then
			exports.GTIhud:drawStat("exitTimer", "Time to exit safezone", "00:0"..timeLeft, 123, 45, 49, 1000)
		else
			exports.GTIhud:drawStat("exitTimer", "Time to exit safezone", "00:"..timeLeft, 123, 45, 49, 1000)
		end
	end
end

addEventHandler( "onClientSafeZoneEnter", root,
	function( source, name, status1, status2, interior)
		local plr = getPlayerName( source)
		if isTimer( exitTimer) then
			killTimer(exitTimer)
			killTimer(showTimer)
		end
		--exitTimer = setTimer( setElementHealth, 30000, 1, source, 0)
		--showTimer = setTimer( updateTimer, 1000, 30)
		--
		if status1 == true then
			setPedWeaponSlot( source, 0)
			--toggleControl( "jump", false)
			toggleControl( "change_camera", false)
			toggleControl( "fire", false)
			toggleControl( "next_weapon", false)
			toggleControl( "previous_weapon", false)
			toggleControl( "aim_weapon", false)
			--toggleControl( "crouch", false)
			--toggleControl( "sprint", false)
			--toggleControl( "walk", false)
			--
			toggleControl( "vehicle_fire", false)
			toggleControl( "vehicle_secondary_fire", false)
			toggleControl( "horn", false)
			toggleControl( "special_control_left", false)
			toggleControl( "special_control_right", false)
			toggleControl( "special_control_down", false)
			toggleControl( "special_control_up", false)
			--
			addEventHandler("onClientPlayerDamage", root, onCSZDamage)
			addEventHandler("onClientKey", root, blockedPress)
			addEventHandler("onClientPlayerWeaponSwitch", root, onCSZSwitch)
			if interior == false then
				if not isTimer( enter1Timer) then
					--exports.GTIhud:dm( "You entered the "..name.." Safezone.", 50, 100, 100)
					enter1Timer = setTimer( function() end, 10000, 1)
				end
				for i, p in ipairs ( getElementsByType( "player")) do
					setElementCollidableWith( source, p, false)
				end
			else
				--exports.GTIhud:dm( "You entered "..name..".", 100, 100, 100)
			end
		else
			if interior == false then
				if not isTimer( enter1Timer) then
					--exports.GTIhud:dm( "You entered the "..name..".", 50, 100, 100)
					--exports.GTIhud:dm( "You are now allocated in the "..name..".", 50, 100, 100)
					enter1Timer = setTimer( function() end, 10000, 1)
				end
			else
				--exports.GTIhud:dm( "You entered "..name..".", 100, 100, 100)
			end
			local slot = getPedWeaponSlot( source)
			local weapon = blockedWeapons[getPedWeapon( source, slot)]
			if weapon then
				toggleControl( "fire", false)
			else
				toggleControl( "fire", true)
			end
		end
	end
)

addEventHandler( "onClientSafeZoneExit", root,
	function( source, name, status1, status2, interior)
		local plr = getPlayerName( source)
		if isTimer( exitTimer) then
			killTimer( exitTimer)
			killTimer( showTimer)
		end
		if status1 == true then
			--
			toggleControl( "jump", true)
			toggleControl( "change_camera", true)
			toggleControl( "fire", true)
			toggleControl( "next_weapon", true)
			toggleControl( "previous_weapon", true)
			toggleControl( "aim_weapon", true)
			toggleControl( "crouch", true)
			toggleControl( "sprint", true)
			toggleControl( "walk", true)
			--
			toggleControl( "vehicle_fire", true)
			toggleControl( "vehicle_secondary_fire", true)
			toggleControl( "horn", true)
			toggleControl( "special_control_left", true)
			toggleControl( "special_control_right", true)
			toggleControl( "special_control_down", true)
			toggleControl( "special_control_up", true)
			--
			removeEventHandler("onClientPlayerDamage", root, onCSZDamage)
			removeEventHandler("onClientKey", root, blockedPress)
			removeEventHandler("onClientPlayerWeaponSwitch", root, onCSZSwitch)
			if interior == false then
				if not isTimer( leave1Timer) then
					--exports.GTIhud:dm( "You left the "..name.." Safezone.", 100, 100, 50)
					leave1Timer = setTimer( function() end, 10000, 1)
				end
				for i, p in ipairs ( getElementsByType( "player")) do
					setElementCollidableWith( source, p, true)
				end
			else
				--exports.GTIhud:dm( "You left "..name..".", 100, 50, 100)
			end
		else
			if interior == false then
				if not isTimer( leave2Timer) then
					--exports.GTIhud:dm( "You left the "..name..".", 100, 100, 50)
					leave2Timer = setTimer( function() end, 10000, 1)
				end
			else
				--exports.GTIhud:dm( "You left "..name..".", 100, 50, 100)
			end
			local fireState = getControlState( "fire")
			if fireState ~= true then
				toggleControl( "fire", true)
			end
		end
	end
)

