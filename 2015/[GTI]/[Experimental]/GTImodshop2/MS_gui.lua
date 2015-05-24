local screenWidth, screenHeight = guiGetScreenSize()

local shopGUI = {buttons = {}}
local upgradeGUI = {}
local upgWidth = 230
local shopWidth = 170
local movingSpeed = 30

local hideSubToo = false
local hideMain = false
local mainWindowIsMoving = false
local shoNewSub = false

local moddingVeh = nil
local currUpgrades = nil
local currColors = {}
local tempColors = {}
local shopEnteredName = nil

local colorSet = {}
local paintjobSet = false
local upgradeChanged = {}
local newUpgrades = {}

addEvent("onClientPlayerEnterModShop", true)
addEventHandler("onClientPlayerEnterModShop", root,
function(vehicle, money, shopname)
	if (localPlayer ~= source) then return end
	moddingVeh = vehicle
	hideAllButtonsInMainWnd()
	showUpgradeButtons()
	upgradeChanged = {}
	newUpgrades = {}
	exports.GTIhud:dm( "You have entered "..shopname.." mod shop.", 255, 255, 0)
	emptyShoppingCart()
	guiSetText(shoppingCostLbl, "0")
	shopEnteredName = shopname

	local colors = {getVehicleColor(vehicle, true)}
	colors[1] = colors[1] or 0
	colors[2] = colors[2] or 0
	colors[3] = colors[3] or 0
	colors[4] = colors[4] or 0
	colors[5] = colors[5] or 0
	colors[6] = colors[6] or 0
	currColors = colors
	tempColors[1], tempColors[2], tempColors[3], tempColors[4], tempColors[5], tempColors[6] = currColors[1], currColors[2], currColors[3], currColors[4], currColors[5], currColors[6]
	currUpgrades = getVehicleUpgrades(vehicle)

	for k, id in ipairs(currUpgrades) do
		upgradeChanged[getVehicleUpgradeSlotName(id)] = false
	end

	paintjob = getVehiclePaintjob(vehicle)
	showCursor(true)
	hideAllButtonsInMainWnd()
	showUpgradeButtons()
	guiSetText(shopGUI.wnd, shopname)
	guiSetVisible(cartWnd, true)
	addEventHandler("onClientRender", root, showShopWindow)
	addEventHandler("onClientRender", root, rotateCameraAroundPlayer)
	addEventHandler("onClientPlayerWasted", localPlayer, function() exitButtonClicked("right") end)
end )

