function manageTolls( option, arg1, arg2)
	if option == "pay_fine" then
		takePlayerMoney( source, arg1)
		exports.GTIpoliceWanted:chargePlayer( source, arg2)
	elseif option == "pay_toll" then
		takePlayerMoney( source, arg1)
	end
end
addEvent( "GTItolls.manageTolls", true)
addEventHandler( "GTItolls.manageTolls", root, manageTolls)
