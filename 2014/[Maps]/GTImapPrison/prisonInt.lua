if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(14412, 3138.2998, 831.1992, 1663.6, 0, 0, 0),
	createObject(14416, 3117.5, 838.3, 1654.9, 0, 0, 0),
	createObject(3089, 3155.7, 824.7, 1655.6, 0, 0, 270),
	createObject(3089, 3155.7, 821.7, 1655.6, 0, 0, 90),
	createObject(3089, 3115.3999, 820.9, 1659.6999, 0, 0, 269.995),
	createObject(3089, 3115.3999, 817.9, 1659.6999, 0, 0, 90),
	createObject(3089, 3106.8, 821.7, 1659.6999, 0, 0, 90),
	createObject(3089, 3106.8, 824.7, 1659.6999, 0, 0, 269.995),
	createObject(14791, 3118.7, 821.2002, 1655.561, 0, 0, 0),
	createObject(2632, 3123.8999, 820.1, 1654.3001, 0, 0, 90),
	createObject(2631, 3126.3999, 820.1, 1654.3001, 0, 0, 90),
	createObject(2630, 3128.5, 818.5, 1654.3001, 0, 0, 0),
	createObject(2628, 3132.3, 819.2, 1654.3001, 0, 0, 180),
	createObject(2628, 3134.1001, 819.3, 1654.3001, 0, 0, 179.995),
	createObject(2627, 3136.2, 819.3, 1654.3001, 0, 0, 180),
	createObject(2627, 3137.8999, 819.3, 1654.3001, 0, 0, 179.995),
	createObject(2630, 3129.8, 818.5, 1654.3001, 0, 0, 0),
	createObject(14459, 3133.5, 831.2, 1661.1999, 0, 0, 0),
	createObject(14437, 3121.8999, 841.3, 1656.3001, 0, 0, 0),
	createObject(7191, 3124.2, 863.8, 1656, 0, 0, 0),
	createObject(14437, 3126.1001, 841.3, 1656.3001, 0, 0, 0),
	createObject(6959, 3140.1001, 845.1, 1638.1, 90, 180, 180),
	createObject(1800, 3120.3999, 841.6, 1654.1, 0, 0, 0),
	createObject(2514, 3123.3, 844.5, 1654.3001, 0, 0, 0),
	createObject(2523, 3123.6001, 843.4, 1654.3001, 0, 0, 270),
	createObject(1800, 3124.8, 841.6, 1654.1, 0, 0, 0),
	createObject(2514, 3127.1001, 844.5, 1654.3001, 0, 0, 0),
	createObject(7191, 3128.3, 863.9, 1656, 0, 0, 0),
	createObject(2523, 3127.7, 842.9, 1654.3001, 0, 0, 270),
	createObject(14437, 3130.2, 841.2, 1656.3001, 0, 0, 0),
	createObject(7191, 3132.3999, 863.9, 1656, 0, 0, 0),
	createObject(14437, 3134.3, 841.2, 1656.3001, 0, 0, 0),
	createObject(7191, 3136.5, 863.9, 1656, 0, 0, 0),
	createObject(14437, 3138.3999, 841.2, 1656.3001, 0, 0, 0),
	createObject(7191, 3140.6001, 863.9, 1656, 0, 0, 0),
	createObject(14437, 3142.5, 841.2, 1656.3001, 0, 0, 0),
	createObject(7191, 3144.7, 863.9, 1656, 0, 0, 0),
	createObject(14437, 3146.6001, 841.2, 1656.3001, 0, 0, 0),
	createObject(7191, 3148.8, 863.9, 1656, 0, 0, 0),
	createObject(14437, 3150.7, 841.2, 1656.3001, 0, 0, 0),
	createObject(7191, 3152.8999, 863.9, 1656, 0, 0, 0),
	createObject(7191, 3175.3, 841.4, 1656.1999, 0, 0, 90),
	createObject(1800, 3128.8999, 841.6, 1654.1, 0, 0, 0),
	createObject(2514, 3131.6001, 844.6, 1654.3001, 0, 0, 0),
	createObject(3808, 3154.3, 841.3, 1656.3001, 0, 0, 274),
	createObject(2523, 3131.8, 843.1, 1654.3001, 0, 0, 270),
	createObject(1800, 3133, 841.6, 1654.1, 0, 0, 0),
	createObject(2514, 3135.5, 844.6, 1654.3001, 0, 0, 0),
	createObject(2523, 3135.8999, 843.2, 1654.3001, 0, 0, 270),
	createObject(2514, 3139.6001, 844.6, 1654.3001, 0, 0, 0),
	createObject(1800, 3137.1001, 841.6, 1654.1, 0, 0, 0),
	createObject(2514, 3143.5, 844.3, 1654.3001, 0, 0, 0),
	createObject(2523, 3140, 843, 1654.3001, 0, 0, 270),
	createObject(2514, 3147.6001, 844.6, 1654.3001, 0, 0, 0),
	createObject(1800, 3141.2, 841.6, 1654.1, 0, 0, 0),
	createObject(2514, 3151.7, 844.6, 1654.3001, 0, 0, 0),
	createObject(2523, 3144.1001, 843.3, 1654.3001, 0, 0, 270),
	createObject(2523, 3152, 842.9, 1654.3001, 0, 0, 270),
	createObject(1800, 3145.3, 841.6, 1654.1, 0, 0, 0),
	createObject(2523, 3148.2, 843.1, 1654.3001, 0, 0, 270),
	createObject(1800, 3149.3999, 841.6, 1654.1, 0, 0, 0),
	createObject(3785, 3124.2, 840.9, 1656.6999, 0, 0, 294),
	createObject(3785, 3128.3, 841, 1656.6999, 0, 0, 294),
	createObject(3785, 3132.3999, 841, 1656.6999, 0, 0, 294),
	createObject(3785, 3136.5, 841, 1656.6999, 0, 0, 294),
	createObject(3785, 3140.6001, 841, 1656.6999, 0, 0, 294),
	createObject(3785, 3144.7, 841, 1656.6999, 0, 0, 294),
	createObject(3785, 3148.8, 841, 1656.6999, 0, 0, 294),
	createObject(3785, 3152.8, 841, 1656.6999, 0, 0, 294),
	createObject(1216, 3155.2, 832.1, 1654.9, 0, 0, 272),
	createObject(1216, 3155.2, 834.8, 1654.9, 0, 0, 272),
	createObject(1216, 3155.2, 829.2, 1654.9, 0, 0, 272),
	createObject(1553, 3155.2, 833.5, 1655.5, 0, 0, 0),
	createObject(1553, 3155.2, 836, 1655.5, 0, 0, 0),
	createObject(1553, 3155.2, 830.7, 1655.5, 0, 0, 0),
	createObject(1553, 3155.2, 827.8, 1655.5, 0, 0, 0),
	createObject(1721, 3153.8999, 834.7, 1654.3001, 0, 0, 270),
	createObject(1721, 3153.8999, 832.1, 1654.3001, 0, 0, 269.995),
	createObject(1721, 3154, 829.1, 1654.3001, 0, 0, 269.995),
	createObject(2762, 3145.6001, 829.6, 1654.6999, 0, 0, 270),
	createObject(2762, 3141.8, 829.6, 1654.6999, 0, 0, 270),
	createObject(2762, 3141.7, 833.9, 1654.6999, 0, 0, 270),
	createObject(2762, 3138.5, 829.6, 1654.6999, 0, 0, 270),
	createObject(2762, 3145.6001, 833.9, 1654.6999, 0, 0, 270),
	createObject(2762, 3138.5, 833.9, 1654.6999, 0, 0, 270),
	createObject(1810, 3137.7, 833.5, 1654.3001, 0, 0, 122),
	createObject(1810, 3137.7, 834.7, 1654.3001, 0, 0, 82),
	createObject(1810, 3137.8999, 829.8, 1654.3001, 0, 0, 90),
	createObject(1810, 3140.8, 834.1, 1654.3001, 0, 0, 60),
	createObject(1810, 3139.2, 833.6, 1654.3001, 0, 0, 270),
	createObject(1810, 3141, 829.8, 1654.3001, 0, 0, 90),
	createObject(1810, 3145, 829.2, 1654.3001, 0, 0, 90),
	createObject(1810, 3145, 830.5, 1654.3001, 0, 0, 60),
	createObject(1810, 3145.2, 834.1, 1654.3001, 0, 0, 90),
	createObject(1810, 3139.2, 828.8, 1654.3001, 0, 0, 240),
	createObject(1810, 3142.3, 833.2, 1654.3001, 0, 0, 224),
	createObject(1810, 3142.3, 834.2, 1654.3001, 0, 0, 248),
	createObject(1810, 3139.3, 829.9, 1654.3001, 0, 0, 286.245),
	createObject(1810, 3146.3, 833.1, 1654.3001, 0, 0, 270),
	createObject(1810, 3146.3, 834.1, 1654.3001, 0, 0, 270),
	createObject(1810, 3142.7, 829.3, 1654.3001, 0, 0, 253.995),
	createObject(1810, 3146.3999, 828.8, 1654.3001, 0, 0, 242),
	createObject(1300, 3148, 818.3, 1654.6, 0, 0, 359),
	createObject(1300, 3120.3999, 835.6, 1654.6, 0, 0, 0),
	createObject(6959, 3115.3, 829.9, 1655.8001, 90, 179.995, 89.995),
	createObject(1649, 3115.3999, 828.9, 1661.3001, 0, 0, 90),
	createObject(1649, 3115.3999, 824.7, 1661.3001, 0, 0, 90),
	createObject(1649, 3115.3999, 832.9, 1661.3001, 0, 0, 90),
	createObject(1649, 3115.3999, 837.1, 1661.3001, 0, 0, 90),
}

