--[[
Frame: 1587
Head: 1588
Left Shoulder: 1590 | Right Shoulder: 1589
Left Body: 1592 | Right Shoulder 1591
--
Civ1: 1586
Civ2: 1585
Tar1: 1584
Tar2: 1583
--]]
local localPlayer = getLocalPlayer()

function attachElementsCorrectly( element1, element2)
	local x1, y1, z1 = getElementPosition ( element1)
	local x2, y2, z2 = getElementPosition ( element2)
	attachElements ( element1, element2, x1-x2, y1-y2, z1-z2)
end

function createTest()
	fram = {}
	fram[1] = createObject( 1587, 291.5, -12.399, 1002.299)
	fram[2] = createObject( 1587, 296.350, -12.399, 1002.299)
	fram[3] = createObject( 1587, 293.911, -12.399, 1002.299)
	fram[4] = createObject( 1587, 288.999, -12.399, 1002.299)
	--
	fram[5] = createObject( 3025, 295.195, -7.393, 1005.299)
	fram[6] = createObject( 3025, 292.793, -7.393, 1005.299)
	fram[7] = createObject( 3025, 290.243, -7.393, 1005.299)
	body1 = {}
	body1[1] = createObject( 1588, 291.5, -12.399, 1002.299)
	body1[2] = createObject( 1590, 291.5, -12.399, 1002.299)
	body1[3] = createObject( 1589, 291.5, -12.399, 1002.299)
	body1[4] = createObject( 1592, 291.5, -12.399, 1002.299)
	body1[5] = createObject( 1591, 291.5, -12.399, 1002.299)
	--
	body2 = {}
	body2[1] = createObject( 1588, 296.350, -12.399, 1002.299)
	body2[2] = createObject( 1590, 296.350, -12.399, 1002.299)
	body2[3] = createObject( 1589, 296.350, -12.399, 1002.299)
	body2[4] = createObject( 1592, 296.350, -12.399, 1002.299)
	body2[5] = createObject( 1591, 296.350, -12.399, 1002.299)
	--
	body3 = {}
	body3[1] = createObject( 1588, 293.911, -12.399, 1002.299)
	body3[2] = createObject( 1590, 293.911, -12.399, 1002.299)
	body3[3] = createObject( 1589, 293.911, -12.399, 1002.299)
	body3[4] = createObject( 1592, 293.911, -12.399, 1002.299)
	body3[5] = createObject( 1591, 293.911, -12.399, 1002.299)
	--
	body4 = {}
	body4[1] = createObject( 1588, 288.999, -12.399, 1002.299)
	body4[2] = createObject( 1590, 288.999, -12.399, 1002.299)
	body4[3] = createObject( 1589, 288.999, -12.399, 1002.299)
	body4[4] = createObject( 1592, 288.999, -12.399, 1002.299)
	body4[5] = createObject( 1591, 288.999, -12.399, 1002.299)
	--
	pap1 ={}
	pap1[1] = createObject( 3024, 295.195, -7.393, 1005.299)
	pap1[2] = createObject( 3023, 295.195, -7.393, 1005.299)
	pap1[3] = createObject( 3022, 295.195, -7.393, 1005.299)
	pap1[4] = createObject( 3021, 295.195, -7.393, 1005.299)
	pap1[5] = createObject( 3020, 295.195, -7.393, 1005.299)
	pap1[6] = createObject( 3019, 295.195, -7.393, 1005.299)
	pap1[7] = createObject( 3018, 295.195, -7.393, 1005.299)
	--
	pap2 ={}
	pap2[1] = createObject( 3024, 292.793, -7.393, 1005.299)
	pap2[2] = createObject( 3023, 292.793, -7.393, 1005.299)
	pap2[3] = createObject( 3022, 292.793, -7.393, 1005.299)
	pap2[4] = createObject( 3021, 292.793, -7.393, 1005.299)
	pap2[5] = createObject( 3020, 292.793, -7.393, 1005.299)
	pap2[6] = createObject( 3019, 292.793, -7.393, 1005.299)
	pap2[7] = createObject( 3018, 292.793, -7.393, 1005.299)
	--
	pap3 ={}
	pap3[1] = createObject( 3024, 290.243, -7.393, 1005.299)
	pap3[2] = createObject( 3023, 290.243, -7.393, 1005.299)
	pap3[3] = createObject( 3022, 290.243, -7.393, 1005.299)
	pap3[4] = createObject( 3021, 290.243, -7.393, 1005.299)
	pap3[5] = createObject( 3020, 290.243, -7.393, 1005.299)
	pap3[6] = createObject( 3019, 290.243, -7.393, 1005.299)
	pap3[7] = createObject( 3018, 290.243, -7.393, 1005.299)
	for i=1, 7 do
		setElementInterior( fram[i], 1)
		setElementDimension( fram[i], 2)
		--
	end
	for i=1, 5 do
		setElementInterior( body1[i], 1)
		setElementDimension( body1[i], 2)
		setObjectBreakable( body1[i], false)
		--
		setElementInterior( body2[i], 1)
		setElementDimension( body2[i], 2)
		setObjectBreakable( body2[i], false)
		--
		setElementInterior( body3[i], 1)
		setElementDimension( body3[i], 2)
		setObjectBreakable( body3[i], false)
		--
		setElementInterior( body4[i], 1)
		setElementDimension( body4[i], 2)
		setObjectBreakable( body4[i], false)
		--
		setElementDoubleSided( body1[i], true)
		setElementDoubleSided( body2[i], true)
		setElementDoubleSided( body3[i], true)
		setElementDoubleSided( body4[i], true)
		--
		for iv=1, 7 do
			attachElementsCorrectly( body1[i], fram[iv])
			attachElementsCorrectly( body2[i], fram[iv])
			attachElementsCorrectly( body3[i], fram[iv])
			attachElementsCorrectly( body4[i], fram[iv])
			setElementDoubleSided( fram[iv], true)
			for t=1,7 do
				setElementDoubleSided( pap1[t], true)
				setElementInterior( pap1[t], 1)
				setElementDimension( pap1[t], 2)
				setObjectBreakable( pap1[t], false)
				--
				setElementDoubleSided( pap2[t], true)
				setElementInterior( pap2[t], 1)
				setElementDimension( pap2[t], 2)
				setObjectBreakable( pap2[t], false)
				--
				setElementDoubleSided( pap3[t], true)
				setElementInterior( pap3[t], 1)
				setElementDimension( pap3[t], 2)
				setObjectBreakable( pap3[t], false)
				--
				attachElementsCorrectly( pap1[t], fram[iv])
				attachElementsCorrectly( pap2[t], fram[iv])
				attachElementsCorrectly( pap3[t], fram[iv])
			end
		end
	end
