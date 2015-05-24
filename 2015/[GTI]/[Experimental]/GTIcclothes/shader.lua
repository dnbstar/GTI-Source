odata = {
	--texture = {},
	--shader = {},
	data = {},
}

function setPlayerData( player, key, data)
	if not odata.data[player] then
		odata.data[player] = {}
	end
	odata.data[player][key] = data
end

function getPlayerData( player, key)
	if odata.data[player] then
		local data = odata.data[player][key]
		if data then
			return data
		else
			return false
		end
	else
		return false
	end
end

--[[
CJ Textures:
cj_ped_head
cj_ped_torso
cj_ped_legs
cj_ped_feet
--]]

function applyCustomTexture( player, txd, wtxd)
	if not odata[player] then
		odata[player] = {}
	end
	if not odata[player]["s-"..wtxd] then
		odata[player]["s-"..wtxd] = dxCreateShader( "shader.fx", 0, 0, true, "ped")
		odata[player]["t-"..wtxd] = dxCreateTexture( txd, "dxt5", false, "clamp", "3d")

		dxSetShaderValue( odata[player]["s-"..wtxd], "Tex0", odata[player]["t-"..wtxd])
		engineApplyShaderToWorldTexture( odata[player]["s-"..wtxd], wtxd, player)
		setPlayerData( player, "shaderTexture", txd)
	else
		removeCustomTexture( player, wtxd)
		applyCustomTexture( player, txd, wtxd)
		setPlayerData( player, "shaderTexture", txd)
	end
end

function removeCustomTexture( player, wtxd)
	if not odata[player] then
		odata[player] = {}
	end
	if odata[player]["s-"..wtxd] and odata[player]["t-"..wtxd] then
		if wtxd then
			engineRemoveShaderFromWorldTexture( odata[player]["s-"..wtxd], wtxd)
		end
		if isElement( odata[player]["s-"..wtxd]) then
			destroyElement( odata[player]["s-"..wtxd])
			odata[player]["s-"..wtxd] = false
		end
		if isElement( odata[player]["t-"..wtxd]) then
			destroyElement( odata[player]["t-"..wtxd])
			odata[player]["t-"..wtxd] = false
		end
	end
end

--[[
function applyCustomTexture( player, txd, wtxd)
	if not odata.shader[wtxd] then
		odata.shader[wtxd] = dxCreateShader( "shader.fx", 0, 0, false, "ped")
		odata.texture[wtxd] = dxCreateTexture( txd, "dxt5", true, "wrap", "3d")

		dxSetShaderValue( odata.shader[wtxd], "Tex0", odata.texture[wtxd])
		engineApplyShaderToWorldTexture( odata.shader[wtxd], wtxd, player)
		setPlayerData( player, "shaderTexture", txd)
	else
		removeCustomTexture( player, wtxd)
		applyCustomTexture( player, txd, wtxd)
		setPlayerData( player, "shaderTexture", txd)
	end
end
--]]

--[[
function removeCustomTexture( player, wtxd)
	if odata.shader[wtxd] and odata.texture[wtxd] then
		if wtxd then
			engineRemoveShaderFromWorldTexture( odata.shader[wtxd], wtxd)
		end
		if isElement( odata.shader[wtxd]) then
			destroyElement( odata.shader[wtxd])
			odata.shader[wtxd] = false
		end
		if isElement( odata.texture[wtxd]) then
			destroyElement( odata.texture[wtxd])
			odata.texture[wtxd] = false
		end
	end
end
--]]