-- LOD Objects
--------------->>

local lodObjects = {
	createObject(7195, 3124.2, 863.8, 1656, 0, 0, 0, true),
	createObject(7343, 3140.1001, 845.1, 1638.1, 90, 180, 180, true),
	createObject(7195, 3128.3, 863.9, 1656, 0, 0, 0, true),
	createObject(7195, 3132.3999, 863.9, 1656, 0, 0, 0, true),
	createObject(7195, 3136.5, 863.9, 1656, 0, 0, 0, true),
	createObject(7195, 3140.6001, 863.9, 1656, 0, 0, 0, true),
	createObject(7195, 3144.7, 863.9, 1656, 0, 0, 0, true),
	createObject(7195, 3148.8, 863.9, 1656, 0, 0, 0, true),
	createObject(7195, 3152.8999, 863.9, 1656, 0, 0, 0, true),
	createObject(7195, 3175.3, 841.4, 1656.1999, 0, 0, 90, true),
	createObject(7343, 3115.3, 829.9, 1655.8001, 90, 179.995, 89.995, true),
}

-- LOD Object Association
-------------------------->>

setLowLODElement(mapObjects[20], lodObjects[1])
setLowLODElement(mapObjects[22], lodObjects[2])
setLowLODElement(mapObjects[28], lodObjects[3])
setLowLODElement(mapObjects[31], lodObjects[4])
setLowLODElement(mapObjects[33], lodObjects[5])
setLowLODElement(mapObjects[35], lodObjects[6])
setLowLODElement(mapObjects[37], lodObjects[7])
setLowLODElement(mapObjects[39], lodObjects[8])
setLowLODElement(mapObjects[41], lodObjects[9])
setLowLODElement(mapObjects[42], lodObjects[10])
setLowLODElement(mapObjects[105], lodObjects[11])

