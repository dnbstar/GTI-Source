----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 29 March 2015
-- Resource: GTiweather/weather.lua
-- Type: Client Side
-- Author: Jack Johnson (Jack)
----------------------------------------->>

local weatherTable = {
	{"very sunny with a chance of sun burn","mild",0,2},
	{"very sunny with a chance of sun burn","mild",0,3},
	{"very sunny with a chance of sun burn","moderate",0,4},
	{"very sunny with a chance of sun burn","mild",0,1},
	{"very sunny with a chance of sun burn","moderate",0,5},
	{"very cloudy and cold","mild",7,2},
	{"very foggy","mild",9,3},
	{"very rainy with a chance of cold","dangerous",16,9},
	{"a sand storm blowing across","moderate",19,6}
}

addEvent("Weather:onServerDataSent",true)
local weatherEnabled = false
local currentWeather = 1

function onClientLoaded()
	triggerServerEvent("onClientLoaded",root)
end
addEventHandler("onClientResourceStart",resourceRoot,onClientLoaded)

function onServerDataSent(weather,setting)
	if weatherEnabled then updateWeather(weather or 1) end
	
	if (type(setting) ~= nil) then
		toggleWeather(setting)
	end
end
addEventHandler("Weather:onServerDataSent",root,onServerDataSent)

function toggleWeather(setting)
	if type(setting) == "boolean" and setting ~= nil then
		if not setting then
			weatherEnabled = setting
			setWaveHeight(0)
			setWeather(0)
			exports.GTIhud:dm("Weather is now disabled.",math.random(255),math.random(255),math.random(255))
		else
			weatherEnabled = setting
			updateWeather(currentWeather)
			exports.GTIhud:dm("Weather is now enabled.",math.random(255),math.random(255),math.random(255))
		end
		triggerServerEvent("Weather:onWeatherToggled",localPlayer,weatherEnabled)
	end
end
addCommandHandler("toggleweather",function() toggleWeather(not weatherEnabled) end)

function updateWeather(weather)
	if not weather then return false end --No idea...
	
	weather = weatherTable[weather]
	setWeatherBlended(weather[3])
	setWaveHeight(weather[4])
	exports.GTIhud:dm("[Weather Forecast] Today's forecast is "..weather[1].." and the ocean waves are "..weather[2].." for fishing.",math.random(255),math.random(255),math.random(255))
end