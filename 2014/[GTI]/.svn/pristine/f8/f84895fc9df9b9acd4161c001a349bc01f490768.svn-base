local screenW, screenH = guiGetScreenSize()

store = {
	window = {},
	logo = {},
	backdrop = {},
    gridlist = {},
    button = {},
    label = {}
}

--store.window[1] = guiCreateStaticImage((screenW - 715) / 2, (screenH - 540) / 2, 715, 540, "images/panel.png", false)
store.window[1] = guiCreateStaticImage( 10, (screenH - 540) / 2, 715, 540, "images/panel.png", false)
guiSetProperty(store.window[1], "ImageColours", "tl:FF585858 tr:FF585858 bl:FF585858 br:FF585858")

store.logo[1] = guiCreateStaticImage(13, 42, 676, 100, "images/logo.png", false, store.window[1])
store.backdrop[1] = guiCreateStaticImage(0, 128, 715, 361, "images/backdrop.png", false, store.window[1])
guiSetVisible( store.window[1], false)

--store.gridlist[1] = guiCreateGridList(17, 142, 672, 337, false, store.window[1])
store.gridlist[1] = guiCreateGridList(18, 11, 670, 336, false, store.backdrop[1])
itemColumn = guiGridListAddColumn(store.gridlist[1], "Item", 0.65)
costColumn = guiGridListAddColumn(store.gridlist[1], "Cost", 0.2)
hpColumn = guiGridListAddColumn(store.gridlist[1], "HP", 0.05)

store.button[1] = guiCreateStaticImage(585, 489, 110, 35, "images/button.png", false, store.window[1])
store.label[1] = guiCreateLabel(6, 6, 98, 23, "Buy", false, store.button[1])

store.button[2] = guiCreateStaticImage(465, 489, 110, 35, "images/button.png", false, store.window[1])
store.label[2] = guiCreateLabel(5, 5, 99, 24, "Close", false, store.button[2])

local font = guiCreateFont("font.ttf")
for _, v in ipairs (store.label) do
	guiSetAlpha( v, 1)
	guiSetFont( v, font)
	guiLabelSetColor( v, 127, 127, 127)
	guiLabelSetHorizontalAlign( v, "center", true)
	guiLabelSetVerticalAlign( v, "center")
end

