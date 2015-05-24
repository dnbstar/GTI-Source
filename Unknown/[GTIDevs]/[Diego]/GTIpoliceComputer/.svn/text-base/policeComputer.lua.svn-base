------------------------------------------------->>
-- PROJECT:         Grand Theft International
-- RESOURCE:        GTImdc/mobileDataComputer.lua
-- DESCRIPTION:     GTI Police Computer.
-- AUTHOR:          Diego Hernandez & Kanto
-- RIGHTS:          All rights reserved to author
------------------------------------------------->>

-------------------------------
-- FIRST PART : GUI CREATIONS
-------------------------------

GTImdc = {checkbox = {}, staticimage = {}, edit = {}, window = {}, tabpanel = {}, button = {}, label = {}, tab = {}, gridlist = {}}
InfoPan = {gridlist = {}, window = {}, label = {}, memo = {}}

screenW, screenH = guiGetScreenSize()

-- Police Computer
----------------------->>

 GTImdc.window[1] = guiCreateWindow((screenW - 773)/2, (screenH - 578)/2, 773, 578, "POLICE — Mobile Data Computer", false)
 guiWindowSetSizable(GTImdc.window[1], false)
 guiSetAlpha(GTImdc.window[1], 1.00)
 GTImdc.staticimage[1] = guiCreateStaticImage(9, 21, 754, 547, "images/page.png", false, GTImdc.window[1])
 GTImdc.tabpanel[1] = guiCreateTabPanel(10, 125, 734, 329, false, GTImdc.staticimage[1])

-- Stats tab:
 GTImdc.tab[1] = guiCreateTab("Stats", GTImdc.tabpanel[1])

 GTImdc.label[1] = guiCreateLabel(20, 54, 86, 151, "Account:\n\nDivision:\n\nRank:\n\nNext rank:\n\nArrests:\n\nOn-duty hours:", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[1], "default-bold-small")
 guiLabelSetColor(GTImdc.label[1], 254, 254, 255)
 guiLabelSetHorizontalAlign(GTImdc.label[1], "right", false)
 GTImdc.label[2] = guiCreateLabel(360, 10, 15, 290, "|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n", false, GTImdc.tab[1])
 GTImdc.label[20] = guiCreateLabel(360, 0, 15, 290, "|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n", false, GTImdc.tab[1])
 GTImdc.label[5] = guiCreateLabel(350, 54, 149, 160, "Total law officers:\n\nFederal Agents:\n\nSWAT Officers:\n\nTraffic officers:\n\nCorrectional officers:\n\nWanted suspects:\n\n", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[5], "default-bold-small")
 guiLabelSetColor(GTImdc.label[5], 254, 254, 255)
 guiLabelSetHorizontalAlign(GTImdc.label[5], "right", false)
 GTImdc.label[6] = guiCreateLabel(10, 23, 57, 16, "My stats", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[6], "default-bold-small")
 guiLabelSetColor(GTImdc.label[6], 30, 125, 255)
 GTImdc.label[7] = guiCreateLabel(5, 29, 365, 15, "________________________________________________________", false, GTImdc.tab[1])
 guiLabelSetColor(GTImdc.label[7], 180, 180, 180)
 GTImdc.label[8] = guiCreateLabel(365, 29, 349, 15, "________________________________________________________", false, GTImdc.tab[1])
 guiLabelSetColor(GTImdc.label[8], 180, 180, 180)
 GTImdc.label[9] = guiCreateLabel(372, 23, 65, 16, "Police stats", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[9], "default-bold-small")
 guiLabelSetColor(GTImdc.label[9], 30, 125, 255)
 GTImdc.label[3] = guiCreateLabel(122, 55, 210, 150, "", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[3], "default-bold-small")
 guiLabelSetColor(GTImdc.label[3], 30, 125, 255)
 guiLabelSetHorizontalAlign(GTImdc.label[3], "left", false)
 GTImdc.label[11] = guiCreateLabel(509, 54, 90, 151, "", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[11], "default-bold-small")
 guiLabelSetColor(GTImdc.label[11], 30, 125, 255)
 guiLabelSetHorizontalAlign(GTImdc.label[11], "center", false)
 GTImdc.checkbox[2] = guiCreateCheckBox(10, 250, 200, 20, "Toggle 911 chatbox messages", true, false, GTImdc.tab[1])
 GTImdc.checkbox[3] = guiCreateCheckBox(156, 275, 136, 20, "Toggle radio sound", true, false, GTImdc.tab[1])
 GTImdc.checkbox[4] = guiCreateCheckBox(10, 275, 136, 20, "Toggle crime reports", true, false, GTImdc.tab[1])
 GTImdc.label[255] = guiCreateLabel(6, 224, 57, 16, "Settings", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[255], "default-bold-small")
 guiLabelSetColor(GTImdc.label[255], 30, 125, 255)
 GTImdc.label[256] = guiCreateLabel(-4, 231, 365, 15, "________________________________________________________", false, GTImdc.tab[1])
 guiLabelSetColor(GTImdc.label[256], 180, 180, 180)
 GTImdc.label[257] = guiCreateLabel(418, 211, 91, 30, "Current Police \nCommissioner:", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[257], "default-bold-small")
 GTImdc.label[258] = guiCreateLabel(508, 218, 91, 13, "-", false, GTImdc.tab[1])
 guiSetFont(GTImdc.label[258], "default-bold-small")
 guiLabelSetColor(GTImdc.label[258], 30, 125, 255)
 guiLabelSetHorizontalAlign(GTImdc.label[258], "center", false)

