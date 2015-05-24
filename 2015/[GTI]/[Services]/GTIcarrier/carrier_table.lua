free_calls = {
	[911] = true,
}

carriers = {
	-- { Network ID, Network Name, Coverage (m[meters]*10), Parody, Average Cost Per Call}
	{ 0, "GT&I", "AT&T", 12, 10},
	{ 1, "Geronimo", "Verizon", 30, 9},
	{ 2, "G-Mobile", "T-Moble", 12, 3},
	{ 3, "SA Cellular", "US Cellular", 8, 4},
	{ 4, "Prone", "Sprint", 40, 5},
}

cell_tower_locations = {
	{ id = "A.A", pos = {1544.202, -1352.844, 328.475}, ids = { 0, 1, 4}, owner = { "#33CCFFGT&I", "#CC0000Geronimo", "#FFDC00Prone"}},
	{ id = "A.B", pos = {1184.728, -1415.599, 30.875}, ids = { 0}, owner = { "#33CCFFGT&I"}},
	{ id = "A.C", pos = {895.314, -1256.722, 48.762}, ids = { 1, 2, 3}, owner = { "#33CCFFGeronimo", "#EB009CG-Mobile", "#33CCFFSA Cellular"}},
}
