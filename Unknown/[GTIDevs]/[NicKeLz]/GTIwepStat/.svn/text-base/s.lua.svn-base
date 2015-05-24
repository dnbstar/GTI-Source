--<--------------------------------->--
-- Grand Theft International (GTI) ~
-- Author: NicKeLz ~
-- Resource: GTIwepStat/s.lua ~
-- Description: Weapon Stats ~
-- Data: #WepStats
--<--------------------------------->--

local Stats = {
    [22] = { 69 };
    [23] = { 70 };
    [24] = { 71 };
    [25] = { 72 };
    [27] = { 74 };
    [28] = { 75 };
    [32] = { 75 };
    [29] = { 76 };
    [30] = { 77 };
    [31] = { 78 };
    [34] = { 79 };
};

function increaseSkills ( ammo, attacker, weapon, bodypart )
    if ( attacker ) then
        if ( getElementType ( attacker ) == "player") then
            if not (Stats[tonumber(weapon)]) then return end
                getOldStat = getPedStat ( attacker, Stats[tonumber(weapon)][1] )
                
            if ( weapon == 28 or 32 and getPedStat(attacker, 75) >= 998 ) then
                setPedStat ( attacker, 75, 998 )
            end
            
            if ( weapon == 22 and getPedStat(attacker, 69) >= 998 ) then
                    setPedStat ( attacker, 69, 998 )
            end
            setPedStat ( attacker, Stats[tonumber(weapon)][1],getOldStat + 100 )
            setPedStat(attacker, 73, 0)
            setWeaponProperty(26, "poor", "damage", 4)
        end
    end
end
addEventHandler ( "onPlayerWasted", getRootElement(), increaseSkills )

addEventHandler('onPlayerQuit',root,
function()
    local vAcc = getPlayerAccount(source)
        if not vAcc or isGuestAccount(vAcc) then return end
        exports.GTIaccounts:SAD(vAcc,'w69', getPedStat (source, 69))
        exports.GTIaccounts:SAD(vAcc,'w71', getPedStat (source, 71))
        exports.GTIaccounts:SAD(vAcc,'w72', getPedStat (source, 72))
        exports.GTIaccounts:SAD(vAcc,'w74', getPedStat (source, 74))
        exports.GTIaccounts:SAD(vAcc,'w75', getPedStat (source, 75))
        exports.GTIaccounts:SAD(vAcc,'w76', getPedStat (source, 76))
        exports.GTIaccounts:SAD(vAcc,'w77', getPedStat (source, 77))
        exports.GTIaccounts:SAD(vAcc,'w78', getPedStat (source, 78))
        exports.GTIaccounts:SAD(vAcc,'w79', getPedStat (source, 79))
end
)

addEventHandler('onPlayerLogin',root,
function(_,acc)
local pAcc = getPlayerAccount(source)
    local d69 = exports.GTIaccounts:GAD(pAcc,'w69')
    local d71 = exports.GTIaccounts:GAD(pAcc,'w71')
    local d72 = exports.GTIaccounts:GAD(pAcc,'w72')
    local d74 = exports.GTIaccounts:GAD(pAcc,'w74')
    local d75 = exports.GTIaccounts:GAD(pAcc,'w75')
    local d76 = exports.GTIaccounts:GAD(pAcc,'w76')
    local d77 = exports.GTIaccounts:GAD(pAcc,'w77')
    local d78 = exports.GTIaccounts:GAD(pAcc,'w78')
    local d79 = exports.GTIaccounts:GAD(pAcc,'w79')
    if ( d69 or d71) then
        setPedStat(source, 69, tonumber(d69))
        setPedStat(source, 71, tonumber(d71))
        setPedStat(source, 72, tonumber(d72))
        setPedStat(source, 73, 0)
        setPedStat(source, 74, tonumber(d74))
        setPedStat(source, 75, tonumber(d75))
        setPedStat(source, 76, tonumber(d76))
        setPedStat(source, 77, tonumber(d77))
        setPedStat(source, 78, tonumber(d78))
        setPedStat(source, 79, tonumber(d79))
        setWeaponProperty(26, "poor", "damage", 4)
        end
        end )
        
function removeSawn (  )
    for index, player in ipairs(getElementsByType("player")) do
    setPedStat(player, 73, 0)
    setWeaponProperty(26, "poor", "damage", 4)
    end
end
addEventHandler ( "onResourceStart", resourceRoot, removeSawn )