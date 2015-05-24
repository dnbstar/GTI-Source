local screenW, screenH = guiGetScreenSize()

local offset = 19

function guiCreateColorLabel( ax, ay, bx, by,str, bool, parent )
    local pat = "(.-)#(%x%x%x%x%x%x)"
    local s, e, cap, col = str:find( pat, 1 )
    local last = 1
    local r,g,b
    while s do
        if cap == "" and col then r,g,b = tonumber( "0x"..col:sub( 1, 2 ) ), tonumber( "0x"..col:sub( 3, 4 ) ), tonumber( "0x"..col:sub( 5, 6 ) ) end
        if s ~= 1 or cap ~= "" then
            local w = dxGetTextWidth( cap )
            avc321 = guiCreateLabel( ax, ay, ax + w, by,cap,bool,parent )
            if not r then r = 255 end
            if not g then g = 255 end
            if not b then b = 255 end
            guiLabelSetColor( avc321,r,g,b )
            ax = ax + w
            r,g,b = tonumber( "0x"..col:sub( 1, 2 ) ), tonumber( "0x"..col:sub( 3, 4 ) ), tonumber( "0x"..col:sub( 5, 6 ) )
        end
        last = e + 1
        s, e, cap, col = str:find( pat, last )
    end
    if last <= #str then
        local cap = str:sub( last )
        local w = dxGetTextWidth( cap )
        local avc123 = guiCreateLabel( ax, ay, ax + w, by,cap,bool,parent )
        guiLabelSetColor( avc123,r or 255,g or 255,b or 255 )
        return avc123
    end
end

GTIstatistics = {
    scrollpane = {},
    edit = {},
    button = {},
    window = {},
    label = {},
    gridlist = {},
    statlbl = {},
}

GTIstatistics.window[1] = guiCreateWindow((screenW - 532) / 2, (screenH - 436) / 2, 532, 436, "GTI - Player Statistics", false)
guiWindowSetSizable(GTIstatistics.window[1], false)
guiSetAlpha( GTIstatistics.window[1], 175)
guiSetVisible( GTIstatistics.window[1], false)

GTIstatistics.edit[1] = guiCreateEdit(10, 26, 180, 26, "", false, GTIstatistics.window[1])
GTIstatistics.gridlist[1] = guiCreateGridList(10, 62, 180, 364, false, GTIstatistics.window[1])
guiGridListSetSortingEnabled ( GTIstatistics.gridlist[1], false )
guiGridListAddColumn(GTIstatistics.gridlist[1], "Players", 0.9)

GTIstatistics.scrollpane[1] = guiCreateScrollPane(200, 53, 328, 373, false, GTIstatistics.window[1])

