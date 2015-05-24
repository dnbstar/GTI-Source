if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(8240, 1892, -2212.5, 26, 0, 0, 179.995),
	createObject(9361, 1864.9, -2182.5, 18.3, 0, 0, 316),
	createObject(9362, 1863.2, -2182.2, 16.7, 0, 0, 179),
	createObject(628, 1868.7, -2185.2, 17.8, 0, 0, 0),
	createObject(640, 1876.2, -2201.9, 16.5, 0, 0, 180),
	createObject(628, 1861.2, -2185.3, 17.8, 0, 0, 0),
	createObject(3115, 1878.4, -2206.5, 13.4, 0, 0, 0),
	createObject(3934, 1883.7, -2209.8, 13.7, 0, 0, 90),
	createObject(3934, 1873.5, -2209.7, 13.7, 0, 0, 90),
	createObject(640, 1873.3, -2204.2, 16.5, 0, 0, 90),
	createObject(640, 1868.1, -2204.2, 16.5, 0, 0, 90),
	createObject(10757, 1892.1, -2246.8, 36, 0, 0, 0),
	createObject(1827, 1870.8, -2188.4, 15.8, 0, 0, 0),
	createObject(1827, 1859.2, -2188.7, 15.8, 0, 0, 0),
	createObject(8240, 1553.4, 1190, 23.4, 0, 0, 0),
	createObject(9361, 1573.4, 1178.6, 15.7, 0, 0, 314),
	createObject(9362, 1571.8, 1179, 14.1, 0, 0, 180),
	createObject(2011, 1569.3, 1176.4, 13.2, 0, 0, 0),
	createObject(2011, 1577.4, 1176.4, 13.23, 0, 0, 0),
	createObject(640, 1573.6, 1159.1, 13.9, 0, 0, 0),
	createObject(640, 1573.6, 1164.1, 13.9, 0, 0, 0),
	createObject(640, 1586.7, 1159.3, 13.9, 0, 0, 180),
	createObject(640, 1586.7, 1164.7, 13.9, 0, 0, 179.995),
	createObject(640, 1585.2, 1157.1, 13.9, 0, 0, 90),
	createObject(640, 1576.1999, 1157.1, 13.9, 0, 0, 90),
	createObject(1827, 1581.6, 1157.5, 13.2, 0, 0, 0),
	createObject(1827, 1579.8, 1157.5, 13.2, 0, 0, 0),
	createObject(3115, 1566.8, 1184.6, 10.7, 0, 0, 180),
	createObject(3934, 1572.7, 1188, 11, 0, 0, 90),
	createObject(3934, 1562.8, 1187.8, 11, 0, 0, 90),
	createObject(10757, 1553.6999, 1223.8001, 33.5, 0, 0, 180),
	createObject(8240, -1399.3001, -510.1, 26.8, 0, 0, 218),
	createObject(10757, -1378.8, -537.1, 36.4, 0, 0, 38),
	createObject(9361, -1437.4, -510.8, 19.1, 0, 0, 84),
	createObject(9362, -1436.4, -512.2, 17.5, 0, 0, 308),
	createObject(632, -1432.2, -512.5, 17, 0, 0, 0),
	createObject(632, -1437.3, -506.2, 17, 0, 0, 0),
	createObject(640, -1434.2, -498.4, 17.3, 0, 0, 38),
	createObject(640, -1431.3, -502.1, 17.3, 0, 0, 37.996),
	createObject(640, -1418.5, -511.1, 17.3, 0, 0, 37.996),
	createObject(640, -1418.6, -514.7, 17.3, 0, 0, 308),
	createObject(640, -1422.5, -517.7, 17.3, 0, 0, 307.996),
	createObject(1827, -1435, -518, 16.6, 0, 0, 0),
	createObject(1827, -1433.6, -514.6, 16.6, 0, 0, 0),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(8241, 1892, -2212.5, 26, 0, 0, 179.995, true),
	createObject(8241, 1553.4, 1190, 23.4, 0, 0, 0, true),
	createObject(8241, -1399.3001, -510.1, 26.8, 0, 0, 218, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[1], lodObjects[1])
setLowLODElement(mapObjects[15], lodObjects[2])
setLowLODElement(mapObjects[32], lodObjects[3])





-- Remove World Objects
------------------------>>

removeWorldModel(5006, 65.3565, 1874.211, -2286.531, 17.9297)
removeWorldModel(5011, 65.3565, 1874.211, -2286.531, 17.9297)
removeWorldModel(1290, 8.8853, 1899.427, -2244.813, 16.7869)
removeWorldModel(1290, 8.8853, 1899.673, -2328.422, 18.589)
removeWorldModel(3629, 49.4096, 1921.641, -2206.391, 18.8828)
removeWorldModel(3672, 49.4096, 1921.641, -2206.391, 18.8828)
removeWorldModel(3625, 13.0333, 1961.445, -2216.172, 14.9844)
removeWorldModel(3769, 13.0333, 1961.445, -2216.172, 14.9844)
removeWorldModel(3664, 17.0016, 1960.695, -2236.43, 19.2813)
removeWorldModel(3663, 6.1883, 1882.266, -2395.781, 14.4688)
removeWorldModel(3663, 6.1883, 1832.453, -2388.437, 14.4688)
removeWorldModel(8240, 78.5759, 1586.258, 1189.594, 23.4453)
removeWorldModel(8241, 78.5759, 1586.258, 1189.594, 23.4453)
removeWorldModel(8378, 37.1322, 1574.453, 1223.379, 24.2121)
removeWorldModel(8379, 37.1322, 1574.453, 1223.379, 24.2121)
removeWorldModel(3816, 64.8253, -1362.984, -491.4922, 21.6953)
removeWorldModel(3817, 64.8253, -1362.984, -491.4922, 21.6953)
removeWorldModel(3816, 64.8253, -1438.414, -529.6328, 21.6953)
removeWorldModel(3817, 64.8253, -1438.414, -529.6328, 21.6953)