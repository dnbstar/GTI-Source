if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(2935, 1712.15, 907.9, 12.94, 0, 0, 0),
	createObject(2935, 1715.199, 907.8994, 12.94, 0, 0, 0),
	createObject(2935, 1712.1494, 901, 12.94, 0, 0, 0),
	createObject(2935, 1715.1992, 901, 12.94, 0, 0, 0),
	createObject(2935, 1712.15, 895, 12.94, 0, 0, 0),
	createObject(2935, 1715.1992, 895, 12.94, 0, 0, 0),
	createObject(2765, -2240.2998, 79.3994, 37.5, 0, 0, 135),
	createObject(2395, 1277.5977, 2531.1992, 20, 0, 179.995, 90),
	createObject(2395, 1276, 2525.5, 18.5, 0, 90, 53.998),
	createObject(2395, 1277.3994, 2531.8, 17.7, 0, 90, 125.997),
	createObject(2395, 1277.598, 2531.199, 17.4, 0, 179.995, 90),
	createObject(8650, 1078.3001, 1386.5, 5.9, 0, 0, 0),
	createObject(8650, 850.6, -1043.6, 29, 0, 0, 304),
	createObject(8650, 1823.65, 2063.2, 7.3, 0, 0, 0),
	createObject(8650, 1771.6, 2163.2, 7.5, 0, 0, 0),
	createObject(8650, 1737.5, 2122.7, 12.4, 0, 0, 90),
	createObject(17946, 2533.7002, -1290.6025, 36.95, 0, 0, 359.747),
	createObject(6959, 2397.8994, 2164.1992, -2.3, 90, 179.995, 179.995),
	createObject(6959, 2438.5, 2164.2, -2.3, 90, 180.005, 179.984),
	createObject(16317, 1553.6999, 889.3, 8.1, 0, 0, 10),
	createObject(2987, -1406, 1.2, 6, 0, 0, 0),
	createObject(2885, 145.1, -200.6, 3.8, 90, 0, 316),
	createObject(1498, 2401.7, -1714.6, 12.9, 0, 0, 0),
	createObject(2885, -2397.8999, 2408, 18.8, 0, 0, 64),
	createObject(6959, 2479.8, 2164.2, -2.3, 90, 179.995, 179.995),
	createObject(6959, 2493.5, 2164.2, -2.3, 90, 180.005, 179.984),
	createObject(17026, -2304.8999, -883.8, 1, 0, 0, 220),
	createObject(901, -2314, -879.6, 18, 0, 0, 16),
	createObject(901, -2313.8, -888.3, 13.8, 0, 0, 15.996),
	createObject(901, -2311.8, -895.8, 8.5, 0, 0, 15.996),
	createObject(2774, 1865.9, 2233.3999, 2.7, 0, 0, 0),
	createObject(901, -2320, -875.8, 25, 50, 0, 347.996),
	createObject(2774, 1866.1, 2233.3999, 2.7, 0, 0, 0),
	createObject(901, -2313.5, -877.2, 25.3, 49.999, 0, 347.992),
	createObject(2774, 1886.1, 2233.3999, 2.7, 0, 0, 0),
	createObject(2774, 1885.9, 2233.3999, 2.7, 0, 0, 0),
	createObject(901, -2326, -871.3, 24, 49.999, 0, 319.992),
	createObject(2774, 1907.6, 2211.8, 2.7, 0, 0, 0),
	createObject(2774, 1907.6, 2212, 2.7, 0, 0, 0),
	createObject(2774, 1886.1, 2190.3, 2.7, 0, 0, 0),
	createObject(2774, 1885.9, 2190.3, 2.7, 0, 0, 0),
	createObject(2774, 1866.1, 2190.3, 2.7, 0, 0, 0),
	createObject(2774, 1865.9, 2190.3, 2.7, 0, 0, 0),
	createObject(2774, 1844.5, 2211.8, 2.7, 0, 0, 0),
	createObject(2774, 1844.5, 2212, 2.7, 0, 0, 0),
	createObject(1649, -1593.1999, 642.8, 37.8, 0, 0, 46),
	createObject(3037, 2507, 1144.8001, 18.8, 0, 0, 90),
	createObject(3062, 2503.8, 1144.8001, 19.1, 0, 0, 0),
	createObject(3037, 2510.5, 1144.8001, 18.8, 0, 0, 90),
	createObject(3037, 2515.7, 1149.5, 18.8, 0, 0, 0),
	createObject(1649, -1590.3001, 645.9, 38.1, 0, 0, 46.494),
	createObject(1649, -1587.3001, 649, 38.1, 0, 0, 46.244),
	createObject(3055, 2167.3, 1289.8001, 9.8, 0, 0, 268),
	createObject(1649, -1585.1, 651.4, 38.1, 0, 0, 46.741),
	createObject(3055, 2171, 1290.8001, 13.8, 90, 90, 267.995),
	createObject(3037, -1564, 674.2, 39.5, 0, 0, 316.5),
	createObject(3037, -1571.3001, 666.8, 40.2, 0, 0, 316.5),
	createObject(2957, 807, -1031.3001, 27.4, 0, 0, 32.75),
	createObject(3037, -1577.1, 659.7, 39.9, 0, 0, 316.5),
	createObject(3037, -1583.1, 653.5, 39.6, 0, 0, 316.5),
	createObject(3037, -1588.1999, 648.5, 39.4, 0, 0, 316.5),
	createObject(3037, -1594.5, 642.1, 39.1, 0, 0, 316.5),
	createObject(3037, -1600, 636.6, 38.9, 0, 0, 316.5),
	createObject(3037, -1604.1999, 632.6, 38.7, 0, 0, 316.5),
	createObject(3037, -1609.1, 626.8, 38.4, 0, 0, 316.5),
	createObject(3037, -1612.6, 622.3, 37.2, 0, 0, 316.5),
	createObject(3037, -1618, 617.2, 38, 0, 0, 316.5),
	createObject(3037, -1623.5, 611.8, 37.7, 0, 0, 316.5),
	createObject(2957, 812.5, -1028.6999, 27.5, 0, 0, 23.745),
	createObject(3037, -1629.1999, 606.2, 37.4, 0, 0, 316.5),
	createObject(3037, -1635.8001, 599.3, 37.1, 0, 0, 316.5),
	createObject(3037, -1640.6999, 593.7, 36.8, 0, 0, 316.5),
	createObject(2957, 817.4, -1026.1999, 27.5, 0, 0, 25.491),
	createObject(2957, 824, -1023, 27.8, 0, 0, 23.738),
	createObject(3037, 1038.5, -1382.8001, 17.3, 0, 90, 90),
	createObject(5020, 2862.1001, -1408, 16.3, 0, 90, 270),
	createObject(5020, 2862.3, -1405.4, 16.3, 0, 90, 270),
	createObject(5020, 2861.8, -1404.3001, 16.3, 0, 90, 270),
	createObject(5020, 935, -1384.3001, 18.5, 0, 90, 270),
	createObject(5020, 937.2, -1384.4, 18.5, 0, 90, 270),
	createObject(5020, 935, -1386.1, 17.2, 0, 0, 90),
	createObject(5020, 937.2, -1386, 17.2, 0, 0, 90),
	createObject(17951, 1934.7, -1555.6, 14.4, 0, 0, 44.75),
	createObject(17951, 1939.1, -1559.9, 14.4, 0, 0, 44.747),
	createObject(17951, 1940.2, -1560.9, 14.4, 0, 0, 44.747),
	createObject(17951, 1951.5, -1558.5, 14.9, 0, 0, 44.747),
	createObject(17951, 1953.5, -1560.5, 14.9, 0, 0, 44.747),
	createObject(2934, -2587.4, 960.6, 86.6, 0, 0, 0),
	createObject(2934, -2587.4, 956.1, 86.6, 0, 0, 90),
	createObject(2934, -2587.4, 964.8, 86.6, 0, 0, 90),
	createObject(2934, -2589.7, 960.7, 86.6, 0, 0, 0),
	createObject(2934, -2584.7, 960.4, 86.6, 0, 0, 0),
	createObject(2934, -2587, 949.9, 81.5, 0, 0, 0),
	createObject(2934, -2589.2, 949.9, 81.5, 0, 0, 0),
	createObject(2934, -2584.7, 950.3, 81.5, 0, 0, 0),
	createObject(2934, -2584.3, 942.3, 77.5, 0, 0, 0),
	createObject(2934, -2586.8, 942.4, 77.5, 0, 0, 0),
	createObject(2934, -2589.6, 942.6, 77.5, 0, 0, 0),
	createObject(2934, -2587.3, 934.2, 75.5, 0, 0, 0),
	createObject(2934, -2590, 934.4, 75.5, 0, 0, 0),
	createObject(2934, -2584.5, 934.1, 75.5, 0, 0, 0),
	createObject(2934, -2587.1, 925.7, 72.1, 0, 0, 0),
	createObject(2934, -2583.6, 925.8, 72.1, 0, 0, 0),
	createObject(2934, -2589.9, 926.4, 72.1, 0, 0, 0),
	createObject(2934, -2580.1, 923.9, 72.6, 0, 0, 90),
	createObject(2934, -2580, 921.4, 72.6, 0, 0, 90),
	createObject(2934, -2580.1, 925.9, 72.6, 0, 0, 90),
	createObject(2934, -2553.9, 924.2, 72, 0, 0, 90),
	createObject(2934, -2553.8, 921, 72, 0, 0, 90),
	createObject(2934, -2543.6, 931.6, 72.7, 0, 0, 0),
	createObject(2934, -2540.3, 931.6, 72.7, 0, 0, 0),
	createObject(2934, -2548.6, 940.6, 72.5, 0, 0, 0),
	createObject(2934, -2545.8, 940.5, 72.5, 0, 0, 0),
	createObject(2934, -2544.3, 940.6, 72.5, 0, 0, 0),
	createObject(2934, -2550.3, 949.3, 72.9, 0, 0, 0),
	createObject(2934, -2546.8, 949.2, 72.9, 0, 0, 0),
	createObject(2934, -2543, 949.6, 72.9, 0, 0, 0),
	createObject(2934, -2546.5, 956.7, 78.1, 0, 0, 0),
	createObject(2934, -2549.7, 956.8, 78.1, 0, 0, 0),
	createObject(2934, -2543.5, 956.7, 78.1, 0, 0, 0),
	createObject(2934, -2549.3, 964.8, 82.9, 0, 0, 0),
	createObject(2934, -2546.1, 964.9, 82.9, 0, 0, 0),
	createObject(2934, -2543.3, 965, 82.9, 0, 0, 0),
	createObject(2934, -2547.3, 970, 82.9, 0, 0, 90),
	createObject(2934, -2545.3, 970.1, 82.9, 0, 0, 90),
	createObject(2934, -2547.3, 972.8, 82.9, 0, 0, 90),
	createObject(2934, -2545.3, 972.5, 82.9, 0, 0, 90),
	createObject(2934, -2547.6, 977.6, 85.5, 0, 0, 0),
	createObject(2934, -2544.8, 977.6, 85.5, 0, 0, 0),
	createObject(2934, -2542.5, 977.6, 85.5, 0, 0, 0),
	createObject(2934, -2554.1, 989, 85.3, 0, 0, 0),
	createObject(2934, -2556.6, 989.1, 85.3, 0, 0, 0),
	createObject(2934, -2581.3, 988.8, 85.9, 0, 0, 0),
	createObject(2934, -2584.1, 988.6, 85.9, 0, 0, 0),
	createObject(2934, -2591.5, 977.9, 85.5, 0, 0, 0),
	createObject(2934, -2594.5, 977.6, 85.5, 0, 0, 0),
	createObject(2934, -2596.2, 977.7, 85.5, 0, 0, 0),
	createObject(2934, 244, 1828.5, 18.1, 0, 0, 90),
	createObject(2934, 234.5, 1828.5, 18.1, 0, 0, 90),
	createObject(2934, 226, 1828.5, 18.1, 0, 0, 90),
	createObject(2934, 216.7, 1828.5, 18.1, 0, 0, 90),
	createObject(2934, 201.7, 1828.5, 18.1, 0, 0, 90),
	createObject(2934, 192.9, 1828.5, 18.1, 0, 0, 90),
	createObject(2934, 183.6, 1828.5, 18.1, 0, 0, 90),
	createObject(2934, 174.6, 1828.5, 18.1, 0, 0, 90),
	createObject(3577, -2455.9, 764.1, 44, 0, 270, 0),
	createObject(3577, -2455.9, 764.1, 45, 0, 269.995, 0),
	createObject(11012, -2166.8, -236.5, 40.9, 0, 0, 0),
	createObject(17951, 1029.4, -1176.4, 26.3, 0, 0, 0),
	createObject(900, 474.7, 798, -19, 0, 90, 0),
	createObject(2765, -1467.9, 505.2, 9, 0, 0, 90),
	createObject(2765, -1467.9, 507.1, 9, 0, 0, 90),
	createObject(2765, -1467.8, 503, 9, 0, 0, 90),
	createObject(2765, -1467.8, 499.2, 9, 0, 0, 90),
	createObject(2765, -1467.8, 496.1, 9, 0, 0, 90),
	createObject(2765, -1467.8, 492.8, 9, 0, 0, 90),
	createObject(2765, -1651, 538.4, 38.71, 0, 90, 318),
	createObject(2765, -1869.1, -156.7, 17.1, 90, 16.779, 73.221),
	createObject(2765, -1869.3, -159.5, 17.1, 90, 16.776, 73.218),
	createObject(10974, -2200.5, 251.91, 53.2, 0, 0, 0),
	createObject(17951, 2862.3, -1445.3, 15.1, 0, 90, 0),
	createObject(17951, 2862.3, -1439.2, 15.1, 0, 90, 0),
	createObject(17951, 2862.3, -1433.1, 15.1, 0, 90, 0),
	createObject(17951, 2858.8, -1433.1, 15.1, 0, 90, 0),
	createObject(17951, 2858.8, -1439.2, 15.1, 0, 90, 0),
	createObject(1569, -2550.8, 195.5, 5.15, 0, 0, 285.5),
	createObject(1569, -2550, 192.6, 5.15, 0, 0, 105.496),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(7343, 2397.8994, 2164.1992, -2.3, 90, 179.995, 179.995, true),
	createObject(7343, 2438.5, 2164.2, -2.3, 90, 180.005, 179.984, true),
	createObject(7343, 2479.8, 2164.2, -2.3, 90, 179.995, 179.995, true),
	createObject(7343, 2493.5, 2164.2, -2.3, 90, 180.005, 179.984, true),
	createObject(11270, -2166.8, -236.5, 40.9, 0, 0, 0, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[18], lodObjects[1])
