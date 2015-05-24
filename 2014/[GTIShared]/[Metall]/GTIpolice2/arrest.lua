function arrestedPlayer()
	for i, stations in pairs(arrestPoints) do
		marker = createMarker(stations[1], stations[2] stations[3] - 1, "cylinder", 3.5, 0, 100, 255, 255)
		blip = createBlipAttachedTo(marker, 30)
		addEventHandler("onClientMarkerHit", marker, enteredPoliceMarker)
	end
end
addEvent("arrestedPlayer", true)
addEventHandler("arrestedPlayer", root, arrestedPlayer)

function enteredPoliceMarker(hitPlayer, matchingDim)
	if (hitPlayer ~= localPlayer) then return end
	if (matchingDim) then
		destroyElement(blip)
		destroyElement(marker)
		triggerServerEvent("finishArrest", root)
	end
end

function removeMarkers()
	if (isElement(blip) and isElement(marker)) then
		destroyElement(blip)
		destroyElement(marker)
	end
end
addEvent("removeMarkers", true)
addEventHandler("removeMarkers", root, removeMarkers)