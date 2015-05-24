if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(8251, 225.2, 2646.8, 19.6, 0, 0, 270),
	createObject(8247, 175.5, 2578.3, 19.4, 0, 0, 270),
	createObject(8247, 133.8, 2578.5, 19.4, 0, 0, 270),
	createObject(8247, 346.5, 2579.3, 19.4, 0, 0, 270),
	createObject(8247, 339.9, 2443, 19.4, 0, 0, 90),
	createObject(3763, 289.3, 2586.3, 48.7, 0, 0, 0),
	createObject(3763, 265.8, 2585.3999, 48.7, 0, 0, 0),
	createObject(8247, 281.1, 2460.8999, 19.4, 0, 0, 90),
	createObject(1596, 319.7998, 2403.5, 18.7, 0, 0, 0),
	createObject(1596, 312.7, 2412.3999, 18.7, 0, 0, 0),
	createObject(1596, 325.2, 2415.2, 18.7, 0, 0, 0),
	createObject(1596, 317.7, 2421, 18.7, 0, 0, 0),
	createObject(1596, 329.1, 2404.3999, 18.7, 0, 0, 0),
	createObject(1596, 303.6, 2406.8, 18.7, 0, 0, 0),
	createObject(1596, 312.7, 2399.6001, 18.7, 0, 0, 0),
	createObject(7981, 238.4, 2430.3, 20.9, 0, 0, 0),
	createObject(9241, 99.6, 2580.3, 17.2, 0, 0, 90),
	createObject(10810, 205.7, 2451.3, 20.5, 0, 0, 110),
	createObject(8247, 168.4, 2460.3999, 19.4, 0, 0, 90),
	createObject(16599, 210.5, 2401.6001, 20.2, 0, 0, 0.162),
	createObject(3287, 203.1, 2417.1001, 20.2, 0, 0, 0),
	createObject(3287, 216.7, 2417.3, 20.2, 0, 0, 0),
	createObject(16599, 210.2, 2426.8999, 20.2, 0, 0, 0.159),
	createObject(11295, 168.3, 2414, 22.1, 0, 0, 0),
	createObject(11295, 159.1, 2413.7, 22.1, 0, 0, 0),
	createObject(11295, 148.9, 2413.3999, 22.1, 0, 0, 0),
	createObject(8251, 99.3, 2458.3999, 19.4, 0, 0, 90),
	createObject(3168, 141.6, 2436.8999, 15.5, 0, 0, 328),
	createObject(3170, 129.7, 2428.3999, 15.5, 0, 0, 94),
	createObject(3286, 123.7, 2445.2, 20.2, 0, 0, 0),
	createObject(9241, 61.9, 2459.6001, 17.2, 0, 0, 270),
	createObject(3252, 266, 2639.3999, 15.5, 0, 0, 0),
	createObject(3173, 268.6, 2615.8, 15.5, 0, 0, 180),
	createObject(3174, 253.9, 2601.8, 15.5, 0, 0, 110),
	createObject(3178, 251.7, 2627, 18.2, 0, 0, 228),
	createObject(8249, 1393.9, 1834, 13.8, 0, 0, 270),
	createObject(8249, 1528.3001, 1837.9, 13.7, 0, 0, 180),
	createObject(8249, 1527.6999, 1724, 13.7, 0, 0, 179.995),
	createObject(9241, 1361, 1793.9, 11.4, 0, 0, 90),
	createObject(9241, 1516.3001, 1201.4, 11.3, 0, 0, 270),
	createObject(8249, 1895.3001, -2653.1001, 16.5, 0, 0, 90),
	createObject(8249, 1792.8001, -2651.8, 16.5, 0, 0, 90),
	createObject(8249, 1710.3001, -2651.8, 16.5, 0, 0, 90),
	createObject(9241, 1423.5, -2441.8, 14, 0, 0, 90),
	createObject(9241, 1494.4, -2636.3999, 14.1, 0, 0, 270),
	createObject(3489, 404.9, 2451.3, 22.1, 0, 0, 180),
	createObject(1595, 1767.6999, -2416.8, 28.7, 0, 0, 0),
	createObject(1682, 1602.1, -2686.3, 19, 0, 0, 0),
	createObject(3268, 1750.6, -2648.1001, 12.5, 0, 0, 270),
	createObject(3268, 1846, -2650.3999, 12.5, 0, 0, 270),
	createObject(1682, 1615.6, -2686.3, 19, 0, 0, 0),
	createObject(3881, 1968.9, -2184.2, 14.4, 0, 0, 0),
	createObject(4832, 1740.1, -2542.1001, 52.5, 0, 0, 0),
	createObject(6959, 1694.6, -2532.5, 12.6, 0, 0, 0),
	createObject(1595, 1471.9, -2397.3, 17.9, 0, 0, 0),
	createObject(1595, 1487.9, -2397.3999, 17.9, 0, 0, 0),
	createObject(1595, 1488, -2410.2, 17.9, 0, 0, 0),
	createObject(1595, 1471.9, -2410.2, 17.9, 0, 0, 0),
	createObject(3109, 1715.4, -2543, 13.7, 0, 0, 0),
	createObject(3109, 1715.3001, -2540, 13.7, 0, 0, 180),
	createObject(2934, 1909.8001, -2691.2, 14, 0, 0, 0),
	createObject(2935, 1914.5, -2691.2, 14, 0, 0, 0),
	createObject(10183, 1736, -2528.3, 12.6, 0, 0, 225.5),
	createObject(3565, 1913, -2691.6001, 16.8, 0, 0, 0),
	createObject(3568, 1855.6999, -2684.8, 15.2, 0, 0, 0),
	createObject(10183, 1694.6999, -2548.3999, 12.6, 0, 0, 225.5),
	createObject(3566, 1844, -2684.8, 15.2, 0, 0, 0),
	createObject(3575, 1737.1, -2685.2, 15.2, 0, 0, 0),
	createObject(1595, 1633, -2689.2, 17.9, 0, 0, 0),
	createObject(1595, 1585.6, -2689.2, 17.9, 0, 0, 0),
	createObject(7040, 1713.9, -2688.2, 16, 0, 0, 0),
	createObject(6959, 1735.9, -2532.5, 12.6, 0, 0, 0),
	createObject(3569, 1793, -2669.8, 15.2, 0, 0, 90),
	createObject(10183, 1691.4785, -2536.7012, 12.4306, 0, 0, 0),
	createObject(640, 1756.9, -2530.6001, 13.2, 0, 0, 0),
	createObject(640, 1756.8994, -2525.3, 13.2, 0, 0, 0),
	createObject(640, 1756.8994, -2519.99, 13.2, 0, 0, 0),
	createObject(640, 1756.8994, -2515.23, 13.2, 0, 0, 0),
	createObject(640, 1712.9, -2552.3999, 13.2, 0, 0, 90),
	createObject(640, 1707.5, -2552.3999, 13.2, 0, 0, 90),
	createObject(640, 1702.1, -2552.3999, 13.2, 0, 0, 90),
	createObject(640, 1696.6999, -2552.3999, 13.2, 0, 0, 90),
	createObject(640, 1691.3001, -2552.3999, 13.2, 0, 0, 90),
	createObject(640, 1685.9, -2552.3999, 13.2, 0, 0, 90),
	createObject(640, 1680.5, -2552.3999, 13.2, 0, 0, 90),
	createObject(640, 1676.6, -2552.3999, 13.2, 0, 0, 90),
	createObject(3569, 1553.1, 1779, 12.4, 0, 0, 0),
	createObject(3569, 1547.1, 1778.9, 12.4, 0, 0, 0),
	createObject(3569, 1541.1, 1778.8001, 12.4, 0, 0, 0),
	createObject(8077, 1624.5, 1240, 13.8, 0, 0, 0),
	createObject(7040, 1622.8001, 1267.1, 13.2, 0, 0, 90),
	createObject(3575, 1605.3001, 1254.6999, 12.5, 0, 0, 0),
	createObject(1595, 1273.8001, 1454.5, 15.1, 0, 0, 90),
	createObject(1595, 1273.8001, 1443.1999, 15.1, 0, 0, 90),
	createObject(1595, 1273.9, 1431.8001, 15.1, 0, 0, 90),
	createObject(3572, 1527.4, 1821.3001, 11.2, 0, 0, 0),
	createObject(3571, 1527.3001, 1818.3001, 11.2, 0, 0, 0),
	createObject(3572, 1527.3001, 1819.8001, 13.9, 0, 0, 0),
	createObject(3575, 1543.6999, 1808.1, 12.5, 0, 0, 0),
	createObject(5262, 1545.1999, 1723.8001, 12.8, 0, 0, 180),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(3490, 404.9, 2451.3, 22.1, 0, 0, 180, true),
	createObject(4948, 1740.1, -2542.1001, 52.5, 0, 0, 0, true),
	createObject(7343, 1694.6, -2532.5, 12.6, 0, 0, 0, true),
	createObject(7343, 1735.9, -2532.5, 12.6, 0, 0, 0, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[46], lodObjects[1])
