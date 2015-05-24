addEventHandler( "onResourceStart", resourceRoot,
	function()
		gates = exports.GTIgatesTable:getGatesTable()
		for index, gate in ipairs (gates) do
			local x, y, z = gate.pos[1], gate.pos[2], gate.pos[3]
			local moveX, moveY, moveZ = gate.move[1], gate.move[2], gate.move[3]
			local rotX, rotY, rotZ = gate.rot[1], gate.rot[2], gate.rot[3]
			local id, size = gate.model, gate.size
			local int, dim = gate.world[1], gate.world[2]
			if gate.animation[1] and gate.animation[2] then
				start, leave = gate.animation[1], gate.animation[2]
			else
				start, leave = "Linear", "Linear"
			end
			if gate.res then
				if gate.res.team then
					team = gate.res.team[1]
				end
			end
			if gate.res then
				if gate.res.job then
					job = gate.res.job[1]
				end
			end
			--outputChatBox( job)
			--
			local gate = createObject( id, x, y, z, rotX, rotY, rotZ)
			local col = createColSphere( x, y, z+1, size)
			--
            addEventHandler("onColShapeHit", col,
                function( hitElement)
					if team then
						local hitTeam = getPlayerTeam( hitElement)
						local teamName = getTeamName( hitTeam)
						if team[teamName] then
							moveObject( gate, 1000, moveX, moveY, moveZ, 0, 0, 0, start)
						end
					elseif not team then
						moveObject( gate, 1000, moveX, moveY, moveZ, 0, 0, 0, start)
                    end
                end
            )
			--
            addEventHandler("onColShapeLeave", col,
                function( leaveElement)
					if team then
						local leaveTeam = getPlayerTeam( leaveElement)
						local teamName = getTeamName( leaveTeam)
						if team[teamName] then
							moveObject( gate, 1000, x, y, z, 0, 0, 0, leave)
						end
					elseif not team then
						moveObject( gate, 1000, x, y, z, 0, 0, 0, leave)
                    end
                end
            )
		end
	end
)