function start()
	loadItems()
	local buttonHeight = 23
	local btns = 3

	cartWnd = guiCreateWindow(5, screenHeight - 320, 120, 150, "Cart", false)
		guiWindowSetSizable(cartWnd, false)
		guiCreateStaticImage(10, 20, 100, 100, "cart.png", false, cartWnd)
		guiCreateButton(10, 121, 110, 19, "", false, cartWnd)
	costsLbl = guiCreateLabel(10, 121, 110, 20, " Costs:  $", false, cartWnd)
	shoppingCostLbl = guiCreateLabel(10, 122, 95, 20, "0", false, cartWnd)
		guiSetFont(shoppingCostLbl, "default-bold-small")
		guiLabelSetHorizontalAlign(shoppingCostLbl, "right")
		guiLabelSetColor(shoppingCostLbl, 0, 255, 0)
	guiSetVisible(cartWnd, false)

	shopGUI.wnd = guiCreateWindow(screenWidth + 2, screenHeight / 2 - 200, shopWidth, 530, "", false)
	guiWindowSetSizable(shopGUI.wnd, false)
	guiWindowSetMovable(shopGUI.wnd, false)
	guiSetAlpha(shopGUI.wnd, 0)

	shopGUI.buttons = {}
	shopGUI.buttons["Color"] = guiCreateButton(10, 28, shopWidth, 18, "Color", false, shopGUI.wnd)
	shopGUI.buttons["Paintjob"] = guiCreateButton(10, 51, shopWidth, 18, "Paintjob", false, shopGUI.wnd)
	shopGUI.buttons["Performance"] = guiCreateButton(10, buttonHeight * btns + 8, shopWidth, buttonHeight - 5, "Performance", false, shopGUI.wnd)
	shopGUI.buttons["Exit"] = guiCreateButton(10, buttonHeight * btns + 8, shopWidth, buttonHeight - 5, "Buy / Exit", false, shopGUI.wnd)

	for i = 1, 17 do
		local upName = getVehicleUpgradeSlotName(i-1)
		-- slot 11 is "Unknown"
		if (not shopGUI.buttons[i] and i ~= 12 and i ~= 9 and upName) then
			shopGUI.buttons[i] = guiCreateButton(10, buttonHeight * btns + 5, 230, buttonHeight - 5, upName, false, shopGUI.wnd)
			guiSetVisible(shopGUI.buttons[i], false)
			btns = btns + 1
		end
	end

	upgradeGUI.wnd = guiCreateWindow(screenWidth - 215, screenHeight / 2 - 150, upgWidth, 30, "", false)
	guiWindowSetSizable(upgradeGUI.wnd, false)
	guiWindowSetMovable(upgradeGUI.wnd, false)
	guiSetText(upgradeGUI.wnd, "")
	guiSetVisible(upgradeGUI.wnd, false)
	guiMoveToBack(upgradeGUI.wnd)
	local wndX, wndY = guiGetPosition(shopGUI.wnd, false)
	guiSetPosition(upgradeGUI.wnd, wndX, wndY, false)

	upgradeGUI.gridList = {}
	upgradeGUI.gridList.grd = guiCreateGridList(10, 23, upgWidth, 200, false, upgradeGUI.wnd)
	guiGridListSetSortingEnabled(upgradeGUI.gridList.grd, false)
	guiGridListAddColumn(upgradeGUI.gridList.grd, "Part name", 0.6)
	guiGridListAddColumn(upgradeGUI.gridList.grd, "Price", 0.25)
	guiGridListSetSelectionMode(upgradeGUI.gridList.grd, 0)


	addEventHandler("onClientGUIClick", shopGUI.buttons["Color"], openColorPicker, false)
	--addEventHandler( "onClientGUIClick", resourceRoot,
	--	function(btn)
	--		colorWndButtonClicked(btn)
	--	end
	--)
	addEventHandler("onClientGUIClick", shopGUI.buttons["Exit"],
		function(btn)
			exitButtonClicked(btn)
		end, false
	)
	addEventHandler("onClientGUIDoubleClick", upgradeGUI.gridList.grd,
		function(btn)
			gridListClicked(btn)
		end, false
	)
end
addEventHandler("onClientResourceStart", resourceRoot, start)

-- Color selection

function openColorPicker()
	if (moddingVeh) then
		colorPicker.openSelect(colors)
	end
end

function updateColor()
	if (not colorPicker.isSelectOpen) then return end
	local r, g, b = colorPicker.updateTempColors()
	if (moddingVeh and isElement(moddingVeh)) then
		local r1, g1, b1, r2, g2, b2 = getVehicleColor(moddingVeh, true)
		if (guiCheckBoxGetSelected(checkColor1)) then
			r1, g1, b1 = r, g, b
		end
		if (guiCheckBoxGetSelected(checkColor2)) then
			r2, g2, b2 = r, g, b
		end
		--if (guiCheckBoxGetSelected(checkColor3)) then
		--	setVehicleHeadLightColor(moddingVeh, r, g, b)
		--end
		setVehicleColor(moddingVeh, r1, g1, b1, r2, g2, b2)
		tempColors = {r1, g1, b1, r2, g2, b2}
	end
end
addEventHandler("onClientRender", root, updateColor)

function exitButtonClicked(btn)
    if (btn == "left") then
        local upgrades = getVehicleUpgrades(moddingVeh)
        if (not table.same(upgrades, currUpgrades) or not table.same(tempColors, currColors) or paintjob ~= getVehiclePaintjob(moddingVeh)) then
            upgrades = leaveNewUpgrades(upgrades, currUpgrades)
            triggerServerEvent("modShop_playerLeaveModShop", localPlayer, moddingVeh, getShoppingCosts(), upgrades, tempColors, getVehiclePaintjob(moddingVeh), shopEnteredName)
        else
            hideMain = true
            showNewSub = false
            showCursor(false)
            btnPressed = nil
            addEventHandler("onClientRender", root, contractSubWindow)
            triggerServerEvent("modShop_unfreezVehicle", moddingVeh)
            removeEventHandler("onClientRender", root, rotateCameraAroundPlayer)
		end
	end
	if (btn == "right" and isElement(moddingVeh)) then
		hideMain = true
		showNewSub = false
		showCursor(false)
		btnPressed = nil
		setCameraTarget(localPlayer)
		triggerServerEvent("modShop_unfreezVehicle", moddingVeh)
		removeEventHandler("onClientRender", root, rotateCameraAroundPlayer)
		guiSetVisible(cartWnd, false)
		resetVehicleUpgradesToPrevious()
		removeEventHandler("onClientPlayerWasted", localPlayer, function() exitButtonClicked("right") end)
	end
