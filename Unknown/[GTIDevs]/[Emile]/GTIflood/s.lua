local level = 0

function up()
	if level > 1000 then return end
	level = level + 0.5
	setWaterLevel(level)
end


function down()
	if level < 0 then return end
	level = level - 0.5
	setWaterLevel(level)
end

function cmd(player,cmd,name)
--    if name and exports.GTIutil:isPlayerInACLGroup( player, "Admin1", "Admin2", "Admin3", "Admin4", "Admin5") then
	if cmd == "waterup" then
		if isTimer(downt) then killTimer(downt) end
		if isTimer(upt) then return end
		floodWater = createWater(-2998,-2998,0,2998,-2998,0,-2998,2998,0,2998,2998,0)
		upt = setTimer(up,1500,0)
		outputChatBox("(SA NEWS): A flood has been reported!",root,255,0,0)
	elseif cmd == "waterdown" then
		if isTimer(upt) then killTimer(upt) end
		if isTimer(downt) then return end
		downt = setTimer(down,1000,0)
	end
end
addCommandHandler("waterdown",cmd)
addCommandHandler("waterup",cmd)