-- Wanted tab:
 GTImdc.tab[2] = guiCreateTab("List of wanted suspects", GTImdc.tabpanel[1])

 wantedgridlist = guiCreateGridList(34, 10, 670, 244, false, GTImdc.tab[2])
 guiGridListSetSortingEnabled(wantedgridlist, false)
 column = guiGridListAddColumn(wantedgridlist, "Name", 0.21)
 column2 = guiGridListAddColumn(wantedgridlist, "Location", 0.23)
 column3 = guiGridListAddColumn(wantedgridlist, "Distance", 0.15)
 column4 = guiGridListAddColumn(wantedgridlist, "Wanted Points", 0.15)
 column5 = guiGridListAddColumn(wantedgridlist, "Vehicle", 0.2)

 GTImdc.button[1] = guiCreateButton(526, 264, 119, 31, "Track suspect", false, GTImdc.tab[2])
 GTImdc.button[122] = guiCreateButton(400, 264, 119, 31, "Refresh", false, GTImdc.tab[2])
 guiSetProperty(GTImdc.button[122], "NormalTextColour", "FFAAAAAA")
 guiSetProperty(GTImdc.button[1], "NormalTextColour", "FFAAAAAA")

-- 911 tab:
 GTImdc.tab[3] = guiCreateTab("Recent 911 calls", GTImdc.tabpanel[1])
 GTImdc.gridlist[2] = guiCreateGridList(12, 14, 703, 246, false, GTImdc.tab[3])
 guiGridListSetSortingEnabled(GTImdc.gridlist[2], false)
 colA = guiGridListAddColumn(GTImdc.gridlist[2], "Caller", 0.25)
 colB = guiGridListAddColumn(GTImdc.gridlist[2], "Last seen location", 0.25)
 colC = guiGridListAddColumn(GTImdc.gridlist[2], "Caller's message", 0.6)
 GTImdc.button[55] = guiCreateButton(400, 264, 119, 31, "Refresh", false, GTImdc.tab[3])
 GTImdc.button[2] = guiCreateButton(526, 264, 119, 31, "Respond to call", false, GTImdc.tab[3])
 guiSetProperty(GTImdc.button[55], "NormalTextColour", "FFAAAAAA")
 guiSetProperty(GTImdc.button[2], "NormalTextColour", "FFAAAAAA")

-- Records tab:
 GTImdc.tab[5] = guiCreateTab("Records", GTImdc.tabpanel[1])
 GTImdc.label[12] = guiCreateLabel(12, 19, 220, 15, "Please enter a player's account name:", false, GTImdc.tab[5])
 guiSetFont(GTImdc.label[12], "default-bold-small")
 GTImdc.edit[1] = guiCreateEdit(246, 15, 184, 25, "Search...", false, GTImdc.tab[5])
 guiSetProperty(GTImdc.edit[1], "NormalTextColour", "FF4D4D4D")
 GTImdc.gridlist[4] = guiCreateGridList(12, 50, 700, 200, false, GTImdc.tab[5])
 crimeID = guiGridListAddColumn(GTImdc.gridlist[4], "Crime ID", 0.1)
 cmtdCrime = guiGridListAddColumn(GTImdc.gridlist[4], "Committed crime", 0.5)
 timesCmtd = guiGridListAddColumn(GTImdc.gridlist[4], "Times committed", 0.3)
 for i = 1, 25 do
    guiGridListAddRow(GTImdc.gridlist[4])
 end
 guiGridListSetItemText(GTImdc.gridlist[4], 0, crimeID, "1", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 1, crimeID, "2", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 2, crimeID, "3", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 3, crimeID, "4", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 4, crimeID, "5", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 5, crimeID, "6", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 6, crimeID, "7", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 7, crimeID, "8", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 8, crimeID, "9", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 9, crimeID, "10", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 10, crimeID, "11", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 11, crimeID, "12", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 12, crimeID, "13", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 13, crimeID, "14", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 14, crimeID, "15", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 15, crimeID, "16", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 16, crimeID, "17", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 17, crimeID, "18", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 18, crimeID, "19", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 19, crimeID, "20", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 20, crimeID, "21", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 21, crimeID, "22", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 22, crimeID, "23", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 23, crimeID, "24", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 24, crimeID, "25", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 25, crimeID, "26", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 26, crimeID, "27", false, false)

 guiGridListSetItemText(GTImdc.gridlist[4], 0, cmtdCrime, "Discharge of a Firearm", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 1, cmtdCrime, "Battery", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 2, cmtdCrime, "Aggravated Assault", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 3, cmtdCrime, "Grand Theft Auto", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 4, cmtdCrime, "Petty Vehicle Theft", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 5, cmtdCrime, "Criminal Hijacking", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 6, cmtdCrime, "Marine Vehicle Theft", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 7, cmtdCrime, "Criminal Damage to Property", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 8, cmtdCrime, "Harassment", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 9, cmtdCrime, "Assault", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 10, cmtdCrime, "Resisting Arrest", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 11, cmtdCrime, "Evading the Police", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 12, cmtdCrime, "Manslaughter", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 13, cmtdCrime, "Murder", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 14, cmtdCrime, "Vehicular Homicide", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 15, cmtdCrime, "Assault against Law Enforcement", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 16, cmtdCrime, "Destruction of Property", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 17, cmtdCrime, "Trespassing over Forbidden Airspace", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 18, cmtdCrime, "2nd Degree Murder", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 19, cmtdCrime, "1st Degree Murder", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 20, cmtdCrime, "Trespassing", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 21, cmtdCrime, "Terrorism", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 22, cmtdCrime, "Grand Larceny", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 23, cmtdCrime, "Armed Robbery", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 24, cmtdCrime, "Burglary", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 25, cmtdCrime, "Vehicular Assault", false, false)
 guiGridListSetItemText(GTImdc.gridlist[4], 26, cmtdCrime, "Conducting Criminal Activity", false, false)

 --GTImdc.staticimage[2] = guiCreateStaticImage(450, 19, 18, 15, "images/search.png", false, GTImdc.tab[5])
 --guiSetAlpha(GTImdc.staticimage[2], 0.50)
 GTImdc.button[4] = guiCreateButton(440, 15, 86, 25, " Search", false, GTImdc.tab[5])
 GTImdc.label[14] = guiCreateLabel(98, 273, 464, 18, "", false, GTImdc.tab[5])
 guiMoveToBack(GTImdc.button[4])
 guiLabelSetHorizontalAlign(GTImdc.label[14], "center")
 guiLabelSetVerticalAlign(GTImdc.label[14], "center")
 guiSetFont(GTImdc.label[14], "default-bold-small")

