local last = {}

function fireWeapon(weapon, ammo, clip, hitX, hitY, hitZ, element)
	if (weapon == 41) then
		cancelEvent(true, "Spraycan")
	end
	if (element and getElementType(element) == "vehicle") then
		if (getVehicleOccupant(element) and last[source] ~= element and weapon ~= 41) then
			last[source] = element
			triggerServerEvent("addCrime", source, 15)
		end
		setTimer(removeLast, 1500, 1)
	end
end
addEventHandler("onClientPlayerWeaponFire", root, fireWeapon)

function removeLast()
	last[localPlayer] = false
end