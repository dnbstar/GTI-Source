
-- /map-warp
-------------->>

addCommandHandler("map-warp",
	function( player, cmd, x, y, z)
		if x and y and z then
			if exports.GTIgovt:isAdmin( player) or exports.GTIgovt:isDeveloper( player) or exports.GTIgovt:isArchitect( player) then
				setElementPosition( player, x, y, z)
				exports.GTIlogs:outputAdminLog( getPlayerName( player).." used /map-warp to warp to '"..getZoneName( x, y, z)..", "..getZoneName( x, y, z, true).."'", "admin", player)
			end
		end
	end
)