local shops = {
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 111, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 112, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 113, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 114, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 115, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 116, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 117, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 118, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 119, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 120, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	{ pos = {370.808, -6.492, 1000.958}, int = 9, dim = 121, shopName = "Cluckin Bell", image = "logo_cbell.png", matrix = {371.444, -4.449, 1002.671, 372.405, 87.323, 962.963}, obj = {371.800, -3.5, 1001.900}},
	--
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 122, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 123, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 124, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 125, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 126, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 127, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 128, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 129, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 130, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {376.515, -68.144, 1000.615}, int = 10, dim = 131, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {375.853, -58.505, 1002.200, 376.360, 38.220, 976.829}, obj = {376.5, -57.200, 1001.550}},
	{ pos = {1176.936, -1437.629, 14.796}, int = 0, dim = 0, shopName = "Burger Shot", image = "logo_bshot.png", matrix = {1181.466, -1445.734, 16.540, 1272.819, -1444.750, -24.126}, obj = {1182.400, -1446.400, 16}}, --Outside
	--
	{ pos = {374.750, -119.163, 1000.499}, int = 5, dim = 132, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {378.147, -119.458, 1002.102, 382.264, -21.218, 983.882}, obj = {378.8, -118, 1001.599}},
	{ pos = {374.750, -119.163, 1000.499}, int = 5, dim = 133, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {378.147, -119.458, 1002.102, 382.264, -21.218, 983.882}, obj = {378.8, -118, 1001.599}},
	{ pos = {374.750,  -119.163, 1000.499}, int = 5, dim = 134, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {378.147, -119.458, 1002.102, 382.264, -21.218, 983.882}, obj = {378.8, -118, 1001.599}},
	{ pos = {374.750, -119.163, 1000.499}, int = 5, dim = 135, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {378.147, -119.458, 1002.102, 382.264, -21.218, 983.882}, obj = {378.8, -118, 1001.599}},
	{ pos = {374.750, -119.163, 1000.499}, int = 5, dim = 136, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {378.147, -119.458, 1002.102, 382.264, -21.218, 983.882}, obj = {378.8, -118, 1001.599}},
	{ pos = {374.750, -119.163, 1000.499}, int = 5, dim = 137, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {378.147, -119.458, 1002.102, 382.264, -21.218, 983.882}, obj = {378.8, -118, 1001.599}},
	{ pos = {374.750, -119.163, 1000.499}, int = 5, dim = 138, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {378.147, -119.458, 1002.102, 382.264, -21.218, 983.882}, obj = {378.8, -118, 1001.599}},
	{ pos = {1084.639, -1448.527, 21.742}, int = 0, dim = 0, shopName = "Well Stacked Pizza", image = "logo_pizza.png", matrix = {1080.263, -1450.839, 23.737, 983.027, -1451.320, 0.397}, obj = {1078.490, -1450.336, 22.652}}, --Outside
	--
	{ pos = {380.922, -190.921, 999.732}, int = 17, dim = 139, shopName = "Rusty Brown Ring Donuts", image = "logo_donut.png", matrix = {378.082, -184.050, 1002.057, 474.152, -188.551, 974.666}, obj = {379.899, -184.699, 1001.399}},
	{ pos = {380.922, -190.921, 999.732}, int = 17, dim = 140, shopName = "Rusty Brown Ring Donuts", image = "logo_donut.png", matrix = {378.082, -184.050, 1002.057, 474.152, -188.551, 974.666}, obj = {379.899, -184.699, 1001.399}},
	--
	--{ pos = {498.335, -75.353, 997.757}, int = 11, dim = 0, shopName = "9/7 Liquor", image = "logo_liquor.png", matrix = {499.175, -77.196, 1000.127, 495.641, -175.160, 980.365}, obj = {498.013, -79.690, 998.975}},
	--{ pos = {499.257, -20.690, 999.679}, int = 17, dim = 0, shopName = "9/7 Liquor", image = "logo_liquor.png", matrix = {502.548, -22.740, 1001.255, 402.586, -20.211, 1000.208}, obj = {500.702, -22.225, 1000.726}},
}

