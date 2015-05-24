local screenW, screenH = guiGetScreenSize()

GTIpathfinder = {
    button = {},
    window = {},
    label = {},
    memo = {},
}

GTIpathfinder.window[1] = guiCreateWindow((screenW - 401) / 2, (screenH - 296) / 2, 401, 296, "GTI Pathmaker Tool - Made by LilDolla", false)
guiWindowSetMovable(GTIpathfinder.window[1], false)
guiWindowSetSizable(GTIpathfinder.window[1], false)
guiSetVisible( GTIpathfinder.window[1], false)

GTIpathfinder.memo[1] = guiCreateMemo(10, 54, 381, 193, "", false, GTIpathfinder.window[1])
guiMemoSetReadOnly(GTIpathfinder.memo[1], true)
GTIpathfinder.label[1] = guiCreateLabel(10, 29, 381, 15, "Path Table Data (Coordinates { x1, y1, z1, x2, y2, z2})", false, GTIpathfinder.window[1])
GTIpathfinder.button[1] = guiCreateButton(10, 257, 111, 28, "Copy to Clipboard", false, GTIpathfinder.window[1])
GTIpathfinder.button[2] = guiCreateButton(145, 257, 111, 28, "Dump Path Data", false, GTIpathfinder.window[1])
GTIpathfinder.button[3] = guiCreateButton(280, 257, 111, 28, "Close", false, GTIpathfinder.window[1])

function showPathWindow( status)
	if status then
		guiSetVisible( GTIpathfinder.window[1], true)
		showCursor( true)
	else
		guiSetVisible( GTIpathfinder.window[1], false)
		showCursor( false)
	end
end

function getPathData()
	guiSetText( GTIpathfinder.memo[1], "paths = {\n")
	for i, path in ipairs ( paths) do
		local x1, y1, z1 = path[1], path[2], path[3]
		local x2, y2, z2 = path[4], path[5], path[6]
		local color = "'255,255,255'"
		local theFormat = "	{ "..x1..", "..y1..", "..z1..", "..x2..", "..y2..", "..z2..", "..color.."},"

		guiSetText( GTIpathfinder.memo[1], guiGetText( GTIpathfinder.memo[1])..theFormat)
	end
	guiSetText( GTIpathfinder.memo[1], guiGetText( GTIpathfinder.memo[1]).."},")
end

function dumpPaths()
	lastpaths = paths
	paths = {}
	getPathData()
end

addCommandHandler( "pathfinder",
	function()
		if not guiGetVisible( GTIpathfinder.window[1]) then
			showPathWindow( true)
			getPathData()
		else
			showPathWindow( false)
		end
	end
)

addEventHandler( "onClientGUIClick", root,
	function()
		if source == GTIpathfinder.button[1] then
			local ttable = guiGetText( GTIpathfinder.memo[1])
			setClipboard( ttable)
		elseif source == GTIpathfinder.button[2] then
			dumpPaths()
		elseif source == GTIpathfinder.button[3] then
			showPathWindow( false)
		end
	end
)
