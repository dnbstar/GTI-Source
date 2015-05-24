--<--------------------------------->--
-- Grand Theft International (GTI) ~
-- Author: NicKeLz ~
-- Resource: GTImods/vClient.lua ~
-- Description: Vehicle Modifications ~
-- Data: #Vehmods
--<--------------------------------->--

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        panel = guiCreateWindow(362, 265, 451, 314, "GTI - Vehicle Modifications", false)
        guiWindowSetSizable(panel, false)
        guiSetVisible(panel, false)
        gl = guiCreateGridList(9, 23, 433, 240, false, panel)
        guiGridListSetSortingEnabled(gl, false)
        guiGridListAddColumn(gl, "ID", 0.12)
        guiGridListAddColumn(gl, "Vehicle Name", 0.21)
        guiGridListAddColumn(gl, "Replace With", 0.21)
        guiGridListAddColumn(gl, "Size", 0.12)
        guiGridListAddColumn(gl, "Download", 0.13)
        guiGridListAddColumn(gl, "Enabled", 0.13)
        download = guiCreateButton(11, 271, 100, 26, "Download", false, panel)
        guiSetFont(download, "default-bold-small")
        guiSetProperty(download, "NormalTextColour", "F8A5A5A5")
        del = guiCreateButton(121, 271, 100, 26, "Delete", false, panel)
        guiSetFont(del, "default-bold-small")
        guiSetProperty(del, "NormalTextColour", "F8A5A5A5")
        enable = guiCreateButton(231, 271, 100, 26, "Enable/Disable", false, panel)
        guiSetFont(enable, "default-bold-small")
        guiSetProperty(enable, "NormalTextColour", "F8A5A5A5")
        close = guiCreateButton(341, 271, 100, 26, "Close", false, panel)
        guiSetFont(close, "default-bold-small")
        guiSetProperty(close, "NormalTextColour", "F8A5A5A5") 
       CW(panel) 
    end
)
local eTable = {}
local dTable = {}
local enabledIDs = {}

addCommandHandler("vehmods",
function()
local status = not guiGetVisible(panel)
guiSetVisible(panel, status)
showCursor(status)
refreshList()
end
)

addEventHandler('onClientGUIClick', root,
function()
    if ( source == close ) then
        guiSetVisible(panel, false)
        showCursor(guiGetVisible(panel))
        
    elseif ( source == download ) then
        local row, col = guiGridListGetSelectedItem(gl)
        if ( row ~= -1 and col ~= 0 ) then
            local name = guiGridListGetItemData(gl, row, 2)
            downloadMod(name)
            refreshList()
        end
            
    elseif ( source == enable ) then
        local row, col = guiGridListGetSelectedItem ( gl )
        if ( not isPedInVehicle(localPlayer) ) then
            local row, col = guiGridListGetSelectedItem ( gl )
            if ( row ~= -1 and col ~= 0 ) then
                local vehName = guiGridListGetItemData(gl, row, 2)
                local enab = guiGridListGetItemText( gl, row, 6 )
                if ( enab == 'Yes' ) then
                    setModEnabled(vehName, false)
                    savexml()
                else
                    setModEnabled(vehName, true)
                    savexml()
                end
            end
        else
            dm("Leave your vehicle first!", 255, 0, 0 )
        end
    
    elseif ( source == del ) then
        local row, col = guiGridListGetSelectedItem ( gl )
        local iDownload = guiGridListGetItemText(gl, row, 5)
        local iEnable = guiGridListGetItemText(gl, row, 6)
        local veh = guiGridListGetItemData(gl, row, 2)
        if ( iDownload == "Yes" ) then
            if ( iEnable == "Yes" ) then  
                dm("Disable this mod first", 255, 0, 0) 
            return end
            guiSetEnabled(source, false)
            guiSetEnabled(enable, false)
            guiSetEnabled(del, true)
            guiGridListSetItemText(gl, row, 3, "No", false, false)
            deleteMod(veh)
            refreshList()
            savexml()
        end
        
    elseif ( source == gl ) then
        local row, col = guiGridListGetSelectedItem(source)
        if ( row ~= -1 and col ~= 0 ) then
            local vehName = guiGridListGetItemData(gl, row, 2)
            local dff = vTable[vehName][3]
            local txd = vTable[vehName][4]
            if ( fileExists("mods/"..dff) and fileExists("mods/"..txd) ) then
                guiSetEnabled( enable, true )
                guiSetEnabled(del, true )
                guiSetEnabled(download, false )
            else
                guiSetEnabled(download, true )
                guiSetEnabled(enable, false)
                guiSetEnabled(del, false )
            end
            
        else
            guiSetEnabled(enable, false )
            guiSetEnabled(download, false )
            guiSetEnabled(del, false )
        end
    end
end
)

function deleteMod(name)
    if ( name and vTable[name] ) then
        local dff, txd = vTable[name][3] ,vTable[name][4]
        if ( fileExists("mods/"..txd) ) then
            fileDelete("mods/"..txd)
            dm('TXD file has been deleted successfully!', 0, 255, 0)
            refreshList()
        end 
        
        if ( fileExists("mods/"..dff) ) then
            fileDelete("mods/"..dff)
            dm('DFF file has been deleted successfully!', 0, 255, 0)
            refreshList()
        end
    end
