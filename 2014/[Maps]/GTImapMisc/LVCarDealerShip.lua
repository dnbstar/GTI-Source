if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(11317, 2175.8, 1415.1, 20.81, 0, 0, 0),
	createObject(3851, 2157.1001, 1437.1, 11.999, 0, 0, 0),
	createObject(3851, 2182.4, 1393.1, 17.6, 0, 0, 0),
	createObject(3851, 2157.101, 1406.2, 17.6, 0, 0, 0),
	createObject(3851, 2157.101, 1419.4, 11.999, 0, 0, 0),
	createObject(3851, 2157.101, 1437.1, 17.6, 0, 0, 0),
	createObject(3851, 2157.102, 1419.3, 17.6, 0, 0, 0),
	createObject(3850, 2163.5, 1413.7, 16.1, 0, 0, 0),
	createObject(7191, 2182, 1408.5, 13.5, 0, 180.005, 0),
	createObject(7191, 2179.5, 1397.2, 15.47, 0, 270, 90),
	createObject(7191, 2179.4, 1393.3, 15.47, 0, 270, 90),
	createObject(7191, 2179.5, 1406.1, 15.47, 0, 270, 90),
	createObject(7191, 2179.4, 1387.55, 15.47, 0, 270, 90),
	createObject(7191, 2179.4, 1385.6, 13.6, 0, 180, 89.995),
	createObject(7191, 2179.4, 1389.4, 15.47, 0, 270, 90),
	createObject(7191, 2182, 1408.5, 11.7, 0, 180, 0),
	createObject(7191, 2179.4, 1385.6, 11.7, 0, 180, 89.995),
	createObject(7191, 2179.5, 1410, 15.47, 0, 270, 90),
	createObject(7191, 2179.5, 1403, 15.47, 0, 270, 90),
	createObject(7191, 2179.5, 1400, 15.47, 0, 270, 90),
	createObject(7520, 2201.5, 1419, 9.4, 0, 0, 90),
	createObject(3851, 2157.102, 1393.05, 17.6, 0, 0, 0),
	createObject(3851, 2175.8, 1386.2, 17.6, 0, 0, 90),
	createObject(3851, 2182.4, 1406.2, 17.6, 0, 0, 0),
	createObject(11327, 2155.9, 1406.3, 13.8, 0, 85, 0),
	createObject(2395, 2160.59, 1412.03, 15.085, 0, 90, 180),
	createObject(2395, 2163.33, 1412.03, 15.085, 0, 90, 179.995),
	createObject(2395, 2160.59, 1412.03, 11.4, 0, 90, 179.995),
	createObject(2395, 2175.44, 1412.03, 15.085, 0, 90, 179.995),
	createObject(1649, 2165, 1411.987, 11.9, 0, 90, 0),
	createObject(1649, 2168.299, 1411.987, 11.9, 0, 90, 0),
	createObject(2395, 2163.33, 1412.03, 11.4, 0, 90, 179.995),
	createObject(2395, 2172.7, 1412.03, 15.085, 0, 90, 179.995),
	createObject(2395, 2172.7, 1412.03, 11.4, 0, 90, 179.995),
	createObject(2395, 2175.44, 1412.03, 11.4, 0, 90, 179.995),
	createObject(14796, 2168, 1393, 13.6, 0, 0, 0),
	createObject(14826, 2179.3, 1407, 10.7, 0, 0, 90),
	createObject(14686, 2169.6001, 1398.3001, 10.4, 0, 0, 0),
	createObject(3761, 2162.8, 1387.78, 12, 0, 0, 270),
	createObject(8651, 2158, 1405, 8.8, 3, 0, 270),
	createObject(8651, 2158, 1407.1, 8.8, 2.999, 0, 270),
	createObject(3850, 2158.4, 1411.9, 16.1, 0, 0, 90),
	createObject(3850, 2161.8, 1411.9, 16.1, 0, 0, 90),
	createObject(3850, 2163.5, 1417.1, 16.1, 0, 0, 0),
	createObject(3850, 2163.5, 1420.55, 16.1, 0, 0, 0),
	createObject(3850, 2163.5, 1424, 16.1, 0, 0, 0),
	createObject(3850, 2163.5, 1427.5, 16.1, 0, 0, 0),
	createObject(3850, 2163.5, 1431, 16.1, 0, 0, 0),
	createObject(3850, 2163.5, 1434.55, 16.1, 0, 0, 0),
	createObject(3850, 2163.5, 1438, 16.1, 0, 0, 0),
	createObject(3850, 2163.5, 1441.5, 16.1, 0, 0, 0),
	createObject(3850, 2169.5, 1413.5, 16.1, 0, 0, 0),
	createObject(3850, 2169.5, 1416.95, 16.1, 0, 0, 0),
	createObject(3850, 2169.5, 1420.4, 16.1, 0, 0, 0),
	createObject(3850, 2171.22, 1422.2, 16.1, 0, 0, 270),
	createObject(2164, 2171.6, 1442.8, 10, 0, 0, 0),
	createObject(2184, 2170.5, 1437.8, 10, 0, 0, 340),
	createObject(2184, 2159.1, 1437.7, 10, 0, 0, 357.999),
	createObject(2184, 2164.2, 1437.7, 10, 0, 0, 357.995),
	createObject(2164, 2164.8, 1442.8, 10, 0, 0, 0),
	createObject(2164, 2171.6011, 1442.8001, 10, 0, 0, 0),
	createObject(2164, 2159.9, 1442.8, 10, 0, 0, 0),
	createObject(1671, 2165.6, 1439, 10.5, 0, 0, 0),
	createObject(1671, 2160.2, 1439, 10.5, 0, 0, 0),
	createObject(1671, 2171.7, 1438.8, 10.5, 0, 0, 0),
	createObject(2190, 2171.9, 1437.5, 10.8, 0, 0, 180),
	createObject(2190, 2165.7, 1437.9, 10.8, 0, 0, 193.995),
	createObject(2190, 2160.7, 1437.8, 10.8, 0, 0, 193.995),
	createObject(7191, 2197.6, 1427.85, 0, 90, 193.263, 166.737),
	createObject(7191, 2197.601, 1431.8, 0, 90, 167.081, 192.914),
	createObject(5020, 2184.7, 1444.6, 11.5, 0, 0, 90),
	createObject(7191, 2200.8, 1408, 13.5, 0, 180, 180),
	createObject(11327, 2200.9, 1397.3, 12.4, 0, 0, 180),
	createObject(7191, 2200.8, 1408, 11.8, 0, 179.995, 179.995),
	createObject(2959, 2200.9, 1388.7, 9.8, 0, 0, 0),
	createObject(11327, 2155.9, 1393.1, 13.8, 0, 84.996, 0),
	createObject(6965, 2214.5, 1483.4, 14.4, 0, 0, 0),
	createObject(6964, 2214.793, 1491.262, 7.9519, 0, 0, 0),
	createObject(3499, 2156.5, 1444.2, 15.3, 0, 0, 0),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(7195, 2182, 1408.5, 13.5, 0, 180.005, 0, true),
	createObject(7195, 2179.5, 1397.2, 15.47, 0, 270, 90, true),
	createObject(7195, 2179.4, 1393.3, 15.47, 0, 270, 90, true),
	createObject(7195, 2179.5, 1406.1, 15.47, 0, 270, 90, true),
	createObject(7195, 2179.4, 1387.55, 15.47, 0, 270, 90, true),
	createObject(7195, 2179.4, 1385.6, 13.6, 0, 180, 89.995, true),
	createObject(7195, 2179.4, 1389.4, 15.47, 0, 270, 90, true),
	createObject(7195, 2182, 1408.5, 11.7, 0, 180, 0, true),
	createObject(7195, 2179.4, 1385.6, 11.7, 0, 180, 89.995, true),
	createObject(7195, 2179.5, 1410, 15.47, 0, 270, 90, true),
	createObject(7195, 2179.5, 1403, 15.47, 0, 270, 90, true),
	createObject(7195, 2179.5, 1400, 15.47, 0, 270, 90, true),
	createObject(7195, 2197.6, 1427.85, 0, 90, 193.263, 166.737, true),
	createObject(7195, 2197.601, 1431.8, 0, 90, 167.081, 192.914, true),
	createObject(7195, 2200.8, 1408, 13.5, 0, 180, 180, true),
	createObject(7195, 2200.8, 1408, 11.8, 0, 179.995, 179.995, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[9], lodObjects[1])
