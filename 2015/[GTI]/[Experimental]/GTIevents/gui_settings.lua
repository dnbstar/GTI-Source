gui_tabs = {
	{ "Event Creation"},
	{ "Event Management"},
	{ "Event Actions"},
	{ "Object Placement"},
}

gui_gridlists = {
	{ 2, "Entities", 10, 10, 165, 275},
	{ 2, "Actions", 359, 35, 173, 243},
	{ 2, "Blips", 185, 147, 163, 102},
	{ 3, "Participants", 370, 44, 162, 274},
	{ 3, "Participant Actions", 10, 10, 166, 270},
	{ 4, "Objects", 10, 10, 190, 270},
}

entity_actions = {
	{ "Freeze Participants", "freeze_p"},
	{ "Disable Weapons", "disable_wep"},
	{ "Return Players", "return_p"},
	{ "Create Health Pickup", "create_hp"},
	{ "Create Armor Pickup", "create_ap"},
	{ "Freeze Event Vehicles", "freeze_v"},
	{ "Lock Event Vehicles", "lock_v"},
	{ "Toggle Damage-Proof Vehicles", "dmg_v"},
	{ "Toggle Vehicle Collisions", "toggle_collision"},
	{ "Destroy Event Vehicles", "destroy_v"},
	{ "Fix Event Vehicles", "fix_v"},
}

participant_actions = {
	--{ "Warp Player", },
	{ "Toggle Freeze", "freeze_p"},
	{ "Toggle Jetpack", "toggle_jet"},
	{ "Give Player Money", "exec;give_m"}, -- Min $5k Max $20k
	{ "Set Full HP", "set_hp"},
	{ "Set Full AP", "set_ap"},
	{ "Kick Player", "kick_p"},
	{ "Kill Player", "kill_p"},
}

objects = {
	["Fences/Barriers"] = {
		{1425, "Detour", 0},
		{1459, "Barrier", 0},
		{981, "Large roadblock", 0},
		{3578, "Yellow fence", 0},
		{1228, "Warning fence", 90},
		{1282, "Lighted Warning fence", 90},
		{1422, "Small fence", 0},
	},
	["Gates"] = {
		{10154, "Garage Door", 0},
		{980, "Airport Gate", 0},
	},
	["Ramps"] = {
		{1632, "Ramp 1", 0},
		{1633, "Ramp 2", 0},
		{1634, "Ramp 3", 0},
		{1655, "Ramp 4", 0},
		{8171, "Runway", 0},
	},
	["Misc"] = {
		{3458, "Car Covering", 0},
	},
}

ob_definitions = {
	-- Objects
	[3091] = "Vehicles",
	[1425] = "Detour",
	[1459] = "Barrier",
	[981] = "Large roadblock",
	[3578] = "Yellow fence",
	[1228] = "Warning fence",
	[1282] = "Lighted Warning fence",
	[1422] = "Small fence",
	[10154] = "Garage Door",
	[980] = "Airport Gate",
	[1632] = "Ramp 1",
	[1633] = "Ramp 2",
	[1634] = "Ramp 3",
	[1655] = "Ramp 4",
	[8171] = "Runway",
	[3458] = "Car Covering",
	-- Pickups
	[1240] = "HP Pickup",
	[1242] = "AP Pickup",
}

bl_def = {
	["01"] = "Marker Blip",
	["02"] = "Centre",
	["03"] = "Map here",
	["04"] = "North",
	["05"] = "Airyard",
	["06"] = "Gun",
	["07"] = "Barber",
	["08"] = "Big Smoke",
	["09"] = "Boatyard",
	["10"] = "Burger Shot",
	["11"] = "Bulldozer",
	["12"] = "Catelina",
	["13"] = "Cesar",
	["14"] = "Cluckin' Bell",
	["15"] = "CJ",
	["16"] = "Crash",
	["17"] = "Diner",
	["18"] = "Ammu Nation",
	["19"] = "Enemy Attack",
	["20"] = "Fire",
	["21"] = "Girlfriend",
	["22"] = "Hospital",
	["23"] = "Loco",
	["24"] = "Madd Dogg",
	["25"] = "Mafia",
	["26"] = "Mcstrap",
	["27"] = "Modshop",
	["28"] = "OG Loc",
	["29"] = "Pizza",
	["30"] = "Police",
	["31"] = "Property Green",
	["32"] = "Property Red",
	["33"] = "Race",
	["34"] = "Ryder",
	["35"] = "Safehouse",
	["36"] = "School",
	["37"] = "Mystery",
	["38"] = "Sweet",
	["39"] = "Tattoo Parlor",
	["40"] = "Truth",
	["41"] = "Waypoint",
	["42"] = "Toreno",
	["43"] = "Triads",
	["44"] = "Triads Casino",
	["45"] = "Clothing Store",
	["46"] = "Woozie",
	["47"] = "Zero",
	["48"] = "Disco",
	["49"] = "Drink",
	["50"] = "Food",
	["51"] = "Truck",
	["52"] = "Cash",
	["53"] = "Flag",
	["54"] = "Gym",
	["55"] = "Impound",
	["56"] = "Runway Light",
	["57"] = "Runway",
	["58"] = "Gang B",
	["59"] = "Gang P",
	["60"] = "Gang Y",
	["61"] = "Gang N",
	["62"] = "Gang G",
	["63"] = "Pay'N'Spray",
}

all_blips = {
}

for i = 1, 63 do
	if i < 10 then
		tb = "0"..i
	else
		tb = i
	end
	table.insert( all_blips, { model = tb, name = tb..".png"})
	table.sort( all_blips,
		function(a, b)
			return a.name < b.name
		end
	)
end

all_vehicles = {}

for i = 400, 609 do
	if ( getVehicleNameFromModel( i) ~= "") then
		table.insert( all_vehicles, { model = i, name = getVehicleNameFromModel( i)})
		table.sort( all_vehicles,
			function(a, b)
				return a.name < b.name
			end
		)
	end
end
