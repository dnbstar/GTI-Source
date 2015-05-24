--Credit to author who scripted this on the wiki.
function displayMyTask ()
    local x,y = 100,200
    for k=0,4 do
        local a,b,c,d = getPedTask ( getLocalPlayer(), "primary", k )
        dxDrawText ( "Primary task #"..k.." is "..tostring(a).." -> "..tostring(b).." -> "..tostring(c).." -> "..tostring(d).." -> ", x, y )
        y = y + 15
    end
    y = y + 15
    for k=0,5 do
        local a,b,c,d = getPedTask ( getLocalPlayer(), "secondary", k )
        dxDrawText ( "Secondary task #"..k.." is "..tostring(a).." -> "..tostring(b).." -> "..tostring(c).." -> "..tostring(d).." -> ", x, y )    
        y = y + 15
    end
end    
addEventHandler ( "onClientRender", root, displayMyTask )