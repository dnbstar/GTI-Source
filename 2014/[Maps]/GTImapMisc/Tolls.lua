if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(8168, 38.3, -1529.6, 6.1, 0, 0, 10),
	createObject(8168, 64.6, -1533.5, 6, 0, 0, 187.995),
	createObject(966, 61.1, -1529, 4, 0, 0, 270),
	createObject(984, 54.7, -1532.2, 4.8, 0, 0, 80),
	createObject(983, 45.2, -1530.5, 4.8, 0, 0, 80),
	createObject(966, 41.2002, -1534.1, 4.3, 0, 0, 90),
	createObject(1237, 40.0996, -1542, 4.2, 0, 0, 0),
	createObject(1237, 61.4, -1521.3001, 4.1, 0, 0, 0),
	createObject(1237, 41, -1532.8994, 4.2, 0, 0, 0),
	createObject(1237, 60.8994, -1529.7998, 4, 0, 0, 0),
	createObject(966, 581.7, 397.5, 17.9, 0, 0, 35.75),
	createObject(966, 564.5, 397.8994, 17.9, 0, 0, 215.75),
	createObject(973, -182.8, 310.7, 11.9, 0, 0, 255.25),
	createObject(967, 569.2, 402.8, 17.8, 0, 0, 125.497),
	createObject(967, 576.5, 392.6, 17.9, 0, 0, 305.497),
	createObject(1237, 582.4, 395.7, 18.1, 0, 0, 0),
	createObject(1237, 571.2998, 388.3994, 18.1, 0, 0, 0),
	createObject(1237, 573.1992, 409, 18.1, 0, 0, 0),
	createObject(1237, 561.5996, 402.3994, 18.1, 0, 0, 0),
	createObject(3872, 577.4004, 396.0996, 25, 0, 0, 34.997),
	createObject(3872, 32.6, -1536.5, 7.8, 0.492, 10, 303.41),
	createObject(3872, 573.7998, 393.5, 25, 0, 0, 217.491),
	createObject(3872, 73.6992, -1527, 8.6, 0.489, 9.998, 131.407),
	createObject(966, -188.2998, 317.2002, 11.1, 0, 0, 165.745),
	createObject(966, -177.5, 303.9, 11.1, 0, 0, 343.745),
	createObject(973, 572.9004, 397.9004, 18.7, 0, 0, 304.75),
	createObject(973, -182.9, 310.7, 11.9, 0, 0, 75.245),
	createObject(973, 572.8994, 397.8994, 18.7, 0, 0, 124.75),
	createObject(967, -178.1, 302.4, 11.3, 0, 0, 255.748),
	createObject(967, -187.7, 319, 11.3, 0, 0, 75.243),
	createObject(1237, -184.5, 304.7, 11.1, 0, 0, 0),
	createObject(1237, -181.3, 316.3, 11.1, 0, 0, 0),
	createObject(966, 1744.1, 543.2998, 25.6, 357.49, 0, 341.741),
	createObject(966, 1746.6999, 542.6, 25.6, 0, 0, 160.994),
	createObject(1237, 1749.6, 554.8, 24.9, 0, 0, 0),
	createObject(1237, 1734.7, 537.9, 26.2, 0, 0, 0),
	createObject(1237, 1742.9, 535.1, 26.2, 0, 0, 0),
	createObject(9623, 1746.6, 544.9004, 28.1, 356.743, 0, 342.241),
	createObject(1237, 1741.0996, 558.5, 24.8, 0, 0, 0),
	createObject(1237, 1758.5, 553.3, 24.8, 0, 0, 0),
	createObject(7415, 1732.5, 498.6, 37.7, 0, 0, 98.998),
	createObject(966, -25.2, -1378.3001, 10, 0, 0, 129.25),
	createObject(8168, -29.8, -1379.1999, 11.9, 0, 0, 56.5),
	createObject(8168, -37.5996, -1357.2, 12.1, 0, 0, 237.739),
	createObject(966, -42.1, -1358.1, 10.2, 0, 0, 311.75),
	createObject(3872, -35.9, -1347.1999, 11, 0, 18.5, 266),
	createObject(3872, -33.5996, -1390.3, 13.5, 0, 35.25, 69.741),
	createObject(8843, -44.9004, -1355.7, 10.3, 1, 0, 128.749),
	createObject(8843, -22.6992, -1381.3994, 10.1, 358.995, 0, 309.749),
	createObject(1616, 61.8, -1530.4, 7.9, 0, 0, 242.25),
	createObject(1616, 41.2, -1532.7, 8.1, 0, 0, 57.499),
	createObject(1616, -41.8, -1357.3, 14.1, 0, 0, 290),
	createObject(1616, -25.7, -1379.2, 13.8, 0, 0, 109.745),
	createObject(1622, 1755.1, 546.2, 30, 358.524, 349.747, 1.233),
	createObject(1622, 1737.8, 543.7998, 30.6, 358.517, 349.739, 190.981),
	createObject(966, 1735.7, 546.1, 25.6, 357.495, 0, 341.746),
	createObject(1237, 1751.9, 532.3, 26.1, 0, 0, 0),
	createObject(1237, 1728.4, 548.6, 25.7, 0, 0, 0),
	createObject(1622, 1736.1, 546.6, 30.2, 358.517, 349.739, 282.731),
	createObject(966, 1755.6, 539.2, 25.6, 0, 0, 159.25),
	createObject(1237, 1762.8, 536.5, 25.7, 0, 0, 0),
	createObject(3872, -181.3, 300.1, 17.2, 0, 0, 40),
	createObject(3872, -182.1, 323, 15.2, 0, 0, 199.996),
	createObject(966, -2671.3, 1280.6, 54.4, 0, 0, 180),
	createObject(966, -2680.7, 1280.6, 54.4, 0, 0, 179.995),
	createObject(966, -2682.7, 1268.5, 54.4, 0, 0, 0),
	createObject(966, -2691.2, 1268.5, 54.4, 0, 0, 0),
}





-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[13], true)
setElementDoubleSided(mapObjects[22], true)
setElementDoubleSided(mapObjects[26], true)
setElementDoubleSided(mapObjects[27], true)
setElementDoubleSided(mapObjects[28], true)
setElementDoubleSided(mapObjects[50], true)
setElementDoubleSided(mapObjects[51], true)
setElementDoubleSided(mapObjects[52], true)
setElementDoubleSided(mapObjects[53], true)
setElementDoubleSided(mapObjects[54], true)
setElementDoubleSided(mapObjects[55], true)
setElementDoubleSided(mapObjects[59], true)
setElementDoubleSided(mapObjects[64], true)
setElementDoubleSided(mapObjects[65], true)
setElementDoubleSided(mapObjects[66], true)
setElementDoubleSided(mapObjects[67], true)



