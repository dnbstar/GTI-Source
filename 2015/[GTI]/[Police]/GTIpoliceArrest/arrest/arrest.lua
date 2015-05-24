----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 19 May 2014
-- Resource: GTIpoliceArrest/arrest_mech.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local HANDCUFFS_OFFSET = 0.5	-- Offset of Handcuffs Notice
local HC_VISIBLE = 20			-- Visible Distance of Handcuffs
local STATION_BLIP = 30			-- Default PD Blip

local hit_arrest = {}	-- Table of Players Hit Arrested
local pd_markers = {}	-- Table of PD Markers
local pd_blips = {}		-- Table of PD Blips

-- Two Hit Arrest
------------------>>

function nightstickArrest(police, weapon)
	if (not exports.GTIutil:isPlayerInTeam(police, "Law Enforcement")) then return end
	if (getElementData(police, "job") ~= "Police Officer") then return end
	if (getElementData(police, "isWorking") ~= 1) then return end
	if (weapon ~= 3) then return end
	
	if ((getElementData(source, "wanted") or 0) == 0 or getElementData(source, "arrested")) then 
		cancelEvent()
	return end

	cancelEvent()
	if (not hit_arrest[source]) then
		-- First Hit
		hit_arrest[source] = {police}
	else
		-- Second Hit
		table.insert(hit_arrest[source], police)
		if (source == localPlayer) then
			triggerServerEvent("GTIpoliceArrest.nightstickArrest", resourceRoot, hit_arrest[source])
		end
		hit_arrest[source] = nil
	end	
end
addEventHandler("onClientPlayerDamage", root, nightstickArrest)

-- Render Arrestable Notice
---------------------------->>

function renderArrestableIcon()
	if (not exports.GTIutil:isPlayerInTeam(localPlayer, "Law Enforcement")) then 
		removeEventHandler("onClientRender", root, renderArrestableIcon)
	return end
	for i,player in ipairs(getElementsByType("player", root, true)) do
		local wanted = getElementData(player, "arrested")
		if (wanted and wanted == 0) then
			local px, py, pz = getCameraMatrix()
			local tx, ty, tz = getPedBonePosition(player, 5)
			tz = tz + HANDCUFFS_OFFSET
			local dist = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
			if (dist < HC_VISIBLE) then
				if (isLineOfSightClear(px, py, pz, tx, ty, tz, true, true, false, true, true, false, false)) then
					local x,y = getScreenFromWorldPosition(tx, ty, tz)
					if (x) then
						dxDrawImage(x-32, y-32, 64, 64, "handcuffs/handcuffs-64.png")
					end
				end
			end
		end
	end
end

addEvent("onClientPlayerGetJob", true)
addEventHandler("onClientPlayerGetJob", localPlayer, function(job, _, division)
	if (job == "Police Officer" and division == "Police Officer") then
		addEventHandler("onClientRender", root, renderArrestableIcon)
	end
end)

addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function(job, _, division)
	if (job == "Police Officer" and division == "Police Officer") then
		removeEventHandler("onClientRender", root, renderArrestableIcon)
		removePDMarkers()
	end
end)

-- Show Police Station
----------------------->>

function showPoliceStation(player, all, table_)
	if (all) then
		for i,v in ipairs(table_) do
			local marker = createMarker(v[1], v[2], v[3], "cylinder", 4, 30, 150, 255, 175)
			local blip = createBlipAttachedTo(marker, STATION_BLIP)
			local col = getElementColShape(marker)
			addEventHandler("onClientColShapeHit", col, jailPlayer)
			table.insert(pd_markers, marker)
			table.insert(pd_blips, blip)
		end
	else
		local x,y,z = table_[1], table_[2], table_[3]
		local marker = createMarker(v[1], v[2], v[3], "cylinder", 4, 30, 150, 255, 175)
		local blip = createBlipAttachedTo(marker, STATION_BLIP)
		local col = getElementColShape(marker)
		addEventHandler("onClientColShapeHit", col, jailPlayer)
		table.insert(pd_markers, marker)
		table.insert(pd_blips, blip)
	end
end
addEvent("GTIpoliceArrest.showPoliceStation", true)
addEventHandler("GTIpoliceArrest.showPoliceStation", root, showPoliceStation)

function jailPlayer(player, dim)
	if (not exports.GTIutil:isPlayerInTeam(player, "Law Enforcement")) then return end
	triggerServerEvent("GTIpoliceArrest.jailPlayer", resourceRoot, player, dim)
end

-- Delete Objects 
------------------>>

function removePDMarkers()
	if (pd_markers)	then
		for i,object in ipairs(pd_markers) do
			local col = getElementColShape(object)
			removeEventHandler("onClientColShapeHit", object, jailPlayer)
			destroyElement(object)
		end
		pd_markers = {}
	end
	if (pd_blips) then
		for i,object in ipairs(pd_blips) do
			destroyElement(object)
		end
		pd_blips = {}
	end
end
addEvent("GTIpoliceWanted.removePDMarkers", true)
addEventHandler("GTIpoliceWanted.removePDMarkers", root, removePDMarkers)

-- Handcuffs Mod
----------------->>

addEventHandler("onClientResourceStart", resourceRoot, function()
	local txd = engineLoadTXD("handcuffs/cuffs.txd")
	engineImportTXD(txd, 331)
	local dff = engineLoadDFF("handcuffs/cuffs.dff")
	engineReplaceModel(dff, 331)
end)
