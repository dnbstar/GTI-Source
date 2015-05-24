triggered = false
showing = false

setTimer(
	function()
		local x, y, z = getElementPosition( localPlayer)

		if z <= -30 then
			if isElementInWater( localPlayer) then
				local hp = getElementHealth( localPlayer) - 10
				--if hp ~= 0 then
					setElementHealth( localPlayer, hp)
					if not triggered then
						triggered = true
						triggerEvent( "LilDolla.water", localPlayer, true)
					end
				--[[
				else
					if triggered then
						triggered = false
						triggerEvent( "LilDolla.water", localPlayer, false)
					end
				end
				--]]
			end
		elseif z > -30 then
			if showing then
				triggerEvent( "LilDolla.water", localPlayer, false)
			end
		end
	end, 1000, 0
)

addEvent( "LilDolla.water")
addEventHandler( "LilDolla.water", root,
	function( state)
		if state then
			exports.GTIhud:drawNote( "antiwater", "You are slowly being crushed by the water's pressure", 255, 25, 25)
			showing = true
		else
			exports.GTIhud:drawNote( "antiwater", "", 255, 25, 25, 100)
			showing = false
		end
	end
)
