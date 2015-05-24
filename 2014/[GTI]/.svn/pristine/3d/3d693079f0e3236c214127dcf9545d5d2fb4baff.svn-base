--if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local INTERIOR = 0
local DIMENSION = 0

local mapObjects = {
	createObject(6959, -2352.5, -82.8, 34.1, 0, 0, 0),
	createObject(6959, -2352.5, -122.8, 34.1, 0, 0, 0),
	createObject(6959, -2311.9, -82.2, 34.1, 0, 0, 270),
	createObject(6959, -2311.2, -122.8, 34.1, 0, 0, 0),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(7343, -2352.5, -82.8, 34.1, 0, 0, 0, true),
	createObject(7343, -2352.5, -122.8, 34.1, 0, 0, 0, true),
	createObject(7343, -2311.9, -82.2, 34.1, 0, 0, 270, true),
	createObject(7343, -2311.2, -122.8, 34.1, 0, 0, 0, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[1], lodObjects[1])
setLowLODElement(mapObjects[2], lodObjects[2])
setLowLODElement(mapObjects[3], lodObjects[3])
setLowLODElement(mapObjects[4], lodObjects[4])





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

-- Remove World Objects
------------------------>>

removeWorldModel(10394, 34.132, -2336.93, -105.2891, 37)
removeWorldModel(10553, 34.132, -2336.93, -105.2891, 37)