-- Information tab:
 GTImdc.tab[6] = guiCreateTab("Information", GTImdc.tabpanel[1])
 GTImdc.label[99] = guiCreateLabel(10, 20, 268, 15, "San Andreas Police Department — Information", false, GTImdc.tab[6])
 guiSetFont(GTImdc.label[99], "default-bold-small")
 guiLabelSetColor(GTImdc.label[99], 30, 125, 255)
 GTImdc.label[100] = guiCreateLabel(1, 25, 723, 15, "_______________________________________________________________________________________________________________________", false, GTImdc.tab[6])
 GTImdc.button[99] = guiCreateButton(45, 64, 214, 65, "POLICE RADIO CODES", false, GTImdc.tab[6])
 guiSetProperty(GTImdc.button[99], "NormalTextColour", "FFAAAAAA")
 GTImdc.button[100] = guiCreateButton(450, 64, 214, 65, "SAN ANDREAS PENAL CODE", false, GTImdc.tab[6])
 guiSetProperty(GTImdc.button[100], "NormalTextColour", "FFAAAAAA")
 GTImdc.button[101] = guiCreateButton(450, 181, 214, 65, "CODE OF CONDUCT", false, GTImdc.tab[6])
 guiSetProperty(GTImdc.button[101], "NormalTextColour", "FFAAAAAA")
 GTImdc.button[102] = guiCreateButton(45, 181, 214, 65, "LAW ENFORCEMENT FEATURES", false, GTImdc.tab[6])
 guiSetProperty(GTImdc.button[102], "NormalTextColour", "FFAAAAAA")
 GTImdc.label[101] = guiCreateLabel(1, 144, 723, 15, "_______________________________________________________________________________________________________________________", false, GTImdc.tab[6])
 GTImdc.label[102] = guiCreateLabel(352, 45, 15, 260, "|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|", false, GTImdc.tab[6])
 GTImdc.label[102] = guiCreateLabel(352, 40, 15, 260, "|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|", false, GTImdc.tab[6])

-- Other:
 GTImdc.label[13] = guiCreateLabel(665, 511, 80, 17, "SHUT DOWN", false, GTImdc.staticimage[1])
 guiSetFont(GTImdc.label[13], "clear-normal")
 guiLabelSetColor(GTImdc.label[13], 0, 0, 0)
 guiSetAlpha(GTImdc.label[13], 0.5)

 guiSetVisible(GTImdc.window[1], false)



-- Information GUI
----------------------->>
 InfoPan.window[1] = guiCreateWindow((screenW - 591)/2, (screenH - 474)/2, 591, 474, "POLICE — Information Panel", false)
 guiWindowSetSizable(InfoPan.window[1], false)
 guiWindowSetMovable(InfoPan.window[1], false)
 InfoPan.gridlist[1] = guiCreateGridList(9, 27, 143, 435, false, InfoPan.window[1])
 guiGridListAddColumn(InfoPan.gridlist[1], "Information", 0.9)
 for i = 1, 4 do
    guiGridListAddRow(InfoPan.gridlist[1])
 end
 guiGridListSetItemText(InfoPan.gridlist[1], 0, 1, "Radio codes", false, false)
 guiGridListSetItemText(InfoPan.gridlist[1], 1, 1, "Penal code", false, false)
 guiGridListSetItemText(InfoPan.gridlist[1], 2, 1, "Features", false, false)
 guiGridListSetItemText(InfoPan.gridlist[1], 3, 1, "Code of conduct", false, false)

 InfoPan.memo[1] = guiCreateMemo(168, 55, 408, 407, "", false, InfoPan.window[1])
 guiMemoSetReadOnly(InfoPan.memo[1], true)
 InfoPan.label[1] = guiCreateLabel(548, 22, 28, 15, "Close", false, InfoPan.window[1])
 guiSetFont(InfoPan.label[1], "default-bold-small")
 InfoPan.label[2] = guiCreateLabel(314, 37, 234, 15, "", false, InfoPan.window[1])
 guiSetFont(InfoPan.label[2], "default-bold-small")
 guiLabelSetColor(InfoPan.label[2], 25, 125, 255)

 guiSetVisible(InfoPan.window[1], false)

-------------------------------
-- FIRST PART : SCRIPTS
-------------------------------

local blips = {
    suspects = {},
    localP_t = {},
    callers = {},
    localP911 = {}
}

local coords = {}
local count_suspects  = 0
local count_callers = 0

function displayGUI()
    if exports.GTIemployment:getPlayerJob(true) == "Police Officer" then
        if not isPedInVehicle(localPlayer) then return end

        if not exports.GTIaccounts:isPlayerLoggedIn() then return end
        if not guiGetVisible(GTImdc.window[1]) then
            guiSetVisible(GTImdc.window[1], true)
            showCursor(true)
            triggerServerEvent("GTIpoliceComputer.showPoliceStats", localPlayer)
            triggerServerEvent("GTIpoliceComputer.showWantedGridlist", localPlayer)
            triggerServerEvent("GTIpoliceComputer.loadRestrictions", localPlayer)
        else
            guiSetVisible(GTImdc.window[1], false)
            if guiGetVisible(InfoPan.window[1]) then
                guiSetVisible(InfoPan.window[1], false)
            end
            showCursor(false)
        end
    end
end
bindKey("F6", "down", displayGUI)

