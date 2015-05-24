local onSpawnActivateVision = false
local onSpawnCameraGoggleEffect = "normal"
function onWastedCheckForVision()
    if source ~= localPlayer then return false end
    if getCameraGoggleEffect () == "nightvision" or getCameraGoggleEffect () == "thermalvision" then
		onSpawnActivateVision = true
		onSpawnCameraGoggleEffect = getCameraGoggleEffect()
	end
end
addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), onWastedCheckForVision )
function onPlayerSpawn()
    if source ~= localPlayer then return false end
    if onSpawnActivateVision then
	    setCameraGoggleEffect ( onSpawnCameraGoggleEffect )
	end
	onSpawnActivateVision = false
	onSpawnCameraGoggleEffect = "normal"
end
addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), onPlayerSpawn )