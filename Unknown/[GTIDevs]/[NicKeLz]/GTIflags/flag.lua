--<--------------------------------->--
-- Grand Theft International (GTI) ~
-- Author: NicKeLz ~
-- Resource: GTIflags/flag.lua ~
-- Description: Scoreboard Country Flags ~
-- Data: #Flags
--<--------------------------------->--

exports.scoreboard:addScoreboardColumn('Country', getRootElement(), 5, 110)

function getCountry()
    if (not getResourceFromName("admin") or getResourceState(getResourceFromName("admin")) ~= "running") then return end
        local flag = exports.admin:getPlayerCountry(source) or "US"
        local ID   = tostring( flag )
        if flag then
            setElementData(source,"Country",{type="image",src=":admin/client/images/flags/"..flag..".png",width=20, id=ID})
        end
end
addEventHandler("onPlayerJoin", getRootElement(), getCountry)
addEventHandler("onPlayerChat", getRootElement(), getCountry)