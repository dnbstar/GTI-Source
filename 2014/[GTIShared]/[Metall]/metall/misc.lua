function isPlayerInTeams(...)
	local teams = {...}
	local playerTeam = getPlayerTeam(localPlayer)
	if (playerTeam) then
		for index, team in pairs(teams) do
			if (getTeamName(playerTeam) == team) then
				result = true
			end
		end
	end
	return result or false
end

-- Get the matrix
function getCameraMatrixPosition()
	local camx, camy, camz, tarx, tary, tarz = getCameraMatrix()
	local camx, camy, camz, tarx, tary, tarz = math.ceil(camx), math.ceil(camy), math.ceil(camz), math.ceil(tarx), math.ceil(tary), math.ceil(tarz)
	outputChatBox(camx..", "..camy..", "..camz..", "..tarx..", "..tary..", "..tarz, 255, 255, 255)
end
addCommandHandler("matrix", getCameraMatrixPosition)

function getRotation()
	local rot = getPedRotation(localPlayer)
	outputChatBox(math.ceil(rot), 255, 0, 0)
end
addCommandHandler("rotation", getRotation)

function testRotatingPed()
	local rot = getPedRotation(localPlayer)
	local x, y, z = getElementPosition(localPlayer)
	ped = createPed(1, x, y, z)
	tmr = setTimer(changeRotation, 50, 0)
end
addCommandHandler("tped", testRotatingPed)

function changeRotation()
	local current = getPedRotation(ped)
	setPedRotation(ped, current + 1)
end

function rocket()
	local x, y, z = getElementPosition(localPlayer)
	createProjectile(localPlayer, 19, x + 3, y, z)
end
addCommandHandler("rocket", rocket)