setLowLODElement(mapObjects[10], lodObjects[2])
setLowLODElement(mapObjects[11], lodObjects[3])
setLowLODElement(mapObjects[12], lodObjects[4])
setLowLODElement(mapObjects[13], lodObjects[5])
setLowLODElement(mapObjects[14], lodObjects[6])
setLowLODElement(mapObjects[15], lodObjects[7])
setLowLODElement(mapObjects[16], lodObjects[8])
setLowLODElement(mapObjects[17], lodObjects[9])
setLowLODElement(mapObjects[18], lodObjects[10])
setLowLODElement(mapObjects[19], lodObjects[11])
setLowLODElement(mapObjects[20], lodObjects[12])
setLowLODElement(mapObjects[69], lodObjects[13])
setLowLODElement(mapObjects[70], lodObjects[14])
setLowLODElement(mapObjects[72], lodObjects[15])
setLowLODElement(mapObjects[74], lodObjects[16])

-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[1], true)
setElementDoubleSided(mapObjects[9], true)
setElementDoubleSided(mapObjects[10], true)
setElementDoubleSided(mapObjects[11], true)
setElementDoubleSided(mapObjects[12], true)
setElementDoubleSided(mapObjects[13], true)
setElementDoubleSided(mapObjects[14], true)
setElementDoubleSided(mapObjects[15], true)
setElementDoubleSided(mapObjects[16], true)
setElementDoubleSided(mapObjects[17], true)
setElementDoubleSided(mapObjects[18], true)
setElementDoubleSided(mapObjects[19], true)
setElementDoubleSided(mapObjects[20], true)
setElementDoubleSided(mapObjects[25], true)
setElementDoubleSided(mapObjects[26], true)
setElementDoubleSided(mapObjects[27], true)
setElementDoubleSided(mapObjects[28], true)
setElementDoubleSided(mapObjects[29], true)
setElementDoubleSided(mapObjects[30], true)
setElementDoubleSided(mapObjects[31], true)
setElementDoubleSided(mapObjects[32], true)
setElementDoubleSided(mapObjects[33], true)
setElementDoubleSided(mapObjects[34], true)
setElementDoubleSided(mapObjects[35], true)
setElementDoubleSided(mapObjects[37], true)
setElementDoubleSided(mapObjects[40], true)
setElementDoubleSided(mapObjects[41], true)
setElementDoubleSided(mapObjects[56], true)
setElementDoubleSided(mapObjects[60], true)
setElementDoubleSided(mapObjects[61], true)
setElementDoubleSided(mapObjects[62], true)
setElementDoubleSided(mapObjects[69], true)
setElementDoubleSided(mapObjects[70], true)
setElementDoubleSided(mapObjects[72], true)
setElementDoubleSided(mapObjects[73], true)
setElementDoubleSided(mapObjects[74], true)
setElementDoubleSided(mapObjects[76], true)

-- Object Scale
---------------->>

setObjectScale(mapObjects[25], 1.118419)
setObjectScale(mapObjects[73], 1.118419)
setObjectScale(mapObjects[76], 1.118419)

-- Remove World Objects
------------------------>>

removeWorldModel(8839, 97.2334, 2162.477, 1403.438, 14.6563)
removeWorldModel(8931, 97.2334, 2162.477, 1403.438, 14.6563)
removeWorldModel(718, 9.711, 2171.867, 1424.641, 9.7656)
removeWorldModel(718, 9.711, 2181.922, 1443.234, 9.75)
removeWorldModel(8842, 64.1799, 2217.75, 1477.664, 31.6797)
removeWorldModel(8930, 64.1799, 2217.75, 1477.664, 31.6797)