end

function setModEnabled(name, state)
    if ( name and vTable[name] ) then
        local dff, txd, id = vTable[name][3], vTable[name][4], vTable[name][5]
        local row, col = guiGridListGetSelectedItem( gl )
            if ( fileExists("mods/"..dff) ) then
                if ( fileExists("mods/"..txd) ) then
                    if ( state == false ) then
                        engineRestoreModel( id )
                        eTable[name] = false
                        enabledIDs[id] = false
                        guiGridListSetItemText( gl, row, 6, "No", false, false )
                    else
                        if ( vTable[name][7] ) then
                            if ( enabledIDs[id] ) then
                            dm("Another mod already enabled at the same vehicle.", 255, 0, 0 )
                            return end
                            local txd1 = engineLoadTXD ( "mods/"..txd )
                            if ( not txd1 ) then
                                dm("Failed to load the mod", 255, 0, 0 )
                            end
                            if ( not engineImportTXD ( txd1, id ) ) then
                                dm("Failed to load the mod", 255, 0, 0 )
                            end
                        end
                        local dff = engineLoadDFF ( "mods/"..dff, id )
                        if ( not dff ) then
                            dm("Failed to load the mod", 255, 0, 0)
                        end
                        if ( not engineReplaceModel ( dff , id ) ) then
                            dm("Failed to replace the mod", 255, 0, 0)
                        end
                        eTable[name] = true
                        enabledIDs[id] = true
                        guiGridListSetItemText(gl, row, 6, "Yes", false, false)
                    end
                end
            end
    end
end

function downloadMod(name)
    if ( name and vTable[name] ) then
        for i, v in pairs(vTable) do
        local dff = vTable[name][3]
        local txd = vTable[name][4]
            downloadFile('mods/'..dff)
            downloadFile('mods/'..txd)
            refreshList()
            dTable[name] = true
        end
        dm('Please wait while downloading your mod!', 0, 255, 0)
    end
end

function onDownloadFinish (file, success)
    if ( source == resourceRoot ) then
        if ( success ) then
            refreshList()
            dm("Your mod has been successfully downloaded ("..tostring(file)..")", 0, 255, 0)
        end
    end
end
addEventHandler ( "onClientFileDownloadComplete", getRootElement(), onDownloadFinish )

function refreshList()
guiGridListClear(gl)
    for i, v in pairs(vTable) do
        if ( fileExists('mods/'..v[3]) and fileExists('mods/'..v[4]) ) then
            downloaded = 'Yes'
        else
            downloaded = 'No'
        end
        
        if ( eTable[i] ) then
            ena = 'Yes'
        else
            ena = 'No'
        end
        local row = guiGridListAddRow( gl )
        guiGridListSetItemText( gl, row, 1, tostring(v[5]), false, false)
        guiGridListSetItemText( gl, row, 2, tostring(v[2]), false, false)
        guiGridListSetItemText( gl, row, 3, tostring(v[1]), false, false)
        guiGridListSetItemText( gl, row, 4, tostring(v[6]), false, false)
        guiGridListSetItemText( gl, row, 5, tostring(downloaded), false, false)
        guiGridListSetItemText( gl, row, 6, tostring(ena), false, false)
        guiGridListSetItemData( gl, row, 2, tostring(i))
        guiSetEnabled(enable, false)
        guiSetEnabled(del, false)
        guiSetEnabled(download, false)
        guiSetEnabled(close, true)
    end
end

function savexml()
    local file = xmlCreateFile ('@save.xml', 'data')
    for i, v in pairs ( vTable ) do
        local child = xmlCreateChild( file, 'mod' )
        xmlNodeSetAttribute( child, 'name', i )
        xmlNodeSetAttribute( child, 'enabled', tostring( isset( eTable[i] ) ) )
    end
    xmlSaveFile( file )
    xmlUnloadFile( file )
end

addEventHandler("onClientResourceStart", resourceRoot, function ( )
    setTimer ( function ( )
        refreshList ( )
        local file = xmlLoadFile ( '@save.xml', 'data' )
        if file then
        for i, v in ipairs ( xmlNodeGetChildren( file ) ) do
                local name = tostring( xmlNodeGetAttribute( v, 'name' ) )
                local enabled = toboolean( xmlNodeGetAttribute( v, 'enabled' ) )
                if ( vTable[name] and tostring( enabled ):lower ( ) ~= "false" ) then
                    setModEnabled(name, true)
                    eTable[name] = true
                    enabledIDs[vTable[name][5]] = true
                end
            end
        end
    end, 500, 1 )
end )

--->>

function dm (t, r, g, b)
    if ( t and r and g and b ) then
        exports.GTIhud:dm(t, r, g, b)
    end
end

function toboolean ( input )
    local input = string.lower ( tostring ( input ) )
    if ( input == 'true' ) then
        return true
    elseif ( input == 'false' ) then
        return false
    else return nil end
end

function isset ( value )
    if ( value ) then
        return true
    end
    return false
end

function CW(center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end