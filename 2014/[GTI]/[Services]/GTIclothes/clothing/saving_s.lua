function saveClothes()
	local account = getPlayerAccount(source)
	if not isGuestAccount(account) then
		if getElementModel(source) == 0 then
			local texture = {}
			local model = {}
			for i=0, 17, 1 do
				local clothesTexture, clothesModel = getPedClothes(source, i)
				if ( clothesTexture ~= false ) then
					table.insert(texture, clothesTexture)
					table.insert(model, clothesModel)
				else
					table.insert(texture, " ")
					table.insert(model, " ")
				end
			end
			local allTextures = table.concat(texture, ",")
			local allModels = table.concat(model, ",")
			setAccountData(account, "clothes:Texture", allTextures)
			setAccountData(account, "clothes:Model", allModels)
			texture = {}
			model = {}
		end
	end
end
addEventHandler("onPlayerQuit", root, saveClothes)
addEventHandler("onPlayerWasted", root, saveClothes)

function setClothes()
	local account = getPlayerAccount(source)
	if ( not isGuestAccount(account) ) then
		if getElementModel( source) == 0 then
			local textureString = getAccountData(account, "clothes:Texture")
			local modelString = getAccountData(account, "clothes:Model")
			if textureString then
				if modelString then
					local textures = split(textureString, 44)
					local models = split(modelString, 44)
					--setElementModel(source,0)
					for i=0, 17, 1 do
						if ( textures[i+1] ~= " " ) then
							addPedClothes(source, textures[i+1], models[i+1], i)
						end
					end
				end
			end
			textures = {}
			models = {}
		end
	end
end
addEventHandler("onPlayerLogin", root, setClothes)
addEventHandler("onPlayerSpawn", root, setClothes)

