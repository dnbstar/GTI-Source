local lastTable = false

data = {
	visn = {},
	name = {},
	text = {},
	pos = {},
	d  = {},
	cost = {},
}
ids = {}

render = false

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		for i, shop in ipairs ( shops) do
			local x, y, z = shop[1], shop[2], shop[3]
			local identifier = shop[4]
			local worldData = shop[5]
			local worldData = split( worldData, ";")

			local int = worldData[1]
			local dim = worldData[2]

			local marker = createMarker( x, y, z, "cylinder", 1.25, 255, 125, 0, 150)
			local col = createColTube( x, y, z, 0.75, 1.75)
			ids[col] = identifier

			setElementInterior( marker, int)
			setElementDimension( marker, dim)
			setElementInterior( col, int)
			setElementDimension( col, dim)

			addEventHandler( "onClientColShapeHit", col, uiEnter)
		end
		--changeShowcase( categories)
	end
)

function setMenuLogo( file)
	menuLogo = file
end

function setMenuIcon( file)
	if file then
		viewedImage = file
	end
end

function setMenuColor( colorString)
	if colorString then
		menuColor = colorString
	end
end

local curShop = ""

function uiEnter( hitElement, matching)
	if isElement( hitElement) and getElementType( hitElement) == "player" and matching then
		if hitElement ~= localPlayer then return end
		if isPlayerInVehicle( localPlayer) then return end
		local id = ids[source]
		if id then
			showChat( false)
			toggleAllControls( false)
			changeShowcase( items[id], "Meals")
			setMenuColor( tcolor[id])
			curShop = id
			if not render then
				render = true
			end
			if trans[id] and trans[id] ~= 0 then
				local logoFile = tostring( "logo"..trans[id])
				local iconFile = tostring( "ttile"..trans[id])
				setMenuIcon( iconFile)
				setMenuLogo( logoFile)
			else
				setMenuIcon( "ttile")
				setMenuLogo( "logo")
			end
		end
	end
end

function uiExit( eating)
	if render then
		render = false
		showChat( true)
		if not eating then
			toggleAllControls( true)
		else
			setTimer( toggleAllControls, 5000, 1, true)
		end
	end
end

addEventHandler( "onClientPlayerWasted", localPlayer,
	function()
		uiExit()
	end
)

function bugStopper()
	uiExit()
end
addEvent( "GTIfood.bugStopper", true)
addEventHandler( "GTIfood.bugStopper", root, bugStopper)

function changeShowcase( theTable, visibleName)
	if theTable == lastTable then return false end
	if theTable and type( theTable) == "table" then
		if visibleName and visibleName ~= "" then
			colName = visibleName
		end
		--lastTable = theTable
		for i, item in pairs (vTable) do
			vTable[i] = nil
			data.text[i] = nil
			data.pos[i] = nil
			data.name[i] = nil
			data.d[i] = nil
			data.visn[i] = nil
			data.cost[i] = nil
		end
		for i, cdata in ipairs ( theTable) do
			if i ~= 1 then
				data.text[i] = "255;255;255"
			else
				data.text[i] = "0;0;0"
			end
			data.pos[i] = 239+((offs*i))
			if not cdata[3] then
				table.insert( vTable, { cdata[1], cdata[2]})
			else
				table.insert( vTable, { cdata[1], cdata[2], cdata[3]})
				data.d[i] = cdata[3]
			end
			data.visn[i] = cdata[1]
			if cdata[2] and type( items[cdata[2]]) == "table" then
				data.name[i] = cdata[2]
				data.cost[i] = 0
			else
				data.name[i] = cdata[1]
				data.cost[i] = cdata[2]
			end
		end
		sname = data.name[selected]
		selpos = 269
		move = 0
		selected = 1
		selShow = 1
	end
end

function getItemData( id)
	if data.d[id] then
		return data.d[id]
	else
		return false
	end
end

valid_keys = {
	["w"] = true,
	["s"] = true,
	["space"] = true,
	["enter"] = true,
	["backspace"] = true,
	["mouse1"] = true,
	["mouse2"] = true,
	["mouse_wheel_up"] = true,
	["mouse_wheel_down"] = true,
}

