if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(7709, -2065.9048, 395.3944, 35.6622, 0, 0, 90),
	createObject(7709, -2074.2334, 395.4028, 35.6622, 0, 0, 90),
	createObject(7709, -2081.3872, 395.3849, 35.6622, 0, 0, 90),
	createObject(16095, -2055.1269, 455.583, 138.7422, 0, 0, 44.995),
	createObject(3934, -2066.6753, 484.3271, 138.7422, 0, 0, 0),
	createObject(3934, 990.0668, 1030.2091, 47.1328, 0, 0, 22),
	createObject(3934, -2042.3433, 443.7999, 138.7422, 0, 0, 90),
	createObject(3934, -2026.1732, 443.8658, 138.7422, 0, 0, 90),
	createObject(16095, 1032.4308, 1011.9962, 47.1328, 0, 0, 0),
	createObject(3934, -2066.543, 468.0508, 138.7422, 0, 0, 0),
	createObject(3934, 1006.6574, 1036.9321, 47.1328, 0, 0, 21.995),
	createObject(3934, 1017.5578, 1017.211, 47.1328, 0, 0, 34.245),
	createObject(3934, 1001.7347, 1006.0748, 47.1328, 0, 0, 34.244),
	createObject(3934, 993.6414, 1053.8232, 47.1328, 0, 0, 4.494),
	createObject(1616, 1030.4979, 1008.9486, 55.2071, 0, 0, 15),
	createObject(1616, -2056.2095, 472.9682, 41.4798, 0, 0, 180),
	createObject(1616, -2045.9471, 454.7595, 143.7844, 0, 0, 180),
	createObject(1616, -2056.9365, 464.2425, 143.7844, 0, 0, 0),
	createObject(7709, 996.1462, 1067.1012, 11.3106, 0, 0, 271),
	createObject(7709, 984.6245, 1066.8313, 11.3106, 0, 0, 271),
	createObject(1256, -2017.1, 465.1, 34.8, 0, 0, 0),
	createObject(1256, -2045.1999, 493.7, 34.8, 0, 0, 90),
	createObject(1281, -2033.8001, 475.9, 35, 0, 0, 0),
	createObject(1281, -2020, 491.5, 35, 0, 0, 0),
	createObject(1281, -2019.8001, 475.9, 35, 0, 0, 0),
	createObject(1281, -2034, 491.5, 35, 0, 0, 0),
	createObject(1280, -2030.3001, 483.6, 34.6, 0, 0, 0),
	createObject(1280, -2024.5, 483.6, 34.6, 0, 0, 180),
	createObject(640, -2019.3001, 454.7, 34.9, 0, 0, 90),
	createObject(640, -2033.6, 454.6, 34.9, 0, 0, 90),
	createObject(640, -2056.2, 476.9, 34.9, 0, 0, 0),
	createObject(640, -2056.2, 491.3, 34.9, 0, 0, 0),
	createObject(1432, -2020.4, 417.7, 34.2, 0, 0, 0),
	createObject(1432, -2027.6999, 423.7, 34.2, 0, 0, 0),
	createObject(1432, -2020, 430.5, 34.2, 0, 0, 0),
	createObject(638, -2035.1, 416.7, 34.9, 0, 0, 0),
	createObject(638, -2035.1, 431.6, 34.9, 0, 0, 0),
	createObject(1280, -2018, 404.5, 34.6, 0, 0, 0),
	createObject(1280, -2026.1999, 395.6, 34.6, 0, 0, 270),
	createObject(1280, -2035.1999, 404.8, 34.6, 0, 0, 180),
	createObject(3532, -2026.4, 404.2, 34.7, 0, 0, 0),
	createObject(3532, -2020.4, 399.3, 34.7, 0, 0, 0),
	createObject(3532, -2019.5, 410, 34.7, 0, 0, 0),
	createObject(3532, -2024.6999, 411.6, 34.7, 0, 0, 92),
	createObject(3532, -2032.6999, 407.8, 34.7, 0, 0, 118),
	createObject(3532, -2032, 398.2, 34.7, 0, 0, 67.999),
	createObject(717, -2047.1, 404, 34.2, 0, 0, 0),
	createObject(717, -2040.1999, 397.8, 34.2, 0, 0, 0),
	createObject(717, -2041.1999, 411.1, 34.2, 0, 0, 0),
	createObject(717, -2054.1001, 412.6, 34.2, 0, 0, 0),
	createObject(717, -2053.6001, 399.8, 34.2, 0, 0, 0),
	createObject(1364, -2106.6001, 492.2, 35, 0, 0, 0),
	createObject(1364, -2098.6001, 484.5, 35, 0, 0, 270),
	createObject(2395, -2059.8, 474.25, 38, 0, 90, 0),
	createObject(1360, -2114.6001, 477.7, 34.9, 0, 0, 0),
	createObject(949, -2115.1001, 492.7, 34.8, 0, 0, 0),
	createObject(949, -2098.3, 476, 34.8, 0, 0, 0),
	createObject(1281, -2085.8, 484.2, 35, 0, 0, 0),
	createObject(1281, -2091.3999, 491.1, 35, 0, 0, 0),
	createObject(1281, -2079.7, 478, 35, 0, 0, 0),
	createObject(1368, -2079, 492.6, 34.9, 0, 0, 0),
	createObject(2395, -2062.5, 474.25, 38, 0, 90, 0),
	createObject(1368, -2094.8999, 476.8, 34.9, 0, 0, 90),
	createObject(792, -2106.8, 465.6, 34.4, 0, 0, 0),
	createObject(987, -2056.8999, 375, 34.2, 0, 0, 90),
	createObject(792, -2114.5, 456.4, 34.4, 0, 0, 0),
	createObject(792, -2114.3, 472, 34.4, 0, 0, 0),
	createObject(1368, -2098.3, 470.8, 34.9, 0, 0, 270),
	createObject(987, -2107.3, 382.99, 34.2, 0, 0, 270),
	createObject(1368, -2098.3999, 458.4, 34.9, 0, 0, 269.995),
	createObject(987, -2107.2998, 394.8994, 34.2, 0, 0, 270),
}





