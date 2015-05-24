----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 06/04/2015
-- Resource: GTIlanguageTable/languages.lua
-- Type: Server Side
-- Author: Jack Johnson (Jack)
----------------------------------------->>

local languages = {}

--Credits to Callum Dawson for the idea.
languages["server"] = {
	PLAYER_LOGGEDIN = {
		en_US = "* %s has logged in.",
		fr = "* %s a connecté."
	},
	PLAYER_QUIT = {
		en_US = "* %s has left the game [%s]",
		fr = "* a quitté la partie [%s]"
	},
	PLAYER_NICK_CHANGE = {
		en_US = "* %s is now known as %s",
		fr = "* %s est maintenant connu comme %s"
	},
	PLAYER_FIRST_JOIN = {
		en_US = "* %s has joined for the first time. Say hello, guys!",
		fr = "* %s a rejoint pour la première fois. Dites bonjour, les gars!"
	}
}

languages["client"] = {
	--Login window
	ACCOUNTS_LOGIN_PLAY = {
		en_US = "PLAY!",
		fr = "JOUER!"
	},
	ACCOUNTS_LOGIN_REGISTER = {
		en_US = "Register",
		fr = "Se enregistrer"
	},
	ACCOUNTS_LOGIN_LEAVE = {
		en_US = "Leave",
		fr = "Laisser"
	},
	ACCOUNTS_LOGIN_RECOVER = {
		en_US = "Recover",
		fr = "Récupérer"
	},
	
	--Register window
	ACCOUNTS_REGISTER_TITLE = {
		en_US = "GTI Account Registration"
	},
	ACCOUNTS_REGISTER_USERNAME = {
		en_US = "Account Username:"
	},
	ACCOUNTS_REGISTER_EMAIL = {
		en_US = "E-mail Address (Optional):"
	},
	ACCOUNTS_REGISTER_PASSWORD = {
		en_US = "Enter a Password"
	},
	ACCOUNTS_REGISTER_REPEAT = {
		en_US = "Repeat Password"
	},
	ACCOUNTS_REGISTER_TEXT = {
		en_US = "Your account Username is the username that you will login with. It cannot be changed. Your e-mail address will be used to recover your password in the event that you forget it. It is completely optional, but password recovery will be a lot more difficult without it. Your password can be changed in the future."
	},
	ACCOUNTS_REGISTER_REGISTER = {
		en_US = "Register"
	},
	ACCOUNTS_REGISTER_CLOSE = {
		en_US = "Close"
	},
	
	--Recovery window
	ACCOUNTS_RECOVERY_TITLE = {
		en_US = "GTI Account Recovery"
	},
	ACCOUNTS_RECOVERY_USERNAME = {
		en_US = "Enter Username:"
	},
	ACCOUNTS_RECOVERY_EMAIL = {
		en_US = "Enter Email Address:"
	},
	ACCOUNTS_RECOVERY_RECOVER = {
		en_US = "Recover"
	},
	ACCOUNTS_RECOVERY_CANCEL = {
		en_US = "Cancel"
	}
}

function getLanguages()
	return languages or {}
end