end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), createTest)

function move()
	local time = getTickCount() / 500
	for i=1, 7 do
		local posX, posY, posZ = getElementPosition( fram[i])
		local movement = math.cos(time) * 5.5
		--setElementRotation( fram, rotX, rotY, movement)
		setElementPosition( fram[i], posX-movement/-150, posY, posZ)
	end
end
addEventHandler( "onClientRender", root, move)

bodyparts = { [1588] = true, [1589] = true, [1590] = true, [1591] = true, [1592] = true}
paperparts = { [3018] = true, [3019] = true, [3020] = true, [3021] = true, [3022] = true, [3023] = true, [3024] = true}
frames = { [1587] = true, [3025] = true}

--Event Syntax 'GTIgun:givePoint' : source, Message, Points, R, G, B, HitCount, Body Type, Medal Type

function targetHit( weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if hitElement then
		if source == localPlayer then
			local int, dim = getElementInterior( source), getElementDimension( source)
			if int == 1 and dim == 2 then
				if not isTimer( antiSpam) then
					local bodyModel = getElementModel( hitElement)
					if bodyparts[getElementModel(hitElement)] then
						if bodyModel == 1588 then
							triggerServerEvent( "GTIgun.givePoint", source, "+300", 300, 255, 45, 49, 1, "Head", "gold")
						elseif bodyModel == 1589 then
							triggerServerEvent( "GTIgun.givePoint", source, "+150", 150, 160, 160, 45, 1, "Left Shoulder", "silver")
						elseif bodyModel == 1590 then
							triggerServerEvent( "GTIgun.givePoint", source, "+150", 150, 160, 160, 45, 1, "Right Shoulder", "silver")
						elseif bodyModel == 1591 then
							triggerServerEvent( "GTIgun.givePoint", source, "+250", 250, 115, 155, 193, 1, "Right Body", "bronze")
						elseif bodyModel == 1592 then
							triggerServerEvent( "GTIgun.givePoint", source, "+250", 250, 115, 155, 193, 1, "Left Body", "bronze")
						end
					elseif paperparts[getElementModel(hitElement)] then
						if bodyModel == 3024 then
							triggerServerEvent( "GTIgun.givePoint", source, "+600", 600, 255, 45, 49, 1, "Head", "gold2")
						elseif bodyModel == 3023 then
							triggerServerEvent( "GTIgun.givePoint", source, "+300", 300, 160, 160, 45, 1, "Right Shoulder", "silver2")
						elseif bodyModel == 3022 then
							triggerServerEvent( "GTIgun.givePoint", source, "+300", 300, 160, 160, 45, 1, "Left Shoulder", "silver2")
						elseif bodyModel == 3021 then
							triggerServerEvent( "GTIgun.givePoint", source, "+250", 250, 115, 155, 193, 1, "Left Body", "bronze2")
						elseif bodyModel == 3020 then
							triggerServerEvent( "GTIgun.givePoint", source, "+250", 250, 115, 155, 193, 1, "Right Body", "bronze2")
						elseif bodyModel == 3019 then
							triggerServerEvent( "GTIgun.givePoint", source, "+50", 50, 150, 150, 150, 1, "Right Leg", "regular2")
						elseif bodyModel == 3018 then
							triggerServerEvent( "GTIgun.givePoint", source, "+50", 50, 150, 150, 150, 1, "Left Leg", "regular2")
						end
					elseif frames[getElementModel(hitElement)] then
						--showPoint( "+50", 255, 255, 255)
						--givePlayerMoney( 50)
						triggerServerEvent( "GTIgun.givePoint", source, "+50", 50, 150, 150, 150, 1, "Frame", "regular")
					end
					antiSpam = setTimer( function() end, 250, 1)
				end
			end
		end
	end
end
addEventHandler( "onClientPlayerWeaponFire", root, targetHit)
