local screenWidth, screenHeight = guiGetScreenSize()
arrestPoints = {
	[1] = {1810.52, -1573.89, 13.49}  -- Commerence, Los Santos
}

function tazePlayer(weapon, ammo, clip, x, y, z, element)
	-- later: police, swat, mf/af, staff
	if (exports.metall:isPlayerInTeams(source, "Police")) then
		if (element and isElement(element) and getElementType(element == "player" and weapon == 23) then
			triggerServerEvent("tazePlayer", root, element)
		end
	end
end
addEventHandler("onClientPlayerDamage", localPlayer, tazePlayer)

function showIntro()
	fadeCamera(false, 0)
	setElementDimension(localPlayer, math.random(1, 10))
	introText = "Hello\nWe see that it's your first time as a Police Officer\nLet us show you a quick intro.."
	setTimer(updateIntroText, 4000, 1, "You can see if a player is wanted by checking at the end\nof their names Smart[1] would mean that Smart has 1 star")
	setTimer(updateIntroText, 8000, 1, "You can also see if they are wanted at TAB under the WL column.\nYou can also use F5 to find wanted players and mark them.")
	setTimer(updateIntroText, 16000, 1, "To arrest a wanted player you must go close to them and press 'M' to get a cursor\nand then click on the player.")
	setTimer(updateIntroText, 32000, 1, "The player you clicked on will then choose to either escape or surrender.\nIf he surrender you will get the arrest automaticially.\nAnd you will need to bring him to a prison (marked on your map)")
	setTimer(updateIntroText, 40000, 1, "However if the player decides to escape he will get twice as much wanted\nand you can kill him to get the arrest or smack him with a nightstick.")
	setTimer(finishIntro, 48000, 1)
	addEventHandler("onClientRender", root, drawIntroText)
end
addEvent("showIntro", true)
addEventHandler("showIntro", root, showIntro)

function updateIntroText(text)
	introText = text
end

function finishIntro()
	setElementDimension(localPlayer, 0)
	removeEventHandler("onClientRender", root, drawIntroText)
	fadeCamera(true)
end

function drawIntroText()
	local text = introText or "An error has occurred, please reconnect"
	dxDrawText(text, (screenWidth / 1920) * 515.0, (screenHeight / 1080) * 393.0, (screenWidth / 1920) * 1348.0, (screenHeight / 1080) * 540.0, tocolor(255, 255, 255, 255), (screenWidth / 1920) * 1.0, "bankgothic", "center", "top", false, false, false)
end