function hideGUI ()
    guiSetVisible (GTImdc.window[1], false)
    showCursor(false)
    if guiGetVisible(InfoPan.window[1]) then
        guiSetVisible(InfoPan.window[1], false)
    end
    if isElement(sound3) then destroyElement(sound3) end
    sound3 = playSound("sounds/button_click.mp3")
end

function hideGUIonJobQuit(jobName, resign)
    if (jobName == "Police Officer") and (resign == true or resign == false) then
        guiSetVisible(GTImdc.window[1], false)
        showCursor(false)
    end
end
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", root, hideGUIonJobQuit)

-- PART I: STATS TAB
----------------------->>

function managePoliceStats(accountName, divisionName, rankName, nextRank, arrests, onDutyHrs, federalAgents, correctionalOfficers, gangUnits, trafficOfficers, totalOfficers, wantedPlrs)
    guiSetText(GTImdc.label[3], ""..accountName.."\n\n"..divisionName.."\n\n"..rankName.."\n\n"..nextRank.."\n\n"..arrests.."\n\n"..onDutyHrs.."")
    guiSetText(GTImdc.label[11], ""..#totalOfficers.."\n\n"..#federalAgents.."\n\n"..#gangUnits.."\n\n"..#trafficOfficers.."\n\n"..#correctionalOfficers.."\n\n"..wantedPlrs.."")
end
addEvent("GTIpoliceComputer.sendPoliceStatsToClient", true)
addEventHandler("GTIpoliceComputer.sendPoliceStatsToClient", root, managePoliceStats)

function crimeReportsHandler()
    if guiCheckBoxGetSelected(GTImdc.checkbox[4]) then
        triggerServerEvent("GTIpoliceMisc.turnOnCrime", localPlayer)
    else
        triggerServerEvent("GTIpoliceMisc.turnOffCrime", localPlayer)
    end
end

function soundHandler()
    if guiCheckBoxGetSelected(GTImdc.checkbox[3]) then
        triggerEvent("GTIpoliceMisc.enableSound", localPlayer)
    else
        triggerEvent("GTIpoliceMisc.disableSound", localPlayer)
    end
end

function nineOneOneHand()
    if guiCheckBoxGetSelected(GTImdc.checkbox[2]) then
        triggerServerEvent("GTIpoliceMisc.turnOn911", localPlayer)
    else
        triggerServerEvent("GTIpoliceMisc.turnOff911", localPlayer)
    end
end

-- PART II: WANTED PLRS
----------------------->>

-- Render Wanted Tab -->>

function wantedTab (wantedPs)
    guiGridListClear(wantedgridlist)

    for i,v in pairs(wantedPs) do
    row = guiGridListAddRow(wantedgridlist)
    local name = getPlayerName(i)
    local vehicle = getPedOccupiedVehicle(i)

    if vehicle then
        vehicleName = getVehicleName(vehicle)
    else
        vehicleName = "On foot"
    end

	if (getElementInterior(i) ~= 0) then
		local position = getElementData(i, "lastPosition")
		if position then
			local xx,yy,zz = unpack( split(position, ",") )
			x,y,z = xx,yy,zz
			local mx,my,mz = getElementPosition(localPlayer)
			distance = math.ceil(getDistanceBetweenPoints3D(x,y,z,mx,my,mz))
		else
			x,y,z=getElementPosition(i)
			distance = math.ceil (exports.GTIutil:getDistanceBetweenElements3D(localPlayer, i))
		end
	else
		x,y,z=getElementPosition(i)
		distance = math.ceil (exports.GTIutil:getDistanceBetweenElements3D(localPlayer, i))
	end
    local zone = getZoneName(x, y, z)

    guiGridListSetItemText(wantedgridlist, row, column, ""..name.."", false, false)
    guiGridListSetItemText(wantedgridlist, row, column2, ""..zone.."", false, false)
    guiGridListSetItemText(wantedgridlist, row, column3, ""..distance.." m", false, false)
    guiGridListSetItemText(wantedgridlist, row, column4, ""..v.." points", false, false)
    guiGridListSetItemText(wantedgridlist, row, column5, ""..vehicleName.."", false, false)

    if blips.suspects[getPlayerFromName(name)] ~= nil then
        for c = 1, 5 do
            guiGridListSetItemColor(wantedgridlist, row, c, 0, 255, 0)
        end
        end
    end
end
addEvent("GTIpoliceComputer.sendWantedPlayers", true)
addEventHandler("GTIpoliceComputer.sendWantedPlayers", root, wantedTab)

-- Refresh Wanted Tab Data -->>

function refreshOnButtonClick()
    triggerServerEvent("GTIpoliceComputer.showWantedGridlist", localPlayer)
    exports.GTIhud:dm("Refreshing the wanted players list", 255, 255, 0)
end

for i, v in ipairs (getElementsByType("blip")) do
    setElementData(v, "GTIpoliceComputer.isSuspectBlip", false)
end

-- Toggle Player Tracking -->>

function trackSuspect(suspect, state)
if not suspect then return end
    if not isElement(suspect) or not getElementType(suspect) == "player" --[[or suspect == localPlayer]] then return end
    local suspectBlip = createBlipAttachedTo(suspect, 36)
    if state == true then
        if count_suspects ~= 2 then
            exports.GTIhud:dm("INFO: You're now tracking ("..getPlayerName(suspect)..")", 30, 125, 255, true)
            setElementData(suspectBlip, "GTIpoliceComputer.isSuspectBlip", true)
            blips.suspects[suspect] = suspectBlip
            blips.localP_t[localPlayer] = suspect
            count_suspects = count_suspects + 1
            guiSetText(GTImdc.button[1], "Untrack suspect")
        else
            exports.GTIhud:dm("* You can only track 2 suspects at once.", 30, 125, 255, true)
        end
    elseif state == false then
        exports.GTIhud:dm("INFO: You've untracked ("..getPlayerName(suspect)..")", 30, 125, 255, true)
        if isElement(blips.suspects[suspect]) then destroyElement(blips.suspects[suspect]) end
        if isElement(suspectBlip) then destroyElement(suspectBlip) end
        if isElement(intBlip) then  destroyElement(intBlip) end
        blips.suspects[suspect] = nil
        blips.localP_t[localPlayer] = nil
        count_suspects = count_suspects - 1
        guiSetText(GTImdc.button[1], "Track suspect")
    end
end

function trackingSuspectsHandler()
    local row, col = guiGridListGetSelectedItem(wantedgridlist)
    if row ~= -1 then
        local playerName = guiGridListGetItemText(wantedgridlist, row, col)
        if not playerName then return end
        local suspect = getPlayerFromName(playerName)
        if blips.suspects[suspect] == nil then
            trackSuspect(suspect, true)
            for c = 1, 5 do
                guiGridListSetItemColor(wantedgridlist, row, c, 0, 255, 0)
            end
        else
            trackSuspect(suspect, false)
            for c = 1, 5 do
                guiGridListSetItemColor(wantedgridlist, row, c, 255, 255, 255)
            end
        end
    end
end

function trackingButtonCheck ()
    local r, c = guiGridListGetSelectedItem(wantedgridlist)
    local r, g, b = guiGridListGetItemColor(wantedgridlist, r, c)
    if r == 0 and g == 255 and b == 0 then
        guiSetText(GTImdc.button[1], "Untrack suspect")
    else
        guiSetText(GTImdc.button[1], "Track suspect")
    end
end

-- Stop Tracking if Suspect is Kill Arrested -->>

function destroyBlipOnSuspectWasted (attacker)
    if (isElement(attacker) and getElementType(attacker) == "player") then
        if getTeamName(getPlayerTeam(attacker)) == "Law Enforcement" then
            if blips.suspects[source] ~= nil then
                if getTeamName(getPlayerTeam(localPlayer)) == "Law Enforcement" then
                    destroyElement(blips.suspects[source])
                    blips.suspects[source] = nil
                    blips.localP_t[localPlayer] = nil
                    count_suspects = count_suspects - 1
                    exports.GTIhud:dm("INFO: Your tracked suspect ("..getPlayerName(source)..") has been taken down.", 30, 125, 255, true)
                end
            end
        end
    end
end
addEventHandler("onClientPlayerWasted", root, destroyBlipOnSuspectWasted)

-- Destroy Interior Blip if you die -->>

function destroyBlipOnWasted()
    if getTeamName(getPlayerTeam(localPlayer)) == "Law Enforcement" then
        if isElement(intBlip) then
            destroyElement(intBlip)
        end
    end
end
addEventHandler("onClientPlayerWasted", root, destroyBlipOnWasted)

-- Inform Tracker on Arrest -->>

function informOnArrest(suspect)
    if blips.suspects[suspect] ~= nil then
        if getTeamName(getPlayerTeam(localPlayer)) == "Law Enforcement" then
            exports.GTIhud:dm("INFO: Your tracked suspect ("..getPlayerName(source)..") has been arrested.", 30, 125, 255, true)
        end
    end
end
addEvent("GTIpoliceComputer.onClientArrest", true)
addEventHandler("GTIpoliceComputer.onClientArrest", root, informOnArrest)

-- Untrack if Suspect is Jailed -->>

function untrackOnJail(suspect, wl_cleared)
    if blips.suspects[suspect] ~= nil then
        if getTeamName(getPlayerTeam(localPlayer)) == "Law Enforcement" then
            destroyElement(blips.suspects[source])
            blips.suspects[source] = nil
            blips.localP_t[localPlayer] = nil
            count_suspects = count_suspects - 1
			if (not wl_cleared) then
				exports.GTIhud:dm("INFO: Your tracked suspect ("..getPlayerName(source)..") has been jailed. Untracking.", 30, 125, 255)
			else
				exports.GTIhud:dm("INFO: Your tracked suspect ("..getPlayerName(source)..") is no longer wanted. Untracking.", 30, 125, 255)
			end
            if isElement(intBlip) then  destroyElement(intBlip)  end
        end
    end
end
addEvent("GTIpoliceComputer.onClientJail", true)
addEventHandler("GTIpoliceComputer.onClientJail", root, untrackOnJail)

-- Remove Tracking if Suspect Quits -->>

function destroyBlipOnSuspectQuit ()
    if blips.suspects[source] ~= nil then
        if getTeamName(getPlayerTeam(localPlayer)) == "Law Enforcement" then
            destroyElement(blips.suspects[source])
            blips.suspects[source] = nil
            blips.localP_t[localPlayer] = nil
            exports.GTIhud:dm("[RADIO] INFO: Your tracked suspect ("..getPlayerName(source)..") has left the server.", 30, 125, 255, true)
            count_suspects = count_suspects - 1
        end
    end
    if isElement(intBlip) ~= nil then
            if getTeamName(getPlayerTeam(localPlayer)) == "Law Enforcement" and isElement(intBlip) then
                destroyElement(intBlip)
            end
    end
end
addEventHandler("onClientPlayerQuit", root, destroyBlipOnSuspectQuit)

-- Remove all Tracking when you resign -->>

function untrackOnJobQuit(jobName, resignJob)
    if resignJob == true or resignJob == false then
        if jobName == "Police Officer" then
            for i,v in ipairs (getElementsByType("blip")) do
                if getElementData(v, "GTIpoliceComputer.isSuspectBlip") == true then
                    destroyElement(v)
                end
                local suspect = blips.localP_t[localPlayer]
                if blips.suspects[suspect] ~= nil then
                    blips.suspects[suspect] = nil
                end
                if blips.localP_t[localPlayer] ~= nil then
                    blips.localP_t[localPlayer] = nil
                end
                count_suspects = 0
                if isElement(intBlip) then  destroyElement(intBlip)  end
            end
        end
    end
end
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", root, untrackOnJobQuit)

-- Tracking inside Interiors -->>

addEvent("onClientPlayerChangeInterior", true)
addEventHandler("onClientPlayerChangeInterior", root, function (player)
    if blips.suspects[player] ~= nil then
        local x, y, z = getElementPosition(source) -- Get the marker position
        intBlip = createBlipAttachedTo(source, 36)
        local zone = getZoneName(x,y,z)
        exports.GTIhud:dm("INFO: Your tracked suspect ("..getPlayerName(player)..") has entered an interior @ "..zone..".", 30, 125, 255, true)
    end
end)

addEventHandler("onClientPlayerChangeInterior", root, function (player)
    if blips.suspects[player] ~= nil then
        exports.GTIhud:dm("INFO: Your tracked suspect ("..getPlayerName(player)..") has left the interior. Tracking enabled.", 30, 125, 255, true)
            if isElement(intBlip) then
                destroyElement(intBlip)
            end
    end
end)

-- PART III: 911 CALLS
----------------------->>

function nineOneOnecalls(n11calls)
    guiGridListClear(GTImdc.gridlist[2])
    for k, v in pairs(n11calls) do
        local playerName, x, y, z, message = unpack(n11calls[k])
        local row = guiGridListAddRow(GTImdc.gridlist[2])
        coords[playerName] = {x, y, z}
        guiGridListSetItemText(GTImdc.gridlist[2], row, colA, playerName, false, false)
        guiGridListSetItemText(GTImdc.gridlist[2], row, colB, getZoneName(x, y, z), false, false)
        guiGridListSetItemText(GTImdc.gridlist[2], row, colC, message, false, false)
        if blips.callers[getPlayerFromName(playerName)] ~= nil then
        for c = 1, 3 do
            guiGridListSetItemColor(GTImdc.gridlist[2], row, c, 0, 255, 0)
        end
        setTimer(function (row)
            guiGridListRemoveRow(GTImdc.gridlist[2], row)
            coords[playerName] = nil
            end, 300000, 1, row)
        end
    end
end
addEvent("GTIpoliceComputer.911calls", true) ---------------- LAW MISC
addEventHandler("GTIpoliceComputer.911calls", root, nineOneOnecalls)

function responding()
    local r, c = guiGridListGetSelectedItem(GTImdc.gridlist[2])
    if r ~= -1 then

    local playerName = guiGridListGetItemText(GTImdc.gridlist[2], r, c)
    local caller = getPlayerFromName(playerName)

    if blips.callers[caller] == nil then
    if count_callers ~= 1 then
        local x, y, z = unpack(coords[getPlayerName(caller)])
        local callerBlip = createBlip(x, y, z, 41)
        exports.GTIhud:dm("[RADIO] INFO: You're now responding to "..playerName.."'s call.", 30, 125, 255)
        blips.callers[caller] = callerBlip
        blips.localP911[localPlayer] = caller
        count_callers = 1
        guiSetText(GTImdc.button[2], "Cancel")
        blips.localP911[localPlayer] = caller

    for c = 1, 3 do
        guiGridListSetItemColor(GTImdc.gridlist[2], r, c, 0, 255, 0)
    end
    triggerServerEvent("GTIpoliceComputer.outputToPlayersInTeam", localPlayer, "(RADIO) #FF0000Dispatch: #FFFFFFOfficer "..getPlayerName(localPlayer).." is responding to "..playerName.."'s 911 call.", 30, 125, 255, true)
    else
        exports.GTIhud:dm("ERROR: You can't respond to more than 1 situation!", 225, 0, 0)
    end
    else
        destroyElement(blips.callers[caller])
        exports.GTIhud:dm("[RADIO] INFO: You are no longer responding to "..playerName.."'s call.", 30, 125, 255)
        blips.callers[caller] = nil
        blips.localP911[localPlayer] = nil
        coords[getPlayerName(caller)] = nil
        count_callers = 0
        guiSetText(GTImdc.button[2], "Respond to call")
        for c = 1, 3 do
            guiGridListSetItemColor(GTImdc.gridlist[2], r, c, 255, 255, 255)
        end
            triggerServerEvent("GTIpoliceComputer.outputToPlayersInTeam", localPlayer, "(RADIO) #FF0000Dispatch: #FFFFFFOfficer "..getPlayerName(localPlayer).." is no longer responding to "..playerName.."'s 911 call.", 30, 125, 255, true)
        end
    end
end

function nine11ButtonChecking ()
    local r, c = guiGridListGetSelectedItem(GTImdc.gridlist[2])
    local r, g, b = guiGridListGetItemColor(GTImdc.gridlist[2], r, c)
        if r == 0 and g == 255 and b == 0 then
            guiSetText(GTImdc.button[2], "Cancel")
        else
            guiSetText(GTImdc.button[2], "Respond to call")
    end
end

function destroyBlipOnCallerWasted ()
    if blips.callers[source] ~= nil then
        destroyElement(blips.callers[source])
        blips.callers[source] = nil
        blips.localP911[localPlayer] = nil
        coords[getPlayerName(source)] = nil
        count_callers = 0
        exports.GTIhud:dm("INFO: Your 911 situation's caller ("..getPlayerName(source)..") has been taken down.", 30, 125, 255, true)
    end
end
addEventHandler("onClientPlayerWasted", root, destroyBlipOnCallerWasted)

function destroyBlipOnCallerQuit ()
    if blips.callers[source] ~= nil then
        destroyElement(blips.callers[source])
        blips.callers[source] = nil
        blips.localP911[localPlayer] = nil
        coords[getPlayerName(source)] = nil
        exports.GTIhud:dm("INFO: Your 911 situation's caller ("..getPlayerName(source)..") has left the server.", 30, 125, 255, true)
        count_callers = 0
    end
end
addEventHandler("onClientPlayerQuit", root, destroyBlipOnCallerQuit)

addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", root,
    function (jobName, resignJob)
        if resignJob == true or resignJob == false then
            if jobName == "Police Officer" then
                for i,v in ipairs (getElementsByType("blip")) do
                    if getBlipIcon(v) == 36 then
                    destroyElement(v)
                end
                    local caller = blips.localP911[localPlayer]
                    if blips.callers[caller] ~= nil then
                        blips.callers[caller] = nil
                    end
                    if blips.localP911[localPlayer] ~= nil then
                        blips.localP911[localPlayer] = nil
                    end
                    if isElement(caller) and coords[getPlayerName(caller)] ~= nil then
                        coords[getPlayerName(caller)] = nil
                    end
                    count_callers = 0
                end
            end
        end
    end)