end

function gridListClicked(btn)
    if (btn == "left" and guiGridListGetSelectedItem(upgradeGUI.gridList.grd) ~= -1) then
		playSoundFrontEnd(1)
        local row = guiGridListGetSelectedItem( source )
        if btnPressed == shopGUI.buttons[ "Paintjob" ] then
            if row ~= paintjob and not paintjobSet then
                if row ~= getVehiclePaintjob( moddingVeh ) then
                    paintjobSet = true
                    setVehiclePaintjob( moddingVeh, row )
                    addItemToCart( "paintjob", tonumber( row ) )
                end
            elseif row == getVehiclePaintjob( moddingVeh ) and paintjobSet then
                paintjobSet = false
                setVehiclePaintjob( moddingVeh, 3 )
                removeItemFromCart( "paintjob" )
                setVehicleColor(moddingVeh, tempColors[1], tempColors[2], tempColors[3], tempColors[4], tempColors[5], tempColors[6])
            else
                replaceItemInCart( "paintjob", row )
                setVehiclePaintjob( moddingVeh, row )
            end
            guiSetText( shoppingCostLbl, tostring( getShoppingCosts( ) ) )
            return
        end
        local upgrades = getVehicleUpgrades( moddingVeh )
        local modid = upgradeGUI.gridList[ "upgID_"..row ]
        local price = tonumber( upgradeGUI.gridList[ "price_"..row ] )
        if currUpgrades then
            for k,id in ipairs( currUpgrades ) do
                if id == modid then
                    local slotname = getVehicleUpgradeSlotName( id )
                    if not isItemInCart( modid ) and not newUpgrades[ slotname ] then
                        if upgradeChanged[ slotname ] == false then
                            upgradeChanged[ slotname ] = 1
                            guiGridListSetSelectedItem( upgradeGUI.gridList.grd, 0, 0 )
                            guiSetText( shoppingCostLbl, tostring( getShoppingCosts( ) ) )
                            return
                        elseif upgradeChanged[ slotname ] == 1 then
                            upgradeChanged[ slotname ] = false
                            addVehicleUpgrade( moddingVeh, modid )
                            return
                        end
                    elseif isItemInCart( newUpgrades[ slotname ] ) and newUpgrades[ slotname ] then
                        addVehicleUpgrade( moddingVeh, modid )
                        removeItemFromCart( newUpgrades[ slotname ] )
                        guiSetText( shoppingCostLbl, tostring( getShoppingCosts( ) ) )
                        upgradeChanged[ slotname ] = false
                        newUpgrades[ slotname ] = false
                        return
                    end
                    return
                end
            end
        end
        for k,v in ipairs( upgrades ) do
            local slotname = getVehicleUpgradeSlotName( v )
            if v == modid then
                guiGridListSetSelectedItem( upgradeGUI.gridList.grd, 0, 0 )
                local rem = removeVehicleUpgrade( moddingVeh, tonumber( modid ) )
                removeItemFromCart( modid )
                guiSetText( shoppingCostLbl, tostring( getShoppingCosts( ) ) )
                return
            elseif guiGetText( upgradeGUI.wnd ) == slotname then
                upgradeChanged[ slotname ] = true
                newUpgrades[ slotname ] = modid
                addVehicleUpgrade( moddingVeh, modid )
                if not replaceItemInCart( modid, price ) then
                    addItemToCart( modid, price )
                end
                guiSetText( shoppingCostLbl, tostring( getShoppingCosts( ) ) )
                return
            end
        end
        newUpgrades[ getVehicleUpgradeSlotName( modid ) ] = tonumber( modid )
        addItemToCart( tonumber( modid ), tonumber( price ) )
        guiSetText( shoppingCostLbl, tostring( getShoppingCosts( ) ) )
        addVehicleUpgrade( moddingVeh, modid )
    end
