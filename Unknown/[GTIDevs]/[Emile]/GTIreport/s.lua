tempinfo = {}
info = {}
timer = {}
viewers = {}
killers = {}
function takeInformation()
    tempinfo[client] = {}
    if isTimer(timer[client]) then killTimer(timer[client]) end
    takePlayerScreenShot(client,1360,1024,nil,87,27000)
    local attacker = killers[client] or client
    tempinfo[client][1] = getPlayerName(attacker)
    tempinfo[client][2] = exports.GTIemployment:getPlayerJob(client) or "General Population"
    tempinfo[client][3] = exports.GTIemployment:getPlayerJob(attacker) or "General Population"
    tempinfo[client][4] = getPlayerName(client)
    timer[client] = setTimer(function(plr) 
        if isElement(plr) and tempinfo[plr] then
            if tempinfo[plr][5] and fileExists("screenshots/"..tempinfo[plr][5]..".jpg") then
                fileDelete("screenshots/"..tempinfo[plr][5]..".jpg")
            end
            tempinfo[plr] = nil
        end
    end,200000,1,client)
end
addEvent( "GTIreport.takeInformation", true)
addEventHandler( "GTIreport.takeInformation", root, takeInformation)

function sendReport(msg,rule)
    if not tempinfo[client] or not tempinfo[client][5] then outputChatBox("Screenshot is not uploaded yet.",client,255,0,0) return end
    local attacker = tempinfo[client][1] 
    local reporterjob = tempinfo[client][2]
    local attackerjob = tempinfo[client][3]
    local reporter = tempinfo[client][4]
    local ss = tempinfo[client][5]
    table.insert(info,{reporter,reporterjob,attacker,attackerjob,ss,msg,rule})
    tempinfo[client] = nil
    if isTimer(timer[client]) then killTimer(timer[client]) end
	exports.GTIirc:ircSay(exports.GTIirc:ircGetChannelFromName("#Gov't"), "13(REPORT) Report from "..reporter.." has arrived!")
    for i,v in ipairs(getElementsByType("player")) do
        if exports.GTIutil:isPlayerInACLGroup( v, "Admin1", "Admin2", "Admin3", "Admin4", "Admin5") then
            outputChatBox("* Report from "..reporter.." has arrived! Type /viewreports to check it out.",v,245,0,0)
        end
    end
end
addEvent( "GTIreport.sendReport", true)
addEventHandler( "GTIreport.sendReport", root, sendReport)

addEventHandler( "onPlayerScreenShot", root,
    function ( theResource, status, pixels, timestamp, tag )
        if ( theResource == getThisResource() ) and ( status == "ok" ) then 
            if tempinfo[source] then 
                local name = getPlayerName(source)
                local fileName = tostring(string.gsub(name,'%W','').."-"..timestamp)
                if fileExists("screenshots/"..fileName) then
                    local fileName = fileName..math.random(50)
                end
                local file = fileCreate("screenshots/"..fileName..".jpg")
                if not file then return triggerClientEvent(source,"GTIreport.enablebtn",resourceRoot,false,true) end
                fileWrite(file,pixels)
                fileClose(file)
                tempinfo[source][5] = fileName
                triggerClientEvent(source,"GTIreport.enablebtn",resourceRoot,true,true)
            elseif viewers[source] then 
                triggerClientEvent(viewers[source],"GTIreport.recievess",resourceRoot,pixels,false)
                viewers[source] = nil
            end
        end
    end
)
function delete(img,plr,punished)
    for i,v in pairs(info) do 
        if v[5] == img then
            table.remove(info,i)
            break
        end
    end
    if fileExists("screenshots/"..img..".jpg") then fileDelete("screenshots/"..img..".jpg") end
    local player = getPlayerFromName(plr)
    if player then
        if punished then
            outputChatBox("Your report was deleted because the player has been punished",player,0,255,0)
        else
            outputChatBox("Your report has been deleted because it was invalid",player,0,255,0)
        end
    end
end
addEvent( "GTIreport.delete", true)
addEventHandler( "GTIreport.delete", root, delete)
function cancel()
    if tempinfo[client] then 
        if tempinfo[client][5] and fileExists("screenshots/"..tempinfo[client][5]..".jpg") then 
            fileDelete("screenshots/"..tempinfo[client][5]..".jpg") 
        end
        tempinfo[client] = nil
        if isTimer(timer[client]) then killTimer(timer[client]) end
    end
end
addEvent( "GTIreport.cancel", true)
addEventHandler( "GTIreport.cancel", root, cancel)
function viewss(ss)
    if fileExists("screenshots/"..ss..".jpg") then
        local file = fileOpen("screenshots/"..ss..".jpg")
        local imagedata = fileRead(file,fileGetSize(file))
        triggerClientEvent(client,"GTIreport.recievess",resourceRoot,imagedata,true)
        fileClose(file)
    end
end
addEvent( "GTIreport.getss", true)
addEventHandler( "GTIreport.getss", root, viewss)

function getReports(player)
    if exports.GTIutil:isPlayerInACLGroup( player, "Admin1", "Admin2", "Admin3", "Admin4", "Admin5") then
        triggerClientEvent(player,"GTIreport.getReports",resourceRoot,info)
    end
end
addCommandHandler("viewreports",getReports)

function deleteAll()
    for i,v in ipairs(info) do
        if v[5] and fileExists("screenshots/"..v[5]..".jpg") then 
            fileDelete("screenshots/"..v[5]..".jpg") 
        end
    end
    for i,v in ipairs(tempinfo) do
        if v[5] and fileExists("screenshots/"..v[5]..".jpg") then 
            fileDelete("screenshots/"..v[5]..".jpg") 
        end
    end
end
addEventHandler("onResourceStop",resourceRoot,deleteAll)


function player_Wasted ( ammo, attacker, weapon, bodypart )
    if attacker and isElement(attacker) then
        if ( getElementType ( attacker ) == "player" ) then
            killers[source] = attacker
            setTimer(removeKiller,20000,1,source)
        end
    end
end
addEventHandler ( "onPlayerWasted", getRootElement(), player_Wasted )

function removeKiller(plr)
    local plr = plr or source
    if isElement(plr) then
        killers[plr] = nil
    end
end
addEventHandler("onPlayerQuit",root,removeKiller)

function takess(player,cmd,name)
    if name and exports.GTIutil:isPlayerInACLGroup( player, "Admin1", "Admin2", "Admin3", "Admin4", "Admin5") then
        local plr = exports.GTIutil:findPlayer(name)
        if plr and isElement(plr) then
            if viewers[plr] and isElement(viewers[plr]) then outputChatBox("Someone else has already been taken a screenshot of this player.",player,255,0,0) return end
            viewers[plr] = player
            takePlayerScreenShot(plr,1360,1024,nil,87,27000)
            exports.GTIhud:dm("Screenshot uploading...",player,0,255,0)
            exports.GTIlogs:outputAdminLog("Screenshot: "..getPlayerName(player).." has forced "..getPlayerName(plr).." to screenshot their screen", player)
        end
    end
end
addCommandHandler("takess",takess)