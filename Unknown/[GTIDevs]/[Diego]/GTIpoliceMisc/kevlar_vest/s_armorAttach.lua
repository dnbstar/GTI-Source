local policeSkins = {[71]=true, [280]=true, [281]=true, [284]=true, [265]=true, [266]=true}
local sheriffSkins = {[282]=true, [283]=true, [288]=true}
local polarmors = {}
local sheriffarmors = {}
 
function attachDetachArmor(player)
        if getPedArmor(player) >= 80 then
                local id = getElementModel(player)
                if (policeSkins[id]) then
                        local policeKev = createObject(3890, 0, 0, 2000, 0, 0, 4)
                        setObjectScale(policeKev, 1.15)
                        exports.bone_attach:attachElementToBone(policeKev, player, 3, -0.005, 0.05, 0.05, 0, 269, 0)
                        polarmors[player] = policeKev
                elseif (sheriffSkins[id]) then
                        local sheriffKev = createObject(3891, 0, 0, 2000, 0, 0, 4)
                        setObjectScale(sheriffKev, 1.15)
                        exports.bone_attach:attachElementToBone(sheriffKev, player, 3, -0.005, 0.05, 0.05, 0, 269, 0)
                        sheriffarmors[player] = sheriffKev
                end
        end
end
addCommandHandler("armor", attachDetachArmor)
 
function check()
        if (getElementType(source) == "player") then
                if getPedArmor(source) == 0 then
                        local id = getElementModel(source)          
                        if (policeSkins[id]) then
                                if polarmors[source] ~= nil then
                                        exports.bone_attach:detachElementFromBone(polarmors[source], source)
                                        destroyElement(polarmors[source])
					polarmors[source] = nil
                                end
                        elseif (sheriffSkins[id]) then
                                if sheriffarmors[source] ~= nil then
                                        exports.bone_attach:detachElementFromBone(sheriffarmors[source], source)
                                        destroyElement(sheriffarmors[source])
					sheriffarmors[source] = nil
                                end
                        end
                end
        end
end
addEventHandler("onPlayerDamage", root, check)
 
function quit()
        if polarmors[source] ~= nil then
                                        destroyElement(polarmors[source])
					polarmors[source] = nil
        elseif sheriffarmors[source] ~= nil then
                                        destroyElement(sheriffarmors[source])
					sheriffarmors[source] = nil
        end
end
addEventHandler("onPlayerQuit", root, quit)
 
function elementModelChange(oM, nM)
        if getElementType(source) == "player" then
        if polarmors[source] ~= nil then
                                                        destroyElement(polarmors[source])
							polarmors[source] = nil
        elseif sheriffarmors[source] ~= nil then
                                                        destroyElement(sheriffarmors[source])
							sheriffarmors[source] = nil
                end
        end
end
addEventHandler("onElementModelChange", root, elementModelChange)

function wasted()
        if polarmors[source] ~= nil then
                    destroyElement(polarmors[source])
					polarmors[source] = nil
        elseif sheriffarmors[source] ~= nil then
                    destroyElement(sheriffarmors[source])
					sheriffarmors[source] = nil
        end
end
addEventHandler("onPlayerWasted", root, wasted)

function jobQuit ()
	        if polarmors[source] ~= nil then
                    destroyElement(polarmors[source])
					polarmors[source] = nil
        elseif sheriffarmors[source] ~= nil then
                    destroyElement(sheriffarmors[source])
					sheriffarmors[source] = nil
        end
end
addEvent("onPlayerJobQuit", true)
addEventHandler("onPlayerJobQuit", root, jobQuit)