end

function showUpgradeButtons()
    guiSetSize(shopGUI.wnd, shopWidth, 500, false)
    local upgrades = getVehicleCompatibleUpgrades(moddingVeh)
    local alreadySet = {}
    local buttonHeight = 23
    local btns = 2
    if (isVehicleRacer(moddingVeh) or isVehicleLowrider(moddingVeh)) then
        guiSetVisible(shopGUI.buttons["Paintjob"], true)
        btns = 3
    end
    for i = 1, 17 do
        for index, value in ipairs(upgrades) do
            if (i ~= 9 and i ~= 12 and alreadySet[i] ~= true and getVehicleUpgradeSlotName(value) == guiGetText(shopGUI.buttons[i])) then
                guiSetVisible(shopGUI.buttons[i], true)
                guiSetPosition(shopGUI.buttons[i], 10, buttonHeight * btns + 5, false)
                alreadySet[i] = true
                btns = btns + 1
            end
        end
    end
	guiSetPosition(shopGUI.buttons["Performance"], 10, 20 * btns + 40, false)
    guiSetPosition(shopGUI.buttons["Exit"], 10, 23 * btns + 50, false)
    guiSetSize(shopGUI.wnd, shopWidth, buttonHeight * btns + 90, false)
end

function hideAllButtonsInMainWnd()
    for i=1, 17 do
		if (shopGUI.buttons[i] and isElement(shopGUI.buttons[i])) then
			guiSetVisible(shopGUI.buttons[i], false)
		end
    end
    guiSetVisible(shopGUI.buttons["Paintjob"], false)
end

function performAction(button)
    if (button == "left") then
        local buttonName = guiGetText(source)
        if (source == shopGUI.buttons["Color"] and btnPressed ~= source) then
            showNewSub = false
            addEventHandler("onClientRender", root, contractSubWindow)
            btnPressed = source
            return
        elseif (source == shopGUI.buttons["Paintjob"]) then
            if (btnPressed ~= source) then
                showPaintjobSub()
            else
                showNewSub = false
                removeEventHandler("onClientGUIClick", resourceRoot, performAction)
                addEventHandler("onClientRender", root, contractSubWindow)
            end
            return
		elseif (source == shopGUI.buttons["Performance"] and btnPressed ~= source) then
            showNewSub = false
            addEventHandler("onClientRender", root, contractSubWindow)
            btnPressed = source
            return
        end
        for i = 1, 17 do
            if (shopGUI.buttons[i] and isElement(shopGUI.buttons[i]) and buttonName == guiGetText(shopGUI.buttons[i])) then
                if (not hideSubToo and btnPressed ~= shopGUI.buttons[i]) then
                    showSpecificSlotWindow(i - 1)
                    btnPressed = shopGUI.buttons[i]
                    removeEventHandler("onClientGUIClick", resourceRoot, performAction)
                    return
                elseif (guiGetText(shopGUI.buttons[i]) == guiGetText(upgradeGUI.wnd)) then
                    removeEventHandler("onClientGUIClick", resourceRoot, performAction)
                    addEventHandler("onClientRender", root, contractSubWindow)
                    btnPressed = shopGUI.buttons[i]
                    return
                elseif (source ~= upgradeGUI.wnd and source ~= shopGUI.wnd) then
                    showNewSub = true
                    showSpecificSlotWindow(guiGetText(source))
                    removeEventHandler("onClientGUIClick", resourceRoot, performAction)
                    btnPressed = shopGUI.buttons[i]
                    return
                end
            end
        end
    end
end

addEvent( "modShop_insufficiantFounds", true )
addEventHandler( "modShop_insufficiantFounds", root,
    function()
		exports.GTIhud:dm( "You do not have enough money to process this purchase.", 255, 0, 0)
    end
)

addEvent( "modShop_moddingConfirmed", true )
addEventHandler( "modShop_moddingConfirmed", root,
    function()
        paintjobSet = false
        colorSet[1], colorSet[2] = false, false
        guiSetVisible(cartWnd, false)
        guiSetAlpha(shopGUI.wnd, 0.8)
        hideMain = true
        showNewSub = false
        showCursor(false)

        setCameraTarget(localPlayer)
        addEventHandler("onClientRender", root, contractSubWindow)
        removeEventHandler("onClientRender", root, rotateCameraAroundPlayer)
		removeEventHandler("onClientPlayerWasted", localPlayer, function() exitButtonClicked("right") end)
    end
)

