local userData = {}
local screenshotsToDelete  = {}

function theCallBack(responseData, errno, playertoReceive)
	if (errno == 0) then
		data = fromJSON(responseData)
		if (data["success"]) then
			exports.GTIhud:dm(data["success"]["message"], playertoReceive, 0, 255, 0)
			outputConsole(data["success"]["link"], playertoReceive)
		elseif (data["error"]) then
			exports.GTIhud:dm(data["error"]["message"], playertoReceive, 255, 0, 0)
		end
	end
end

function postHandler(data)
	local accountName = getAccountName(getPlayerAccount(source))
	userData[accountName] = {}
	
	userData[accountName]["authkey"] = exports.GTIauth:getPlayerAuthKey(source)
	userData[accountName]["ipaddr"] = getPlayerIP(source)
	if (data["loc"]) then
		local x, y, z = getElementPosition(source)
		userData[accountName]["location"] = string.format("%.3f", x) .. ", " .. string.format("%.3f", y) .. ", " .. string.format("%.3f", z)
	else
		userData[accountName]["location"] = ""
	end
	
	for k, v in pairs(data) do userData[accountName][k] = v end
	if (data["screenshot"]) then
		takePlayerScreenShot(source, data["screendimentions"]["screenw"], data["screendimentions"]["screenh"], "GTIbreporter." .. getAccountName(getPlayerAccount(source))) 
		userData["screendimentions"] = nil
		exports.GTIhud:dm("Uploading screenshot, please wait a few seconds..", source, 255, 128, 0)
	else
		fetchRemote("localhost/custom/igreporter/igreporter.php", theCallBack, toJSON(userData[accountName]))
		userData[accountName] = nil
	end
	
end
addEvent("GTIbreporter.submit", true)
addEventHandler("GTIbreporter.submit", root, postHandler)

function getFormattedData(thedata)
	local formattedData = ""
	for k, v in ipairs(thedata) do
		formattedData = formattedData .. k:gsub("^%1", string.upper) .. "\n"
	end
end

function screenshotTaken(resource, status, imageData, timestamp, tag)
	local accountName = getAccountName(getPlayerAccount(source))
	if (status == "ok") then
		userData[accountName]["status"] = true
		local timeTaken = getRealTime()
		filename = accountName .. "_" ..  timeTaken.year + 1900 .. "-" .. string.format("%02d", timeTaken.month + 1) .. "-" .. string.format("%02d", timeTaken.monthday) .. "_" .. string.format("%02d", timeTaken.hour) .. "-" .. string.format("%02d", timeTaken.minute) .. "-" .. string.format("%02d", timeTaken.second) .. ".jpeg"
		local newfile = fileCreate("/screenshots/" .. filename)
		if (newfile) then
			fileWrite(newfile, imageData)
			userData[accountName]["filename"] = filename
			fileClose(newfile)
			userData[accountName]["saved"] = true
		end
	else
		exports.GTIhud:dm("Was unable to take screenshot, skipping the screenshot...", source, 255, 0, 0)
		userData[accountName]["status"] = "failed"
	end
end
addEventHandler("onPlayerScreenShot", root, screenshotTaken)

function uploadToServer()
	url = "localhost/custom/igreporter/igreporter.php"
	for accName, datatable in pairs(userData) do
		if (datatable["saved"] and datatable["filename"]) then
			datatable["saved"] = nil
			datatable["status"] = nil
			fetchRemote(url, theCallBack, toJSON(userData[accName]))
			screenshotsToDelete[datatable["filename"]] = getRealTime().minute
			userData[accName] = nil
		elseif (datatable["status"] == "failed") then
			userData[accName]["screenshot"] = false
			datatable["saved"] = nil
			datatable["status"] = nil
			fetchRemote(url, theCallBack, toJSON(userData[accName]))
			userData[accName] = nil
		end
	end
end
setTimer(uploadToServer, 3000, 0)

function deleteSSs()
	for imgname, minute in pairs(screenshotsToDelete) do
		fileDelete("/screenshots/" .. imgname)
		screenshotsToDelete[imgname] = nil
	end
end
setTimer(deleteSSs, 100000, 0)

function resourceStart(res)
	local serverport = getServerPort()
	if (serverport ~= 22020) then
		cancelEvent()
	end
end
addEventHandler("onResourceStart", resourceRoot, resourceStart)