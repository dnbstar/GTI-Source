local lastTable = false

render = true

function changeShowcase( theTable, visibleName)
	if theTable == lastTable then return false end
	if theTable and type( theTable) == "table" then
		if visibleName and visibleName ~= "" then
			colName = visibleName
		end
		lastTable = theTable
		for i, item in pairs (vTable) do
			vTable[i] = nil
			--table.remove( vTable, i)
			data.text[i] = nil
			data.pos[i] = nil
			data.name[i] = nil
			data.visn[i] = nil
		end
		--[[
		data.text = {}
		data.pos = {}
		data.name = {}
		--]]
		for i, cdata in ipairs ( theTable) do
			if i ~= 1 then
				data.text[i] = "255;255;255"
			else
				data.text[i] = "0;0;0"
			end
			data.pos[i] = 239+((offs*i))
			if not cdata[3] then
				table.insert( vTable, { cdata[1], cdata[2]})
			else
				table.insert( vTable, { cdata[1], cdata[2], cdata[3]})
			end
			data.visn[i] = cdata[1]
			if cdata[2] and type( items[cdata[2]]) == "table" then
				data.name[i] = cdata[2]
			else
				data.name[i] = cdata[1]
			end
		end
		sname = data.name[selected]
		selpos = 269
		move = 0
		selected = 1
		selShow = 1
	end
end

valid_keys = {
	["w"] = true,
	["s"] = true,
	["space"] = true,
	["enter"] = true,
	["backspace"] = true,
	["mouse1"] = true,
	["mouse2"] = true,
	["mouse_wheel_up"] = true,
	["mouse_wheel_down"] = true,
}

addEventHandler( "onClientKey", root,
	function( key, press)
		if key and valid_keys[key] and press then
			--if getPlayerName( localPlayer) ~= "LilDolla" then return end
			if key == "mouse_wheel_up" or key == "w" then
				if selected == ((#vTable-#vTable)+1) then
					if not maxed then
						return
					end
				end
				--if not maxed then
				if selShow <= 10 then
					data.text[selected] = "255;255;255"
					selected = selected - 1
					selShow = selShow - 1
					selpos = data.pos[selected]
					data.text[selected] = "0;0;0"
					sname = data.name[selected]
				else
					move = move + 60
					data.text[moved_up] = "255;255;255"
					moved_up = moved_up - 1
					selShow = selShow - 1
					--data.text[moved_up] = "0;0;0"
					sname = data.name[selected]
					if selShow <= 9 then
						selected = selected - 1
					end
					if selShow - 1 == 9 then
						maxed = false
					end
				end
			elseif key == "mouse_wheel_down" or key == "s" then
				if selected ~= 10 then
					if not data.pos[selected+1] then return end
					data.text[selected] = "255;255;255"
					selected = selected + 1
					selShow = selShow + 1
					moved_up = moved_up + 1
					selpos = data.pos[selected]
					data.text[selected] = "0;0;0"
					sname = data.name[selected]
				else
					if selShow ~= #vTable then
						if show+moved_up ~= #vTable then
							return
						end
						--if not data.name[selShow+1] then return end
						move = move - 60
						moved_up = moved_up + 1
						data.text[selShow] = "255;255;255"
						selShow = selShow + 1
						data.text[selShow] = "0;0;0"
						sname = data.name[selShow]
					else
						if not maxed then
							maxed = true
						end
						return
					end
				end
			elseif key == "mouse1" or key == "enter" then
				if data.name[selShow] then
					local name = data.name[selShow]
					if items[name] then
						changeShowcase( items[name], data.visn[selShow] .. " Tattoos")
					end
				end
			elseif key == "mouse2" or key == "space" then
				changeShowcase( categories, "Categories")
				--[[
			elseif key == "backspace" then
				if render then
					render = false
				end
				--]]
			end
		end
	end
)