function showSpecificSlotWindow(slotid)
    local slotname = getVehicleUpgradeSlotName(slotid)
    if type(slotid) == "string" then
        slotname = slotid
    end
    local upgrades = getVehicleCompatibleUpgrades(moddingVeh)
    if (not hideSubToo) then
        guiSetText(upgradeGUI.wnd, slotname)
        showNewSub = false
    else
        addEventHandler("onClientRender", root, contractSubWindow)
    end
    layoutButtons(slotname)
end

function layoutButtons( slotname )
    if not hideSubToo then
        local headerHeight = 23
        local rowHeight = 15
        local footerHeight = 10

        local upgrades = getVehicleCompatibleUpgrades( moddingVeh )
        guiSetSize( upgradeGUI.wnd, upgWidth, 600, false )
        guiGridListClear( upgradeGUI.gridList.grd )
        for k,v in pairs( upgradeGUI.gridList ) do
            if upgradeGUI.gridList[ k ] ~= upgradeGUI.gridList.grd then
                upgradeGUI.gridList[ k ] = nil
            end
        end
        guiSetSize( upgradeGUI.gridList.grd, upgWidth, 500, false )
        for k,v in ipairs( upgrades ) do
            if slotname == getVehicleUpgradeSlotName( v ) then
                local row = guiGridListAddRow( upgradeGUI.gridList.grd )
                local price = getItemPrice( v )
                guiGridListSetItemText( upgradeGUI.gridList.grd, row, 1, getItemName( v ), false, false )
                upgradeGUI.gridList[ "upgID_"..tostring( row ) ] = v
                guiGridListSetItemText( upgradeGUI.gridList.grd, row, 2, "$ "..tostring( price ), false, false )
                upgradeGUI.gridList[ "price_"..tostring( row ) ] = price
            end
        end
        local rows = guiGridListGetRowCount( upgradeGUI.gridList.grd )
        guiSetSize( upgradeGUI.wnd, upgWidth, rowHeight * rows + headerHeight + footerHeight + 40, false )
        guiSetSize( upgradeGUI.gridList.grd, upgWidth, (rowHeight * rows) + headerHeight + footerHeight, false )
        guiSetSize( upgradeGUI.wnd, upgWidth, 0, false )
		local a2, a3 = guiGetPosition( shopGUI.wnd, false )
        guiSetPosition( upgradeGUI.wnd, a2, a3, false )
        guiSetVisible( upgradeGUI.wnd, true )
        addEventHandler( "onClientRender", root, flyIn_window )
    end
end

function setProperRowSelected()
    for index, val in ipairs(getVehicleUpgrades(moddingVeh)) do
        if getVehicleUpgradeSlotName(val) == guiGetText(btnPressed) then
            for i = 0, guiGridListGetRowCount( upgradeGUI.gridList.grd ) do
                if upgradeGUI.gridList[ "upgID_"..i ] == val then
                    guiGridListSetSelectedItem( upgradeGUI.gridList.grd, i, 2 )
                    break
                end
                i = i + 1
            end
        end
    end
end

function hideShopWindow()
    local fadingOut = 0.023
    local currAlpha = guiGetAlpha( shopGUI.wnd )
    local x,y = guiGetPosition( shopGUI.wnd, false )
    local subX, subY = guiGetPosition( upgradeGUI.wnd, false )
    if subX and guiGetAlpha( upgradeGUI.wnd ) > 0.1 and x < screenWidth and currAlpha > ( currAlpha - fadingOut )then
        mainWindowIsMoving = true
        guiSetPosition( shopGUI.wnd, x + movingSpeed, y, false )
        guiSetAlpha( shopGUI.wnd, currAlpha - fadingOut )
        if subX < x - 30 and subX < screenWidth and hideSubToo then
            addEventHandler( "onClientRender", root, dragSubWindow )
            hideSubToo = false
        end
    elseif x < screenWidth and currAlpha > ( currAlpha - fadingOut ) then
        guiSetPosition( shopGUI.wnd, x + movingSpeed, y, false )
        guiSetAlpha( shopGUI.wnd, currAlpha - fadingOut )
    else
        mainWindowIsMoving = false
        hideMain = false
        removeEventHandler( "onClientGUIClick", resourceRoot, performAction )
        removeEventHandler( "onClientRender", root, hideShopWindow )
    end
