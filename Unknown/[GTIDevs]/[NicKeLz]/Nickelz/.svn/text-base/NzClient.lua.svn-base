--[[local aMap = {
    players = false,
    coords = false,
    cursor = false
}

addEventHandler ( "onClientClick", root, function ( button, state, x, y )
    if ( getElementData( getLocalPlayer(), "Quick.access" ) ) then
        if ( isPlayerMapVisible () and button == "left" ) then
            local minX, minY, maxX, maxY = getPlayerMapBoundingBox ()
            if ( ( x >= minX and x <= maxX ) and ( y >= minY and y <= maxY ) ) then
                local msx, msy = -(minX-maxX), -(minY-maxY)
                local x = 6000 * ( ( x - minX ) / msx ) - 3000
                local y = 3000 - 6000 * ( ( y - minY ) / msy )
                local mX, mY, mZ = getElementPosition( getLocalPlayer() )
                z = getGroundPosition ( mX, mY, 5000 ) or 40
                setElementPosition ( getLocalPlayer(), x, y, z + 1 )
            end
        end
    end
end )

bindKey ( "mouse2", "both", function ( key, state )
    if ( getElementData( getLocalPlayer(), "Quick.access" ) ) then
        if ( isPlayerMapVisible () ) then
            showCursor ( state == "down" )
            aMap.cursor = state == "down"
        end
    end
    end )]]

function setTimes (_, hour, minute)
    if ( tonumber(hour) ) then
		local hours = math.ceil(hour)
        if not ( tonumber(hours) <= 23 ) or ( tonumber(hours) < 0 ) then return end
        if ( minute ) then
			local minutes = math.ceil(minute)
            if not ( tonumber(minutes) <= 59 ) or ( tonumber(minutes) < 0 ) then return end
            setTime( hours, minutes )
            outputChatBox("#FF0000* Time set to #FFFFFF"..hours.." : "..minutes, 255, 255, 255, true)
        else
            setTime( hours, 00 )
            outputChatBox("#FF0000* Time set to #FFFFFF"..hours.." : 00", 255, 255, 255, true)
        end
    end
end
addCommandHandler("settime", setTimes)

--[[display = false
veh = false

function onPlayerTarget(elm)
    if ( elm ) then
        if ( isElement(elm) ) then
            if ( getElementType(elm) == 'vehicle' ) then
                if not ( isPedInVehicle(source) ) then
                    display = true
                    veh = elm
                    setTimer(function () display = false veh = false end,3500,1)
                end
            end
        end
    end
end
addEventHandler("onClientPlayerTarget",root,onPlayerTarget)

function draw()
    if isElement(veh) then
    local owner = getElementData(veh, "owner")
        if display then
            local xb,yb,zb = getElementPosition(veh)
            local xp,yp,zp = getElementPosition (localPlayer)
            local sx, sy = getScreenFromWorldPosition (xb, yb, zb+1)
                if sx and sy then
                    local theDistance = getDistanceBetweenPoints3D(xb, yb, zb, xp, yp, zp)
                        if theDistance < 25 then
                        dxDrawText ( "Owner : "..tostring(owner), sx+2, sy+2, sx, sy, tocolor(255,255,255, 255), 1.5, 'default', "center", "center" )
                        end
                end
        end 
    end
end
addEventHandler("onClientPreRender",root,draw)]]