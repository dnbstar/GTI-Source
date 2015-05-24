--<--------------------------------->--
-- Grand Theft International (GTI) ~
-- Author: NicKeLz and Emile ~
-- Resource: GTIircg/Tables.lua ~
-- Description: <Desc> ~
-- Data: #IRCgroups
--<--------------------------------->--


eTable = {
    ["#Lennyecho"] = 165, -- Lenny Face
    ["#GHoST"] = 2, -- NorthSideGHoST
    ["#CIA"] = 14, -- CIA
    ["#PsychoMob"] = 618, -- Psycho Mob
    ["#RudePrawns"] = 7, -- Rude Prawns
    -- [#Channel] = ID -- GroupName
}


--
vTable = {}

function getChannelFromGroupID(ID)
    if ( ID and vTable[ID] ) then
        return vTable[ID]
    end
end

function getGroupIDFromChannel(channel)
    if ( channel and eTable[channel] ) then
        return eTable[channel]
    end
end