end

function showShopWindow(name)
    local fadingIn = 0.023
    local currAlpha = guiGetAlpha( shopGUI.wnd )
    local x,y = guiGetPosition( shopGUI.wnd, false )
    if x > screenWidth - shopWidth and currAlpha < currAlpha + fadingIn then
        mainWindowIsMoving = true
        guiSetPosition( shopGUI.wnd, x - movingSpeed, y, false )
        guiSetAlpha( shopGUI.wnd, currAlpha + fadingIn )
    else
        mainWindowIsMoving = false
        guiSetPosition(shopGUI.wnd, screenWidth - shopWidth, y, false)
        guiSetAlpha(shopGUI.wnd, 0.8)
        removeEventHandler("onClientRender", root, showShopWindow)
        addEventHandler("onClientGUIClick", resourceRoot, performAction)
    end
end

function showPaintjobSub()
    showNewSub = "paintjob"
    removeEventHandler("onClientGUIClick", resourceRoot, performAction)
    addEventHandler("onClientRender", root, contractSubWindow)
end

function showPerformanceSub()
    showNewSub = "performance"
    removeEventHandler("onClientGUIClick", resourceRoot, performAction)
    addEventHandler("onClientRender", root, contractSubWindow)
end

function flyIn_window()
    local x, y = guiGetPosition( upgradeGUI.wnd, false )
    local shopX, shopY = guiGetPosition( shopGUI.wnd, false )
    local btnX, btnY = guiGetPosition( btnPressed, false )
    local shopWidth, _ = guiGetSize( shopGUI.wnd, false )
    local currAlpha = guiGetAlpha( upgradeGUI.wnd )
	if (not btnY) then return end
    if ( x > screenWidth - upgWidth - shopWidth ) and currAlpha < currAlpha + .024 then
        guiSetAlpha( upgradeGUI.wnd, currAlpha + .02 )
        guiSetPosition( upgradeGUI.wnd, x - movingSpeed, btnY+shopY, false )
    else
        hideSubToo = true
        guiSetAlpha( upgradeGUI.wnd, 0.8 )
        guiSetPosition( upgradeGUI.wnd, screenWidth - shopWidth - upgWidth, btnY+shopY, false )
        removeEventHandler( "onClientRender", root, flyIn_window )
        if btnPressed == shopGUI.buttons[ "Paintjob" ] and getVehiclePaintjob( moddingVeh ) ~= 255 then
            guiGridListSetSelectedItem( upgradeGUI.gridList.grd, getVehiclePaintjob( moddingVeh ), 1 )
        else
            setProperRowSelected()
        end
        addEventHandler( "onClientRender", root, extendSubWindow )
    end
end