function refreshOnButtonClick2()
--    triggerServerEvent("mdc.refresh", localPlayer)
    exports.GTIhud:dm("Refreshing the 911 calls list.", 255, 255, 0)
end

-- PART IV: RECORDS
----------------------->>

function inputFocus()
    if source == GTImdc.edit[1] and source == this then
        if string.find(guiGetText(source), "Search") then
            guiSetProperty(source, "NormalTextColour", "FF060606")
            guiSetText(source, "")
        end
    end
end
addEventHandler("onClientGUIClick", GTImdc.edit[1], inputFocus, false)

function outputRecordsMsg(text, r, g, b, time)
    if type(text) ~= "string" and type(r) ~= "number" and type(g) ~= "number" and type(b) ~= "number" and type(time) ~= "number" then return end
    guiSetText(GTImdc.label[14], text)
    guiLabelSetColor(GTImdc.label[14], r, g, b)
    setTimer(guiSetText, time, 1, GTImdc.label[14], "")
end
addEvent("GTIpoliceComputer.outputRecordsMsg", true)
addEventHandler("GTIpoliceComputer.outputRecordsMsg", root, outputRecordsMsg)

--http://puu.sh/c8a9M/bfddfcb355.txt

function getPlayerRecords(crimes)
    guiGridListSetItemText(GTImdc.gridlist[4], 0, timesCmtd, ""..crimes[1].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 1, timesCmtd, ""..crimes[2].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 2, timesCmtd, ""..crimes[3].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 3, timesCmtd, ""..crimes[4].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 4, timesCmtd, ""..crimes[5].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 5, timesCmtd, ""..crimes[6].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 6, timesCmtd, ""..crimes[7].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 7, timesCmtd, ""..crimes[8].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 8, timesCmtd, ""..crimes[9].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 9, timesCmtd, ""..crimes[10].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 10, timesCmtd, ""..crimes[11].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 11, timesCmtd, ""..crimes[12].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 12, timesCmtd, ""..crimes[13].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 13, timesCmtd, ""..crimes[14].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 14, timesCmtd, ""..crimes[15].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 15, timesCmtd, ""..crimes[16].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 16, timesCmtd, ""..crimes[17].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 17, timesCmtd, ""..crimes[18].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 18, timesCmtd, ""..crimes[19].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 19, timesCmtd, ""..crimes[20].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 20, timesCmtd, ""..crimes[21].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 21, timesCmtd, ""..crimes[22].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 22, timesCmtd, ""..crimes[23].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 23, timesCmtd, ""..crimes[24].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 24, timesCmtd, ""..crimes[25].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 25, timesCmtd, ""..crimes[26].."", false, false)
    guiGridListSetItemText(GTImdc.gridlist[4], 26, timesCmtd, ""..crimes[27].."", false, false)

    for i = 0, 26 do
        guiGridListSetItemColor(GTImdc.gridlist[4], i, timesCmtd, 20, 188, 20)
    end
