----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Ministry of Architecture
-- Date: 23 Dec 2014
-- Original Map File: LilDollaBankHeist.map
----------------------------------------->>

if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local INTERIOR = 0
local DIMENSION = 0

money = {}

locations = {
	{ 2271.914, -86.958, 25.495, "8,2"},
	{ 2272.914, -86.958, 25.487, "8,2"},
	{ 2273.914, -86.958, 25.487, "8,2"},
	{ 2274.914, -86.958, 25.487, "8,2"},
	{ 2275.914, -86.958, 25.487, "8,2"},
}

local offset = 0.01

function generateMap()
	for k, loc in pairs (locations) do
		local x, y, z = loc[1], loc[2], loc[3]
		local eX, eY = x+(offset/2), y+(offset/2)
		local dist = getDistanceBetweenPoints2D( x, y, eX, eY)
		local gridData = split( loc[4], ",")
		local columns = gridData[1]
		local height = gridData[2]
		createObject( 1448, x, y, z) -- Plank
		for index = 1, columns do
			for sIndex = 1, columns do
				for zIndex = 1, height do
					local object = createObject( 1212, (index/10)+x, (-sIndex/10)+y, (zIndex/15)+z, 0, 0, 12)
					--setElementStreamable( object, false)
					--createRadarArea( (index*offset)+x, (-sIndex*offset)-y, dist+(offset/3), dist+(offset/3), 25, 25, 25, 175)
					setElementDoubleSided( object, true)
					setElementFrozen( object, true)
					setObjectBreakable( object, false)
					table.insert( money, {object})
				end
			end
		end
	end
end

generateMap()

--[[
local monies = createObject( 1212, 2271.497, -86.958, 25.495, 0, 0, 12)
local col = createColCircle( 2271.497, -86.958, 25.495, 0.25)
attachElements( col, monies)
--]]

local mapObjects = {
	createObject(14602, 1537, -500.9004, 585.7, 0, 0, 0),
	createObject(14576, 1516.2, -520.9, 580.1, 0, 0, 90),
	createObject(1381, 1532.4, -514.4, 579.2, 0, 180, 0),
	createObject(971, 1534.2, -523.4, 583.9, 0, 0, 270),
	createObject(1569, 1530.9004, -516.0996, 580.3109, 0, 0, 270),
	createObject(6959, 1509.5, -508, 581.6, 0, 90, 90),
	createObject(2634, 1508.7, -520.9, 573.6, 0, 0, 270),
	createObject(14593, 1520.3203, -471, 582.66, 0, 0, 0),
	createObject(1569, 1551.3, -501.6, 580.3, 0, 0, 90),
	createObject(6959, 1529.5, -475.2002, 563, 0, 90, 179.995),
	createObject(1569, 1529.4, -479.9, 580.3, 0, 0, 269.995),
	createObject(1359, 1538.4, -497.1, 581, 0, 0, 0),
	createObject(2922, 1525.5, -475.9, 581.8, 0, 0, 270),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(7343, 1509.5, -508, 581.6, 0, 90, 90, true),
	createObject(7343, 1529.5, -475.2002, 563, 0, 90, 179.995, true),
}

-- LOD Object Association
-------------------------->>

local lowLOD = {{6,1}, {10,2}}

for _,data in ipairs(lowLOD) do
	setLowLODElement(mapObjects[data[1]], lodObjects[data[2]])
end

-- Element Double Sided
------------------------>>

local double_sided = {1, 2, 3, 5, 6, 7, 8, 9, 10, 11, 17}

for _,index in ipairs(double_sided) do
	--setElementDoubleSided( mapObjects[index], true)
end

-- Object Scale
---------------->>

local scale = {{5,1.025}, {11,1.025}, {12,0.75}}

for _,data in ipairs(scale) do
	setObjectScale(mapObjects[data[1]], data[2])
end

-- Set Interior/Dimension
-------------------------->>

for i,object in ipairs(mapObjects) do
	setElementInterior(object, INTERIOR)
	setElementDimension(object, DIMENSION)
end

for i,object in ipairs(lodObjects) do
	setElementInterior(object, INTERIOR)
	setElementDimension(object, DIMENSION)
end