function flyOut_window()
    local x, y = guiGetPosition( upgradeGUI.wnd, false )
    local shopX, shopY = guiGetPosition( shopGUI.wnd, false )
    local shopWidth, _ = guiGetSize( shopGUI.wnd, false )
    local currAlpha = guiGetAlpha( upgradeGUI.wnd )
    if ( x <= screenWidth - shopWidth ) and currAlpha - .021 > 0.0 then
        guiSetAlpha( upgradeGUI.wnd, currAlpha - .04 )
        guiSetPosition( upgradeGUI.wnd, x + movingSpeed, y, false )
    else
        hideSubToo = false
        guiSetVisible( upgradeGUI.wnd, false )
        guiSetAlpha( upgradeGUI.wnd, 0.0 )
        guiSetPosition( upgradeGUI.wnd, shopX, shopY, false )
        removeEventHandler( "onClientRender", root, flyOut_window )
        if hideMain then
            addEventHandler( "onClientRender", root, hideShopWindow )
        elseif type( showNewSub ) == "string" and showNewSub == "paintjob" then

            btnPressed = shopGUI.buttons[ "Paintjob" ]
            local headerHeight = 23
            local rowHeight = 15
            local footerHeight = 10
            guiSetSize( upgradeGUI.wnd, upgWidth, 600, false )
            guiSetSize( upgradeGUI.gridList.grd, upgWidth, 500, false )
            guiSetText( upgradeGUI.wnd, "Paintjob" )
            guiGridListClear( upgradeGUI.gridList.grd )
            for k,v in pairs( upgradeGUI.gridList ) do
                if upgradeGUI.gridList[ k ] ~= upgradeGUI.gridList.grd then
                    upgradeGUI.gridList[ k ] = nil
                end
            end
            if getElementModel( moddingVeh ) ~= 575 then
                for i = 0, 2 do
                    local row = guiGridListAddRow( upgradeGUI.gridList.grd )
                    guiGridListSetItemText( upgradeGUI.gridList.grd, row, 1, "Paintjob "..tostring(i+1), false, false )
                    guiGridListSetItemText( upgradeGUI.gridList.grd, row, 2, "$ 500", false, false )
                end
            else
                for i = 0, 1 do
                    local row = guiGridListAddRow( upgradeGUI.gridList.grd )
                    guiGridListSetItemText( upgradeGUI.gridList.grd, row, 1, "Paintjob "..tostring(i+1), false, false )
                    guiGridListSetItemText( upgradeGUI.gridList.grd, row, 2, "$ 500", false, false )
                end
            end
            local rows = guiGridListGetRowCount( upgradeGUI.gridList.grd )
            guiSetSize( upgradeGUI.gridList.grd, upgWidth, (rowHeight * rows) + headerHeight + footerHeight, false )
            guiSetSize( upgradeGUI.wnd, upgWidth, 0, false )
            guiSetVisible( upgradeGUI.wnd, true )
            addEventHandler( "onClientRender", root, flyIn_window )

        elseif showNewSub then
            showSpecificSlotWindow( guiGetText( btnPressed ) )
        elseif btnPressed == shopGUI.buttons["Paintjob"] then
            if (btnPressed == shopGUI.buttons["Paintjob"]) then
                addEventHandler("onClientGUIClick", resourceRoot, performAction)
                btnPressed = nil
            end
            return
        else
			removeEventHandler("onClientGUIClick", resourceRoot, performAction)
			addEventHandler("onClientGUIClick", resourceRoot, performAction)
        end
    end
end

function extendSubWindow()
    local btns
    local headerHeight = 23
    local rowHeight = 15
    local footerHeight = 10
    if (btnPressed == shopGUI.buttons["Paintjob"]) then
        if (getElementModel(moddingVeh) ~= 575) then
            btns = 4
        else
            btns = 3
        end
	elseif (btnPressed == shopGUI.buttons["Performance"]) then
		btns = getBtnsInWindow( )
    elseif (btnPressed ~= shopGUI.buttons["Color"]) then
        btns = getBtnsInWindow( )
    end
    local width, height = guiGetSize( upgradeGUI.wnd, false )
    local x, y = guiGetPosition( upgradeGUI.wnd, false )
    if height < ( btns * rowHeight + headerHeight + footerHeight ) then
        guiSetSize( upgradeGUI.wnd, width, height + movingSpeed, false )
        if height > screenHeight - y then
            guiSetPosition( upgradeGUI.wnd, x, (screenHeight - height), false )
        end
    else
        guiSetSize( upgradeGUI.wnd, width, btns * rowHeight + headerHeight + footerHeight + 25, false )
        removeEventHandler( "onClientRender", root, extendSubWindow )
        if not showNewSub or btnPressed == shopGUI.buttons[ "Paintjob" ] then
            addEventHandler( "onClientGUIClick", resourceRoot, performAction )
        end
    end
end

function contractSubWindow()
    local btns = getBtnsInWindow()
    local width, height = guiGetSize(upgradeGUI.wnd, false)
    local x, y = guiGetPosition(upgradeGUI.wnd, false)
    if height > 49 then
        guiSetSize( upgradeGUI.wnd, width, height - movingSpeed, false )
        if height > screenHeight - y then
            guiSetPosition(upgradeGUI.wnd, x, (screenHeight - height), false)
        end
    else
        guiSetSize( upgradeGUI.wnd, width, 23, false )
        removeEventHandler( "onClientRender", root, contractSubWindow )
        guiMoveToBack( upgradeGUI.wnd )
        addEventHandler( "onClientRender", root, flyOut_window )
        if (not showNewSub and btnPressed ~= shopGUI.buttons["Color"] and btnPressed ~= shopGUI.buttons["Paintjob"]) then
            btnPressed = nil
        end
    end
