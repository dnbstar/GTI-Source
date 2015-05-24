----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 03 Dec 2013
-- Resource: GTIjobs/JobPanel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

addEvent("onClientPlayerGetJob", true)
addEvent("onClientPlayerQuitJob", true)

------------------>>
-- Job Site Panel
------------------>>

-- GUI Job Data
---------------->>

local orgSkin
local jobName
function sendGUIJobData(job, jobData)
		-- Player Data
	guiSetText(jobs.label[2], "Level "..jobData["level"])
	guiSetText(jobs.label[4], jobData["rank"])
	guiSetText(jobs.label[6], exports.GTIutil:tocomma(jobData["prog"]).." "..jobData["unit"])
		-- Job Name
	jobName = job
	local team = getTeamFromName(jobData["jobTable"].team) or "Civilians"
	local r,g,b = getTeamColor(team)
	guiSetText(jobs.label[1], job.." Job")
	guiLabelSetColor(jobs.label[1], r, g, b)
		-- Job Description
	local desc = jobData["jobTable"].desc.."\n\n-- Job Ranks:"
	desc = desc.."\nLevel 0: "..jobData["rankTable"][0].name
	for lvl,tbl in ipairs(jobData["rankTable"]) do
		desc = desc.."\nLevel "..lvl..": "..tbl.name
	end
		-- Job Description Scroll Length
	local sx,sy = guiGetSize(jobs.label[9], false)
	local len = math.ceil(#jobData["jobTable"].desc/(sy/6))
	local pos = 0
	while true do
		local sPos,ePos = string.find(desc,"\n",pos)
		if (not sPos) then break end
		pos,len = sPos+1, len+1
	end
	local sx,sy = guiGetSize(jobs.label[9], false)
	guiSetSize(jobs.label[9], sx, len*15, false)
	guiSetText(jobs.label[9], desc)
		-- Job Skins
	orgSkin = getElementModel(localPlayer)
	guiGridListClear(jobs.gridlist[1])
	for i,skin in ipairs(jobData["jobTable"].skins) do
		local row = guiGridListAddRow(jobs.gridlist[1])
		guiGridListSetItemText(jobs.gridlist[1], row, jobs.col[1], skin[1], false, true)
		guiGridListSetItemText(jobs.gridlist[1], row, jobs.col[2], skin[2], false, false)
	end
		-- Take Job or Change Skin
	local occ = getElementData(localPlayer, "job")
	if (occ == job) then
		guiSetText(jobs.button[1], "Change Skin")
	else
		guiSetText(jobs.button[1], "Take Job")
	end
		-- Show Panel
	guiSetVisible(jobs.window[1], true)
	showCursor(true)
end
addEvent("GTIjobs.sendGUIJobData", true)
addEventHandler("GTIjobs.sendGUIJobData", root, sendGUIJobData)

-- Preview Job Skin
-------------------->>

local selSkin
function previewJobSkin(button, state)
	if (button ~= "left" and state ~= "up") then return end
	local row,col = guiGridListGetSelectedItem(jobs.gridlist[1])
	if (not row or row == -1) then return end
	selSkin = guiGridListGetItemText(jobs.gridlist[1], row, col)
	setElementModel(localPlayer, selSkin)
end
addEventHandler("onClientGUIClick", jobs.gridlist[1], previewJobSkin)

-- Set Player Job
------------------>>

function setPlayerJob(button, state)
	if (button ~= "left" and state ~= "up") then return end
	if (not selSkin) then
		exports.GTIhud:dm("Notice: Please select a job skin from the list.", 255, 125, 0)
		return 
	end
	
	setElementModel(localPlayer, orgSkin)
	if (guiGetText(jobs.button[1]) == "Take Job") then
		triggerServerEvent("GTIjobs.setPlayerJob", root, jobName, selSkin)
	else
		triggerServerEvent("GTIjobs.changeSkin", root, selSkin)
	end
	selSkin = nil
	orgSkin = nil
end
addEventHandler("onClientGUIClick", jobs.button[1], setPlayerJob)	

-- Close Panel
--------------->>

function closeJobsPanel(button, state, ignoreSkin)
	if (button ~= "left" or state ~= "up") then return end
	if (ignoreSkin ~= true) then
		setElementModel(localPlayer, orgSkin)
	end
	guiSetVisible(jobs.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", jobs.label[8], closeJobsPanel, false)
addEvent("GTIjobs.closeJobsPanel", true)
addEventHandler("GTIjobs.closeJobsPanel", root, closeJobsPanel)

addEventHandler("onClientMouseEnter", jobs.label[8], function()
	guiLabelSetColor(source, 255, 100, 100)
end, false)

addEventHandler("onClientMouseLeave", jobs.label[8], function()
	guiLabelSetColor(source, 255, 255, 255)
end, false)

-- Job Exports
--------------->>

function getPlayerJob(isWorking)
	local job = getElementData(localPlayer, "job")
	if (job == "" or not job) then return false end
	
	if (isWorking) then
		local working = getElementData(localPlayer, "isWorking")
		if (working == 1) then
			return job
		else
			return false
		end
	end
	
	return job
end