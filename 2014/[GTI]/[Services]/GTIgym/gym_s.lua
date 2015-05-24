playerData = {
	walk = {},
	fight = {},
}

addEvent( "GTIgym.queryStyle", true)
addEventHandler( "GTIgym.queryStyle", root,
	function( styleType, theElement, theName, theID)
		if styleType == "walk" then
			triggerClientEvent( source, "GTIgym.returnQuery", source, "disabled", theElement, styleType, theName, theID)
		elseif styleType == "fight" then
			local option = getPedFightingStyle(source)
			triggerClientEvent( source, "GTIgym.returnQuery", source, option, theElement, styleType, theName, theID)
		end
	end
)

addEvent( "GTIgym.buyStyle", true)
addEventHandler( "GTIgym.buyStyle", root,
	function( styleType, styleName, styleID, styleCost)
		local cA = getPlayerAccount( source)
		--
		local cWS, cFS = playerData.walk[cA], playerData.fight[cA]
		--
		if styleType == "walk" then
			if styleID ~= cWS then
				outputChatBox( "You bought the "..styleName.." Walking Style for $"..styleCost..".", source, 51, 255, 51)
				setPedWalkingStyle( source, styleID)
				playerData.walk[cA] = styleID
			else
				outputChatBox( "You already have the "..styleName.." Walking Style.", source, 255, 51, 51)
			end
		elseif styleType == "fight" then
			if styleID ~= cFS then
				outputChatBox( "You bought the "..styleName.." Fighting Style for $"..styleCost..".", source, 51, 255, 51)
				setPedFightingStyle( source, styleID)
				playerData.fight[cA] = styleID
			else
				outputChatBox( "You already have the "..styleName.." Fighting Style.", source, 255, 51, 51)
			end
		end
	end
)

addEventHandler( "onResourceStart", getResourceRootElement(getThisResource()),
	function()
		for i, v in ipairs ( getElementsByType( "player")) do
			local cA = getPlayerAccount( v)
			--
			--local movementData = getAccountData( cA, "GTIgym.data")
			local movementData = exports.GTIaccounts:GAD( cA, "GTIgym.data")
			if movementData then
				local theData = split(movementData, string.byte( ";"))
				local walkStyle, fightStyle = theData[1], theData[2]
				if walkStyle then
					setPedWalkingStyle( v, walkStyle)
					playerData.walk[cA] = walkStyle
				else
					setPedWalkingStyle( v, 0)
					playerData.walk[cA] = 0
				end
				if fightStyle then
					setPedFightingStyle( v, fightStyle)
					playerData.fight[cA] = fightStyle
				else
					setPedFightingStyle( v, 0)
					playerData.fight[cA] = 0
				end
			else
				setPedWalkingStyle( v, 0)
				playerData.walk[cA] = 0
				--
				setPedFightingStyle( v, 0)
				playerData.fight[cA] = 0
			end
			--setAccountData( cA, "GTIgym.data", playerData.walk[cA]..";"..playerData.fight[cA])
			exports.GTIaccounts:SAD( cA, "GTIgym.data", playerData.walk[cA]..";"..playerData.fight[cA])
		end
	end
)

addEventHandler( "onResourceStop", getResourceRootElement(getThisResource()),
	function()
		for i, v in ipairs ( getElementsByType( "player")) do
			local account = getPlayerAccount( v)
			local wStyle, fStyle = playerData.walk[account], playerData.fight[account]
			--setAccountData( account, "GTIgym.data", wStyle..";"..fStyle)
			exports.GTIaccounts:SAD( account, "GTIgym.data", wStyle..";"..fStyle)
		end
	end
)

addEventHandler( "onPlayerLogin", root,
	function( pA, cA)
		--local movementData = getAccountData( cA, "GTIgym.data")
		local movementData = exports.GTIaccounts:GAD( cA, "GTIgym.data")
		if movementData then
			local theData = split(movementData, string.byte( ";"))
			local walkStyle, fightStyle = theData[1], theData[2]
			if walkStyle then
				setPedWalkingStyle( source, walkStyle)
				playerData.walk[cA] = walkStyle
			else
				setPedWalkingStyle( source, 0)
				playerData.walk[cA] = 0
			end
			if fightStyle then
				setPedFightingStyle( source, fightStyle)
				playerData.fight[cA] = fightStyle
			else
				setPedFightingStyle( source, 0)
				playerData.fight[cA] = 0
			end
		else
			setPedWalkingStyle( source, 0)
			playerData.walk[cA] = 0
			--
			setPedFightingStyle( source, 0)
			playerData.fight[cA] = 0
		end
		--setAccountData( cA, "GTIgym.data", playerData.walk[cA]..";"..playerData.fight[cA])
		exports.GTIaccounts:SAD( cA, "GTIgym.data", playerData.walk[cA]..";"..playerData.fight[cA])
	end
)

addEventHandler( "onPlayerQuit", root,
	function()
		local account = getPlayerAccount( source)
		local wStyle, fStyle = playerData.walk[account], playerData.fight[account]
		--setAccountData( account, "GTIgym.data", wStyle..";"..fStyle)
		exports.GTIaccounts:SAD( account, "GTIgym.data", wStyle..";"..fStyle)
	end
)
