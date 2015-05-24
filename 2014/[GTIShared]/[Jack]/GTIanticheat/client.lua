local monitorList = {}

function recieveMonitorList(list)
	if (list) then
		monitorList = list
	end
end
addEvent("sendMonitorList",true)
addEventHandler("sendMonitorList",root,recieveMonitorList)

function monitor()
	if (#monitorList >= 1) then
		local data = {}
		for k,v in ipairs(monitorList) do
			local elementData = getElementData(localPlayer,tostring(v.name)) or ""
			table.insert(data,{name=tostring(v),data=elementData})
		end
		
		triggerServerEvent("returnElementMonitoringList",localPlayer,data)
	end
end
setTimer(monitor,math.random(3000,10000),0)