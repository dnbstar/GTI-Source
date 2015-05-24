if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(5706, -1463.1, 693.8975, -3.46, 0, 0, 0),
	createObject(3886, -1464, 712.1992, -0.56, 0, 0, 0),
	createObject(3886, -1464, 722.6719, -0.56, 0, 0, 0),
	createObject(1341, -1485.1, 710.9, 7.2, 0, 0, 180),
	createObject(3886, -1464, 733.14, -0.56, 0, 0, 0),
	createObject(3886, -1464, 754.08, -0.56, 0, 0, 0),
	createObject(3886, -1464, 743.61, -0.56, 0, 0, 0),
	createObject(3886, -1464, 764.55, -0.56, 0, 0, 0),
	createObject(3886, -1464, 775.02, -0.56, 0, 0, 0),
	createObject(3886, -1464, 785.49, -0.56, 0, 0, 0),
	createObject(3886, -1446.2676, 724.6992, -0.56, 0, 0, 90),
	createObject(3886, -1456.74, 724.6992, -0.56, 0, 0, 90),
	createObject(3886, -1446.2679, 752.1, -0.56, 0, 0, 90),
	createObject(3886, -1456.74, 752.0996, -0.56, 0, 0, 90),
	createObject(3886, -1456.74, 776.88, -0.56, 0, 0, 90),
	createObject(3886, -1446.2679, 776.8799, -0.56, 0, 0, 90),
	createObject(970, -1473.3, 684.2002, 0.9, 0, 0, 0),
	createObject(970, -1461, 684.1992, 0.9, 0, 0, 0),
	createObject(9361, -1450.88, 703.7451, 2.9, 0, 0, 314.995),
	createObject(1637, -1450.6, 689.9, 1.6, 0, 0, 179.995),
	createObject(1637, -1474, 703.6, 1.6, 0, 0, 270),
	createObject(1775, -1455.6999, 705, 1.4, 0, 0, 270),
	createObject(1775, -1455.6999, 703.7998, 1.4, 0, 0, 270),
	createObject(2406, -1454, 702, 1.6, 0, 0, 0),
	createObject(2405, -1453, 702, 1.6, 0, 0, 0),
	createObject(1643, -1453, 701.2, 0.4, 0, 0, 270),
	createObject(3468, -1483.9, 720, 6.9, 0, 0, 90),
	createObject(1597, -1478.6, 702.0996, 3, 0, 0, 0),
	createObject(674, -1448, 700.4, 0.4, 0, 0, 180),
	createObject(2404, -1452, 702, 1.6, 0, 0, 0),
	createObject(970, -1456.9, 684.2, 0.9, 0, 0, 0),
	createObject(970, -1452.8001, 684.2, 0.9, 0, 0, 0),
	createObject(970, -1448.6999, 684.2, 0.9, 0, 0, 0),
	createObject(970, -1446.6, 686.2998, 0.9, 0, 0, 90),
	createObject(970, -1446.6, 690.4, 0.9, 0, 0, 90),
	createObject(970, -1446.6, 694.5, 0.9, 0, 0, 90),
	createObject(970, -1446.6, 698.6, 0.9, 0, 0, 90),
	createObject(970, -1446.6, 702.7, 0.9, 0, 0, 90),
	createObject(970, -1477.4, 684.2, 0.9, 0, 0, 0),
	createObject(970, -1481.5, 684.2, 0.9, 0, 0, 0),
	createObject(970, -1459.9, 707, 0.9, 0, 0, 0),
	createObject(970, -1455.8001, 707, 0.9, 0, 0, 0),
	createObject(970, -1468.1, 707, 0.9, 0, 0, 0),
	createObject(970, -1472.1999, 707, 0.9, 0, 0, 0),
	createObject(970, -1476.2998, 707, 0.9, 0, 0, 0),
	createObject(970, -1480.4, 707, 0.9, 0, 0, 0),
	createObject(1646, -1455, 686.5, 0.7, 0, 0, 20),
	createObject(1645, -1457, 686.5, 0.7, 0, 0, 20),
	createObject(1646, -1459, 686.5, 0.7, 0, 0, 19.995),
	createObject(1368, -1467.9, 706.5, 1, 0, 0, 0),
	createObject(1281, -1459.6, 704.2998, 1.2, 0, 0, 0),
	createObject(1215, -1461.8001, 706.8, 0.9, 0, 0, 0),
	createObject(1215, -1466.1999, 706.8, 0.9, 0, 0, 0),
	createObject(1215, -1478.4, 706.4, 1.1, 0, 0, 0),
	createObject(1215, -1478.4, 697.6, 1.1, 0, 0, 0),
	createObject(9362, -1449.119, 705.54, 1.3, 0, 0, 0),
	createObject(2001, -1454.6999, 706.6, 0.5, 0, 0, 0),
	createObject(11245, -1479.4, 715.5, 5, 0, 0, 0),
	createObject(3886, -1466.2, 679.4, -0.6, 0, 0, 0),
	createObject(970, -1470.2, 684.2, 0.9, 0, 0, 0),
	createObject(9361, -1478.5, 664.7, 2.9, 0, 0, 134.995),
	createObject(5706, -1484.7, 671.1, -3.5, 0, 0, 0),
	createObject(3886, -1464.2, 672.1, -0.6, 0, 0, 270),
	createObject(3886, -1453.7, 672.1, -0.6, 0, 0, 269.995),
	createObject(3886, -1443.2, 672.1, -0.6, 0, 0, 269.995),
	createObject(3886, -1470.2, 656.2, -0.6, 0, 0, 0),
	createObject(3886, -1470.2, 645.7, -0.6, 0, 0, 0),
	createObject(3886, -1462.9, 647.7, -0.6, 0, 0, 269.995),
	createObject(3886, -1452.4, 647.7, -0.6, 0, 0, 269.995),
	createObject(970, -1468.3, 667.8, 0.9, 0, 0, 90),
	createObject(970, -1468.3, 663.6, 0.9, 0, 0, 90),
	createObject(970, -1474.3, 661.4, 0.9, 0, 0, 0),
	createObject(1281, -1481, 680.2, 1.2, 0, 0, 0),
	createObject(1281, -1481.1, 675.2, 1.2, 0, 0, 0),
	createObject(1597, -1478, 683, 3, 0, 0, 90),
	createObject(1999, -1476.3, 663.1, 0.5, 0, 0, 0),
	createObject(1999, -1480.8, 664.9, 0.5, 0, 0, 180),
	createObject(1663, -1481.7, 665.7, 1, 0, 0, 0),
	createObject(1663, -1475.6, 662.5, 1, 0, 0, 180),
	createObject(1439, -1473.8, 663.8, 0.3, 0, 0, 90),
}





-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[63], true)
setElementDoubleSided(mapObjects[64], true)
setElementDoubleSided(mapObjects[65], true)
setElementDoubleSided(mapObjects[68], true)
setElementDoubleSided(mapObjects[69], true)
setElementDoubleSided(mapObjects[75], true)
setElementDoubleSided(mapObjects[77], true)
setElementDoubleSided(mapObjects[80], true)



