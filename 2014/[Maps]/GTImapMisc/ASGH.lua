if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(7922, 1170.1, -1324, 14.3, 0, 90, 0),
	createObject(7922, 1166.6, -1324, 14.3, 0, 90, 0),
	createObject(7922, 1163.1, -1324, 14.3, 0, 90, 0),
	createObject(7922, 1159.6, -1324, 14.3, 0, 90, 0),
	createObject(7922, 1159.6, -1333.6, 14.3, 0, 90, 0),
	createObject(7922, 1159.6, -1343.2, 14.3, 0, 90, 0),
	createObject(7922, 1159.6, -1352.8, 14.3, 0, 90, 0),
	createObject(7922, 1159.6, -1362.4, 14.3, 0, 90, 0),
	createObject(7922, 1166.1, -1330.5, 14.3, 0, 90, 90),
	createObject(7922, 1166.1, -1333.9, 14.3, 0, 90, 90),
	createObject(7922, 1166.1, -1339.8, 14.3, 0, 90, 90),
	createObject(7922, 1166.1, -1343.3, 14.3, 0, 90, 90),
	createObject(7922, 1166.168, -1350.1, 14.3, 0, 90, 90),
	createObject(7922, 1166.1, -1353.6, 14.3, 0, 90, 90),
	createObject(7922, 1166.1, -1360.2, 14.3, 0, 90, 90),
	createObject(7922, 1166.1, -1363.7, 14.3, 0, 90, 90),
	createObject(7922, 1159.6, -1372, 14.3, 0, 90, 0),
	createObject(7922, 1166.1, -1370.3, 14.3, 0, 90, 90.247),
	createObject(7922, 1166.17, -1373.8, 14.3, 0, 90, 90.247),
	createObject(7922, 1153.035, -1323.4, 14.3, 0, 90, 90),
	createObject(3063, 1161.4, -1329.4, 16.1, 0, 0, 0),
	createObject(3064, 1153.1, -1325.2, 16.1, 0, 0, 90),
	createObject(3063, 1170.3, -1327.7, 16.1, 0, 0, 90),
	createObject(3064, 1157.9, -1329.93, 16.1, 0, 0, 180),
	createObject(3098, 1165.5, -1327.7, 16.1, 0, 0, 90),
	createObject(3064, 1157.9, -1339.5, 16.1, 0, 0, 179.995),
	createObject(3064, 1157.9, -1349.1, 16.1, 0, 0, 179.995),
	createObject(3064, 1157.9, -1358.7, 16.1, 0, 0, 179.995),
	createObject(3064, 1157.9, -1368.3, 16.1, 0, 0, 179.995),
	createObject(3063, 1157.9, -1374.7, 16.1, 0, 0, 0),
	createObject(7922, 1156.099, -1371.95, 14.3, 0, 90, 179.997),
	createObject(3898, 1158, -1319.3, 16.1, 0, 0, 90),
	createObject(3063, 1170, -1319.3, 16.1, 0, 0, 90),
	createObject(3099, 1161.4, -1332.6, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1335.8, 16.1, 0, 0, 0),
	createObject(3099, 1161.4, -1339, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1342.2, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1345.4, 16.1, 0, 0, 0),
	createObject(3099, 1161.4, -1349.2, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1346, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1352.4, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1355.6, 16.1, 0, 0, 0),
	createObject(3099, 1161.4, -1359.3, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1356.1, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1362.5, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1365.7, 16.1, 0, 0, 0),
	createObject(3099, 1159.6, -1376.6, 16.1, 0, 0, 90),
	createObject(3063, 1161.4, -1366.1999, 16.1, 0, 0, 0),
	createObject(3063, 1161.4, -1372.6, 16.1, 0, 0, 0),
	createObject(3099, 1161.4, -1369.4, 16.1, 0, 0, 0),
	createObject(3063, 1166.8, -1319.3, 16.1, 0, 0, 90),
	createObject(3063, 1163.6, -1319.3, 16.1, 0, 0, 90),
	createObject(3099, 1156.1, -1323.9, 16.1, 0, 0, 0),
	createObject(3063, 1157.8, -1320.9, 16.1, 0, 0, 0),
	createObject(3064, 1153, -1322.5, 16.1, 0, 0, 90),
	createObject(3099, 1159.1, -1327.7, 16.1, 0, 0, 90),
	createObject(3063, 1162.8, -1376.6, 16.1, 0, 0, 90),
	createObject(3063, 1157.9, -1377.8, 16.1, 0, 0, 0),
	createObject(3064, 1166.2, -1375.5, 16.1, 0, 0, 90),
	createObject(3064, 1170.9, -1373.1, 16.1, 0, 0, 359.747),
	createObject(3064, 1166.2, -1368.54, 16.1, 0, 0, 90),
	createObject(3064, 1166.3, -1365.5, 16.1, 0, 0, 90),
	createObject(3064, 1170.9, -1362.5, 16.1, 0, 0, 180),
	createObject(3064, 1166.2, -1358.44, 16.1, 0, 0, 90),
	createObject(3064, 1170.8, -1351.9, 16.1, 0, 0, 179.995),
	createObject(3064, 1170.8001, -1341.4, 16.1, 0, 0, 179.995),
	createObject(3064, 1166.3, -1355.4, 16.1, 0, 0, 90),
	createObject(3064, 1166.3, -1348.339, 16.1, 0, 0, 90),
	createObject(3064, 1166.3, -1345.1, 16.1, 0, 0, 90),
	createObject(3064, 1166.2, -1338.14, 16.1, 0, 0, 90),
	createObject(3064, 1166.1999, -1335.6999, 16.1, 0, 0, 90),
	createObject(3064, 1170.8, -1332.5, 16.1, 0, 0, 180),
	createObject(10252, 1171.6, -1326.4, 16.1, 0, 0, 0),
	createObject(10252, 1171.6, -1320.3, 16.1, 0, 0, 0),
	createObject(10252, 1171.6, -1323.4, 18.6, 0, 0, 0.25),
	createObject(1569, 1156.2, -1323, 14.4, 0, 0, 270),
	createObject(8661, 1162.5, -1363.9, 17.8, 0, 0, 90),
	createObject(8661, 1161.7, -1323.905, 17.8, 0, 0, 90),
	createObject(1569, 1145.4, -1323.2, 12.5, 0, 0, 270),
	createObject(3063, 1160.4, -1319.3, 16.1, 0, 0, 90),
	createObject(3565, 1176.6, -1325.5, 11.8, 0, 20.495, 0),
	createObject(3565, 1183, -1325.5, 10.5, 0, 20.49, 0),
	createObject(1649, 1165.6, -1327.7, 17.4, 0, 0, 0),
	createObject(1502, 1161.4, -1331.8, 14.4, 0, 0, 270),
	createObject(1523, 1158.3, -1327.7, 14.32, 0, 0, 0),
	createObject(3898, 1167.9, -1327.7, 16.1, 0, 0, 90),
	createObject(1703, 1168.4, -1328.3, 14.4, 0, 0, 0),
	createObject(1703, 1166.4, -1320.5, 14.4, 0, 0, 0),
	createObject(2164, 1170.7, -1331.4, 14.4, 0, 0, 270),
	createObject(2001, 1171.1, -1321.9, 14.4, 0, 0, 0),
	createObject(2001, 1171, -1325, 14.4, 0, 0, 0),
	createObject(1703, 1162.4, -1320.4, 14.4, 0, 0, 0),
	createObject(1523, 1161.5, -1350, 14.3, 0, 0, 90),
	createObject(1523, 1161.5, -1339.8, 14.3, 0, 0, 90),
	createObject(1523, 1161.5, -1360.1, 14.3, 0, 0, 90),
	createObject(1523, 1161.5, -1370.2, 14.3, 0, 0, 90),
	createObject(2181, 1164.7, -1333.9, 14.4, 0, 0, 270),
	createObject(2181, 1165.6, -1334.9, 14.4, 0, 0, 90),
	createObject(2181, 1168.9, -1334.9, 14.4, 0, 0, 90),
	createObject(2181, 1168, -1333.9, 14.4, 0, 0, 270),
	createObject(2165, 1164.9, -1328.2, 14.4, 0, 0, 0),
	createObject(2356, 1167, -1334.5, 14.4, 0, 0, 294),
	createObject(2356, 1166.1, -1334.5, 14.4, 0, 0, 99.75),
	createObject(2356, 1164.2, -1334.4, 14.4, 0, 0, 278.995),
	createObject(2356, 1169.8, -1334.4, 14.4, 0, 0, 78.992),
	createObject(10671, 1170.2, -1307.4, 14.7, 0, 0, 0),
	createObject(2181, 1162, -1334.8, 14.4, 0, 0, 90),
	createObject(2356, 1163, -1334.4, 14.4, 0, 0, 78.992),
	createObject(1776, 1159.9, -1319.8, 15.5, 0, 0, 0),
	createObject(3095, 1124, -1330.8, 12, 179.995, 349.997, 90),
	createObject(3095, 1111, -1331.1, 12, 179.995, 349.997, 90),
	createObject(3095, 1098, -1330.7, 12, 179.995, 349.997, 90),
	createObject(8843, 1139.8, -1301.4, 12.6, 0, 0, 180),
	createObject(8843, 1126.7, -1316.8, 12.7, 0, 0, 90),
	createObject(1671, 1165.5, -1329.4, 14.8, 0, 0, 178),
	createObject(2146, 1169.5, -1326.1, 14.9, 0, 0, 0),
	createObject(1997, 1167.1, -1344.3, 14.4, 0, 0, 270),
	createObject(1997, 1166.8, -1354.3, 14.4, 0, 0, 270),
	createObject(1997, 1166.5, -1364.3, 14.4, 0, 0, 270),
	createObject(1997, 1166.6, -1374.5, 14.4, 0, 0, 270),
	createObject(3393, 1170.2, -1341.6, 14.4, 0, 0, 0),
	createObject(3393, 1170.2, -1351.8, 14.4, 0, 0, 0),
	createObject(3393, 1170.2, -1361.9, 14.4, 0, 0, 0),
	createObject(3393, 1170.3, -1372.4, 14.4, 0, 0, 0),
	createObject(3383, 1162.4, -1342.7, 14.4, 0, 0, 270),
	createObject(3383, 1162.4, -1352.7, 14.4, 0, 0, 270),
	createObject(3383, 1162.3, -1363, 14.4, 0, 0, 270),
	createObject(3383, 1162.4, -1373, 14.4, 0, 0, 270),
	createObject(1569, 1158.8, -1376.5, 14.4, 0, 0, 0),
	createObject(3095, 1124, -1339.6, 12.8, 179.995, 0, 90),
	createObject(3095, 1124, -1348.6, 12.8, 179.995, 0, 90),
	createObject(3095, 1110.9, -1339.6, 12.8, 179.995, 0, 90),
	createObject(3095, 1110.9, -1348.6, 12.8, 179.995, 0, 90),
	createObject(3095, 1097.8, -1339.6, 12.8, 179.995, 0, 90),
	createObject(3095, 1097.8, -1348.6, 12.8, 179.995, 0, 90),
	createObject(3905, 1128.5, -1339.9, 14.5, 0, 0, 0),
	createObject(3905, 1128.5, -1349.5, 14.5, 0, 0, 0),
	createObject(3905, 1123.5, -1346.8, 14.5, 0, 0, 270),
	createObject(3905, 1113.9, -1346.8, 14.5, 0, 0, 270),
	createObject(3905, 1104.3, -1346.8, 14.5, 0, 0, 270),
	createObject(3905, 1096, -1346.8, 14.5, 0, 0, 270),
	createObject(3905, 1115.4, -1339.9, 14.5, 0, 0, 0),
	createObject(3905, 1115.4, -1349.5, 14.5, 0, 0, 0),
	createObject(3905, 1102.3, -1339.9, 14.5, 0, 0, 0),
	createObject(3905, 1102.3, -1349.5, 14.5, 0, 0, 0),
	createObject(3905, 1093.3, -1339.9, 14.5, 0, 0, 0),
	createObject(3905, 1093.3, -1349.5, 14.5, 0, 0, 0),
	createObject(3905, 1106.4, -1339.9, 14.5, 0, 0, 0),
	createObject(3905, 1106.4, -1349.5, 14.5, 0, 0, 0),
	createObject(3905, 1119.5, -1339.9, 14.5, 0, 0, 0),
	createObject(3905, 1119.5, -1349.5, 14.5, 0, 0, 0),
	createObject(8661, 1109.6, -1345.4, 16.2, 0, 0, 0),
	createObject(10252, 1126.6, -1335.3, 17.5, 90, 0, 90),
	createObject(10252, 1123.1, -1335.3, 17.5, 90, 0, 90),
	createObject(10252, 1119.6, -1335.3, 17.5, 90, 0, 90),
	createObject(10252, 1113.6, -1335.4, 17.5, 90, 0, 90),
	createObject(10252, 1110.1, -1335.4, 17.5, 90, 0, 90),
	createObject(10252, 1106.6, -1335.4, 17.5, 90, 0, 90),
	createObject(10252, 1100.4, -1335.3, 17.5, 90, 0, 90),
	createObject(10252, 1097, -1335.3, 17.5, 90, 0, 90),
	createObject(10252, 1093.5, -1335.3, 17.5, 90, 0, 90),
	createObject(1290, 1117.6, -1331.9, 16.1, 0, 0, 0),
	createObject(1290, 1104.3, -1331.7, 16.1, 0, 0, 0),
	createObject(16375, 1184.1, -1326.9, 30.6, 0, 0, 0),
	createObject(16375, 1183.9, -1308.7, 30.6, 0, 0, 0),
	createObject(1569, 1160.9, -1330.5, 30.5, 0, 0, 0),
	createObject(1694, 1167.6, -1334.3, 39.3, 0, 0, 214),
	createObject(3666, 1150.2, -1291, 31, 0, 0, 0),
	createObject(10183, 1112.8, -1306.2, 12.7, 0, 0, 225),
	createObject(982, 1120.3, -1310.2, 13.3, 0, 0, 90),
	createObject(984, 1133.1, -1303.7, 13.2, 0, 0, 0),
	createObject(983, 1133.1, -1294.1, 13.2, 0, 0, 0),
	createObject(3458, 1114.5, -1308, 14.1, 0, 0, 0),
	createObject(1297, 1131.6, -1291, 15.9, 0, 0, 0),
	createObject(1250, 1140.4, -1369.1, 13.2, 0, 0, 90),
	createObject(1251, 1144.3, -1368.9, 13.5, 0, 0, 90),
	createObject(988, 1150.5, -1369, 10, 0, 0, 0),
	createObject(988, 1137.2, -1368.9, 9.9, 0, 0, 0),
	createObject(3063, 1162.3, -1327.7, 16.1, 0, 0, 90),
	createObject(3063, 1161.4, -1375.8, 16.1, 0, 0, 0),
	createObject(9131, 1171.9, -1327.7, 15.4, 0, 180, 358.75),
	createObject(9131, 1171.9, -1327.7, 17.672, 0, 179.995, 358.745),
	createObject(9131, 1172, -1319.8, 15.4, 0, 179.995, 358.998),
	createObject(9131, 1172, -1319.8, 17.672, 0, 179.995, 358.992),
	createObject(9131, 1171.6, -1320.9, 17.2, 90, 180, 0),
	createObject(9131, 1171.6, -1323.17, 17.2, 90, 180, 359.995),
	createObject(9131, 1171.6, -1325.4, 17.2, 90, 180, 359.984),
	createObject(9131, 1171.6, -1327.673, 17.2, 90, 179.995, 359.978),
	createObject(9131, 1171.7, -1318.6, 17.2, 90, 179.995, 0),
	createObject(9131, 1171.6, -1329.9, 17.2, 90, 179.995, 359.978),
	createObject(1361, 1172.9, -1327.7, 15.1, 0, 0, 350.5),
	createObject(1361, 1172.9, -1319.8, 15.1, 0, 0, 0),
}





