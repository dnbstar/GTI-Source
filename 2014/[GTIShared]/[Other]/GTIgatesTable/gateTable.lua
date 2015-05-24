----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 11 March 2014
-- Resource: GTIgates/gateTables_s.lua
-- Type: Server Side
-- Author: LilDolla
----------------------------------------->>

--[[
gates = {
	{ pos={ x, y, z}, rot={x, y, z}, model=980, world={ int, dim}, size=2, res={ team={""}, job={""}}, move={x, y, z}, animation={enter, leave}, settings={ vehicle=boolean}},
}
--]]

gates = {
	{ pos={ 1171.699, -1324.800, 14.399}, rot={ 0, 0, 90}, model=1569, world={ 0, 0}, size=4, move={ 1171.699, -1326.099, 14.399}, animation={ "OutQuad", "InQuad"}, settings={ vehicle="t"}}, --ASGH Front Door 1
	{ pos={ 1171.699, -1321.799, 14.399}, rot={ 0, 0, 270}, model=1569, world={ 0, 0}, size=4, move={ 1171.699, -1320.5, 14.399}, animation={ "OutQuad", "InQuad"}, settings={ vehicle="t"}}, --ASGH Front Door 2
	--
	{ pos={ 1124.400, -1335.5, 15}, rot={ 0, 0, 90.241}, model=3037, world={ 0, 0}, size=8, move={ 1124.400, -1335.5, 10.600}, animation={ "OutQuad", "InQuad"}, settings={ vehicle="t"}}, --ASGH Garage Door 1
	{ pos={ 1110.599, -1335.5, 15}, rot={ 0, 0, 90.241}, model=3037, world={ 0, 0}, size=8, move={ 1110.599, -1335.5, 10.600}, animation={ "OutQuad", "InQuad"}, settings={ vehicle="t"}}, --ASGH Garage Door 2
	{ pos={ 1097.799, -1335.5, 15}, rot={ 0, 0, 90.241}, model=3037, world={ 0, 0}, size=8, move={ 1097.799, -1335.5, 10.600}, animation={ "OutQuad", "InQuad"}, settings={ vehicle="t"}}, --ASGH Garage Door 3
}

--Export
function getGatesTable()
	return gates
end