-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[1], true)
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
setElementDoubleSided(mapObjects[19], true)
setElementDoubleSided(mapObjects[20], true)
setElementDoubleSided(mapObjects[21], true)
setElementDoubleSided(mapObjects[22], true)
setElementDoubleSided(mapObjects[24], true)
setElementDoubleSided(mapObjects[25], true)
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
setElementDoubleSided(mapObjects[44], true)
setElementDoubleSided(mapObjects[46], true)
setElementDoubleSided(mapObjects[48], true)
setElementDoubleSided(mapObjects[49], true)
setElementDoubleSided(mapObjects[50], true)
setElementDoubleSided(mapObjects[52], true)
setElementDoubleSided(mapObjects[53], true)
setElementDoubleSided(mapObjects[54], true)
setElementDoubleSided(mapObjects[56], true)
setElementDoubleSided(mapObjects[57], true)
setElementDoubleSided(mapObjects[58], true)
setElementDoubleSided(mapObjects[60], true)
setElementDoubleSided(mapObjects[73], true)
setElementDoubleSided(mapObjects[74], true)
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
setElementDoubleSided(mapObjects[101], true)
setElementDoubleSided(mapObjects[102], true)
setElementDoubleSided(mapObjects[103], true)
setElementDoubleSided(mapObjects[104], true)
setElementDoubleSided(mapObjects[105], true)
setElementDoubleSided(mapObjects[106], true)
setElementDoubleSided(mapObjects[107], true)
setElementDoubleSided(mapObjects[108], true)
setElementDoubleSided(mapObjects[109], true)

-- Object Scale
---------------->>

setObjectScale(mapObjects[2], 1.1000000238419)

