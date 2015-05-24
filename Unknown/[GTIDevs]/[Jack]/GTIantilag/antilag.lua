PING_LIMIT = 350
PACKETLOSS_LIMIT = 15
local lagging
local debug = false
local color = tocolor(255,0,0,255)

addEvent("onClientPlayerQuitJob",true)

function monitor()
    --Logging
    local packetloss = getNetworkStats().packetlossLastSecond
    local ping = getPlayerPing(localPlayer)
    
    if (exports.GTIemployment:getPlayerJob(localPlayer, true) == "Gangster" or exports.GTIemployment:getPlayerJob(localPlayer, true) == "SWAT Division" or exports.GTIemployment:getPlayerJob(localPlayer, true) == "Paramedic") then
        
        if not (exports.GTIemployment:getPlayerJob(localPlayer, true) == "Paramedic") then --Make sure paramedics aren't effected!
            --Handle packetloss and ping
            if packetloss >= PACKETLOSS_LIMIT then
                state = false
            else
                state = true
            end
            toggleControl("fire",state)
            
            if ping >= PING_LIMIT then
                state = false
            else
                state = true
            end
            toggleControl("sprint",state)
            
            if packetloss >= PACKETLOSS_LIMIT or ping >= PING_LIMIT then
                lagging = true
            else
                lagging = false
            end
        end
        
        local px, py, pz, tx, ty, tz, dist
        px, py, pz = getCameraMatrix( )
        for _, v in ipairs( getElementsByType("player") ) do
            if (v ~= localPlayer) then
                if (getElementData(v,"lagging")) then
                    tx, ty, tz = getElementPosition( v )
                    dist = math.sqrt( ( px - tx ) ^ 2 + ( py - ty ) ^ 2 + ( pz - tz ) ^ 2 )
                    if dist < 30.0 then
                        if isLineOfSightClear( px, py, pz, tx, ty, tz, true, false, false, true, false, false, false,localPlayer ) then
                            local sx, sy, sz = getPedBonePosition( v, 5 )
                            local x,y = getScreenFromWorldPosition( sx, sy, sz + 0.3 )
                            if x then -- getScreenFromWorldPosition returns false if the point isn't on screen
                                dxDrawText( "Lagger", x, y, x, y, color, 0.65 + ( 15 - dist ) * 0.02, "bankgothic","center","center" )
                            end
                        end
                    end
                end
            end
        end
    end
end
addEventHandler("onClientRender",root,monitor)

setTimer(function() 
    setElementData(localPlayer,"lagging",lagging,true) --Data sync
    color = tocolor(math.random(255),math.random(255),math.random(255),255)
    end, 1000, 0
)

addEventHandler("onClientResourceStop",resourceRoot,
function()
    --Re-enable control when the resource stops.
    toggleControl("fire",true)
    toggleControl("sprint",true)
    setElementData(localPlayer,"lagging",false,true)
end)

addEventHandler("onClientPlayerQuitJob",resourceRoot,
function(job)
    if (job == "Gangster") or (job == "SWAT Division") then
        toggleControl("fire",true)
        toggleControl("sprint",true)
        setElementData(localPlayer,"lagging",false,true)
    end
end)