-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[4], true)
setElementDoubleSided(mapObjects[21], true)
setElementDoubleSided(mapObjects[22], true)
setElementDoubleSided(mapObjects[23], true)
setElementDoubleSided(mapObjects[24], true)
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
setElementDoubleSided(mapObjects[36], true)
setElementDoubleSided(mapObjects[37], true)
setElementDoubleSided(mapObjects[38], true)
setElementDoubleSided(mapObjects[39], true)
setElementDoubleSided(mapObjects[40], true)
setElementDoubleSided(mapObjects[41], true)
setElementDoubleSided(mapObjects[42], true)
setElementDoubleSided(mapObjects[43], true)
setElementDoubleSided(mapObjects[44], true)
setElementDoubleSided(mapObjects[45], true)
setElementDoubleSided(mapObjects[46], true)
setElementDoubleSided(mapObjects[47], true)
setElementDoubleSided(mapObjects[48], true)
setElementDoubleSided(mapObjects[49], true)
setElementDoubleSided(mapObjects[50], true)
setElementDoubleSided(mapObjects[51], true)
setElementDoubleSided(mapObjects[52], true)
setElementDoubleSided(mapObjects[53], true)
setElementDoubleSided(mapObjects[55], true)
setElementDoubleSided(mapObjects[56], true)
setElementDoubleSided(mapObjects[57], true)
setElementDoubleSided(mapObjects[58], true)
setElementDoubleSided(mapObjects[59], true)
setElementDoubleSided(mapObjects[60], true)
setElementDoubleSided(mapObjects[61], true)
setElementDoubleSided(mapObjects[63], true)
setElementDoubleSided(mapObjects[64], true)
setElementDoubleSided(mapObjects[65], true)
setElementDoubleSided(mapObjects[66], true)
setElementDoubleSided(mapObjects[67], true)
setElementDoubleSided(mapObjects[68], true)
setElementDoubleSided(mapObjects[70], true)



