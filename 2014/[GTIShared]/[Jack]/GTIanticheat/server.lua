local monitoredData = {} --Holds all potential strings that requires monitoring.

function onPlayerJoin()
	if (isElement(source)) then
		--outputDebugString("Player joined, sending monitor data table..")
		sendPlayerList(source)
	end
end
addEventHandler("onPlayerJoin",root,onPlayerJoin)

function pulseMonitorList()
	local playersList = {}
	for k,v in ipairs(getElementsByType("player")) do
		setTimer(sendPlayerList,3000,1,v) --send to 1 player at a time, because tables suck!
	end
end
setTimer(pulseMonitorList,120000,0) --resend the list every 2 minutes.

function onStart()
	pulseMonitorList()
end
addEventHandler("onResourceStart",resourceRoot,onStart)

function sendPlayerList(player)
	if (isElement(player)) then
		--outputDebugString("Sending list for "..getPlayerName(player).."...")
		triggerClientEvent(player,"sendMonitorList",player,monitoredData)
	end
end

function checkRecievedData(data)
	--outputDebugString("checkRecievedData called...")
	if (data) then
		--outputDebugString("Collecting "..getPlayerName(client).."'s serverside data...")
		local serverData = {}
		for k,v in ipairs(monitoredData) do
			local elData = getElementData(client,tostring(v.name))
			if (elData) then
				table.insert(serverData,{name=v.name,data=elData})
			end
		end
		
		--outputDebugString("Checking for mismatched data (cheated)..")
		local mismatchData = {}
		for k,v in ipairs(data) do
			for k2,v2 in ipairs(serverData) do
				if (v.name == v2.name) then
					if (v.data ~= v2.data) then
						table.insert(mismatchData,{name=v.name,clientSource=v.data,serverSource=v2.data})
					end
				end
			end
		end
		
		--outputDebugString("Outputting cheated data (if any)..")
		local flag = false
		if (#mismatchData >= 1) then
			--outputDebugString("Player cheated, outputting results...")
			for k,v in ipairs(mismatchData) do
				outputDebugString("[ANTI-CHEAT] Player "..getPlayerName(client).." has altered data! Name: "..v.name..", Client: "..v.clientSource..", Server: "..v.serverSource..".")
				flag = true
			end
		end
		
		if (flag) then
			--outputDebugString("Player flagged.")
			triggerEvent("onPlayerCheatDetected",root,client,mismatchData)
		end
	end
end
addEvent("returnElementMonitoringList",true)
addEventHandler("returnElementMonitoringList",root,checkRecievedData)

-------------------------

function pushToMonitor(elementName,state)
	if (type(elementName) == "string") and (elementName ~= "") and (type(state) == "boolean") then
		--outputDebugString("pushToMonitor ran.")
		if (state == true) then --adding
			--outputDebugString("Adding \""..elementName.."\" to monitor...")
			table.insert(monitoredData,{name=elementName})
			return true
		elseif (state == false) then
			--outputDebugString("Removing \""..elementName.."\" if any...")
			for k,v in ipairs(monitoredData) do
				if (v == elementName) or (k == elementName) then
					--outputDebugString("Removed.")
					monitoredData[v] = nil --forgot which one works
					monitoredData[k] = nil
					return true
				end
			end
			--outputDebugString(elementName.." not found.")
			return false --value wasn't found
		else
			return nil --invalid state
		end
	else
		return nil --missing args
	end
	
	pulseMonitorList() --resend the list to everyone
end