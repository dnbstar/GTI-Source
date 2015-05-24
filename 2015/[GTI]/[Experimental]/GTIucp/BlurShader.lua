local sW, sH = guiGetScreenSize()

local blurStrength = 6

local myScreenSource = dxCreateScreenSource(sW, sH)

addEventHandler("onClientResourceStart", resourceRoot,
function()
    if not getVersion ().sortable < "1.3.1" then
		blurShader, blurTec = dxCreateShader("blur.fx")
	end
end)

addEventHandler("onClientPreRender", root,
function()
    if (blurShader) then
        dxUpdateScreenSource(myScreenSource)

        dxSetShaderValue(blurShader, "ScreenSource", myScreenSource)
        dxSetShaderValue(blurShader, "BlurStrength", blurStrength)
		dxSetShaderValue(blurShader, "UVSize", sW, sH)

        dxDrawImage(0, 0, sW, sH, blurShader)
    end
end)

addEventHandler("onClientResourceStop", resourceRoot,
function()
	if (blurShader) then
		destroyElement(blurShader)
		blurShader = nil
	end
end)
