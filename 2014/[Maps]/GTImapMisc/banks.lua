if (getElementData(root, "mapSecurity") ~= "G32MdAZtHJ9Ajmm9GkuvtFQh") then return end

local mapObjects = {
	createObject(14799, 357.4188, 165.6805, 1008.9442, 0, 0, 0),
	createObject(2942, 381.5944, 170.0375, 1008.0257, 0, 0, 180),
	createObject(2942, 383.2943, 170.0356, 1008.0257, 0, 0, 179.995),
	createObject(2942, 379.8551, 170.0684, 1008.0257, 0, 0, 179.995),
	createObject(3109, 367.2969, 189.6115, 1008.5744, 0, 0, 90),
	createObject(3109, 367.2969, 189.6113, 1010.9475, 0, 0, 90),
	createObject(16773, 382.4959, 162.7556, 1006.7202, 0, 0, 90),
	createObject(16773, 380.6528, 162.8344, 1006.7202, 0, 0, 90),
	createObject(16773, 382.4703, 184.7794, 1006.7202, 0, 0, 90),
	createObject(16773, 380.6343, 184.8128, 1006.7202, 0, 0, 90),
	createObject(2942, 383.2575, 177.6246, 1008.0257, 0, 0, 0),
	createObject(2942, 381.5272, 177.6767, 1008.0257, 0, 0, 0),
	createObject(2942, 379.8378, 177.6526, 1008.0257, 0, 0, 0),
	createObject(16773, 377.6754, 182.9026, 1006.7202, 0, 0, 90),
	createObject(16773, 377.6558, 164.6209, 1006.7202, 0, 0, 90),
	createObject(3294, 377.6654, 173.7621, 1013.0288, 0, 0, 0),
	createObject(16773, 350.4898, 170.1927, 1006.7202, 0, 0, 0),
	createObject(16773, 350.5136, 177.0121, 1006.7202, 0, 0, 0),
	createObject(16773, 350.5281, 185.8912, 1006.7202, 0, 0, 0),
	createObject(16773, 350.4123, 161.1706, 1006.7202, 0, 0, 0),
	createObject(14799, 357.5279, 181.5135, 1008.9442, 0, 0, 0),
	createObject(1209, 368.528, 164.6045, 1007.3828, 0, 0, 270),
	createObject(1776, 368.4523, 165.9407, 1008.4822, 0, 0, 270),
	createObject(2773, 362.7953, 159.1037, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 161.1344, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 163.4343, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 165.63, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 167.9486, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 170.2516, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 177.005, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 179.2195, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 181.5103, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 183.7596, 1007.9, 0, 0, 90),
	createObject(2773, 360.8104, 185.8709, 1007.9, 0, 0, 90),
	createObject(2773, 358.8645, 187.9579, 1007.9, 0, 0, 90),
	createObject(2773, 360.8056, 187.9656, 1007.9, 0, 0, 90),
	createObject(2773, 362.7258, 187.9287, 1007.9, 0, 0, 90),
	createObject(2773, 364.6302, 187.913, 1007.9, 0, 0, 90),
	createObject(2773, 363.6773, 184.9228, 1007.9, 0, 0, 0),
	createObject(2773, 362.7588, 185.9008, 1007.9, 0, 0, 90),
	createObject(2773, 363.6827, 182.9605, 1007.9, 0, 0, 0),
	createObject(2773, 363.6578, 180.999, 1007.9, 0, 0, 0),
	createObject(2773, 363.6322, 179.0407, 1007.9, 0, 0, 0),
	createObject(2773, 363.6378, 177.0787, 1007.9, 0, 0, 0),
	createObject(2773, 358.8736, 159.1432, 1007.9, 0, 0, 90),
	createObject(2773, 363.7296, 162.0683, 1007.9, 0, 0, 0),
	createObject(2773, 363.73, 164.0058, 1007.9, 0, 0, 0),
	createObject(2773, 363.73, 165.9587, 1007.9, 0, 0, 0),
	createObject(2773, 363.7301, 167.9191, 1007.9, 0, 0, 0),
	createObject(2773, 363.7299, 169.8654, 1007.9, 0, 0, 0),
	createObject(2773, 364.7218, 159.0874, 1007.9, 0, 0, 90),
	createObject(2773, 365.6216, 160.0828, 1007.9, 0, 0, 0),
	createObject(2773, 365.6181, 162.0322, 1007.9, 0, 0, 0),
	createObject(2773, 365.6144, 163.9697, 1007.9, 0, 0, 0),
	createObject(2773, 365.6113, 165.9189, 1007.9, 0, 0, 0),
	createObject(2773, 366.32, 167.5919, 1007.9, 0, 0, 135),
	createObject(2773, 362.7875, 161.1301, 1007.9, 0, 0, 90),
	createObject(2773, 365.5517, 186.9428, 1007.9, 0, 0, 0),
	createObject(2773, 365.5504, 184.9965, 1007.9, 0, 0, 0),
	createObject(2773, 365.5526, 183.035, 1007.9, 0, 0, 0),
	createObject(2773, 365.5389, 181.0883, 1007.9, 0, 0, 0),
	createObject(2773, 366.2133, 179.4029, 1007.9, 0, 0, 45),
	createObject(1318, 362.7493, 177.0718, 1007.343, 0, 90, 270),
	createObject(1318, 362.6547, 182.0373, 1007.343, 0, 90, 270),
	createObject(1318, 360.7286, 184.9473, 1007.343, 0, 90, 0),
	createObject(1318, 360.6559, 180.4098, 1007.343, 0, 90, 0),
	createObject(1318, 360.737, 166.8508, 1007.343, 0, 90, 0),
	createObject(1318, 360.7482, 162.2817, 1007.343, 0, 90, 0),
	createObject(1318, 364.6274, 165.9143, 1007.343, 0, 90, 270),
	createObject(1318, 364.5242, 160.1378, 1007.343, 0, 90, 270),
	createObject(1318, 365.774, 169.4376, 1007.343, 0, 90, 226),
	createObject(1318, 365.4037, 178.1472, 1007.343, 0, 90, 129.993),
	createObject(1318, 362.6642, 167.8778, 1007.343, 0, 90, 90),
	createObject(1318, 362.6573, 163.3528, 1007.343, 0, 90, 90),
	createObject(1318, 364.5772, 185.8509, 1007.343, 0, 90, 90),
	createObject(1318, 364.5615, 181.8645, 1007.343, 0, 90, 90),
	createObject(1318, 360.857, 160.0087, 1007.343, 0, 90, 180),
	createObject(1318, 361.5607, 186.9252, 1007.343, 0, 90, 179.995),
	createObject(1318, 358.5643, 179.143, 1007.343, 0, 90, 270),
	createObject(1318, 358.6249, 183.8536, 1007.343, 0, 90, 270),
	createObject(1318, 358.6266, 167.9938, 1007.343, 0, 90, 90),
	createObject(1318, 358.6317, 163.3084, 1007.343, 0, 90, 90),
}

for i,object in ipairs(mapObjects) do
	setObjectBreakable(object, false)
	setElementDoubleSided(object, true)
	setElementInterior(object, 3)
	setElementDimension(object, 143)
	for dim=150,151 do
		local model = getElementModel(object)
		local x,y,z = getElementPosition(object)
		local rx,ry,rz = getElementRotation(object)
		local object2 = createObject(model, x, y, z, rx, ry, rz)
		setObjectBreakable(object, false)
		setElementDoubleSided(object, true)
		setElementInterior(object2, 3)
		setElementDimension(object2, dim)
	end
end