end
addEvent("GTIpoliceComputer.sendWantedData", true)
addEventHandler("GTIpoliceComputer.sendWantedData", root, getPlayerRecords)

function onButtonClick()
    if source == GTImdc.button[4] then
        local accountName = guiGetText(GTImdc.edit[1])
        if string.find(accountName, "Search") then return end
        triggerServerEvent( "GTIpoliceComputer.sendRecordsData", localPlayer, accountName)
    end
end

function restrictRecordsTab(state)
    if state[localPlayer] == true then
        guiSetEnabled(GTImdc.tab[5], true)
    elseif state[localPlayer] == false then
        guiSetEnabled(GTImdc.tab[5], false)
    end
end
addEvent("GTIpoliceComputer.restrictRecordsUsage", true)
addEventHandler("GTIpoliceComputer.restrictRecordsUsage", root, restrictRecordsTab)


-- PART V: INFORMATION
----------------------->>
local codesFile = fileOpen("miscfiles/codes.txt", true)
local crimesFile = fileOpen("miscfiles/crimes.txt", true)
local featuresFile = fileOpen("miscfiles/features.txt", true)

if fileExists("miscfiles/codes.txt") then
    codes = fileRead(codesFile, 8000)
end
if fileExists("miscfiles/crimes.txt") then
    crimes = fileRead(crimesFile, 8000)
