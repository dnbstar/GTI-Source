local screenW, screenH = guiGetScreenSize()

GTIbManager = {
    tab = {},
    scrollpane = {},
    tabpanel = {},
    label = {},
	slabel = {},
	s1label = {},
	sbutton = {},
    button = {},
    window = {},
    gridlist = {},
    memo = {}
}

local tabs = {
	{ "General"},
	{ "Management"},
}

GTIbManager.window[1] = guiCreateWindow((screenW - 690) / 2, (screenH - 479) / 2, 690, 479, "GTIbuilder - Zone Manager", false)
guiWindowSetSizable(GTIbManager.window[1], false)
guiSetVisible( GTIbManager.window[1], false)

GTIbManager.tabpanel[1] = guiCreateTabPanel(10, 25, 670, 444, false, GTIbManager.window[1])
for i, tab in ipairs (tabs) do
	GTIbManager.tab[i] = guiCreateTab( tab[1], GTIbManager.tabpanel[1])
end
--[[
GTIbManager.tab[1] = guiCreateTab("General", GTIbManager.tabpanel[1])
GTIbManager.tab[2] = guiCreateTab("Management", GTIbManager.tabpanel[1])
--]]

GTIbManager.memo[1] = guiCreateMemo(10, 51, 650, 359, "", false, GTIbManager.tab[1])
guiMemoSetReadOnly(GTIbManager.memo[1], true)
GTIbManager.label[1] = guiCreateLabel(274, 31, 122, 20, "Zone Information", false, GTIbManager.tab[1])
guiSetFont(GTIbManager.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(GTIbManager.label[1], "center", false)
guiLabelSetVerticalAlign(GTIbManager.label[1], "center")
GTIbManager.label[2] = guiCreateLabel(10, 10, 72, 15, "Zone Name:", false, GTIbManager.tab[1])
guiSetFont(GTIbManager.label[2], "default-bold-small")
guiLabelSetVerticalAlign(GTIbManager.label[2], "center")
GTIbManager.label[3] = guiCreateLabel(10, 31, 72, 15, "Zone Cost:", false, GTIbManager.tab[1])
guiSetFont(GTIbManager.label[3], "default-bold-small")
guiLabelSetVerticalAlign(GTIbManager.label[3], "center")
GTIbManager.label[4] = guiCreateLabel(86, 31, 99, 15, "$XX", false, GTIbManager.tab[1])
guiLabelSetVerticalAlign(GTIbManager.label[4], "center")
GTIbManager.label[5] = guiCreateLabel(86, 10, 188, 15, "$XX", false, GTIbManager.tab[1])
guiLabelSetVerticalAlign(GTIbManager.label[5], "center")
GTIbManager.label[6] = guiCreateLabel(284, 10, 72, 15, "Zone Owner:", false, GTIbManager.tab[1])
guiSetFont(GTIbManager.label[6], "default-bold-small")
guiLabelSetVerticalAlign(GTIbManager.label[6], "center")
GTIbManager.label[7] = guiCreateLabel(361, 10, 107, 15, "XX", false, GTIbManager.tab[1])
guiLabelSetVerticalAlign(GTIbManager.label[7], "center")
GTIbManager.button[1] = guiCreateButton(537, 15, 123, 26, "Purchase Zone", false, GTIbManager.tab[1])

GTIbManager.gridlist[1] = guiCreateGridList(10, 6, 218, 134, false, GTIbManager.tab[2])
guiGridListAddColumn(GTIbManager.gridlist[1], "Accesslist", 0.9)
GTIbManager.button[2] = guiCreateButton(10, 150, 83, 29, "Add Player", false, GTIbManager.tab[2])
GTIbManager.button[3] = guiCreateButton(103, 150, 125, 29, "Remove Selected", false, GTIbManager.tab[2])
GTIbManager.gridlist[2] = guiCreateGridList(10, 189, 218, 159, false, GTIbManager.tab[2])
guiGridListAddColumn(GTIbManager.gridlist[2], "Roles", 0.9)
--GTIbManager.button[4] = guiCreateButton(10, 358, 125, 19, "Add Player To Role", false, GTIbManager.tab[2])
--GTIbManager.button[5] = guiCreateButton(10, 387, 125, 19, "Remove Sel. Player", false, GTIbManager.tab[2])
GTIbManager.button[4] = guiCreateButton(10, 358, 218, 19, "Add Player To Role", false, GTIbManager.tab[2])
GTIbManager.button[5] = guiCreateButton(10, 387, 218, 19, "Remove Sel. Player", false, GTIbManager.tab[2])
--GTIbManager.button[6] = guiCreateButton(145, 358, 83, 19, "Add Role", false, GTIbManager.tab[2])
--GTIbManager.button[7] = guiCreateButton(145, 387, 83, 19, "Remove Role", false, GTIbManager.tab[2])
GTIbManager.scrollpane[1] = guiCreateScrollPane(246, 6, 414, 400, false, GTIbManager.tab[2])

GTIbManager.button[6] = guiCreateButton(621, 20, 59, 27, "Close", false, GTIbManager.window[1])

local roles = {
	{ "Observers"},
	{ "Editors"},
	{ "Owner"},
}

local options = {
	{ "Zone Name", "Change the name of the zone to something other than the current."},
	{ "Manage Roles", "Modify what each role is named and can do or change within the zone."},
}

local offset = 67

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		-- Add Items To Roles Gridlist
		for i, role in ipairs (roles) do
			local name = role[1]
			local row = guiGridListAddRow( GTIbManager.gridlist[2])
			guiGridListSetItemText( GTIbManager.gridlist[2], row, 1, name, true, false)
		end
		-- Add Options
		for i,v in ipairs( options) do
			-- Buttons

			-- 24+(72*(i-1))
			--GTIbManager.sbutton[i] = guiCreateButton(3, 3+(35*(i-1)), 125, 25, v[1], false, GTIbManager.scrollpane[1])
			GTIbManager.sbutton[i] = guiCreateButton(5, 24+(i*offset), 112, 27, "Edit Option", false, GTIbManager.scrollpane[1])
			guiSetProperty(GTIbManager.button[i], "NormalTextColour", "FFAAAAAA")
			-- Labels

			-- 4+(67*(i-1))
			GTIbManager.slabel[i] = guiCreateLabel(5, 4+(i*offset), 112, 15, v[1], false, GTIbManager.scrollpane[1])
			guiSetFont(GTIbManager.slabel[i], "default-bold-small")
			guiLabelSetHorizontalAlign(GTIbManager.slabel[i], "center", false)

			GTIbManager.s1label[i] = guiCreateLabel(127, 4+(i*offset), 282, 57, v[2], false, GTIbManager.scrollpane[1])
			guiLabelSetHorizontalAlign(GTIbManager.s1label[i], "left", true)

			guiCreateLabel(5, 48+(i*offset), 404, 15, "____________________________________________________________________________________", false, GTIbManager.scrollpane[1])
		end
		-- Set All Fonts
		for i, label in ipairs ( GTIbManager.label) do
			guiSetFont( label, "default")
		end
		for i, slabel in ipairs ( GTIbManager.slabel) do
			guiSetFont( slabel, "default-bold")
		end
		for i, button in ipairs ( GTIbManager.button) do
			guiSetFont( button, "clear-normal")
		end
		for i, sbutton in ipairs ( GTIbManager.sbutton) do
			guiSetFont( sbutton, "clear-normal")
		end
		for i, s1label in ipairs ( GTIbManager.s1label) do
			guiSetFont( s1label, "clear-normal")
		end

		--Set Data
		--setObjectCount( "zone1")
	end
)

addEventHandler("onClientRender", root,
    function()
		for i, tabpanel in ipairs ( getElementsByType( "gui-tabpanel")) do
			local tab = guiGetSelectedTab( tabpanel)
			if tab == GTIbManager.tab[2] then
				local x, y = guiGetPosition( GTIbManager.window[1], false)
				dxDrawLine(x+248, y+56, x+248, y+460, tocolor(255, 255, 255, 255), 1, true)
			end
		end
    end
)
