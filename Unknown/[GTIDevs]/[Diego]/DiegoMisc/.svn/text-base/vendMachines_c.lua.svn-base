----------------------------------------------->>
-- What     : vendingMachines_c.lua
-- Type     : Client
-- For      : Grand Theft International
-- Author   : Diego aka diegonese
-- All rights reserved to GTI 2014/2015 (C)
----------------------------------------------->>

local vendMach = {    button = {},    window = {},   staticimage = {},    label = {}}

vendMach.window[1] = guiCreateWindow(0.01, 0.18, 0.31, 0.79, "Vending Machine", true)
guiWindowSetSizable(vendMach.window[1], false)
guiSetAlpha(vendMach.window[1], 0.8)

vendMach.button[1] = guiCreateButton(133, 166, 132, 39, "BUY $20", false, vendMach.window[1])
guiSetFont(vendMach.button[1], "default-bold-small")
vendMach.label[1] = guiCreateLabel(274, 573, 31, 14, "Close", false, vendMach.window[1])
guiSetFont(vendMach.label[1], "default-bold-small")
vendMach.staticimage[1] = guiCreateStaticImage(9, 39, 296, 85, "images/sprunk.png", false, vendMach.window[1])
vendMach.staticimage[2] = guiCreateStaticImage(21, 138, 67, 96, "images/pepsi.png", false, vendMach.window[1])
vendMach.staticimage[3] = guiCreateStaticImage(9, 244, 89, 99, "images/cocacola.png", false, vendMach.window[1])
vendMach.label[3] = guiCreateLabel(1, 114, 314, 14, "_________________________________________________", false, vendMach.window[1])
vendMach.label[4] = guiCreateLabel(1, 15, 314, 14, "_________________________________________________", false, vendMach.window[1])
vendMach.staticimage[4] = guiCreateStaticImage(10, 353, 88, 108, "images/lays.png", false, vendMach.window[1])
vendMach.staticimage[5] = guiCreateStaticImage(13, 472, 85, 105, "images/doritos.png", false, vendMach.window[1])
vendMach.label[5] = guiCreateLabel(133, 144, 132, 16, "Pepsi can | 10 HP | $20", false, vendMach.window[1])
guiSetFont(vendMach.label[5], "default-bold-small")
vendMach.label[6] = guiCreateLabel(1, 224, 314, 14, "_________________________________________________", false, vendMach.window[1])
vendMach.label[7] = guiCreateLabel(1, 333, 314, 14, "_________________________________________________", false, vendMach.window[1])
vendMach.label[8] = guiCreateLabel(1, 451, 314, 14, "_________________________________________________", false, vendMach.window[1])
vendMach.label[9] = guiCreateLabel(98, 129, 15, 466, "|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|", false, vendMach.window[1])
vendMach.label[10] = guiCreateLabel(98, 125, 15, 466, "|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|", false, vendMach.window[1])
vendMach.label[11] = guiCreateLabel(123, 254, 157, 16, "Cocacola can | 20 HP | $40", false, vendMach.window[1])
guiSetFont(vendMach.label[11], "default-bold-small")
vendMach.button[2] = guiCreateButton(133, 280, 132, 39, "BUY $40", false, vendMach.window[1])
guiSetFont(vendMach.button[2], "default-bold-small")
vendMach.label[12] = guiCreateLabel(123, 373, 157, 16, "Lays chips | 25 HP | $50", false, vendMach.window[1])
guiSetFont(vendMach.label[12], "default-bold-small")
vendMach.button[3] = guiCreateButton(133, 399, 132, 39, "BUY $50", false, vendMach.window[1])
guiSetFont(vendMach.button[3], "default-bold-small")
vendMach.label[13] = guiCreateLabel(117, 480, 182, 26, "Doritos (Nacho cheese) | 50 HP | \n$100", false, vendMach.window[1])
guiSetFont(vendMach.label[13], "default-bold-small")
vendMach.button[4] = guiCreateButton(133, 516, 132, 39, "BUY $100", false, vendMach.window[1])
guiSetFont(vendMach.button[4], "default-bold-small") 
    
guiSetVisible(vendMach.window[1], false)        

-- Scripts
------------------->>
function toggleGUI()
    guiSetVisible(vendMach.window[1], not guiGetVisible(vendMach.window[1]))
    showCursor(not isCursorShowing())
    guiSetText(vendMach.window[1], ""..getZoneName(getElementPosition(localPlayer)).." - Vending Machine")
end
addEvent("vendMach.onToggleGUI", true)
addEventHandler("vendMach.onToggleGUI", root, toggleGUI)

function onPlayerEat(button)
    if (source == vendMach.button[1]) then
        triggerServerEvent("vendMach.onDrinkPepsi", resourceRoot)
    elseif (source == vendMach.button[2]) then
        triggerServerEvent("vendMach.onDrinkCoca", resourceRoot)
    elseif (source == vendMach.button[3]) then
        triggerServerEvent("vendMach.onEatLays", resourceRoot)
    elseif (source == vendMach.button[4]) then
        triggerServerEvent("vendMach.onEatDoritos", resourceRoot)
    end
end
addEventHandler("onClientGUIClick", vendMach.button[1], onPlayerEat, false)
addEventHandler("onClientGUIClick", vendMach.button[2], onPlayerEat, false)
addEventHandler("onClientGUIClick", vendMach.button[3], onPlayerEat, false)
addEventHandler("onClientGUIClick", vendMach.button[4], onPlayerEat, false)

function onClose(button)
        if (button == "left") and (source == vendMach.label[1]) then
            guiSetVisible(vendMach.window[1], false)
            showCursor(false)
    end
end
addEventHandler("onClientGUIClick", vendMach.label[1], onClose, false)

addEventHandler("onClientMouseEnter", getRootElement(), 
    function(aX, aY)
        if (source == vendMach.label[1]) then
            guiLabelSetColor(vendMach.label[1], 255, 155, 0)
        end
   end
)

addEventHandler("onClientMouseLeave", getRootElement(), 
    function(aX, aY)
        if (source == vendMach.label[1]) then
            guiLabelSetColor(vendMach.label[1], 255, 255, 255)
        end
   end
)