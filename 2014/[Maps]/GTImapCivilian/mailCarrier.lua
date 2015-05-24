if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(7861, -1857.184, -11.1016, 17.6934, 0, 0, 0),
	createObject(3624, -1832.519, 32.9133, 18.3724, 0, 0, 0),
	createObject(3624, -1832.519, 70.0361, 18.3724, 0, 0, 0),
	createObject(7191, -1865.426, 69.1982, 15.0965, 0, 0, 179.995),
	createObject(7191, -1865.461, 24.7478, 15.0965, 0, 0, 179.995),
	createObject(7191, -1865.464, -4.2285, 15.0965, 0, 0, 179.995),
	createObject(7191, -1840.124, -26.2266, 15.0611, 0, 0, 90),
	createObject(7191, -1842.949, -26.1874, 15.0611, 0, 0, 270),
	createObject(2904, -1820.916, 82.5343, 16.2663, 0, 0, 0),
	createObject(2904, -1820.905, 57.5208, 16.2663, 0, 0, 0),
	createObject(2904, -1820.945, 45.4301, 16.2663, 0, 0, 0),
	createObject(2904, -1820.898, 20.3886, 16.2663, 0, 0, 0),
	createObject(10844, -1862.455, 160.4384, 17.1139, 0, 0, 90),
	createObject(10183, -1848.975, 152.4902, 14.1753, 0, 0, 135.731),
	createObject(10844, -1862.35, 131.6118, 17.1139, 0, 0, 90),
	createObject(10183, -1848.881, 137.4074, 14.1445, 0, 0, 135.731),
	createObject(10847, -1829.993, 95.6423, 20.4864, 0, 0, 180),
	createObject(10183, -1822.754, 134.637, 14.1291, 0, 0, 318.307),
	createObject(10843, -1846.5, -58.1212, 22.1573, 0, 0, 90),
	createObject(10847, -1821.618, -60.8798, 20.4785, 0, 0, 179.995),
	createObject(10847, -1856.09, -93.2357, 20.4861, 0, 0, 179.995),
	createObject(7191, -1865.211, 113.749, 15.0965, 0, 0, 179.995),
	createObject(3761, -1823.024, 40.9364, 16.1218, 0, 0, 0),
	createObject(3761, -1828.819, 41.0059, 16.1218, 0, 0, 0),
	createObject(3761, -1836.999, 40.9135, 16.1218, 0, 0, 0),
	createObject(3761, -1823.242, 24.8752, 16.1218, 0, 0, 0),
	createObject(3761, -1828.839, 24.8956, 16.1218, 0, 0, 0),
	createObject(3761, -1836.765, 24.8117, 16.1218, 0, 0, 0),
	createObject(3761, -1836.789, 62.0253, 16.1218, 0, 0, 0),
	createObject(3761, -1828.82, 62.01, 16.1218, 0, 0, 0),
	createObject(3761, -1823.074, 61.9677, 16.1218, 0, 0, 0),
	createObject(3761, -1822.995, 77.6151, 16.1218, 0, 0, 0),
	createObject(3761, -1828.626, 78.0304, 16.1218, 0, 0, 0),
	createObject(3761, -1837.06, 78.0985, 16.1218, 0, 0, 0),
	createObject(7191, -1842.589, 173.1988, 15.096, 0, 0, 90),
	createObject(3624, 2231.404, -2380.861, 17.2025, 0, 0, 135),
	createObject(3624, 2255.077, -2357.554, 17.2025, 0, 0, 135),
	createObject(3624, 2277.772, -2335.335, 17.2025, 0, 0, 135),
	createObject(3761, 2219.167, -2379.962, 14.5459, 0, 0, 135),
	createObject(3761, 2223.167, -2383.875, 14.5459, 0, 0, 135),
	createObject(3761, 2228.956, -2389.645, 14.5459, 0, 0, 135),
	createObject(3761, 2240.207, -2378.332, 14.5459, 0, 0, 135),
	createObject(3761, 2234.441, -2372.785, 14.5459, 0, 0, 135),
	createObject(3761, 2230.529, -2368.555, 14.5151, 0, 0, 135),
	createObject(3761, 2274.95, -2343.996, 14.5151, 0, 0, 135),
	createObject(3761, 2269.188, -2338.3, 14.5151, 0, 0, 135),
	createObject(3761, 2265.458, -2334.59, 14.5151, 0, 0, 135),
	createObject(3761, 2276.919, -2323.092, 14.5151, 0, 0, 135),
	createObject(3761, 2281.004, -2327.049, 14.5151, 0, 0, 135),
	createObject(3761, 2286.378, -2332.534, 14.5151, 0, 0, 135),
	createObject(3574, 2217.46, -2395.267, 15.2386, 0, 0, 135),
	createObject(3630, 2253.766, -2364.508, 14.0395, 0, 0, 45),
	createObject(3630, 2257.026, -2350.355, 14.0395, 0, 0, 44.995),
	createObject(3577, 2265.068, -2354.12, 13.3294, 0, 0, 225),
	createObject(3577, 2254.791, -2370.485, 13.3294, 0, 0, 225),
	createObject(3577, 2242.561, -2358.306, 13.3294, 0, 0, 225),
	createObject(3577, 2245.442, -2361.431, 13.3294, 0, 0, 225),
	createObject(3577, 2245.442, -2361.431, 14.8674, 0, 0, 225),
	createObject(3577, 2265.068, -2354.12, 14.8946, 0, 0, 225),
	createObject(3577, 2254.791, -2370.485, 14.7986, 0, 0, 225),
	createObject(3577, 2265.068, -2354.12, 16.4254, 0, 0, 225),
	createObject(3577, 2267.449, -2356.262, 13.3294, 0, 0, 225),
	createObject(3577, 2267.449, -2356.262, 14.8402, 0, 0, 225),
	createObject(3631, 2246.165, -2348.691, 13.1252, 0, 0, 45),
	createObject(3631, 2246.165, -2348.69, 14.2438, 0, 0, 44.995),
	createObject(3631, 2246.165, -2348.689, 15.385, 0, 0, 44.995),
	createObject(3623, 2309.508, -2372.432, 16.3737, 0, 0, 135),
	createObject(10183, 1022.206, 2103.111, 9.8323, 0, 0, 135.731),
	createObject(10183, 1022.26, 2088.013, 9.9093, 0, 0, 135.731),
	createObject(7496, 1023.465, 2204.595, 13.3965, 0, 0, 0),
	createObject(10183, 1021.725, 2163.418, 9.8323, 0, 0, 135.731),
	createObject(942, 1065.044, 2079.675, 12.2635, 0, 0, 90),
	createObject(942, 1072.72, 2079.61, 12.2635, 0, 0, 90),
	createObject(2567, 1059.722, 2138.93, 11.7479, 0, 0, 0),
	createObject(2567, 1068.46, 2138.681, 11.7479, 0, 0, 0),
	createObject(2567, 1077.306, 2138.674, 11.7479, 0, 0, 0),
	createObject(18260, 1080.153, 2126.466, 11.3935, 0, 0, 90),
	createObject(5260, 1090.815, 2117.71, 11.5308, 0, 0, 90),
	createObject(5260, 1091.007, 2104.871, 11.5308, 0, 0, 90),
	createObject(5260, 1090.815, 2117.71, 16.0498, 0, 0, 90),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(7860, -1857.184, -11.1016, 17.6934, 0, 0, 0, true),
	createObject(3710, -1832.519, 32.9133, 18.3724, 0, 0, 0, true),
	createObject(3710, -1832.519, 70.0361, 18.3724, 0, 0, 0, true),
	createObject(7195, -1865.426, 69.1982, 15.0965, 0, 0, 179.995, true),
	createObject(7195, -1865.461, 24.7478, 15.0965, 0, 0, 179.995, true),
	createObject(7195, -1865.464, -4.2285, 15.0965, 0, 0, 179.995, true),
	createObject(7195, -1840.124, -26.2266, 15.0611, 0, 0, 90, true),
	createObject(7195, -1842.949, -26.1874, 15.0611, 0, 0, 270, true),
	createObject(10910, -1862.455, 160.4384, 17.1139, 0, 0, 90, true),
	createObject(10910, -1862.35, 131.6118, 17.1139, 0, 0, 90, true),
	createObject(10913, -1829.993, 95.6423, 20.4864, 0, 0, 180, true),
	createObject(10892, -1846.5, -58.1212, 22.1573, 0, 0, 90, true),
	createObject(10913, -1821.618, -60.8798, 20.4785, 0, 0, 179.995, true),
	createObject(10913, -1856.09, -93.2357, 20.4861, 0, 0, 179.995, true),
	createObject(7195, -1865.211, 113.749, 15.0965, 0, 0, 179.995, true),
	createObject(7195, -1842.589, 173.1988, 15.096, 0, 0, 90, true),
	createObject(3710, 2231.404, -2380.861, 17.2025, 0, 0, 135, true),
	createObject(3710, 2255.077, -2357.554, 17.2025, 0, 0, 135, true),
	createObject(3710, 2277.772, -2335.335, 17.2025, 0, 0, 135, true),
	createObject(3744, 2217.46, -2395.267, 15.2386, 0, 0, 135, true),
	createObject(3709, 2309.508, -2372.432, 16.3737, 0, 0, 135, true),
	createObject(7683, 1023.465, 2204.595, 13.3965, 0, 0, 0, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[1], lodObjects[1])
