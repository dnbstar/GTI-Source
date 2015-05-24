-- Money ID: 1212

objects = {
	{ 1448, 1590.099, -472, 580.4000}
}

for _, o in ipairs ( objects) do
	createObject( o[1], o[2], o[3], o[4])
end

local scores = {}

addEventHandler( "onResourceStart", resourceRoot,
	function()
		for i, player in ipairs ( getElementsByType( "player")) do
			table.insert( scores, { player, 0})
		end
	end
)

addEventHandler( "onPlayerDamage", root,
	function( attacker, _, _, loss)
		for i, data in ipairs ( scores) do
			local plr = data[1]
			local score = data[2]

			local new_score = score+loss

			if plr == attacker then
				table.remove( scores, i)
				table.insert( scores, { attacker, new_score})
				outputDebugString( scores[i][2])
			end
			--outputDebugString( "CnR Score| Name: "..getPlayerName( plr).." -|- Score: "..score)
		end
	end
)
