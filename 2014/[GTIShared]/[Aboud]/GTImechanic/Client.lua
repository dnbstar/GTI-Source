------------------------------------------------------------------------------------
--  PROJECT:     GTI Demo 1.0
--  RIGHTS:      All rights reserved by developers
--  FILE:        GTIMechanic/Client.lua
--  PURPOSE:     Mechanic Job
--  DEVELOPERS:  Aboud aka. iTaX
------------------------------------------------------------------------------------

local Markers = {
-- Format: {x,y,z,r,g,b},
{1035.817, -1026.539, 33,255,255,0},
}

local theJob = "Mechanic" -- Job name
local theInfo = "GIT Mechanic Job -- Aboud" -- Job info

-- { GUI } --
local theJobWindow = guiCreateWindow(544,193,321,470,theJob.." Job",false)
local theJobButton1 = guiCreateButton(11,426,149,35,"Take job!",false,theJobWindow)
local theJobButton2 = guiCreateButton(163,426,149,35,"No thanks!",false,theJobWindow)
local theJobMemo = guiCreateMemo(9,44,322,217,theInfo,false,theJobWindow)
guiMemoSetReadOnly(theJobMemo, true)
local theJobLabel1 = guiCreateLabel(14,22,257,17,"Information about this job:",false,theJobWindow)
guiSetFont(theJobLabel1,"default-bold-small")
local screenW,screenH=guiGetScreenSize()
local windowW,windowH=guiGetSize(theJobWindow,false)
local x,y = (screenW-windowW)/2,(screenH-windowH)/2
guiSetPosition(theJobWindow,x,y,false)
guiWindowSetMovable (theJobWindow, true)
guiWindowSetSizable (theJobWindow, false)
guiSetVisible (theJobWindow, false)
-- { GUI } --

function onClientJobMarkerHit (hitElement, matchingDimension) -- onMarkerHit Event
	local px,py,pz = getElementPosition ( hitElement )
	local mx, my, mz = getElementPosition ( source )
	if ( hitElement == localPlayer ) and ( pz-3 < mz ) and ( pz+3 > mz ) then
	if not ( getPedOccupiedVehicle (localPlayer) ) then
	if (getElementData (hitElement,"Occupation") ~= getElementData (source,"Job")) then
	guiSetVisible( theJobWindow, true )
	showCursor( true )
    else return end
        end
	end
end
		
local jobMarkersTable = {}

addEventHandler("onClientGUIClick",root,function () -- onClientGUIClick Event
if source == theJobButton1 then
triggerServerEvent ("set"..theJob,localPlayer,localPlayer)
guiSetVisible (theJobWindow,false)
showCursor (false)
elseif source == theJobButton2 then
guiSetVisible (theJobWindow,false)
showCursor (false)
end
end
)

for i=1,#Markers do -- Create the blips, and the markers using the cords table
local x, y, z = Markers[i][1], Markers[i][2], Markers[i][3] - 1
local r, g, b = Markers[i][4], Markers[i][5], Markers[i][6]
createBlip ( x, y, z, 56, 2, 0, 0, 0, 0, 0, 270 )
jobMarkersTable[i] = createMarker( x, y, z -1, "cylinder", 2.0, r, g, b, 255)
setElementData ( jobMarkersTable[i],"Job",theJob)
addEventHandler( "onClientMarkerHit", jobMarkersTable[i], onClientJobMarkerHit )
end
