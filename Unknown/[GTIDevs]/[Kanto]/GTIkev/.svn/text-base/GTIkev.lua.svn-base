local policeSkins = {[71]=true, [280]=true, [281]=true, [284]=true, [265]=true, [266]=true}
local sheriffSkins = {[282]=true, [283]=true, [288]=true}
polarmors = {}
sherrifarmors = {}
addEvent("onInteriorEnter", true)

--Remove all armor when the resource stops (to stop bone_attach from spamming)
addEventHandler("onResourceStop",resourceRoot,
function()
	for k,v in ipairs(getElementsByType("player")) do
		if (polarmors[v]) then
			if (isElement(polarmors[v])) then
				destroyElement(polarmors[v])
			end
			
			polarmors[v] = nil
			remHandler(v)
		end
	end
end)

function skinCheck()
	if polarmors[source] then
		destroyElement(polarmors[source])
		polarmors[source] = nil
		remHandler(source)
	else
		destroyElement(polarmors[source])
		polarmors[source] = nil
		remHandler(source)
	end
end

function onQuit()
	if polarmors[source] then
		destroyElement(polarmors[source])
		polarmors[source] = nil
		remHandler(source)
	else
		destroyElement(polarmors[source])
		polarmors[source] = nil
		remHandler(source)
	end
end

function onInteriorE()
	if polarmors[source] then
		destroyElement(polarmors[source])
		polarmors[source] = nil
		remHandler(source)
	else
		destroyElement(polarmors[source])
		polarmors[source] = nil
		remHandler(source)
	end
end

function onDamage()
	if getPedArmor(source) <= 80 then
		if polarmors[source] then
			destroyElement(polarmors[source])
			polarmors[source] = nil
			remHandler(source)
		else
			destroyElement(polarmors[source])
			polarmors[source] = nil
			remHandler(source)
		end
	end
end

function attachDetachArmor(player)
	local id = getElementModel(player)
	if policeSkins[id] then
		if polarmors[player] == nil then
			if getPedArmor(player) >= 80 then
				local policeKev = createObject(3903, 0, 0, 2000, 0, 0, 4)
				setObjectScale(policeKev, 1.15)
				exports.bone_attach:attachElementToBone(policeKev, player, 3, -0.005, 0.05, 0.05, 0, 269, 0)
				polarmors[player] = policeKev
				addEventHandler("onElementModelChange", player, skinCheck)
				addEventHandler("onPlayerQuit", player, onQuit)
				addEventHandler("onInteriorEnter", player, onInteriorE)
				addEventHandler("onPlayerDamage", player, onDamage)
			end
		else
			destroyElement(polarmors[player])
			polarmors[player] = nil
			remHandler(player)
		end
	elseif (sheriffSkins[id]) then
		if sherrifarmors[player] == nil then
			if getPedArmor(player) >= 80 then
				local sheriffKev = createObject(3902, 0, 0, 2000, 0, 0, 4)
				setObjectScale(sheriffKev, 1.15)
				exports.bone_attach:attachElementToBone(sheriffKev, player, 3, -0.005, 0.05, 0.05, 0, 269, 0)
				sherrifarmors[player] = sheriffKev
				addEventHandler("onElementModelChange", player, skinCheck)
				addEventHandler("onPlayerQuit", player, onQuit)
				addEventHandler("onInteriorEnter", player, onInteriorE)
				addEventHandler("onPlayerDamage", player, onDamage)
			end
		else
			destroyElement(sherrifarmors[player])
			sherrifarmors[player] = nil
			remHandler(player)
		end
	end
end
addCommandHandler("armor", attachDetachArmor)

function remHandler(player)
	removeEventHandler("onElementModelChange", player, skinCheck)
	removeEventHandler("onPlayerQuit", player, onQuit)
	removeEventHandler("onInteriorEnter", player, onInteriorE)
	removeEventHandler("onPlayerDamage", player, onDamage)
end