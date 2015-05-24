function job_f(server,channel,user,command,name)
    if not name then exports.GTIirc:ircNotice(user,"Syntax is !job <name>") return end
        local player = getPlayerFromPartialName(name)
            if player then
                local job = exports.GTIemployment:getPlayerJob(player) or 'Unknown'
                exports.GTIirc:ircNotice(user,getPlayerName(player).." is working as "..job..".")
                else
                exports.GTIirc:ircNotice(user,"'"..name.."' no such player")
            end
end

addEventHandler("onResourceStart",resourceRoot,
    function()
        if (not getResourceFromName("GTIirc") or getResourceState(getResourceFromName("GTIirc")) ~= "running") then return end
        exports.GTIirc:addIRCCommandHandler("!job",'job_f',0,false)
    end
)

addEventHandler("onResourceStart",root,
function(resource)
        if (getResourceName(resource) == "GTIirc") then
        exports.GTIirc:addIRCCommandHandler("!job",'job_f',0,false)
        end
end)

function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