setLowLODElement(mapObjects[2], lodObjects[2])
setLowLODElement(mapObjects[3], lodObjects[3])
setLowLODElement(mapObjects[4], lodObjects[4])
setLowLODElement(mapObjects[5], lodObjects[5])
setLowLODElement(mapObjects[6], lodObjects[6])
setLowLODElement(mapObjects[7], lodObjects[7])
setLowLODElement(mapObjects[8], lodObjects[8])
setLowLODElement(mapObjects[13], lodObjects[9])
setLowLODElement(mapObjects[15], lodObjects[10])
setLowLODElement(mapObjects[17], lodObjects[11])
setLowLODElement(mapObjects[19], lodObjects[12])
setLowLODElement(mapObjects[20], lodObjects[13])
setLowLODElement(mapObjects[21], lodObjects[14])
setLowLODElement(mapObjects[22], lodObjects[15])
setLowLODElement(mapObjects[35], lodObjects[16])
setLowLODElement(mapObjects[36], lodObjects[17])
setLowLODElement(mapObjects[37], lodObjects[18])
setLowLODElement(mapObjects[38], lodObjects[19])
setLowLODElement(mapObjects[51], lodObjects[20])
setLowLODElement(mapObjects[67], lodObjects[21])
setLowLODElement(mapObjects[70], lodObjects[22])

