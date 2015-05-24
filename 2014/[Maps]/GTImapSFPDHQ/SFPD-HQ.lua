if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(1533, 214.7, 127.07, 1002.2, 0, 0, 0),
	createObject(2001, 217.1, 126.5, 1002.2, 0, 0, 0),
	createObject(2001, 214, 126.6, 1002.2, 0, 0, 0),
	createObject(1537, 239.3, 114.2, 1009.2, 0, 0, 270),
}





-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[1], true)
setElementDoubleSided(mapObjects[2], true)
setElementDoubleSided(mapObjects[3], true)
setElementDoubleSided(mapObjects[4], true)