addEventHandler( "onClientKey", root,
	function( key, press)
		if not render then return end
		if key and valid_keys[key] and press then
			--if getPlayerName( localPlayer) ~= "LilDolla" then return end
			if key == "mouse_wheel_up" or key == "w" then
				if selected == ((#vTable-#vTable)+1) then
					if not maxed then
						return
					end
				end
				if selShow <= 10 then
					data.text[selected] = "255;255;255"
					selected = selected - 1
					selShow = selShow - 1
					selpos = data.pos[selected]
					data.text[selected] = "0;0;0"
					sname = data.name[selected]
				else
					move = move + 60
					data.text[moved_up] = "255;255;255"
					moved_up = moved_up - 1
					selShow = selShow - 1
					--data.text[moved_up] = "0;0;0"
					sname = data.name[selected]
					if selShow <= 9 then
						selected = selected - 1
					end
					if selShow - 1 == 9 then
						maxed = false
					end
				end
			elseif key == "mouse_wheel_down" or key == "s" then
				if selected ~= 10 then
					if not data.pos[selected+1] then return end
					data.text[selected] = "255;255;255"
					selected = selected + 1
					selShow = selShow + 1
					moved_up = moved_up + 1
					selpos = data.pos[selected]
					data.text[selected] = "0;0;0"
					sname = data.name[selected]
				else
					if selShow ~= #vTable then
						if show+moved_up == #vTable then
							return
						end
						--if not data.name[selShow+1] then return end
						move = move - 60
						moved_up = moved_up + 1
						data.text[selShow] = "255;255;255"
						selShow = selShow + 1
						data.text[selShow] = "0;0;0"
						sname = data.name[selShow]
					else
						if selShow ~= 10 then
							if not maxed then
								maxed = true
							end
						end
						return
					end
				end
			elseif key == "mouse1" or key == "enter" then
				if data.name[selShow] then
					local name = data.name[selShow]
					if items[name] then
						changeShowcase( items[name], data.visn[selShow])
					else
						local chp = getElementHealth( localPlayer)

						local name = name
						local cost = data.cost[selShow]
						local hp = getItemData(selShow)

						local int = getElementInterior( localPlayer)
						local dim = getElementDimension( localPlayer)

						if chp ~= 100 then
							eatFood( curShop, int, dim)
							triggerServerEvent("GTIfood.setFeature", localPlayer, "buy", name, hp, cost, curShop)
						else
							eatFood( "vomit", int, dim)
							triggerServerEvent("GTIfood.setFeature", localPlayer, "vomit", "", -10, 0, curShop)
						end
						uiExit( true)
					end
				end
			elseif key == "mouse2" then
				uiExit()
			end
		end
	end
)

function destroyFoodElement( theElement, theTimer)
	eatTimer[theTimer] = nil
	exports.bone_attach:detachElementFromBone( theElement)
	if not exports.bone_attach:isElementAttachedToBone( theElement) then
		if isElement( theElement) then
			destroyElement( theElement)
		end
	end
end

--Replacements
addEventHandler("onClientResourceStart", resourceRoot,
	function()
		local puke = engineLoadDFF("puke.dff",0)
		engineReplaceModel(puke,928)
	end
)

function vomit(int, dim)
	vt = createObject(928, 0, 0, 0)
	--
	setElementInterior(vt, int)
	setElementDimension(vt, dim)
	--
	exports.bone_attach:attachElementToBone(vt, localPlayer, 1, 0, 0, 0.0095, 0, 0, 125)
end

eatTimer = {}

function eatFood(food, int, dim)
	--local x, y, z = getElementPosition(localPlayer)
	if food == "bshot" then
		--Burger
		if not isTimer(eatTimer['eat']) then
			bgr = createObject(2880, 0, 0, 0)
			--
			setElementInterior(bgr, int)
			setElementDimension(bgr, dim)
			--
			exports.bone_attach:attachElementToBone(bgr, localPlayer, 12, 0, 0, 0, 0, -90, 0)
			exports.GTIanims:setJobAnimation(localPlayer, "FOOD", "EAT_Burger", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer(destroyFoodElement, 3750, 1, bgr, 'eat')
		end
	elseif food == "cbell" then
		--Chicken
		if not isTimer(eatTimer['eat']) then
			ckn = createObject(2880, 0, 0, 0)
			--
			setElementInterior(ckn, int)
			setElementDimension(ckn, dim)
			--
			exports.bone_attach:attachElementToBone(ckn, localPlayer, 12, 0, 0, 0, 0, -90, 0)
			setPedAnimation(localPlayer)
			exports.GTIanims:setJobAnimation(localPlayer, "FOOD", "EAT_Burger", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer(destroyFoodElement, 3750, 1, ckn, 'eat')
		end
	elseif food == "wsp" then
		--Pizza
		if not isTimer(eatTimer['eat']) then
			pza = createObject(2881, 0, 0, 0)
			--
			setElementInterior(pza, int)
			setElementDimension(pza, dim)
			--
			exports.bone_attach:attachElementToBone(pza, localPlayer, 12, -0.050, 0.125, -0.050, 0, -85, 270)
			setPedAnimation(localPlayer)
			exports.GTIanims:setJobAnimation(localPlayer, "FOOD", "EAT_Pizza", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer(destroyFoodElement, 4750, 1, pza, 'eat')
		end
	elseif food == "can" then
		--Can
		if not isTimer(eatTimer['eat']) then
			can1 = createObject(2601, 0, 0, 0)
			--
			setElementInterior(can1, int)
			setElementDimension(can1, dim)
			--
			exports.bone_attach:attachElementToBone(can1, localPlayer, 11, 0, 0.0535, 0.0850, 0, 85, 0)
			setPedAnimation(localPlayer)
			exports.GTIanims:setJobAnimation(localPlayer, "VENDING", "VEND_Drink2_P", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer(destroyFoodElement, 1450, 1, can1, 'eat')
		end
	elseif food == "donut" then
		--Donut
		if not isTimer(eatTimer['eat']) then
			dnt = createObject(2703, 0, 0, 0)
			setObjectScale(dnt, 0.2)
			--
			setElementInterior(dnt, int)
			setElementDimension(dnt, dim)
			--
			exports.bone_attach:attachElementToBone(dnt, localPlayer, 12, 0.08, -0.075, -0.075, 0, -90, 0)
			setPedAnimation(localPlayer)
			exports.GTIanims:setJobAnimation(localPlayer, "FOOD", "EAT_Pizza", 5000, false, false, false, false)
			eatTimer['eat'] = setTimer(destroyFoodElement, 4750, 1, dnt, 'eat')
		end
	elseif food == "vomit" then
		--Vomit
		if not isTimer(eatTimer['eat']) then
			setPedAnimation(localPlayer)
			--setPedAnimation(localPlayer, "FOOD", "EAT_Vomit_P", 5000, false, false, false, false)
			exports.GTIanims:setJobAnimation(localPlayer, "FOOD", "EAT_Vomit_P", 5000, false, false, false, false)
			setTimer(vomit, 3650, 1, int, dim)
			eatTimer['eat'] = setTimer(destroyFoodElement, 2550, 1, vt, 'eat')
		end
	end
end