setLowLODElement(mapObjects[19], lodObjects[2])
setLowLODElement(mapObjects[25], lodObjects[3])
setLowLODElement(mapObjects[26], lodObjects[4])
setLowLODElement(mapObjects[148], lodObjects[5])

-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[8], true)
setElementDoubleSided(mapObjects[9], true)
setElementDoubleSided(mapObjects[10], true)
setElementDoubleSided(mapObjects[11], true)
setElementDoubleSided(mapObjects[17], true)
setElementDoubleSided(mapObjects[18], true)
setElementDoubleSided(mapObjects[19], true)
setElementDoubleSided(mapObjects[22], true)
setElementDoubleSided(mapObjects[24], true)
setElementDoubleSided(mapObjects[25], true)
setElementDoubleSided(mapObjects[26], true)
setElementDoubleSided(mapObjects[47], true)
setElementDoubleSided(mapObjects[49], true)
setElementDoubleSided(mapObjects[50], true)
setElementDoubleSided(mapObjects[53], true)
setElementDoubleSided(mapObjects[55], true)
setElementDoubleSided(mapObjects[58], true)
setElementDoubleSided(mapObjects[69], true)
setElementDoubleSided(mapObjects[73], true)
setElementDoubleSided(mapObjects[74], true)
setElementDoubleSided(mapObjects[75], true)
setElementDoubleSided(mapObjects[83], true)
setElementDoubleSided(mapObjects[84], true)
setElementDoubleSided(mapObjects[85], true)
setElementDoubleSided(mapObjects[86], true)
setElementDoubleSided(mapObjects[87], true)
setElementDoubleSided(mapObjects[146], true)
setElementDoubleSided(mapObjects[147], true)
setElementDoubleSided(mapObjects[148], true)
setElementDoubleSided(mapObjects[160], true)
setElementDoubleSided(mapObjects[161], true)
setElementDoubleSided(mapObjects[162], true)
setElementDoubleSided(mapObjects[163], true)
setElementDoubleSided(mapObjects[164], true)
setElementDoubleSided(mapObjects[165], true)
setElementDoubleSided(mapObjects[166], true)
setElementDoubleSided(mapObjects[167], true)