GTIstatistics.label[1] = guiCreateLabel(10, 10, 302, 15, "", false, GTIstatistics.scrollpane[1])
guiSetFont(GTIstatistics.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(GTIstatistics.label[1], "center", false)

GTIstatistics.button[1] = guiCreateButton(447, 24, 75, 19, "Close", false, GTIstatistics.window[1])
guiSetProperty(GTIstatistics.button[1], "NormalTextColour", "FFAAAAAA")

--[[
statsToView = {
    { "Name"},
    { "Account"},
    { "Hours"},
    { "Origin"},
    { "Location"},
    { "Money"},
    { "Occupation"},
    { "Group"},
    { "Group Rank"},
    { "Kills"},
    { "Deaths"},
    { "KDR"},
    { "Wanted Level"},
    { "Arrests"},
    { "Arrest Points"},
    { "Heal Points"},
    { "Job Level"},
}

for i, stat in ipairs ( statsToView) do
    local statName = stat[1]

    GTIstatistics.statlbl[i] = guiCreateColorLabel(10, (35-offset)+(i*offset), 302, 15, "#FFFFFF"..statName..":         #FF0000Hex Color Test", false, GTIstatistics.scrollpane[1])
    --guiSetFont(GTIstatistics.statlbl.name[i], "default-bold-small")
    --GTIstatistics.statlbl.value[i] = guiCreateColorLabel(127, (35-offset)+(i*offset), 185, 15, i.." - #FF0000 hex test", false, GTIstatistics.scrollpane[1])
end
--]]

function refreshPlayerList()
    guiGridListClear( GTIstatistics.gridlist[1])
    for i, team in ipairs ( getElementsByType( "team")) do
        local tNumber = #getPlayersInTeam(team)
        if (tNumber > 0) then
            local row = guiGridListAddRow( GTIstatistics.gridlist[1])
            local teamName = getTeamName( team)
            local tR, tG, tB = getTeamColor( team)
                --jR = tR
                --jG = tG
                --jB = tB
            guiGridListSetItemText( GTIstatistics.gridlist[1], row, 1, teamName, true, false)
            guiGridListSetItemColor( GTIstatistics.gridlist[1], row, 1, tR, tG, tB)
            for k, player in ipairs ( getPlayersInTeam(team)) do
                local row = guiGridListAddRow( GTIstatistics.gridlist[1])
                local plrName = getPlayerName( player)
                guiGridListSetItemText( GTIstatistics.gridlist[1], row, 1, plrName, false, false)
				local r, g, b = getPlayerNametagColor(player)
                guiGridListSetItemColor( GTIstatistics.gridlist[1], row, 1, r, g, b)
            end
        end
    end
end

addEventHandler( "onClientGUIClick", root,
    function()
        if source == GTIstatistics.gridlist[1] then
            local row, col = guiGridListGetSelectedItem ( source)
            if row and col then
                local playerName = guiGridListGetItemText( source, row, col)
                local player = getPlayerFromName( playerName)
                if player then
                    triggerServerEvent( "GTIstatistics.getAllStats", localPlayer, playerName)
                end
            end
        elseif source == GTIstatistics.button[1] then
            if guiGetVisible( GTIstatistics.window[1]) then
                guiSetVisible( GTIstatistics.window[1], false)
                showCursor( false)
            end
        end
    end
)

function addAllStats( statsTable, thePlayer)
    local team = getPlayerTeam( thePlayer)
    local pR, pG, pB = getTeamColor( team)
    if type( statsTable) == "table" then
        --Place Stats
        for i, data in ipairs ( statsTable) do
            local name = data[1]
            local value = data[2]

			local value = tostring( value)
            local value = string.gsub( value, "false", "N/A")
            local value = string.gsub( value, "nil", "N/A")

            guiSetText( GTIstatistics.label[1], getPlayerName( thePlayer))
            guiLabelSetColor( GTIstatistics.label[1], pR, pG, pB)
            if not GTIstatistics.statlbl[i] then
                if value ~= "" then
                    GTIstatistics.statlbl[i] = guiCreateLabel(10, (35-offset)+(i*offset), 302, 15, name..":  "..value, false, GTIstatistics.scrollpane[1])
                else
                    GTIstatistics.statlbl[i] = guiCreateLabel(10, (35-offset)+(i*offset), 302, 15, name.."  "..value, false, GTIstatistics.scrollpane[1])
                end
                guiLabelSetColor( GTIstatistics.statlbl[i], pR, pG, pB)
            else
                if value ~= "" then
                    guiSetText( GTIstatistics.statlbl[i], name..": "..value)
                else
                    guiSetText( GTIstatistics.statlbl[i], name.." "..value)
                end
                guiLabelSetColor( GTIstatistics.statlbl[i], pR, pG, pB)
                --GTIstatistics.statlbl[i] = guiCreateColorLabel(10, (35-offset)+(i*offset), 302, 15, "#FFFFFF"..name..":   #FF0000"..value, false, GTIstatistics.scrollpane[1])
            end
        end
    end
end
addEvent( "GTIstatistics.returnData", true)
addEventHandler( "GTIstatistics.returnData", root, addAllStats)

function playerSearch()
    local searchString = guiGetText( source)

    local teams = {}
    for i,team in ipairs(getElementsByType("team")) do
        for i,player in ipairs(getPlayersInTeam(team)) do
            if (string.find(string.lower(getPlayerName(player)), string.lower(searchString))) then
                if (not teams[team]) then teams[team] = {} end
                table.insert(teams[team], player)
            end
        end
    end

    guiGridListClear(GTIstatistics.gridlist[1])
    for i,team in ipairs(getElementsByType("team")) do
        if (teams[team]) then
            local row = guiGridListAddRow(GTIstatistics.gridlist[1])
            guiGridListSetItemText(GTIstatistics.gridlist[1], row, 1, getTeamName(team), true, false)
            local r,g,b = getTeamColor(team)
            guiGridListSetItemColor(GTIstatistics.gridlist[1], row, 1, r, g, b)
            for i,player in ipairs(teams[team]) do
                local row = guiGridListAddRow(GTIstatistics.gridlist[1])
                guiGridListSetItemText(GTIstatistics.gridlist[1], row, 1, getPlayerName(player), false, false)
                local r,g,b = getPlayerNametagColor(player)
                guiGridListSetItemColor(GTIstatistics.gridlist[1], row, 1, r, g, b)
            end
        end
    end
end

addEventHandler( "onClientResourceStart", resourceRoot,
    function()
        refreshPlayerList()
        --setTimer( refreshPlayerList, 5000, 0)

        addEventHandler("onClientGUIChanged", GTIstatistics.edit[1], playerSearch)
    end
)

addCommandHandler( "stats",
    function()
        local swin = guiGetVisible( GTIstatistics.window[1])
        if not swin then
            guiSetVisible( GTIstatistics.window[1], true)
            showCursor( true)
            refreshPlayerList()
        else
            guiSetVisible( GTIstatistics.window[1], false)
            showCursor( false)
            --refreshPlayerList()
        end
    end
)

function RGBToHex(red, green, blue, alpha)
    if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
        return nil
    end
    if(alpha) then
        return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
    else
        return string.format("#%.2X%.2X%.2X", red,green,blue)
    end
end