-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[14], true)
setElementDoubleSided(mapObjects[18], true)
setElementDoubleSided(mapObjects[68], true)
setElementDoubleSided(mapObjects[69], true)
setElementDoubleSided(mapObjects[71], true)

-- Remove World Objects
------------------------>>

removeWorldModel(10775, 88.6895, -1847.781, 44.7813, 35.5625)
removeWorldModel(10796, 88.6895, -1847.781, 44.7813, 35.5625)
removeWorldModel(10776, 55.0407, -1849.633, -54.3125, 24.9766)
removeWorldModel(10797, 55.0407, -1849.633, -54.3125, 24.9766)
removeWorldModel(3707, 56.6269, 2245.453, -2378.961, 20.0313)
removeWorldModel(3708, 56.6269, 2245.453, -2378.961, 20.0313)
removeWorldModel(1635, 4.9538, 2255.305, -2393.805, 14.7109)
removeWorldModel(3627, 24.4193, 2288.266, -2342.07, 15.5625)
removeWorldModel(3686, 24.4193, 2288.266, -2342.07, 15.5625)
removeWorldModel(3474, 16.443, 1024.258, 2110.695, 16.7422)
removeWorldModel(7620, 25.695, 1029.359, 2082.852, 13.9219)
removeWorldModel(7674, 25.695, 1029.359, 2082.852, 13.9219)
removeWorldModel(7657, 12.1845, 1047.391, 2063.688, 11.5391)
removeWorldModel(1438, 3.8296, 1072.521, 2116.503, 10.3747)
removeWorldModel(1441, 3.6971, 1084.82, 2110.731, 10.2644)
removeWorldModel(1440, 3.6365, 1081.315, 2108.982, 10.5092)
removeWorldModel(1438, 3.8296, 1080.582, 2102.252, 10.3476)
removeWorldModel(1438, 3.8296, 1081.63, 2097.385, 10.2796)
removeWorldModel(1438, 3.8296, 1073.776, 2078.903, 10.3747)
removeWorldModel(1438, 3.8296, 1069.523, 2079.227, 10.3747)
removeWorldModel(1438, 3.8296, 1059.992, 2079.081, 10.3598)
removeWorldModel(7622, 33.5339, 1031.617, 2173.82, 15.9219)
removeWorldModel(7675, 33.5339, 1031.617, 2173.82, 15.9219)
removeWorldModel(3474, 16.443, 1052.836, 2191.484, 16.7422)
removeWorldModel(1448, 2.8051, 1068.282, 2112.13, 9.9782)
removeWorldModel(1448, 2.8051, 1069.52, 2121.149, 9.9782)
removeWorldModel(1448, 2.8051, 1063.26, 2111.08, 9.9782)
removeWorldModel(1421, 3.4202, 1061.556, 2111.585, 10.7334)
removeWorldModel(1421, 3.4202, 1062.744, 2115.634, 10.6416)
removeWorldModel(1431, 3.4146, 1061.998, 2118.626, 10.6047)
removeWorldModel(1431, 3.4146, 1061.54, 2123.355, 10.6213)
removeWorldModel(1431, 3.4146, 1061.558, 2127.66, 10.6947)
removeWorldModel(1421, 3.4202, 1082.167, 2113.389, 11.087)
removeWorldModel(1421, 3.4202, 1082.305, 2105.094, 10.488)
removeWorldModel(1421, 3.4202, 1072.101, 2079.704, 10.6007)
removeWorldModel(1421, 3.4202, 1065.544, 2079.282, 10.5105)
removeWorldModel(1421, 3.4202, 1058.234, 2080.112, 10.4874)

setOcclusionsEnabled(false)