end
if fileExists("miscfiles/features.txt") then
    features = fileRead(featuresFile, 10000)
end

function displayInfoPanel()
    if  (source == GTImdc.button[99]) then
        guiSetVisible(InfoPan.window[1], true)
        guiBringToFront(InfoPan.window[1])
        guiGridListSetSelectedItem ( InfoPan.gridlist[1], 0, 1 )
        guiSetText( InfoPan.memo[1], codes )
        guiSetText( InfoPan.label[2], "Police Radio Codes" )
    elseif (source == GTImdc.button[100]) then
        guiSetVisible(InfoPan.window[1], true)
        guiBringToFront(InfoPan.window[1])
        guiGridListSetSelectedItem ( InfoPan.gridlist[1], 1, 1 )
        guiSetText( InfoPan.memo[1], crimes )
        guiSetText( InfoPan.label[2], "San Andreas Penal Code" )
    elseif (source == GTImdc.button[101]) then
        guiSetVisible(InfoPan.window[1], true)
        guiBringToFront(InfoPan.window[1])
        guiGridListSetSelectedItem ( InfoPan.gridlist[1], 3, 1 )
        guiSetText( InfoPan.memo[1], "Not complete yet, sorry." )
        guiSetText( InfoPan.label[2], "Code of Conduct" )
    elseif (source == GTImdc.button[102]) then
        guiSetVisible(InfoPan.window[1], true)
        guiBringToFront(InfoPan.window[1])
        guiGridListSetSelectedItem ( InfoPan.gridlist[1], 2, 1 )
        guiSetText( InfoPan.memo[1], features )
        guiSetText( InfoPan.label[2], "Law Enforcement features" )
    end
