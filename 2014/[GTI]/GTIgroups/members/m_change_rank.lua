----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 11 Apr 2014
-- Resource: GTIgroups/members/m_change_rank.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local RankIDByRow = {}	-- Rank ID & Row Association
local activeAccount		-- Selected Player Account
local activePlayer		-- Selected Player Name

-- Toggle GUI
-------------->>

function showChangeRankGUI(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(groupPanel.gridlist[1])
	if (not row or row == -1) then return end
	local player = guiGridListGetItemText(groupPanel.gridlist[1], row, 2)
	activePlayer = player
	local account = guiGridListGetItemText(groupPanel.gridlist[1], row, 3)
	activeAccount = account
	guiGridListClear(mChangeRank.gridlist[1])
	guiSetText(mChangeRank.label[3], player)
	guiSetText(mChangeRank.label[4], "...")
	
	guiBringToFront(mChangeRank.window[1])
	guiSetVisible(mChangeRank.window[1], true)
	
	triggerServerEvent("GTIgroups.callChangeRankInfo", resourceRoot, account)
end
addEventHandler("onClientGUIClick", groupPanel.button[6], showChangeRankGUI, false)

function returnChangeRankInfo(rankName, groupRanks, rankNames)
	guiSetText(mChangeRank.label[4], rankName)
	for i,rank in ipairs(rankNames) do
		local row = guiGridListAddRow(mChangeRank.gridlist[1])
		guiGridListSetItemText(mChangeRank.gridlist[1], row, 1, rank, false, false)
		RankIDByRow[row] = groupRanks[i]
	end
end
addEvent("GTIgroups.returnChangeRankInfo", true)
addEventHandler("GTIgroups.returnChangeRankInfo", root, returnChangeRankInfo)

function closeChangeRankGUI(button, state)
	if (button ~= "left" or state ~= "up") then return end
	guiSetVisible(mChangeRank.window[1], false)
end
addEventHandler("onClientGUIClick", mChangeRank.button[2], closeChangeRankGUI, false)

-- Set Rank
------------>>

function selectRankForPlayer(button, state)
	if (button ~= "left" or state ~= "up") then return end
	local row = guiGridListGetSelectedItem(mChangeRank.gridlist[1])
	if (not row or row == -1) then return end
	triggerServerEvent("GTIgroups.selectRankForPlayer", resourceRoot, RankIDByRow[row], activePlayer, activeAccount)
end
addEventHandler("onClientGUIClick", mChangeRank.button[1], selectRankForPlayer, false)
