exports.scoreboard:addScoreboardColumn('Money', getRootElement(), 6, 80)

function updateMoneyTab()
    for index, player in ipairs( getElementsByType "player" ) do
    local cash = exports.GTIutil:tocomma(getPlayerMoney(player))
        setElementData(player, "Money", "$"..cash)
    end 
end
setTimer(updateMoneyTab, 2500, 0)