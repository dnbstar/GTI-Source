col = engineLoadCOL('kevlar_vest/armor.col')
dff = engineLoadDFF('kevlar_vest/swat.dff')
txd = engineLoadTXD('kevlar_vest/swat.txd')
txd1 = engineLoadTXD('kevlar_vest/swat2.txd')
	
engineImportTXD(txd, 3890)
engineReplaceCOL(col, 3890)
engineReplaceModel(dff, 3890)
engineImportTXD(txd1, 3891)
engineReplaceCOL(col, 3891)
engineReplaceModel(dff, 3891)