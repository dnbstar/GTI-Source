local weatherTypes = {
	--{ Weather Set, Next Weather}
	[3] = 8,
	[8] = 11,
	[11] = 16,
	[16] = 39,
	[39] = 27,
	[27] = 34,
	[34] = 37,
	[37] = 3,
}

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		setWeather( 3)
	end
)

setTimer(
	function()
		local currentWeather = getWeather()
		local altrification = weatherTypes[currentWeather]
		setWeatherBlended( altrification) --Changes Every 60 seconds
	end, 840000, 0
)

--840000+600000=900000 Seconds
