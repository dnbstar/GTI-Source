addEvent( "GTIgun.givePoint", true)
addEventHandler( "GTIgun.givePoint", root,
	function( message, points, r, g, b, multiplier, bodyType, medalType)
		if message then
			if points then
				showPoint( source, message, r, g, b)
				placePoint( source, points)
				placeMultiplier( source, multiplier, medalType)
			end
		end
	end
)

function placeHitMarker()
end

function placeMultiplier( player, multiplier, multiType)
	if isElement( player) then
		if multiplier then
			if multiType then
				if multiType == "regular" then
					local rGathered = getElementData( player, "rH") or 0
					setElementData( player, "rH", rGathered+multiplier)
				elseif multiType == "bronze" then
					local bGathered = getElementData( player, "bH") or 0
					setElementData( player, "bH", bGathered+multiplier)
				elseif multiType == "silver" then
					local sGathered = getElementData( player, "sH") or 0
					setElementData( player, "sH", sGathered+multiplier)
				elseif multiType == "gold" then
					local gGathered = getElementData( player, "gH") or 0
					setElementData( player, "gH", gGathered+multiplier)
				elseif multiType == "regular2" then
					local rGathered2 = getElementData( player, "rH") or 0
					setElementData( player, "rH", rGathered2+multiplier)
				elseif multiType == "bronze2" then
					local bGathered2 = getElementData( player, "bH2") or 0
					setElementData( player, "bH2", bGathered2+multiplier)
				elseif multiType == "silver2" then
					local sGathered2 = getElementData( player, "sH2") or 0
					setElementData( player, "sH2", sGathered2+multiplier)
				elseif multiType == "gold2" then
					local gGathered2 = getElementData( player, "gH2") or 0
					setElementData( player, "gH2", gGathered2+multiplier)
				end
			end
		end
	end
end

function placeMedal( player, medalType)
end

function placePoint( player, thePoint)
	if isElement( player) then
		if thePoint then
			local pointsGathered = getElementData( player, "gunPoints") or 0
			setElementData( player, "gunPoints", pointsGathered+thePoint)
		end
	end
end