end

function infoPanelConf ()
    if (source == InfoPan.gridlist[1]) then
    local r,c = guiGridListGetSelectedItem ( InfoPan.gridlist[1] )

    if ( r == 0  and  c == 1 ) then
        guiSetText( InfoPan.memo[1], codes )
        guiSetText( InfoPan.label[2], "Police Radio Codes" )
    elseif ( r == 1 and  c == 1 ) then
        guiSetText( InfoPan.memo[1], crimes )
        guiSetText( InfoPan.label[2], "San Andreas Penal Code" )
    elseif ( r == 2 and  c == 1 ) then
        guiSetText( InfoPan.memo[1], features )
        guiSetText( InfoPan.label[2], "Law Enforcement Features" )
    elseif ( r == 3 and c == 1) then
        guiSetText( InfoPan.memo[1], "Not complete yet, sorry.")
        guiSetText( InfoPan.label[2], "Code of Conduct" )
    elseif ( r == nil and c == nil) then
        guiSetText( InfoPan.memo[1], "Please select a topic to read" )
        guiSetText( InfoPan.label[2], "" )
        end
    end
end

function hideInfoWdw()
    if (source == InfoPan.label[1]) then
        if isElement(sound5) then destroyElement(sound5) end
        sound5 = playSound("sounds/button_click.mp3")
        guiSetVisible(InfoPan.window[1], false)
    end
end

-- PART VI: MISCELLANEOUS
-------------------------->>

addEventHandler("onClientMouseEnter", guiRoot, function()
    if (source == GTImdc.label[13]) then
        if isElement(sound1) then destroyElement(sound1) end
        guiSetAlpha(GTImdc.label[13], 1.0)
        sound1 = playSound("sounds/button_hit.mp3")
    elseif (getElementType(source) == "gui-button") then
        if isElement(sound2) then destroyElement(sound2) end
        sound2 = playSound("sounds/button_hit.mp3")
    elseif (source == GTImdc.button[4]) then
    --  guiSetAlpha(GTImdc.staticimage[2], 1.0)
    elseif (source == InfoPan.label[1]) then
        if isElement(sound4) then destroyElement(sound4) end
        guiLabelSetColor(InfoPan.label[1], 25, 125, 255)
        sound4 = playSound("sounds/button_hit.mp3")
    end
end)

addEventHandler("onClientMouseLeave", guiRoot, function()
    if (source == GTImdc.label[13]) then
        guiSetAlpha(GTImdc.label[13], 0.5)
    --elseif (source == GTImdc.staticimage[2]) then
    --  guiSetAlpha(GTImdc.staticimage[2], 0.5)
    elseif (source == GTImdc.button[4]) then
        --guiSetAlpha(GTImdc.staticimage[2], 0.5)
    elseif (source == InfoPan.label[1]) then
        guiLabelSetColor(InfoPan.label[1], 255, 255, 255)
    end
end)

-- Computer related events:
 addEventHandler("onClientGUIClick", GTImdc.label[13], hideGUI, false)
-- Info panel:
 addEventHandler("onClientGUIClick", InfoPan.gridlist[1], infoPanelConf, false)
 addEventHandler("onClientGUIClick", GTImdc.button[99], displayInfoPanel, false)
 addEventHandler("onClientGUIClick", GTImdc.button[100], displayInfoPanel, false)
 addEventHandler("onClientGUIClick", GTImdc.button[101], displayInfoPanel, false)
 addEventHandler("onClientGUIClick", GTImdc.button[102], displayInfoPanel, false)
 addEventHandler("onClientGUIClick", InfoPan.label[1], hideInfoWdw, false)

-- Wanted tab:
 addEventHandler("onClientGUIClick",GTImdc.button[122], refreshOnButtonClick, false)
 addEventHandler("onClientGUIClick", GTImdc.button[1], trackingSuspectsHandler, false)
 addEventHandler("onClientGUIDoubleClick", wantedgridlist, trackingSuspectsHandler, false)
 addEventHandler("onClientGUIClick", wantedgridlist, trackingButtonCheck, false)
-- 911:
 addEventHandler("onClientGUIClick",GTImdc.button[2], responding, false)
 addEventHandler("onClientGUIClick",GTImdc.button[55], refreshOnButtonClick2, false)
 addEventHandler("onClientGUIClick", GTImdc.gridlist[2], nine11ButtonChecking, false)
-- Others:
 addEventHandler("onClientGUIDoubleClick", GTImdc.gridlist[2], responding, false)
 addEventHandler("onClientGUIClick", GTImdc.checkbox[4], crimeReportsHandler, false)
 addEventHandler("onClientGUIClick", GTImdc.checkbox[3], soundHandler, false)
 addEventHandler("onClientGUIClick", GTImdc.checkbox[2], nineOneOneHand, false)
 addEventHandler("onClientGUIClick", GTImdc.button[4], onButtonClick, false)

-----------------------------------------------------------
--  COPYRIGHT GRAND THEFT INTERNATIONAL (C)
-----------------------------------------------------------
