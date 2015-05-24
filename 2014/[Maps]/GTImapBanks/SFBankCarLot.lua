if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(10779, -2074.4, 486.9, -19.2, 0, 0, 0),
	createObject(9254, -2090.3, 531.7, -22.2, 90, 0.5, 359.75),
	createObject(9254, -2045, 451.4, -21, 90, 90, 0),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(9364, -2090.3, 531.7, -22.2, 90, 0.5, 359.75, true),
	createObject(9364, -2045, 451.4, -21, 90, 90, 0, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[2], lodObjects[1])
setLowLODElement(mapObjects[3], lodObjects[2])

-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[1], true)
setElementDoubleSided(mapObjects[2], true)
setElementDoubleSided(mapObjects[3], true)



