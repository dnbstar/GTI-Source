local garages = {
	--{garageName,x,y,z,exitX,exitY,exitZ,rot}
	[1] = {"Doherty Garage",-2037.6865234375, 178.8974609375,28.8359375,-2023.2919921875,156.5546875,28.8359375,180}
}

local garageMarkers = {}
local dimensions = {} --Store the used dimensions in here, so we don't get no issues

function onStart()
	for k,v in ipairs(garages) do
		local marker = createMarker(v[3],v[4],v[5]-1,"cylinder",3,255,0,0)
		garageMarkers[marker] = {id=v[1],name=v[2],eX=v[6],eY=v[7],eZ=v[8],rot=v[9]}
		addEventHandler("onMarkerHit",marker,onGarageMarkerHit)
	end
end
addEventHandler("onResourceStart",resourceRoot,onStart)

function onGarageMarkerHit(hitElement,dim)
	if (hitElement) and (getElementType(hitElement) == "vehicle") then
		--Anti-Troll--
		local driver = getVehicleOccupant(hitElement,0)
		local vehicleOwner = getElementData(hitElement,"vehicleOwner")
		if not (vehicleOwner) or not (vehicleOwner == getAccountName(driver)) then
			outputChatBox("You must own this vehicle to modify it.",driver,255,0,0)
			return false
		end
		
		local garageID = garageMarkers[source][1]
		openGarage(driver,hitElement,garageID)
	else
		outputChatBox("You must be in a vehicle to modify your vehicle!",hitElement,255,0,0)
		return false
	end
end

function openGarage(driver,vehicle,garageID)
	if (isElement(driver)) and (getElementType(driver) == "player") and (isElement(vehicle)) and (getElementType(vehicle) == "vehicle") and garageID then
		--Begin "creating" the garage and warping the vehicle and driver into the garage.
	else
		outputDebugString("Missing arg / wrong arg type for "..getPlayerName(driver)..", returning...",0,255,0,0)
		return false
	end
end