items = {
	['Burger Shot'] = {
		{ objectid = 2212, cost = 10, hp = 20, name = "Deluxe Shot - Large Burger & Fries, Large Drink, Small Desert", file = "bshot", rgb = {164, 41, 41}},
		{ objectid = 2214, cost = 5, hp = 10, name = "Medium Shot - Medium Burger & Fries, Medium Drink, Small Desert", file = "bshot", rgb = {164, 41, 41}},
		{ objectid = 2213, cost = 2, hp = 5, name = "Little Shot - Small Meal Box, Small Drink, Small Desert", file = "bshot", rgb = {164, 41, 41}},
		--{ objectid = 2663, cost = 15, hp = 5, name = "Bagged Shot - Medium Burger & Fries", file = "bshot", rgb = {164, 41, 41}},
		{ objectid = 2354, cost = 2, hp = 2.5, name = "Healthy Shot - Regular Wing Salad & Regular Drink & Desert", file = "bshot", rgb = {164, 41, 41}},
	},
	['Cluckin Bell'] = {
		{ objectid = 2217, cost = 10, hp = 20, name = "Cluckin' Jumbo - Deluxe Burger, Large Wing Bucket & Fries, Large Drink", file = "cbell", rgb = {88, 88, 88}},
		{ objectid = 2216, cost = 5, hp = 10, name = "Cluckin' Medium - Medium Burger & Fried, Medium Chicken Burrito & Drink", file = "cbell", rgb = {88, 88, 88}},
		{ objectid = 2215, cost = 2, hp = 5, name = "Cluckin' Small - Small Meal Box & Fries, Small Drink", file = "cbell", rgb = {88, 88, 88}},
		{ objectid = 2353, cost = 2, hp = 2.5, name = "Cluckin' Healthy - Small Salad, Regular Chicken Burrito", file = "cbell", rgb = {88, 88, 88}},
		{ objectid = 2768, cost = 1, hp = 2.5, name = "Cluckin' Burger - Medium Burger", file = "cbell", rgb = {88, 88, 88}},
	},
	['Well Stacked Pizza'] = {
		{ objectid = 2220, cost = 10, hp = 20, name = 'Double Stacker - Large 12" Pizza, Large Drink & Fries', file = "pizza", rgb = {154, 53, 53}},
		{ objectid = 2219, cost = 5, hp = 10, name = 'Medium Stacker - Pizza Slice, Medium Wing Salad, Medium Fries & Drink', file = "pizza", rgb = {154, 53, 53}},
		--{ objectid = 2355, cost = 50, hp = 2.5, name = 'Stacker Box - Large 12" Pizza', file = "pizza", rgb = {154, 53, 53}},
		{ objectid = 2814, cost = 25, hp = 2.5, name = 'Stacker Box - Large 12" Pizza', file = "pizza", rgb = {154, 53, 53}},
		{ objectid = 2218, cost = 2, hp = 5, name = 'Little Stacker - Pizza Slice, Small Fries & Drink', file = "pizza", rgb = {154, 53, 53}},
		{ objectid = 2355, cost = 2, hp = 2.5, name = 'Healthy Stacker - Regular Wing Salad & Drink', file = "pizza", rgb = {154, 53, 53}},
	},
	['Rusty Brown Ring Donuts'] = {
		{ objectid = 2222, cost = 25, hp = 20, name = "Double Ringer - Large Coffee, 4 Large Glazed'n'Regular Donuts, Large Bagel", file = "donut", rgb = {237, 119, 205}},
		{ objectid = 2223, cost = 10, hp = 10, name = "Medium Ringer - 1 Medium Coffee, 4 Medium Glazed Donuts, 1 Medium Bagel", file = "donut", rgb = {237, 119, 205}},
		{ objectid = 2221, cost = 5, hp = 5, name = "Regular Ringer - Reguler Coffee & Muffin, Small Bagel", file = "donut", rgb = {237, 119, 205}},
		{ objectid = 2342, cost = 2, hp = 2.5, name = "Little Ringer - Regular Coffee", file = "donut", rgb = {237, 119, 205}},
	},
	--[[
	['9/7 Liquor'] = {
		{ objectid = 2647, cost = 100, hp = 0, name = "Soda", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1486, cost = 100, hp = 0, name = "Light Beer (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1543, cost = 100, hp = 0, name = "Pissh Beer (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1544, cost = 100, hp = 0, name = "Beer (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1666, cost = 100, hp = 0, name = "Light Beer (Glass)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1666, cost = 100, hp = 0, name = "Pissh Beer (Glass)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1950, cost = 100, hp = 0, name = "Pisswauser Beer (Glass)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1951, cost = 100, hp = 0, name = "KB Beer (Glass)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1487, cost = 100, hp = 0, name = "White Wine (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1664, cost = 100, hp = 0, name = "Red Wine (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1667, cost = 100, hp = 0, name = "Red Wine (Glass)", file = "liquor", rgb = {129, 180, 126}},
		--{ objectid = 1488, cost = 100, hp = 0, name = "Rum (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1512, cost = 100, hp = 0, name = "Whiskey (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1517, cost = 100, hp = 0, name = "Whiskey (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1520, cost = 100, hp = 0, name = "Whiskey (Bottle)", file = "liquor", rgb = {129, 180, 126}},
		{ objectid = 1668, cost = 100, hp = 0, name = "Vodka (Bottle)", file = "liquor", rgb = {129, 180, 126}},
	},
	--]]
}

local btnColors = {
	['Burger Shot'] = "164;41;41",
	['Cluckin Bell'] = "224;189;28",
	['Well Stacked Pizza'] = "154;53;53",
	['Rusty Brown Ring Donuts'] = "237;119;205",
	['9/7 Liquor'] = "129;180;126",
}

shopType = {}
shopImg = {}
foodPrice = {}
itemLoc = {}

function createShops()
	for i,v in pairs (shops) do
		local x, y, z, interior, dimension = v.pos[1], v.pos[2], v.pos[3], v.int, v.dim
		local oX, oY, oZ = v.obj[1], v.obj[2], v.obj[3]
		local iX, iY, iZ, i1X, i1Y, i1Z = v.matrix[1], v.matrix[2], v.matrix[3], v.matrix[4], v.matrix[5], v.matrix[6]
		--
		local color = split(btnColors[v.shopName], string.byte( ";"))
		local r, g, b = color[1], color[2], color[3]
		--
		local marker = createMarker( x, y, z, "cylinder", 1.25, r, g, b, 150)
		local col = createColTube( x, y, z, 0.75, 1.75)
		shopType[col] = v.shopName
		shopImg[col] = v.image
		itemLoc[col] = oX..";"..oY..";"..oZ..";"..iX..";"..iY..";"..iZ..";"..i1X..";"..i1Y..";"..i1Z..";"..interior
		setElementInterior( marker, interior)
		setElementDimension( marker, dimension)
		addEventHandler( "onClientColShapeHit", col, enteredShop)
	end
end
addEventHandler("onClientResourceStart", resourceRoot, createShops)

cshop = false

function enteredShop(element, matchDim)
	if (element ~= localPlayer) then return end
	if (isPedInVehicle(element)) then return end
	guiGridListClear(store.gridlist[1])
	foodPrice = {}
	cshop = source
	local int = getElementInterior( element)
	local sName = shopType[source]
	--
	local iO = split(itemLoc[source], string.byte( ";"))
	local miX, miY, miZ, moX, moY, moZ, molX, molY, molZ, mInt = iO[1], iO[2], iO[3], iO[4], iO[5], iO[6], iO[7], iO[8], iO[9], iO[10]
	--
	if sName == "Well Stacked Pizza" then
		--pX, pY, pZ, pInt, pDim = 378.8, -118, 1001.599, 5, getElementDimension( localPlayer)
		pX, pY, pZ, pInt, pDim = miX, miY, miZ, mInt, getElementDimension( localPlayer)
		rotX, rotY = 334.918, 24.933
		--
		--x, y, z, lX, lY, lZ = 378.147, -119.458, 1002.102, 382.264, -21.218, 983.882
		x, y, z, lX, lY, lZ = moX, moY, moZ, molX, molY, molZ
	elseif sName == "Burger Shot" then
		--pX, pY, pZ, pInt, pDim = 376.5, -57.200, 1001.550, 10, getElementDimension( localPlayer)
		pX, pY, pZ, pInt, pDim = miX, miY, miZ, mInt, getElementDimension( localPlayer)
		rotX, rotY = 334.918, 24.933
		--
		--x, y, z, lX, lY, lZ = 375.853, -58.505, 1002.200, 376.360, 38.220, 976.829
		x, y, z, lX, lY, lZ = moX, moY, moZ, molX, molY, molZ
	elseif sName == "Cluckin Bell" then
		--pX, pY, pZ, pInt, pDim = 371.800, -3.5, 1001.900, 9, getElementDimension( localPlayer)
		pX, pY, pZ, pInt, pDim = miX, miY, miZ, mInt, getElementDimension( localPlayer)
		rotX, rotY = 334.918, 24.933
		--
		--x, y, z, lX, lY, lZ = 371.444, -4.449, 1002.671, 372.405, 87.323, 962.963
		x, y, z, lX, lY, lZ = moX, moY, moZ, molX, molY, molZ
	elseif sName == "Rusty Brown Ring Donuts" then
		--pX, pY, pZ, pInt, pDim = 379.899, -184.699, 1001.399, 17, getElementDimension( localPlayer)
		pX, pY, pZ, pInt, pDim = miX, miY, miZ, mInt, getElementDimension( localPlayer)
		rotX, rotY = 0, 0
		--
		--x, y, z, lX, lY, lZ = 378.082, -184.050, 1002.057, 474.152, -188.551, 974.666
		x, y, z, lX, lY, lZ = moX, moY, moZ, molX, molY, molZ
	elseif sName == "9/7 Liquor" then
		--pX, pY, pZ, pInt, pDim = 379.899, -184.699, 1001.399, 17, getElementDimension( localPlayer)
		pX, pY, pZ, pInt, pDim = miX, miY, miZ, mInt, getElementDimension( localPlayer)
		rotX, rotY = 0, 0
		--
		--x, y, z, lX, lY, lZ = 378.082, -184.050, 1002.057, 474.152, -188.551, 974.666
		x, y, z, lX, lY, lZ = moX, moY, moZ, molX, molY, molZ
	end
	--
	for name, category in pairs (items) do
		--local row = guiGridListAddRow(store.gridlist[1])
		--guiGridListSetItemText(store.gridlist[1], row, 1, name, true, false)
		if sName == name then
			for index, exp in pairs (category) do
				local row = guiGridListAddRow(store.gridlist[1])
				local nPrice = formatNumber(exp.cost)
				local r, g, b = exp.rgb[1], exp.rgb[2], exp.rgb[3]
				foodPrice[exp.objectid] = exp.price
				guiGridListSetItemText(store.gridlist[1], row, itemColumn, exp.name, false, false)
				guiGridListSetItemText(store.gridlist[1], row, costColumn, tostring("$"..nPrice), false, false)
				guiGridListSetItemText(store.gridlist[1], row, hpColumn, exp.hp, false, false)
				guiGridListSetItemData(store.gridlist[1], row, itemColumn, exp.objectid)
				guiGridListSetItemData(store.gridlist[1], row, costColumn, exp.cost)
				guiGridListSetItemData(store.gridlist[1], row, hpColumn, exp.hp)
				guiGridListSetItemColor( store.gridlist[1], row, itemColumn, r, g, b)
				guiGridListSetItemColor( store.gridlist[1], row, costColumn, r, g, b)
				guiGridListSetItemColor( store.gridlist[1], row, hpColumn, r, g, b)
			end
		end
	end
	--
	guiStaticImageLoadImage( store.logo[1], "images/"..shopImg[source])
	guiSetVisible(store.window[1], true)
	showCursor(true)
	setElementInterior( element, mInt)
	setCameraMatrix( x, y, z, lX, lY, lZ)
end

local rotationBlocks = {
	[1486] = true,
	[1664] = true,
	--
	[2814] = true,
	[2663] = true,
	[2768] = true,
}

function updateRotation()
	if (not isElement(previewItem)) then removeEventHandler("onClientPreRender", root, updateRotation) timer = nil return end
	local _, _, crot = getElementRotation(previewItem)
	local model = getElementModel(previewItem)
	local pX, pY, pZ = getElementPosition(previewItem)
	--
	local tick = getTickCount() / 100
	local hover = math.cos(tick) * 1.5
	setElementPosition( previewItem, pX, pY, pZ+(hover/1000))
	--
	if not rotationBlocks[model] then
		--setElementRotation(previewItem, rotX, rotY, crot + 0.2)
	else
		--setElementRotation(previewItem, 0, 0, crot + 0.2)
	end
end

addEventHandler( "onClientMouseEnter", root,
	function()
		if source == store.label[1] then
			local shop = shopType[cshop]
			local color = split(btnColors[shop], string.byte( ";"))
			local r, g, b = color[1], color[2], color[3]
			--
			guiLabelSetColor( source, r, g, b)
		elseif source == store.label[2] then
			local shop = shopType[cshop]
			local color = split(btnColors[shop], string.byte( ";"))
			local r, g, b = color[1], color[2], color[3]
			--
			guiLabelSetColor( source, r, g, b)
		end
	end
)

addEventHandler( "onClientMouseLeave", root,
	function()
		if source == store.label[1] then
			guiLabelSetColor( source, 127, 127, 127)
		elseif source == store.label[2] then
			guiLabelSetColor( source, 127, 127, 127)
		end
	end
)

-- Player Interaction Rendering

--Replacements
addEventHandler("onClientResourceStart", resourceRoot,
	function()
		local puke = engineLoadDFF("puke.dff",0)
		engineReplaceModel(puke,928)
		--
		local hdd = engineLoadDFF("replacements/summing.dff",0)
		local hdt = engineLoadTXD("replacements/melrose12_lawn.txd")
		engineImportTXD( hdt,2703)
		engineReplaceModel( hdd, 2703)
	end
)
--

--[[Food Attachments
	Pizza: 2881
	Burger: 2880
	Donut: 2703
	Can: 2601
	Vomit/Puke: 928
--]]

function destroyFoodElement( theElement, theTimer)
	eatTimer[theTimer] = nil
	exports.bone_attach:detachElementFromBone( theElement)
	if not exports.bone_attach:isElementAttachedToBone( theElement) then
		if isElement( theElement) then
			destroyElement( theElement)
		end
	end
end

eatTimer = {}

function eatFood( food, int, dim)
	--local x, y, z = getElementPosition( localPlayer)
	if food == "bs" then
		--Burger
		if not isTimer( eatTimer['eat']) then
			bgr = createObject( 2880, 0, 0, 0)
			--
			setElementInterior( bgr, int)
			setElementDimension( bgr, dim)
			--
			exports.bone_attach:attachElementToBone(bgr, localPlayer, 12, 0, 0, 0, 0, -90, 0)
			setPedAnimation( localPlayer, "FOOD", "EAT_Burger", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer( destroyFoodElement, 3750, 1, bgr, 'eat')
		end
	elseif food == "cb" then
		--Chicken
		if not isTimer( eatTimer['eat']) then
			ckn = createObject( 2880, 0, 0, 0)
			--
			setElementInterior( ckn, int)
			setElementDimension( ckn, dim)
			--
			exports.bone_attach:attachElementToBone(ckn, localPlayer, 12, 0, 0, 0, 0, -90, 0)
			setPedAnimation( localPlayer, "FOOD", "EAT_Burger", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer( destroyFoodElement, 3750, 1, ckn, 'eat')
		end
	elseif food == "wsp" then
		--Pizza
		if not isTimer( eatTimer['eat']) then
			pza = createObject( 2881, 0, 0, 0)
			--
			setElementInterior( pza, int)
			setElementDimension( pza, dim)
			--
			exports.bone_attach:attachElementToBone(pza, localPlayer, 12, -0.050, 0.125, -0.050, 0, -85, 270)
			setPedAnimation( localPlayer, "FOOD", "EAT_Pizza", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer( destroyFoodElement, 4750, 1, pza, 'eat')
		end
	elseif food == "can" then
		--Can
		if not isTimer( eatTimer['eat']) then
			can1 = createObject( 2601, 0, 0, 0)
			--
			setElementInterior( can1, int)
			setElementDimension( can1, dim)
			--
			exports.bone_attach:attachElementToBone(can1, localPlayer, 11, 0, 0.0535, 0.0850, 0, 85, 0)
			setPedAnimation( localPlayer, "VENDING", "VEND_Drink2_P", 1500, false, false, false, false)
			eatTimer['eat'] = setTimer( destroyFoodElement, 1450, 1, can1, 'eat')
		end
	elseif food == "donut" then
		--Donut
		if not isTimer( eatTimer['eat']) then
			dnt = createObject( 2703, 0, 0, 0)
			setObjectScale( dnt, 0.2)
			--
			setElementInterior( dnt, int)
			setElementDimension( dnt, dim)
			--
			exports.bone_attach:attachElementToBone(dnt, localPlayer, 12, 0.08, -0.075, -0.075, 0, -90, 0)
			setPedAnimation( localPlayer, "FOOD", "EAT_Pizza", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer( destroyFoodElement, 4750, 1, dnt, 'eat')
		end
	elseif food == "vomit" then
		--Vomit
		if not isTimer( eatTimer['eat']) then
			setPedAnimation( localPlayer, "FOOD", "EAT_Vomit_P", 5000, false, false, false, false)
			setTimer( vomit, 3950, 1, int, dim)
			eatTimer['eat'] = setTimer( destroyFoodElement, 3950, 1, vt, 'eat')
		end
	end
end

function buyFood( name, health, cost)
	if name and cost then
		triggerServerEvent( "GTIstores.setFeature", localPlayer, "buy", name, health, cost)
	end
end

function vomit( int, dim)
	vt = createObject( 928, 0, 0, 0)
	--
	setElementInterior( vt, int)
	setElementDimension( vt, dim)
	--
	exports.bone_attach:attachElementToBone( vt, localPlayer, 1, 0, 0, 0.0150, 0, 0, 185)
end

--GUI Element Clicking

anim_convert = {
	--Burger Shot
	[2212] = 'bs',
	[2213] = 'bs',
	[2214] = 'bs',
	[2354] = 'bs',
	--Cluckin' Bell
	[2215] = 'cb',
	[2216] = 'cb',
	[2217] = 'cb',
	[2353] = 'cb',
	[2768] = 'cb',
	--Well Stacked Pizza
	[2218] = 'wsp',
	[2219] = 'wsp',
	[2220] = 'wsp',
	[2355] = 'wsp',
	[2814] = 'wsp',
	--Rusty Brown's Ring Donuts
	[2221] = 'donut',
	[2222] = 'donut',
	[2223] = 'donut',
	[2342] = 'can',
}

addEventHandler( "onClientGUIClick", root,
	function()
		if source == store.label[1] then
			if localPlayer then
				if guiGetVisible( store.window[1]) == true then
					setCameraTarget( localPlayer)
					guiSetVisible(store.window[1], false)
					showCursor(false)
					if isElement( previewItem) then
						destroyElement( previewItem)
						timer = nil
						removeEventHandler("onClientPreRender", root, updateRotation)
					end
					local selectedRow, selectedCol = guiGridListGetSelectedItem(store.gridlist[1])
					local itemName = guiGridListGetItemText( store.gridlist[1], selectedRow, selectedCol)
					local itemID = guiGridListGetItemData( store.gridlist[1], selectedRow, selectedCol)
					local itemHP = guiGridListGetItemData( store.gridlist[1], selectedRow, hpColumn)
					local itemCost = guiGridListGetItemData( store.gridlist[1], selectedRow, costColumn)
					local perform = anim_convert[itemID]
					if perform then
						local money = getPlayerMoney( localPlayer)
						if money ~= 0 and money > 0 and money >= itemCost then
							eatFood( perform, pInt, pDim)
						end
					end
					buyFood( itemName, itemHP, itemCost)
				end
			end
		elseif source == store.label[2] then
			if localPlayer then
				if guiGetVisible( store.window[1]) == true then
					setCameraTarget( localPlayer)
					guiSetVisible(store.window[1], false)
					showCursor(false)
					if isElement( previewItem) then
						destroyElement( previewItem)
						timer = nil
						removeEventHandler("onClientPreRender", root, updateRotation)
					end
				end
			end
		elseif source == store.gridlist[1] then
			local selectedRow, selectedCol = guiGridListGetSelectedItem(store.gridlist[1])
			local itemName = guiGridListGetItemText( store.gridlist[1], selectedRow, selectedCol)
			local itemID = guiGridListGetItemData( store.gridlist[1], selectedRow, selectedCol)
			if not itemName then return end
			if not itemID then return end
			if isElement(previewItem) then
				destroyElement(previewItem)
				timer = nil
				removeEventHandler("onClientPreRender", root, updateRotation)
			end
			--
			local shop = shopType[cshop]
			local color = split(btnColors[shop], string.byte( ";"))
			local r, g, b = color[1], color[2], color[3]
			if shop ~= "9/7 Liquor" then
				previewItem = createObject(itemID, pX, pY, pZ+0.100)
				fxAddGlass( pX, pY, pZ+0.100, r-20, g-20, b-20, 200, 0.025, 50)
				fxAddDebris( pX, pY, pZ+0.100, r, g, b, 200, 0.025, 100)
			elseif shop == "9/7 Liquor" then
				previewItem = createObject(itemID, pX, pY, pZ+0.600)
				--fxAddFootSplash( pX, pY, pZ+0.600)
				fxAddBulletImpact( pX, pY, pZ+0.600, 0, 0, 1, 3, 0, 1)
			end
			--
			setElementInterior( previewItem, pInt)
			setElementDimension( previewItem, pDim)
			setElementDoubleSided( previewItem, true)
			if not rotationBlocks[getElementModel( previewItem)] then
				if shop ~= "9/7 Liquor" then
					setElementRotation( previewItem, rotX, rotY, 0)
				elseif shop == "9/7 Liquor" then
					setElementRotation( previewItem, rotX, rotY, 180)
				end
			end
			timer = addEventHandler("onClientPreRender", root, updateRotation)
		end
	end
)

function formatNumber(v)
	v = tonumber(v)
	if v then
		local s = string.format("%d", math.floor(v))
		local pos = string.len(s) % 3
		if pos == 0 then pos = 3 end
		return string.sub(s, 1, pos)
			.. string.gsub(string.sub(s, pos+1), "(...)", ",%1")
	else
		return false
	end
end