-- Object Scale
---------------->>

setObjectScale(mapObjects[21], 0)
setObjectScale(mapObjects[22], 0)
setObjectScale(mapObjects[23], 1.1000000238419)
setObjectScale(mapObjects[24], 0)
setObjectScale(mapObjects[53], 0)
setObjectScale(mapObjects[54], 0)
setObjectScale(mapObjects[55], 0)
setObjectScale(mapObjects[56], 0)
setObjectScale(mapObjects[57], 0)
setObjectScale(mapObjects[59], 0)
setObjectScale(mapObjects[60], 0)
setObjectScale(mapObjects[61], 0)
setObjectScale(mapObjects[62], 0)
setObjectScale(mapObjects[63], 0)
setObjectScale(mapObjects[64], 0)
setObjectScale(mapObjects[65], 0)
setObjectScale(mapObjects[66], 0)
setObjectScale(mapObjects[67], 0)
setObjectScale(mapObjects[68], 0)
setObjectScale(mapObjects[70], 0)
setObjectScale(mapObjects[71], 0)
setObjectScale(mapObjects[72], 0)
setObjectScale(mapObjects[75], 0)
setObjectScale(mapObjects[81], 0)
setObjectScale(mapObjects[82], 0)
setObjectScale(mapObjects[89], 0)
setObjectScale(mapObjects[90], 0)
setObjectScale(mapObjects[91], 0)
setObjectScale(mapObjects[92], 0)
setObjectScale(mapObjects[93], 0)
setObjectScale(mapObjects[94], 0)
setObjectScale(mapObjects[95], 0)
setObjectScale(mapObjects[96], 0)
setObjectScale(mapObjects[97], 0)
setObjectScale(mapObjects[98], 0)
setObjectScale(mapObjects[99], 0)
setObjectScale(mapObjects[100], 0)
setObjectScale(mapObjects[101], 0)
setObjectScale(mapObjects[102], 0)
setObjectScale(mapObjects[103], 0)
setObjectScale(mapObjects[104], 0)
setObjectScale(mapObjects[105], 0)
setObjectScale(mapObjects[106], 0)
setObjectScale(mapObjects[107], 0)
setObjectScale(mapObjects[108], 0)
setObjectScale(mapObjects[109], 0)
setObjectScale(mapObjects[110], 0)
setObjectScale(mapObjects[111], 0)
setObjectScale(mapObjects[112], 0)
setObjectScale(mapObjects[113], 0)
setObjectScale(mapObjects[114], 0)
setObjectScale(mapObjects[115], 0)
setObjectScale(mapObjects[116], 0)
setObjectScale(mapObjects[117], 0)
setObjectScale(mapObjects[118], 0)
setObjectScale(mapObjects[119], 0)
setObjectScale(mapObjects[120], 0)
setObjectScale(mapObjects[121], 0)
setObjectScale(mapObjects[122], 0)
setObjectScale(mapObjects[123], 0)
setObjectScale(mapObjects[124], 0)
setObjectScale(mapObjects[125], 0)
setObjectScale(mapObjects[126], 0)
setObjectScale(mapObjects[127], 0)
setObjectScale(mapObjects[128], 0)
setObjectScale(mapObjects[129], 0)
setObjectScale(mapObjects[130], 0)
setObjectScale(mapObjects[131], 0)
setObjectScale(mapObjects[132], 0)
setObjectScale(mapObjects[133], 0)
setObjectScale(mapObjects[134], 0)
setObjectScale(mapObjects[135], 0)
setObjectScale(mapObjects[136], 0)
setObjectScale(mapObjects[137], 0)
setObjectScale(mapObjects[138], 0)
setObjectScale(mapObjects[139], 0)
setObjectScale(mapObjects[140], 0)
setObjectScale(mapObjects[141], 0)
setObjectScale(mapObjects[142], 0)
setObjectScale(mapObjects[143], 0)
setObjectScale(mapObjects[144], 0)
setObjectScale(mapObjects[145], 0)
setObjectScale(mapObjects[166], 1.03)
setObjectScale(mapObjects[167], 1.03)

-- Remove World Objects
------------------------>>

removeWorldModel(1345, 3.5106, 171.4453, -93.4453, 1.2734)
removeWorldModel(1345, 3.5106, 196.7109, -121.4063, 1.2734)
removeWorldModel(654, 13.1365, -2312.6563, -885.7344, 7.5547)
removeWorldModel(11012, 58.5888, -2166.867, -236.5078, 40.8672)
removeWorldModel(11270, 58.5888, -2166.867, -236.5078, 40.8672)
removeWorldModel(1523, 3.4588, -2550.562, 194.4383, 6.6375)