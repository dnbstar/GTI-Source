local screenW, screenH = guiGetScreenSize()

GTIresMisc = {
	radiobutton = {},
	button = {},
	window = {},
	edit = {},
	label = {}
}

GTIresMisc.window[1] = guiCreateWindow((screenW - 324) / 2, (screenH - 159) / 2, 324, 159, "GTI", false)
guiWindowSetSizable(GTIresMisc.window[1], false)
guiWindowSetMovable(GTIresMisc.window[1], false)
guiSetVisible( GTIresMisc.window[1], false)
GTIresMisc.label[1] = guiCreateLabel(10, 26, 304, 15, "", false, GTIresMisc.window[1])
guiLabelSetHorizontalAlign(GTIresMisc.label[1], "center", false)
guiLabelSetVerticalAlign(GTIresMisc.label[1], "center")
GTIresMisc.edit[1] = guiCreateEdit(121, 53, 193, 24, "", false, GTIresMisc.window[1])
GTIresMisc.radiobutton[1] = guiCreateRadioButton(9, 51, 112, 15, "user.", false, GTIresMisc.window[1])
guiSetVisible( GTIresMisc.radiobutton[1], false)
GTIresMisc.radiobutton[2] = guiCreateRadioButton(9, 66, 112, 15, "resource.", false, GTIresMisc.window[1])
guiSetVisible( GTIresMisc.radiobutton[2], false)
GTIresMisc.button[1] = guiCreateButton(20, 122, 128, 26, "Cancel", false, GTIresMisc.window[1])
GTIresMisc.button[2] = guiCreateButton(176, 122, 128, 26, "Add Object", false, GTIresMisc.window[1])
