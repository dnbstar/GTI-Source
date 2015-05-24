local maxOxygen = 50000 --default
local oxygenTankEnabled = true

function onStart()
	outputDebugString("Starting...")
	
	local rX,rY = guiGetScreenSize()
	local width,height = 243,21
	local X,Y = (rX/1.2) - (width/2), (rY/1.1) - (height/2)
	progressBar = guiCreateProgressBar(X,Y,width,height, false)
	guiSetAlpha(progressBar, 0.80)
	guiProgressBarSetProgress(progressBar, 0)

	progressLbl = guiCreateLabel(8, 3, 224, 15, "100%", false, progressBar)
	guiSetFont(progressLbl, "default-bold-small")
	guiLabelSetColor(progressLbl, 255, 30, 0)
	guiLabelSetHorizontalAlign(progressLbl, "center", false)
	guiLabelSetVerticalAlign(progressLbl, "center")
	addEventHandler("onClientRender",root,onRender)
	outputDebugString("Drawn.")
end
addEventHandler("onClientResourceStart",resourceRoot,onStart)

function onRender()
	guiSetVisible(progressBar,false)
	local curOxygen = getPedOxygenLevel(localPlayer)-1000 - 2  --take away 2 because GTA is a bitch.
	
	if (math.floor(curOxygen) <= 0) then
		oxygenTankEnabled = false
	else
		oxygenTankEnabled = true
	end
	
	if (oxygenTankEnabled == true) and (isElementInWater(localPlayer)) then
		guiSetVisible(progressBar,true)
		local total = ((curOxygen/maxOxygen)*100)
		guiProgressBarSetProgress(progressBar,math.floor(total))
		guiSetText(progressLbl,"Oxygen: "..math.floor(total).."%")
	end
end