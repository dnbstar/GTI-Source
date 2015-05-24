lockdown = false

room1 = {
	createObject(2885, 1519.5996, -475.7002, 580.4, 0, 0, 0),
	createObject(2885, 1519.5996, -460.5, 580.4, 0, 0, 179.995),
	createObject(2885, 1525.1, -468.4, 580.4, 0, 0, 89.995),
	createObject(2885, 1514, -468.2, 580.4, 0, 0, 269.995),
}

scales = {
	{1,1.075},
	{2,1.075},
	{3,1.4},
	{4,1.4},
}

for i, scale in ipairs ( scales) do
	setObjectScale( room1[scale[1]], scale[2])
end

addCommandHandler( "bhlock",
	function()
		for i, object in ipairs ( room1) do
			local x, y, z = getElementPosition( object)
			if not lockdown then
				moveObject( object, 1000, x, y, z+3.4)
			else
				moveObject( object, 1000, x, y, z-3.4)
			end
		end
		if not lockdown then
			outputDebugString( "CnR Heist: Locking down the bank.")
			lockdown = true
		else
			outputDebugString( "CnR Heist: Opening up the bank.")
			lockdown = false
		end
	end
)
