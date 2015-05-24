local blacklisted_clothes = {
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
}

function getCurrentPlayerClothes( theElement)
	guiGridListClear( GTIclothing.gridlist[3])
	for i = 0, 17 do
		if not blacklisted_clothes[i] then
			local txd, dff = getPedClothes( theElement, i)
			if type(txd) ~= "boolean" and type(dff) ~= "boolean" then
				for k, item in ipairs (clothes) do
					if string.match( item.texture, txd) and string.match(item.model, dff) then
						local apparelRow = guiGridListAddRow( GTIclothing.gridlist[3])
						guiGridListSetItemText( GTIclothing.gridlist[3], apparelRow, 1, "$"..exports.GTIutil:tocomma(item.price).." | "..item.name, false, false)
					end
				end
			end
		end
	end
end

function getClothesFromID( theID)
	guiGridListClear( GTIclothing.gridlist[2])
	if type( theID) == "number" then
		for i, item in ipairs (clothes) do
			if item.id ~= nil then
				if theID == item.id then
					local itemRow = guiGridListAddRow( GTIclothing.gridlist[2])
					guiGridListSetItemText( GTIclothing.gridlist[2], itemRow, 1, "$"..exports.GTIutil:tocomma( item.price).." - "..item.name, false, false)
					guiGridListSetItemData( GTIclothing.gridlist[2], itemRow, 1, item.texture..";"..item.model..";"..item.id)
				end
			end
		end
	end
end

function previewClothingItem( txd, dff, id)
	if txd and dff and id then
		local ctxd, cdff = getPedClothes( theClothingPed, id)
		if ctxd and cdff then
			if string.match( ctxd, txd) and string.match( cdff, dff) then
				getCurrentPlayerClothes( theClothingPed, txd, dff)
			else
				if isElement(theClothingPed) then
					addPedClothes( theClothingPed, txd, dff, id)
					getCurrentPlayerClothes( theClothingPed, txd, dff)
				end
			end
		else
			if isElement(theClothingPed) then
				addPedClothes( theClothingPed, txd, dff, id)
				getCurrentPlayerClothes( theClothingPed, txd, dff)
			end
		end
	end
end

-- Buttons

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIclothing.label[3] then
			if guiGetVisible( GTIclothing.staticimage[1]) then
				displayStore( false, "", localPlayer)
			end
		elseif source == GTIclothing.gridlist[1] then
			local categoryRow, categoryCol = guiGridListGetSelectedItem( GTIclothing.gridlist[1])
			local theClothingID = guiGridListGetItemData( GTIclothing.gridlist[1], categoryRow, categoryCol)
			getClothesFromID( theClothingID)
		elseif source == GTIclothing.gridlist[2] then
			local itemRow, itemCol = guiGridListGetSelectedItem( GTIclothing.gridlist[2])
			local theClothingData = guiGridListGetItemData( GTIclothing.gridlist[2], itemRow, itemCol)
			local theClothingData = split( theClothingData, ";")
			local txd, dff, id = theClothingData[1], theClothingData[2], theClothingData[3]
			previewClothingItem( txd, dff, id)
		end
	end
)

local levelTable = {
	[0] = 400,			[11] = 44600,			[22] = 122800,
	[1] = 1600,			[12] = 52800,			[23] = 160000,
	[2] = 3800,			[13] = 64000,			[24] = 182200,
	[3] = 7000,			[14] = 73200,			[25] = 242600,
	[4] = 9200,			[15] = 79400,			[26] = 284800,
	[5] = 11400,		[16] = 84600,			[27] = 328600,
	[6] = 19800,		[17] = 92800,			[28] = 362800,
	[7] = 22200,		[18] = 104000,			[29] = 496400,
	[8] = 29000,		[19] = 106200,			[30] = 750000,
	[9] = 33200,		[20] = 109400,
	[10] = 39400,		[21] = 114600,
}

local screenW, screenH = guiGetScreenSize()
local resX, resY = 1366, 768

function aToR( X, Y, sX, sY)
    local sW, sH = guiGetScreenSize()
    local xd = X/resX or X
    local yd = Y/resY or Y
    local xsd = sX/resX or sX
    local ysd = sY/resY or sY
    return xd*sW, yd*sH, xsd*sW, ysd*sH
end

--[[
local level = 0
local TotalXP = 0
local XP = 0
local maxXP = levelTable[level]
local editing = false
local editType = "neutral"
local lastDXPos = 0
local theWhiteAdd = 0

function edit( theXP)
	TotalXP = theXP
end

function wedit( theW)
	theWhiteAdd = theW
end

function timerIncrease()
	if TotalXP ~= XP then
		if editing then
			--setTimer( increase, 50, XP, TotalXP+2)
			if editType == "plus" then
				edit( TotalXP+100)
			end
		else
			editing = true
		end
	else
		editing = false
		editType = "neutral"
		if theWhiteAdd ~= 0 then
			wedit( theWhiteAdd-theWhiteAdd)
		end
		local ngetX, ngetY, ngetSX, ngetSY = aToR( 0, 0, (TotalXP/maxXP)*224, 0)
		lastDXPos = ngetSX
		if XP >= maxXP then
			if levelTable[level] then
				level = level+1
				maxXP = levelTable[level]
			else
				level = 30
				maxXP = maxXP[level]
				XP = maxXP[level]
				TotalXP = maxXP[level]
			end
		end
	end
end
addEventHandler("onClientRender", root, timerIncrease)
--setTimer( timerIncrease, 50, 0)

function increaseXP( cmd, theXP)
	XP = XP + theXP
	editType = "plus"
	theWhiteAdd = theXP
end
addCommandHandler( "giveXP", increaseXP)

addEventHandler("onClientRender", root,
    function()
		local x1, y1, xs1, ys1 = aToR( 10, 377, 228, 12)
		local x2, y2, xs2, ys2 = aToR( 12, 379, (TotalXP/maxXP)*224, 8)
		local x3, y3, xs3, ys3 = aToR( 10, 358, 238, 379)
		local wX, wY, wSX, wSY = aToR( 12, 379, theWhiteAdd/224, 8)
        dxDrawRectangle( x1, y1, xs1, ys1, tocolor(0, 0, 0, 200), false)
        dxDrawRectangle( x2, y2, xs2, ys2, tocolor(53, 130, 208, 255), false)
		dxDrawRectangle( x2+lastDXPos, wY, wSX, wSY, tocolor( 255, 255, 255, 255), false)
		dxDrawText("Level: "..level.." - XP: "..TotalXP.."/"..maxXP.." (DX Math: "..lastDXPos.." - "..editType..")", x3, y3, xs3, ys3, tocolor(255, 255, 255, 255), 1.00, "default", "left", "center", false, false, false, false, false)
    end
)
--]]