setLowLODElement(mapObjects[53], lodObjects[2])
setLowLODElement(mapObjects[54], lodObjects[3])
setLowLODElement(mapObjects[72], lodObjects[4])

-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[2], true)
setElementDoubleSided(mapObjects[3], true)
setElementDoubleSided(mapObjects[4], true)
setElementDoubleSided(mapObjects[5], true)
setElementDoubleSided(mapObjects[6], true)
setElementDoubleSided(mapObjects[7], true)
setElementDoubleSided(mapObjects[8], true)
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
setElementDoubleSided(mapObjects[23], true)
setElementDoubleSided(mapObjects[24], true)
setElementDoubleSided(mapObjects[25], true)
setElementDoubleSided(mapObjects[26], true)
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
setElementDoubleSided(mapObjects[51], true)
setElementDoubleSided(mapObjects[52], true)
setElementDoubleSided(mapObjects[53], true)
setElementDoubleSided(mapObjects[54], true)
setElementDoubleSided(mapObjects[55], true)
setElementDoubleSided(mapObjects[56], true)
setElementDoubleSided(mapObjects[57], true)
setElementDoubleSided(mapObjects[58], true)
setElementDoubleSided(mapObjects[61], true)
setElementDoubleSided(mapObjects[62], true)
setElementDoubleSided(mapObjects[64], true)
setElementDoubleSided(mapObjects[65], true)
setElementDoubleSided(mapObjects[67], true)
setElementDoubleSided(mapObjects[68], true)
setElementDoubleSided(mapObjects[69], true)
setElementDoubleSided(mapObjects[70], true)
setElementDoubleSided(mapObjects[71], true)
setElementDoubleSided(mapObjects[72], true)
setElementDoubleSided(mapObjects[73], true)
setElementDoubleSided(mapObjects[75], true)
setElementDoubleSided(mapObjects[76], true)
setElementDoubleSided(mapObjects[77], true)
setElementDoubleSided(mapObjects[78], true)
setElementDoubleSided(mapObjects[79], true)
setElementDoubleSided(mapObjects[80], true)
setElementDoubleSided(mapObjects[81], true)
setElementDoubleSided(mapObjects[82], true)
setElementDoubleSided(mapObjects[83], true)
setElementDoubleSided(mapObjects[84], true)
setElementDoubleSided(mapObjects[85], true)
setElementDoubleSided(mapObjects[86], true)
setElementDoubleSided(mapObjects[87], true)
setElementDoubleSided(mapObjects[88], true)
setElementDoubleSided(mapObjects[89], true)
setElementDoubleSided(mapObjects[90], true)
setElementDoubleSided(mapObjects[91], true)
setElementDoubleSided(mapObjects[92], true)
setElementDoubleSided(mapObjects[93], true)
setElementDoubleSided(mapObjects[94], true)
setElementDoubleSided(mapObjects[95], true)
setElementDoubleSided(mapObjects[96], true)
setElementDoubleSided(mapObjects[97], true)
setElementDoubleSided(mapObjects[98], true)
setElementDoubleSided(mapObjects[99], true)
setElementDoubleSided(mapObjects[100], true)



