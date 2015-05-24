----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 13 Mar 2013
-- Resource: GTIdroid/clock.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local showCalculator
local X_OFF,Y_OFF = 17, 88

-- Calculator DX
----------------->>

addEventHandler("onClientRender", root,
    function()
		if (not showCalculator) then return end
		GTIPhone = exports.GTIdroid:getGTIDroid()
		local x,y = guiGetPosition(GTIPhone, false)
		local x,y = x+X_OFF-278, y+Y_OFF-233
		
        dxDrawRectangle(278+x, 233+y, 278, 401, tocolor(0, 0, 0, 255), true)
        dxDrawRectangle(290+x, 244+y, 255, 50, tocolor(0, 15, 25, 255), true)
        dxDrawRectangle(290+x, 306+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(494+x, 306+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(443+x, 306+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(392+x, 306+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(341+x, 306+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(290+x, 358+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(341+x, 358+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(392+x, 358+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(443+x, 358+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(494+x, 358+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(290+x, 418+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(290+x, 574+y, 100, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(290+x, 522+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(290+x, 470+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(341+x, 418+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(341+x, 470+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(341+x, 522+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(392+x, 574+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(392+x, 418+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(392+x, 470+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(392+x, 522+y, 49, 49, tocolor(70, 70, 70, 255), true)
        dxDrawRectangle(443+x, 418+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(494+x, 418+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(443+x, 574+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(443+x, 522+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(443+x, 470+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(494+x, 522+y, 49, 100, tocolor(35, 35, 35, 255), true)
        dxDrawRectangle(494+x, 470+y, 49, 49, tocolor(35, 35, 35, 255), true)
        dxDrawText("sin", 	296+x, 320+y, 336+x, 340+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("ln", 	295+x, 371+y, 335+x, 391+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("π", 	448+x, 320+y, 488+x, 340+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("tan", 	399+x, 320+y, 438+x, 340+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("cos", 	346+x, 320+y, 386+x, 340+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("√", 	498+x, 371+y, 538+x, 391+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("^", 	447+x, 371+y, 487+x, 391+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("e", 	396+x, 371+y, 436+x, 391+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("log", 	347+x, 371+y, 387+x, 391+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("!", 	498+x, 320+y, 538+x, 340+y, tocolor(255, 255, 255, 255), 1.30, "clear", "center", "top", false, false, true, false, false)
        dxDrawText("7", 	295+x, 427+y, 335+x, 447+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("0", 	320+x, 581+y, 360+x, 601+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("1", 	295+x, 532+y, 335+x, 552+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("4", 	295+x, 479+y, 335+x, 499+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("7", 	295+x, 427+y, 335+x, 447+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("8", 	347+x, 427+y, 387+x, 447+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("2", 	347+x, 531+y, 387+x, 551+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("5", 	347+x, 479+y, 387+x, 499+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("9", 	397+x, 427+y, 437+x, 447+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText(".", 	397+x, 582+y, 437+x, 602+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("3", 	397+x, 530+y, 437+x, 550+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("6", 	397+x, 479+y, 437+x, 499+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("÷", 	448+x, 427+y, 488+x, 447+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("+", 	448+x, 582+y, 488+x, 602+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("−", 	448+x, 530+y, 488+x, 550+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("x", 	448+x, 478+y, 488+x, 498+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("(", 	499+x, 427+y, 539+x, 447+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText("=", 	499+x, 554+y, 539+x, 574+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
        dxDrawText(")", 	499+x, 478+y, 539+x, 498+y, tocolor(255, 255, 255, 255), 2.00, "default", "center", "top", false, false, true, false, false)
    end
)

-- Toggle Calculator DX
------------------------>>

function toggleCalculator()
	showCalculator = nil
	exports.GTIdroid:showMainMenu(true)
	GTICalculatorApp = exports.GTIdroid:getGTIDroidAppButton("Calculator")
	addEventHandler("onClientGUIClick", GTICalculatorApp, function()
		if (not showCalculator) then
			showCalculator = true
			exports.GTIdroid:showMainMenu(false)
		else
			showCalculator = nil
			exports.GTIdroid:showMainMenu(true)
		end
	end, false)
end
addEventHandler("onClientResourceStart", resourceRoot, toggleCalculator)
-- Prevent Bugs when GTIdroid is restarted
addEvent("onGTIPhoneCreate", true)
addEventHandler("onGTIPhoneCreate", root, toggleCalculator)

function hideCalculator()
	showCalculator = nil
	exports.GTIdroid:showMainMenu(true)
end
addEvent("onGTIDroidClickBack", true)
addEventHandler("onGTIDroidClickBack", root, hideCalculator)
addEvent("onGTIDroidClose", true)
addEventHandler("onGTIDroidClose", root, hideCalculator)
addEventHandler("onClientResourceStop", resourceRoot, hideCalculator)