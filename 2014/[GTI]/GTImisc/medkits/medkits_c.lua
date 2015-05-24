local pickups = {
	{ 1175.234, -1323.260, 14.390, 3, 1240, 60},
	{ 2020.033, -1409.411, 16.992, 3, 1240, 60},
	{ -2191.085, -2304.340, 30.625, 3, 1240, 60},
	{ -2670.109, 616.481, 14.454, 3, 1240, 60},
	{ -314.925, 1051.723, 20.340, 3, 1240, 60},
	{ 1616.121, 1817.909, 10.820, 3, 1240, 60},
	{ -1512.540, 2522.254, 55.835, 3, 1240, 60},
	{ 1245.682, 328.538, 19.757, 3, 1240, 60},
	{ 850.756, -602.109, 18.421, 3, 1240, 60},
}

setTimer (
	function()
		for _,v in ipairs ( pickups) do
			local cX, cY, cZ, pC, cM, cR = unpack ( v )
			--createBlip( blipX, blipY, blipZ, 22, 1, 255, 0, 0, 255, 0, 200)
			local pickup = createPickup( cX, cY, cZ, pC, cM, cR)
			addEventHandler("onClientPickupHit", pickup, HealthBuyOpen, false)
		end
	end, 500, 1
)

BuyWindow2 = guiCreateWindow(363, 307, 207, 140, "GTImedkits - Buy Medkits", false)
guiWindowSetSizable(BuyWindow2, false)
guiSetVisible(BuyWindow2, false)

buyHealth = guiCreateButton(108, 99, 88, 31, "Buy ", false, BuyWindow2)
cancelBuy = guiCreateButton(174, 27, 22, 24, "[X]", false, BuyWindow2)
medRadio = guiCreateRadioButton(11, 37, 93, 15, "Medkit(s)", false, BuyWindow2)
healthRadio = guiCreateRadioButton(10, 62, 94, 15, "100% Health", false, BuyWindow2)
medEdit = guiCreateEdit(20, 99, 65, 31, "", false, BuyWindow2)
addEventHandler("onClientGUIChanged", medEdit, function()
	guiSetText(source, guiGetText(source):gsub("[^0-9]",""))
	if tonumber( guiGetText(source)) then
		--guiSetText(source, "")
	end
end)
guiSetVisible( medEdit, false)
guiEditSetMaxLength(medEdit, 3)

--Pickup Function
function HealthBuyOpen( hitElement )
	if getElementType(hitElement) == "player" and (hitElement == localPlayer) then
		if not guiGetVisible(BuyWindow2) then
			guiSetVisible( BuyWindow2, true )
			showCursor( true, true )
		end
	end
end

addEventHandler( "onClientGUIClick", root,
	function()
		if source == cancelBuy then
			if guiGetVisible( BuyWindow2) == true then
				guiSetVisible( BuyWindow2, false)
				showCursor( false)
			end
		elseif source == buyHealth then
			local theSelected1 = guiRadioButtonGetSelected( medRadio)
			local theSelected2 = guiRadioButtonGetSelected( healthRadio)
			if theSelected1 or theSelected2 then
				if theSelected1 == true then
					local medNumber = guiGetText( medEdit)
					if medNumber ~= "" then
						triggerServerEvent("GTImisc.buyMedkit", root, medNumber)
					else
						exports.GTIhelp:dm( "You enter how many medkits your wish to buy", 255, 0, 0)
					end
				elseif theSelected2 == true then
					triggerServerEvent("onHealthBuy2", getLocalPlayer())
				end
			else
				exports.GTIhelp:dm( "You must select what you would like to buy", 255, 0, 0)
			end
		elseif source == medRadio then
			if guiGetVisible( medEdit) == false then
				guiSetVisible( medEdit, true)
			end
		elseif source == healthRadio then
			if guiGetVisible( medEdit) == true then
				guiSetVisible( medEdit, false)
			end
		end
	end
)