-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[77], true)
setElementDoubleSided(mapObjects[78], true)
setElementDoubleSided(mapObjects[83], true)
setElementDoubleSided(mapObjects[85], true)
setElementDoubleSided(mapObjects[152], true)
setElementDoubleSided(mapObjects[175], true)
setElementDoubleSided(mapObjects[181], true)
setElementDoubleSided(mapObjects[182], true)
setElementDoubleSided(mapObjects[183], true)
setElementDoubleSided(mapObjects[184], true)
setElementDoubleSided(mapObjects[185], true)
setElementDoubleSided(mapObjects[186], true)
setElementDoubleSided(mapObjects[187], true)
setElementDoubleSided(mapObjects[188], true)
setElementDoubleSided(mapObjects[189], true)
setElementDoubleSided(mapObjects[190], true)
setElementDoubleSided(mapObjects[191], true)
setElementDoubleSided(mapObjects[192], true)

-- Object Scale
---------------->>

setObjectScale(mapObjects[76], 1.1)
setObjectScale(mapObjects[129], 1.1)
setObjectScale(mapObjects[191], 0.9)
setObjectScale(mapObjects[192], 0.9)

-- Remove World Objects
------------------------>>

removeWorldModel(5737, 27.4957, 1120.156, -1303.453, 18.5703)
removeWorldModel(5935, 27.4957, 1120.156, -1303.453, 18.5703)
removeWorldModel(1294, 7.9697, 1115.171, -1286.589, 16.93)
removeWorldModel(1440, 3.6365, 1142.056, -1345.937, 13.524)
removeWorldModel(1440, 3.6365, 1148.4, -1384.653, 13.1999)