end

function dragSubWindow()
    local x, y = guiGetPosition( upgradeGUI.wnd, false )
    local shopX, shopY = guiGetPosition( shopGUI.wnd, false )
    local _, shopHeight = guiGetSize( shopGUI.wnd, false )
    local currAlpha = guiGetAlpha( upgradeGUI.wnd )
    if mainWindowIsMoving then
        guiSetAlpha( upgradeGUI.wnd, currAlpha - 0.024 )
        guiSetPosition( upgradeGUI.wnd, x + movingSpeed, y, false )
    elseif (x ~= shopX or x < shopX and currAlpha < currAlpha + 0.024) then
        guiSetAlpha( upgradeGUI.wnd, currAlpha - 0.024 )
        guiSetPosition( upgradeGUI.wnd, x + movingSpeed, y, false )
    else
        guiSetAlpha(upgradeGUI.wnd, 0.8)
        guiSetPosition( upgradeGUI.wnd, x, shopHeight + shopY, false )
        removeEventHandler( "onClientRender", root, dragSubWindow )
        addEventHandler( "onClientGUIClick", resourceRoot, performAction )
        showNewSub = false
    end
end

-- MISC. FUNCTIONS --

function getBtnsInWindow()
	if (not btnPressed) then return end
    local slotname = guiGetText(btnPressed)
    local upgrades = getVehicleCompatibleUpgrades(moddingVeh)
	if (upgrades) then
		local btns = 1
		for index, val in ipairs(upgrades) do
			if (slotname == getVehicleUpgradeSlotName(val)) then
				btns = btns + 1
			end
		end
		return btns
	end
end

function table.same(t1, t2)
    local size = table.getsize(t1)
    local size2 = table.getsize(t2)
    if size == size2 then
        for i = 1, size do
            if t1[i] ~= t2[i] then return false end
        end
    else
        return false
    end
    return true
end

function table.getsize( t )
    local tsize = 0
    for k, v in pairs( t ) do
        tsize = tsize + 1
    end
    return tsize
end

function leaveNewUpgrades(newtable, oldtable)
    local leftUpgrades = {}
    for k, v in ipairs(newtable) do
        if (newtable[k] ~= oldtable[k]) then
            table.insert(leftUpgrades, newtable[k])
        end
    end
    return leftUpgrades
end

local facing = 0
function rotateCameraAroundPlayer()
    local x, y, z = getElementPosition(localPlayer)
    if isPedInVehicle(localPlayer) then
        x, y, z = getElementPosition( moddingVeh )
    else
        removeEventHandler( "onClientRender", resourceRoot, rotateCameraAroundPlayer )
    end
	if (getVehicleType(moddingVeh) == "Boat" or getVehicleType(moddingVeh) == "Plane" or getVehicleType(moddingVeh) == "Helicopter") then
		local camX = x + math.cos( facing / math.pi * 180 ) * 10
		local camY = y + math.sin( facing / math.pi * 180 ) * 10
		setCameraMatrix( camX, camY, z+1, x, y, z )
		facing = facing + 0.0002
	else
	    local camX = x + math.cos( facing / math.pi * 180 ) * 4
		local camY = y + math.sin( facing / math.pi * 180 ) * 4
		setCameraMatrix( camX, camY, z+1, x, y, z )
		facing = facing + 0.0002
	end
end

function resetVehicleUpgradesToPrevious()
    triggerEvent("modShop_moddingConfirmed", localPlayer)
    for i = 0, 16 do
		if (moddingVeh and isElement(moddingVeh)) then
			local modid = getVehicleUpgradeOnSlot(moddingVeh, i)
			if modid then
				removeVehicleUpgrade(moddingVeh, modid)
			end
		end
    end
    for k,v in pairs( currUpgrades ) do
        addVehicleUpgrade( moddingVeh, v )
    end
    setVehicleColor(moddingVeh, unpack(currColors))
    if (paintjob ~= 255) then
        setVehiclePaintjob(moddingVeh, paintjob)
    end
end
addEvent("modShop_clientResetVehicleUpgrades", true)
addEventHandler("modShop_clientResetVehicleUpgrades", root, resetVehicleUpgradesToPrevious)