-- Remove World Objects
------------------------>>

removeWorldModel(3270, 21.6306, 338.0078, 2587.7422, 15.4766)
removeWorldModel(3368, 21.6306, 338.0078, 2587.7422, 15.4766)
removeWorldModel(3270, 21.6306, 311.1328, 2614.6172, 15.4766)
removeWorldModel(3368, 21.6306, 311.1328, 2614.6172, 15.4766)
removeWorldModel(3271, 22.7465, 284.2656, 2587.7422, 15.4766)
removeWorldModel(3367, 22.7465, 284.2656, 2587.7422, 15.4766)
removeWorldModel(3271, 22.7465, 257.3984, 2614.6172, 15.4766)
removeWorldModel(3367, 22.7465, 257.3984, 2614.6172, 15.4766)
removeWorldModel(3271, 22.7465, 284.2656, 2641.4844, 15.4766)
removeWorldModel(3367, 22.7465, 284.2656, 2641.4844, 15.4766)
removeWorldModel(3271, 22.7465, 230.5234, 2587.7422, 15.4766)
removeWorldModel(3367, 22.7465, 230.5234, 2587.7422, 15.4766)
removeWorldModel(3269, 21.3061, 203.6563, 2614.6172, 15.4766)
removeWorldModel(3369, 21.3061, 203.6563, 2614.6172, 15.4766)
removeWorldModel(3269, 21.3061, 230.5234, 2641.4844, 15.4766)
removeWorldModel(3369, 21.3061, 230.5234, 2641.4844, 15.4766)
removeWorldModel(3271, 22.7465, 149.9141, 2614.6172, 15.4766)
removeWorldModel(3367, 22.7465, 149.9141, 2614.6172, 15.4766)
removeWorldModel(3270, 21.6306, 176.7891, 2587.7422, 15.4766)
removeWorldModel(3368, 21.6306, 176.7891, 2587.7422, 15.4766)
removeWorldModel(3271, 22.7465, 176.7891, 2641.4844, 15.4766)
removeWorldModel(3367, 22.7465, 176.7891, 2641.4844, 15.4766)
removeWorldModel(3269, 21.3061, 123.0469, 2587.7422, 15.4766)
removeWorldModel(3369, 21.3061, 123.0469, 2587.7422, 15.4766)
removeWorldModel(3269, 21.3061, 349.875, 2438.25, 15.4766)
removeWorldModel(3369, 21.3061, 349.875, 2438.25, 15.4766)
removeWorldModel(3270, 21.6306, 323.0078, 2411.3828, 15.4766)
removeWorldModel(3368, 21.6306, 323.0078, 2411.3828, 15.4766)
removeWorldModel(3271, 22.7465, 296.1406, 2438.25, 15.4766)
removeWorldModel(3367, 22.7465, 296.1406, 2438.25, 15.4766)
removeWorldModel(3269, 21.3061, 269.2656, 2411.3828, 15.4766)
removeWorldModel(3369, 21.3061, 269.2656, 2411.3828, 15.4766)
removeWorldModel(3269, 21.3061, 242.3984, 2438.25, 15.4766)
removeWorldModel(3369, 21.3061, 242.3984, 2438.25, 15.4766)
removeWorldModel(3271, 22.7465, 215.5313, 2411.3828, 15.4766)
removeWorldModel(3367, 22.7465, 215.5313, 2411.3828, 15.4766)
removeWorldModel(3269, 21.3061, 188.6563, 2438.25, 15.4766)
removeWorldModel(3369, 21.3061, 188.6563, 2438.25, 15.4766)
removeWorldModel(3270, 21.6306, 161.7891, 2411.3828, 15.4766)
removeWorldModel(3368, 21.6306, 161.7891, 2411.3828, 15.4766)
removeWorldModel(3271, 22.7465, 134.9141, 2438.25, 15.4766)
removeWorldModel(3367, 22.7465, 134.9141, 2438.25, 15.4766)
removeWorldModel(3269, 21.3061, 108.0469, 2411.3828, 15.4766)
removeWorldModel(3369, 21.3061, 108.0469, 2411.3828, 15.4766)
removeWorldModel(3364, 9.2994, 82.7288, 2453.7546, 18.0126)
removeWorldModel(16771, 50.6802, 404.7969, 2454.7188, 22.0547)
removeWorldModel(16772, 50.6802, 404.7969, 2454.7188, 22.0547)
removeWorldModel(16773, 10.3468, 392.0253, 2476.5327, 21.9588)
removeWorldModel(16775, 10.3468, 412.1146, 2476.533, 19.9768)
removeWorldModel(3629, 49.4096, 1889.6563, -2666.0078, 18.8828)
removeWorldModel(3672, 49.4096, 1889.6563, -2666.0078, 18.8828)
removeWorldModel(3629, 49.4096, 1822.7344, -2666.0078, 18.8828)
removeWorldModel(3672, 49.4096, 1822.7344, -2666.0078, 18.8828)
removeWorldModel(3629, 49.4096, 1754.1719, -2666.0078, 18.8828)
removeWorldModel(3672, 49.4096, 1754.1719, -2666.0078, 18.8828)
removeWorldModel(3629, 49.4096, 1682.7266, -2666.0078, 18.8828)
removeWorldModel(3672, 49.4096, 1682.7266, -2666.0078, 18.8828)
removeWorldModel(3629, 49.4096, 1617.2813, -2666.0078, 18.8828)
removeWorldModel(3672, 49.4096, 1617.2813, -2666.0078, 18.8828)
removeWorldModel(3664, 17.0016, 1960.6953, -2236.4297, 19.2813)
removeWorldModel(3625, 13.0333, 1961.4453, -2216.1719, 14.9844)
removeWorldModel(3769, 13.0333, 1961.4453, -2216.1719, 14.9844)
removeWorldModel(1290, 8.8853, 1855.9345, -2641.1528, 13.2644)
removeWorldModel(5044, 111.7849, 1818.9141, -2543.6719, 13.4688)