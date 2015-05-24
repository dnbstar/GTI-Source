--[[
local API_LINK = "http://api.voicerss.org/?key="

local API_KEY = "453dd238e2fb4b21b2dcc622782a7d46"

local TEXT_ENTRY = "&src=%27"
local HTML_SPACE = "%27"
local CODEC = "&c='MP3'"

function queryAssistantSound( text)
	if text then
		playSound( API_LINK..API_KEY..TEXT_ENTRY.."'"..text.."'"..CODEC, false)
	end
end
addEvent( "GTIassistant.querySound", true)
addEventHandler( "GTIassistant.querySound", resourceRoot, queryAssistantSound)
--]]

--local API_LINK = "http://tts-api.com/tts.mp3?q="
--local HTML_SPACE = "+"

local askable_questions = {
	["location"] = "You are located at @LC",
	["name"] = "Your name is @NA",
	["cash"] = "You have @$",
}

speeds = {
	["Gtranslate"] = 1.05,
	["Male-TTS1"] = 1.2,
}

voices = {
	["Gtranslate"] = "http://translate.google.com/translate_tts?tl=en&q=",
	["Male-TTS1"] = "http://tts-api.com/tts.mp3?q=",
	["Notification"] = ":GTIdroid/audio/Tejat.ogg",
}

local API_LINK = "http://translate.google.com/translate_tts?tl=en&q="
local HTML_SPACE = "%20"
local HTML_QUOTE = "%27"

function queryAssistantSound( text, voice)
	if text then
		if voice then
			if voices[voice] then
				sound = playSound( voices[voice]..HTML_QUOTE..text..HTML_QUOTE, false)
				setSoundSpeed( sound, tonumber(speeds[voice]) or 1.3)
				setSoundEffectEnabled( sound, "flanger", true)
			else
				sound = playSound( API_LINK..HTML_QUOTE..text..HTML_QUOTE, false)
				setSoundSpeed( sound, tonumber(speeds[voice]) or 1.3)
				setSoundEffectEnabled( sound, "flanger", true)
			end
		else
			sound = playSound( API_LINK..HTML_QUOTE..text..HTML_QUOTE, false)
			setSoundEffectEnabled( sound, "flanger", true)
		end
	end
end
addEvent( "GTIassistant.querySound", true)
addEventHandler( "GTIassistant.querySound", resourceRoot, queryAssistantSound)

addCommandHandler( "assistme",
	function( cmd, ...)
		--local text = table.concat( {...}, " ")
		local text = table.concat( {...}, HTML_SPACE)
		--local text = string.gsub( text, " ", HTML_SPACE)
		if askable_questions[string.lower(text)] then
			local newtext = askable_questions[text]
			local x, y, z = getElementPosition( localPlayer)
			local newtext = string.gsub( newtext, "@LC", tostring(getZoneName( x, y, z, false)..", "..getZoneName( x, y, z, true)))
			local newtext = string.gsub( newtext, "@NA", tostring(getPlayerName(localPlayer)))
			local newtext = string.gsub( newtext, "@$", tostring("$"..getPlayerMoney( localPlayer)))
			--
			queryAssistantSound( newtext)
		else
			queryAssistantSound( "I'm sorry, but i'm still learning to answer questions.")
		end
	end
)
