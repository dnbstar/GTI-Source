--Ped Order
--Binco
--ProLaps
--Victim
--SubUrban
--Zip
--DS

Bdummy1 = createPed( 0, 218.370, -96.387, 1005.257, 90)
Bdummy2 = createPed( 0, 199.165, -127.193, 1003.515, 180)
Bdummy3 = createPed( 0, 200.089, -3.967, 1001.210, 270)
Bdummy4 = createPed( 0, 215.716, -38.319, 1002.023, 90)
Bdummy5 = createPed( 0, 182.639, -84.604, 1002.023, 90)
Bdummy6 = createPed( 0, 216.967, -152.636, 1000.523, 90)


function setBuySkin(id, costs)
	setElementModel( source, id)
	exports.CRPhelp:dm( source, "You have successfully bought skin id "..id.." for $"..costs, 255, 255, 0)
end
addEvent( "setSkinBuy", true)
addEventHandler( "setSkinBuy", getRootElement(), setBuySkin)

function setTSkin(id)
	setElementModel( Bdummy1, id)
	setElementModel( Bdummy2, id)
	setElementModel( Bdummy3, id)
	setElementModel( Bdummy4, id)
	setElementModel( Bdummy5, id)
	setElementModel( Bdummy6, id)
end
addEvent( "setSkin", true)
addEventHandler( "setSkin", getRootElement(), setTSkin)

function skinFailBuy()
	exports.CRPhelp:dm( source, "You don't have enough money to buy this skin", 255, 0, 0)
end
addEvent( "failBuy", true)
addEventHandler( "failBuy", getRootElement(), skinFailBuy)

function skinView1(id, target)
	local dimension = getElementDimension(source)
	setCameraMatrix( source, 216.778, -96.022, 1005.257, 218.370, -96.387, 1005.257, 0, 90)
	setCameraInterior( source, 15)
	setElementFrozen( Bdummy1, true)
	setElementDimension( Bdummy1, dimension)
	setElementInterior( Bdummy1, 15)
end
addEvent( "produceSkinViewer1", true)
addEventHandler( "produceSkinViewer1", getRootElement(), skinView1)

function skinView2(id, target)
	local dimension = getElementDimension(source)
	setCameraMatrix( source, 199.108, -130.033, 1003.515, 199.108, -130.033, 1003.515, 0, 90)
	setCameraInterior( source, 3)
	setElementFrozen( Bdummy2, true)
	setElementDimension( Bdummy2, dimension)
	setElementInterior( Bdummy2, 3)
end
addEvent( "produceSkinViewer2", true)
addEventHandler( "produceSkinViewer2", getRootElement(), skinView2)

function skinView3(id, target)
	local dimension = getElementDimension(source)
	setCameraMatrix( source, 203.435, -3.944, 1001.210, -219.435, -100.944, 1001.210, 0, 90)
	setCameraInterior( source, 5)
	setElementFrozen( Bdummy3, true)
	setElementDimension( Bdummy3, dimension)
	setElementInterior( Bdummy3, 5)
end
addEvent( "produceSkinViewer3", true)
addEventHandler( "produceSkinViewer3", getRootElement(), skinView3)

function skinView4(id, target)
	local dimension = getElementDimension(source)
	setCameraMatrix( source, 212.953, -38.044, 1002.023, 214.953, -38.044, 1002.023, 0, 90)
	setCameraInterior( source, 1)
	setElementFrozen( Bdummy4, true)
	setElementDimension( Bdummy4, dimension)
	setElementInterior( Bdummy4, 1)
end
addEvent( "produceSkinViewer4", true)
addEventHandler( "produceSkinViewer4", getRootElement(), skinView4)

function skinView5(id, target)
	local dimension = getElementDimension(source)
	setCameraMatrix( source, 179.438, -84.329, 1002.023, 181.438, -84.329, 1002.023, 0, 90)
	setCameraInterior( source, 18)
	setElementFrozen( Bdummy5, true)
	setElementDimension( Bdummy5, dimension)
	setElementInterior( Bdummy5, 18)
end
addEvent( "produceSkinViewer5", true)
addEventHandler( "produceSkinViewer5", getRootElement(), skinView5)

function skinView6(id, target)
	local dimension = getElementDimension(source)
	setCameraMatrix( source, 213.899, -153.008, 1000.523, 216.899, -153.008, 1000.523, 0, 90)
	setCameraInterior( source, 14)
	setElementFrozen( Bdummy6, true)
	setElementDimension( Bdummy6, dimension)
	setElementInterior( Bdummy6, 14)
end
addEvent( "produceSkinViewer6", true)
addEventHandler( "produceSkinViewer6", getRootElement(), skinView6)

function cameraSet()
	setCameraTarget( source)
end
addEvent( "resetCamera", true)
addEventHandler( "resetCamera", getRootElement(), cameraSet)
