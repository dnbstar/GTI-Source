--<--------------------------------->--
-- Grand Theft International (GTI) ~
-- Author: NicKeLz ~
-- Resource: GTIanims/c.lua ~
-- Description: Ped Animation ~
-- Data: #Animations
--<--------------------------------->--

GUIEditor = {
    gridlist = {},
    window = {},
    button = {}
}
Timer = {}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.window[1] = guiCreateWindow(576, 199, 343, 330, "GTI Animations", false)
        guiWindowSetSizable(GUIEditor.window[1], false)
        guiSetVisible (GUIEditor.window[1], false)
        GUIEditor.gridlist[1] = guiCreateGridList(9, 22, 156, 275, false, GUIEditor.window[1])
        guiGridListAddColumn(GUIEditor.gridlist[1], "Category", 0.9)
        GUIEditor.gridlist[2] = guiCreateGridList(175, 22, 156, 275, false, GUIEditor.window[1])
        animsC = guiGridListAddColumn(GUIEditor.gridlist[2], "Animations", 0.9)
        GUIEditor.button[1] = guiCreateButton(9, 301, 93, 19, "Start", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
        GUIEditor.button[2] = guiCreateButton(125, 301, 93, 19, "Stop", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
        GUIEditor.button[3] = guiCreateButton(238, 301, 93, 19, "Close", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FFAAAAAA")  
        local screenW, screenH = guiGetScreenSize()
        local windowW, windowH = guiGetSize(GUIEditor.window[1], false)
        local x, y = (screenW - windowW) /2,(screenH - windowH) /2
        guiSetPosition(GUIEditor.window[1], x, y, false) 
    end
)

antiSpam = {}

addEventHandler ( "onClientGUIClick", root, function ( )
    if ( source == GUIEditor.gridlist[1] ) then
        if ( guiGridListGetSelectedItem ( source ) ~= -1 ) then
            if not isTimer(antiSpam[source]) then
                antiSpam[source] = setTimer(function(source) antiSpam[source] = nil end, 700, 1, source)
                guiGridListClear ( GUIEditor.gridlist[2] )
                local groupname = guiGridListGetItemText ( source, guiGridListGetSelectedItem ( source ), 1 )
                triggerServerEvent ( "GTIanims.onGetAllAnim", localPlayer, groupname )
            end
        end
        
    elseif ( source == GUIEditor.button[1] ) then
        local arrested = getElementData(localPlayer, "isPlayerArrested")
        
        if ( guiGridListGetSelectedItem ( GUIEditor.gridlist[1] ) ~= -1 ) then
            if ( guiGridListGetSelectedItem ( GUIEditor.gridlist[2] ) ~= -1 ) then
                if ( getElementData(localPlayer, "GTIanims.setAnim") == false ) then 
                    if not isPedInVehicle ( localPlayer ) then
                        if (arrested == true) then 
                            exports.GTIhud:dm("You can't use an animation while arrested!", 255, 0, 0)
                            return 
                        end
                    local group = guiGridListGetItemText ( GUIEditor.gridlist[1], guiGridListGetSelectedItem ( GUIEditor.gridlist[1] ), 1 )
                    local anim = guiGridListGetItemText ( GUIEditor.gridlist[2], guiGridListGetSelectedItem ( GUIEditor.gridlist[2] ), 1 )
                    triggerServerEvent ( "GTIanims.onSetAnim", localPlayer, true, group, anim )
                    else
                        exports.GTIhud:dm("You can NOT use the animations while in vehicle.", 255, 0, 0)
                    end
                end
            end
        end
    
    elseif ( source == GUIEditor.button[2] ) then
        local jAnims = getElementData(localPlayer, "GTIanims.setAnim")
        if ( jAnims == true ) then return end
            triggerServerEvent ( "GTIanims.onSetAnim", localPlayer, false )
            
         elseif ( source == GUIEditor.button[3] ) then
            guiSetVisible ( GUIEditor.window[1], false )
            showCursor ( false )
    end
end )

addEvent ( "GTIanims.onPutAll", true )
addEventHandler ( "GTIanims.onPutAll", root, function ( groupName )
    local row = guiGridListAddRow ( GUIEditor.gridlist[1] )
    guiGridListSetItemText ( GUIEditor.gridlist[1], row, 1, groupName, false, false )
end )

addEvent ( "GTIanims.onPutAllAnim", true )
addEventHandler ( "GTIanims.onPutAllAnim", root, function ( animName )
    local row = guiGridListAddRow ( GUIEditor.gridlist[2] )
    guiGridListSetItemText ( GUIEditor.gridlist[2], row, 1, animName, false, false )
end )

function showGui ()
    guiGridListClear ( GUIEditor.gridlist[1] )
    guiGridListClear ( GUIEditor.gridlist[2] )
    guiSetVisible (GUIEditor.window[1], not guiGetVisible ( GUIEditor.window[1]))
    showCursor( not isCursorShowing())
    triggerServerEvent ( "GTIanims.onGetAll", localPlayer )
end
addCommandHandler("animations", showGui)

function setJobAnimation (ped, block, anim, time, loop, update, inter, freeze)
        if ( ped and block ) then
			if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
            setElementData(ped, "GTIanims.setAnim", true)
            setPedAnimation(ped, block, anim, time, loop, update, inter, freeze)
			if not (loop or freeze) and time > 51 and not ( anim == "crry_prtial" ) then
				Timer[ped] = setTimer(function(ped)
				setElementData(ped, "GTIanims.setAnim", false)
				end,time,1,ped)
			elseif loop or ( anim == "crry_prtial" ) or time < 51 then
				Timer[ped] = setTimer(function(ped)
				setElementData(ped, "GTIanims.setAnim", false)
				end,120000,1,ped) --as we dont know the time then...2mins
			end
            -- outputDebugString("Data set")

    else
		if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
        setPedAnimation(ped, false)
        setElementData(ped, "GTIanims.setAnim", false)
        -- outputDebugString("Data removed")
        end
    end