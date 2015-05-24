if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(968, -2436.899, 495.4004, 29.7, 0, 270, 205),
	createObject(968, -2436.899, 495.4004, 29.7, 0, 340, 204.999),
	createObject(16096, -2487.3, 522.8, 52, 0, 0, 180),
	createObject(3934, -2469.9, 523, 50.1, 0, 0, 0),
	createObject(2985, -2437.6, 516.9, 33.2, 0, 0, 280.25),
	createObject(1281, -2441.3, 538.3, 30, 0, 0, 0),
	createObject(1280, -2430.4, 537.8, 29.9, 0, 0, 0),
	createObject(3785, -2447.4, 519.4, 31.1, 0, 0, 0),
	createObject(3785, -2447.3, 526.8, 31.1, 0, 0, 0),
	createObject(8406, -2448, 522.3, 32.5, 0, 0, 90),
	createObject(10010, -2481.2, 490.6, 1.2, 0, 0, 270),
	createObject(1238, -2422.2, 518.2, 29.2, 0, 0, 0),
	createObject(16775, -2447.6, 524.9, 5.5, 0, 0, 90),
	createObject(1238, -2425.899, 514.7002, 29.2, 0, 0, 0),
	createObject(1238, -2418.9, 521.7, 29.2, 0, 0, 0),
	createObject(1238, -2414.1, 529.3, 29.2, 0, 0, 0),
	createObject(1238, -2416.2, 525.4004, 29.2, 0, 0, 0),
	createObject(1238, -2412.4, 533.2, 29.2, 0, 0, 0),
	createObject(1238, -2411.7, 537.7, 29.2, 0, 0, 0),
	createObject(1223, -2426.8, 523.4, 29.4, 0, 0, 299.75),
	createObject(1223, -2421.9, 529.5, 29.4, 0, 0, 321.746),
	createObject(1223, -2418.8, 536.7, 29.4, 0, 0, 355.49),
	createObject(3877, -2492.3, 535, 51.7, 0, 0, 0),
	createObject(1281, -2474.3, 496.3, 29.9, 0, 0, 0),
	createObject(3877, -2455.5, 511.4, 51.7, 0, 0, 0),
	createObject(11245, -2445.1, 516.6, 42.2, 0, 0, 0),
	createObject(11245, -2444.8, 529.6, 42.2, 0, 0, 0),
	createObject(2889, -2472.7, 509.1, 48.4, 0, 0, 2),
	createObject(2888, -2472.8, 509, 48.3, 322, 0, 184.25),
	createObject(2889, -2476.7, 536.7, 48.4, 0, 0, 0),
	createObject(2888, -2476.7, 536.5, 48, 335.248, 0, 16.246),
	createObject(2887, -2472.7, 509.1, 48.2, 322, 0, 182.75),
	createObject(2887, -2476.7, 536.4, 47.9, 335, 0, 16.246),
	createObject(3872, -2478.7, 543.3, 42.6, 0, 350, 286.25),
	createObject(3872, -2473, 503.4, 41.4, 0, 338.497, 82.999),
	createObject(3876, -2487.2, 530.6, 50.1, 0, 0, 0),
}





-- Double Sided
---------------->>

setElementDoubleSided(mapObjects[3], true)
setElementDoubleSided(mapObjects[5], true)
setElementDoubleSided(mapObjects[6], true)
setElementDoubleSided(mapObjects[7], true)
setElementDoubleSided(mapObjects[11], true)
setElementDoubleSided(mapObjects[13], true)
setElementDoubleSided(mapObjects[24], true)
setElementDoubleSided(mapObjects[28], true)
setElementDoubleSided(mapObjects[29], true)
setElementDoubleSided(mapObjects[30], true)
setElementDoubleSided(mapObjects[31], true)

-- Object Scale
---------------->>

setObjectScale(mapObjects[4], 1.2)
setObjectScale(mapObjects[10], 0.3)

-- Remove World Objects
------------------------>>

removeWorldModel(774, 26.7257, -2432.625, 538.5469, 29.3438)
removeWorldModel(778, 12.1402, -2428.453, 528.8516, 29.3359)
removeWorldModel(968, 5.5763, -2436.812, 495.4688, 29.6797)