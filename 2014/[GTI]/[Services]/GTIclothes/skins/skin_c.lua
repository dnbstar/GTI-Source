local hats ={
	--{ "Name", "Texture", "Model", ID}
	{ "Red Bandana","bandred", "bandana", 16},
	{ "Blue Bandana","bandblue", "bandana", 16},
	{ "Green Bandana","bandgang", "bandana", 16},
	{ "Black Bandana","bandblack", "bandana", 16},
	{ "Red Bandana Front","bandred2", "bandknots", 16},
	{ "Blue Bandana Front","bandblue2", "bandknots", 16},
	{ "Green Bandana Front","bandgang2", "bandknots", 16},
	{ "Black Bandana Front","bandblack2", "bandknots", 16},
	{ "Green Knit Cap","capknitgrn", "capknit", 16},
	{ "Trucker Cap","captruck", "captruck", 16},
	{ "Cowboy Hat 1","cowboy", "cowboy", 16},
	{ "Cowboy Hat 2","hattiger", "cowboy", 16},
	{ "Red Motorbike Helmet","helmet", "helmet", 16},
	{ "Blue Motorbike Helmet","moto", "moto", 16},
	{ "Boxing Cap","boxingcap", "boxingcap", 16},
	{ "Hockey Mask","hockey", "hockeymask", 16},
	{ "Green Cap Front","capgang", "cap", 16},
	{ "Green Cap Back","capgangback", "capblack", 16},
	{ "Green Cap Side","capgangside", "capside", 16},
	{ "Green Cap Back 2","capgangover", "capovereye", 16},
	{ "Green Cap Up","capgangup", "caprimup", 16},
	{ "Biker Helmet","bikerhelmet", "bikerhelmet", 16},
	{ "Red Cap Front","capred", "cap", 16},
	{ "Red Cap Back","capredback", "capback", 16},
	{ "Red Cap Side","capredside", "capside", 16},
	{ "Red Cap Back 2","capredover", "capovereye", 16},
	{ "Red Cap Up","capredup", "caprimup", 16},
	{ "Blue Cap Front","capblue", "cap", 16},
	{ "Blue Cap Back","capblueback", "capback", 16},
	{ "Blue Cap Side","capblueside", "capside", 16},
	{ "Blue Cap Back 2","capblueover", "capovereye", 16},
	{ "Blue Cap Up","capblueup", "caprimup", 16},
	{ "Black Beanie","skullyblk", "skullycap", 16},
	{ "Green Beanie","skullygrn", "skullycap", 16},
	{ "Black Sunhat","hatmanblk", "hatmanc", 16},
	{ "Striped Sunhat","hatmancplaid", "hatmanc", 16},
	{ "Yellow Cap Front","capzip", "cap", 16},
	{ "Yellow Cap Back","capzipback", "capback", 16},
	{ "Yellow Cap Side","capzipside", "capside", 16},
	{ "Yellow Cap Back 2","capzipover", "capovereye", 16},
	{ "Red Cap Up","capzipup", "caprimup", 16},
	{ "Red Beret","beretred", "beret", 16},
	{ "Black Beret","beretblk", "beret", 16},
	{ "Black Beret","capblk", "cap", 16},
	{ "Black Cap Back","capblkback", "capback", 16},
	{ "Black Cap Side","capblkside", "capside", 16},
	{ "Black Cap Back 2","capblkover", "capovereye", 16},
	{ "Black Cap Up","capblkup", "caprimup", 16},
	{ "Dark Detective  Hat","trilbydrk", "trilby", 16},
	{ "Light Detective Hat","trilbylght", "trilby", 16},
	{ "Black Bowler","bowler", "bowler", 16},
	{ "Red Bowler","bowlerred", "bowler", 16},
	{ "Blue Bowler","bowlerblue", "bowler", 16},
	{ "Yellow Bowler","bowleryellow", "bowler", 16},
	{ "Boater Hat 1","boater", "boater", 16},
	{ "Green Bowler","bowlergang", "bowler", 16},
	{ "Boater Hat 2","boaterblk", "boater", 16}
}

local markers = {
	--{x, y, z, interior},
	{217.485, -98.763, 1005, 15},
}

    setTimer (
        function ( )
            for _,v in ipairs ( markers ) do
                local x, y, z, interior = unpack ( v )
                local markers = createMarker ( x, y, z, "cylinder", 1, 91, 204, 255, 255 )
                setElementInterior ( markers, interior )
                addEventHandler ( "onClientMarkerHit", markers, openClothesWindow, false )
				addEventHandler ( "onClientMarkerLeave", markers, closeClothesWindow, false )
            end
        end, 1000, 1
    )

    function openClothesWindow( hitElement )
        if getElementType(hitElement) == "player" and (hitElement == localPlayer) then
            if not guiGetVisible(clotheShopWindow) then
                guiSetVisible( clotheShopWindow, true )
                showCursor( true, true )
            end
        end
    end

    function closeClothesWindow( hitElement )
        if getElementType(hitElement) == "player" and (hitElement == localPlayer) then
            if not guiGetVisible(clotheShopWindow) then
                guiSetVisible( clotheShopWindow, false )
                showCursor( false, false )
            end
        end
    end

local screenW, screenH = guiGetScreenSize()
clotheShopWindow = guiCreateWindow((screenW - 804) / 2, (screenH - 478) / 2, 804, 478, "CRP - Binco | SubUrban | ProLaps | Zip | Victim | Didier Sachs", false)
guiWindowSetSizable(clotheShopWindow, false)

selectLabel = guiCreateLabel(9, 32, 785, 34, "Please select an apparel that you wish to try on or buy", false, clotheShopWindow)
guiLabelSetHorizontalAlign(selectLabel, "center", true)
guiLabelSetVerticalAlign(selectLabel, "center")
hatsGDList = guiCreateGridList(15, 76, 187, 352, false, clotheShopWindow)
guiGridListAddColumn(hatsGDList, "Hats", 0.9)
JeansGDList = guiCreateGridList(409, 76, 187, 352, false, clotheShopWindow)
guiGridListAddColumn(JeansGDList, "Jeans", 0.9)
shirtsGDList = guiCreateGridList(212, 76, 187, 352, false, clotheShopWindow)
guiGridListAddColumn(shirtsGDList, "Shirts", 0.9)
shoesGDList = guiCreateGridList(606, 76, 187, 352, false, clotheShopWindow)
guiGridListAddColumn(shoesGDList, "Shoes", 0.9)
goCJButton = guiCreateButton(15, 437, 93, 30, "Get CJ Skin", false, clotheShopWindow)
guiSetProperty(goCJButton, "NormalTextColour", "FFAAAAAA")
confirmBuyButton = guiCreateButton(690, 438, 103, 30, "Confirm Purchase", false, clotheShopWindow)
guiSetProperty(confirmBuyButton, "NormalTextColour", "FFAAAAAA")
