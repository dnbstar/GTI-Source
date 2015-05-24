upgrades = {
	names = {},
	prices = {},
}
modshops = {
	id = {}
}

local uiR, uiG, uiB = 0, 153, 255

function loadXMLUpgrades()
    local file_root = xmlLoadFile( "modding/moditems.xml")
    local sub_node = xmlFindChild( file_root, "item", 0)
    local i = 1
    while sub_node do
        upgrades.names[i] = xmlNodeGetAttribute( sub_node, "name")
        upgrades.prices[i] = xmlNodeGetAttribute( sub_node, "price")
        sub_node = xmlFindChild( file_root, "item", i)
        i = i + 1
    end
end

addEventHandler( "onResourceStart", resourceRoot,
	function()
		loadXMLUpgrades()
		for i, shop in ipairs ( shops) do
			local name = shop[1]
			local x, y, z = shop[2], shop[3], shop[4]

			--local blip = createBlip( x, y, z, blip_icon, 2, 255, 0, 0, 255, 0, 450)
			local marker = createMarker( x, y, z, "cylinder", 3.5, uiR, uiG, uiB, 100)
			modshops[name] = createColTube( x, y, z, 2.5, 3)
			modshops.id[modshops[name]] = name
			addEventHandler( "onColShapeHit", modshops[name], onModShopEnter)
		end
	end
)

function onModShopEnter( hitElement, matching)
	if isElement( hitElement) and getElementType( hitElement) == "player" and matching then
		if modshops.id[source] then
			outputChatBox( "Welcome to "..modshops.id[source].."!", hitElement, uiR, uiG, uiB)
		end
	end
end
