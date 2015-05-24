shopsBlips = {
	--Los Santos
	{2105.479, -1806.513, 13.554, "WSP"}, --Well Stacked Pizza(Idlewood, LS)
	{2397.749, -1898.438, 13.546, "CB"}, --Cluckin' Bell(Willowfield, LS)
	{2420.372, -1508.951, 24, "CB"}, --Cluckin' Bell(East LS, LS)
	{1200.413, -918.528, 43.112, "BS"}, --Burger Shot(Mulholland, LS)
	{810.830, -1616.094, 13.546, "BS"}, --Burger Shot(Marina, LS)
	{1038.270, -1340.133, 13.737, "RBRD"}, --Rusty Brown's Ring Donuts(Market, LS)
	{1176.936, -1437.629, 15.796, "BS"}, --Burger Shot(Market, LS)
	{1084.639, -1448.527, 21.742, "WSP"}, --Well Stacked Pizza(Market, LS)
	--[[
	{2309.620, -1643.629, 13.827, "NSL"}, --9/7 Liquor(Ganton, LS)
	{1836.900, -1681.75, 13.328, "NSL"}, --9/7 Liquor(Idlewood, LS)
	--]]
	--San Fierro
	{-2154.9873046875, -2460.41796875, 30.851, "CB"}, --Cluckin' Bell(Whetstone, SF)
	{-2336.1826171875, -166.779296875, 35.554, "BS"}, --Burger Shot(Garcia, SF)
	{-2672.449, 258.561, 4.632, "CB"}, --Cluckin' Bell(Ocean Flats, SF)
	{-1816.506, 617.286, 35.171, "CB"}, --Cluckin' Bell(Downtown, SF)
	{-1912.099, 828.147, 35.205, "BS"}, --Burger Shot(Downtown, SF)
	{-1808.0712, 945.398, 24.890, "WSP"}, --Well Stacked Pizza(Financial, SF)
	{-2356.808, 1008.071, 50.898, "BS"}, --Burger Shot(Juniper Hollow, SF)
	{-1721.782, 1359.757, 7.185, "WSP"}, --Well Stacked Pizza(Esplanade North, SF)
	{-2767.755, 788.823, 52.781, "RBRD"}, --Rusty Brown's Ring Donuts(Palisades, SF)
	--Las Venturas
	{-1213.416, 1830.782, 41.929, "CB"}, --Cluckin' Bell(Tierra Robada, LV)
	{172.791, 1176.790, 14.757, "CB"}, --Cluckin' Bell(Bone County, LV)
	{1158.207, 2072.208, 11.062, "BS"}, --Burger Shot(Whitewood Estates, LV)
	{1872.776, 2071.883, 11.062, "BS"}, --Burger Shot(Redsands East, LV)
	{2102.897, 2228.837, 11.023, "CB"}, --Cluckin' Bell(The Emerald Isle, LV)
	{2083.343, 2224.089, 11.0234, "WSP"}, --Well Stacked Pizza(The Emerald Isle, LV)
	{2351.811, 2532.613, 10.820, "WSP"}, --Well Stacked Pizza( Roca Escalante, LV)
	{2170.282, 2795.774, 10.820, "BS"}, --Burger Shot(Spinybed, LV)
	{2756.495, 2477.017, 11.062, "WSP"}, --Well Stacked Pizza( Creek, LV)
	{2846.290, 2414.998, 11.068, "CB"}, --Cluckin' Bell( Creek, LV)
	{2392.984, 2042.247, 10.820, "CB"}, --Cluckin' Bell( Old Venturas Strip, LV)
	{2366.213, 2070.998, 10.820, "BS"}, --Cluckin' Bell( Old Venturas Strip, LV)
	{2472.069, 2034.090, 11.062, "BS"}, --Cluckin' Bell( Old Venturas Strip, LV)
	{2637.850, 1849.898, 11.023, "WSP"}, --Well Stacked Pizza( Starfish Casino, LV)
	{2637.669, 1671.942, 11.023, "CB"}, --Cluckin' Bell( Starfish Casino, LV)
}

    setTimer (
        function ( )
            for _,v in ipairs ( shopsBlips ) do
                local x, y, z, shopName = unpack ( v )
				if shopName == "WSP" then
					createBlip( x, y, z, 29, 1, 255, 0, 0, 255, 0, 450)
				elseif shopName == "CB" then
					createBlip( x, y, z, 14, 1, 255, 0, 0, 255, 0, 450)
				elseif shopName == "BS" then
					createBlip( x, y, z, 10, 1, 255, 0, 0, 255, 0, 450)
				elseif shopName == "RBRD" then
					createBlip( x, y, z, 17, 1, 255, 0, 0, 255, 0, 450)
				elseif shopName == "NSL" then
					createBlip( x, y, z, 49, 1, 255, 0, 0, 255, 0, 450)
				end
            end
        end, 1000, 1
    )
