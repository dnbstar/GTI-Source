
function setHealth(plr, amount)
    setPedStat(plr, 24, amount)
end
addEvent("GTIdrugs.sethealth", true)
addEventHandler("GTIdrugs.sethealth", root, setHealth)

function sethealthBack(plr, amount)
    setPedStat(plr, 24, amount)
end
addEvent("GTIdrugs.sethealthBack", true)
addEventHandler("GTIdrugs.sethealthBack", root, sethealthBack)

function Ecstasy(plr, enabled)
	if enabled then
		addEventHandler("onPlayerDamage",plr,lessDamage)
	else
		removeEventHandler("onPlayerDamage",plr,lessDamage)
	end
end
addEvent("GTIdrugs.Ecstasy", true)
addEventHandler("GTIdrugs.Ecstasy", root, Ecstasy)

function lessDamage( attacker, weapon, bodypart, loss )
	if loss then
		cancelEvent()
		local health = getElementHealth(source)-(loss*0.7)
		setElementHealth(source,health)
	end
end