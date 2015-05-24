--<--------------------------------->--
-- Grand Theft International (GTI) ~
-- Author: NicKeLz ~
-- Resource: GTIod/script.lua ~
-- Description: Vehicle Door Controller ~
-- Data: #VehDoors
--<--------------------------------->--

addCommandHandler ( "od",
function ( player, _, door )
    if ( door ) then
        if ( isPedInVehicle ( player ) ) then
            if ( getVehicleController ( getPedOccupiedVehicle ( player ) ) == player ) then
                if ( string.match ( door, '^%d+$' ) ) then
                    if ( tonumber ( door ) < 6 ) then
                        if ( getVehicleDoorOpenRatio ( getPedOccupiedVehicle ( player ), tonumber ( door ) ) == 0 ) then
                            setVehicleDoorOpenRatio ( getPedOccupiedVehicle ( player ), tonumber ( door ), 1, 1000 )
                        else
                            setVehicleDoorOpenRatio ( getPedOccupiedVehicle ( player ), tonumber ( door ), 0, 1000 )
                        end
                    end
                else
                    if ( door == "*" ) then
                        for i = 0, 5 do
                            if ( getVehicleDoorOpenRatio ( getPedOccupiedVehicle ( player ), i ) == 0 ) then
                                setVehicleDoorOpenRatio ( getPedOccupiedVehicle ( player ), i, 1, 1000)
                            else
                                setVehicleDoorOpenRatio ( getPedOccupiedVehicle ( player ), i, 0, 1000)
                            end
                        end
                    end
                end
            else
                exports.GTIhud:dm("You can NOT use this command as a passenger!", player, 255, 0, 0)
            end
        else
            exports.GTIhud:dm("You must be in a vehicle to use this command!", player, 255, 0, 0)
        end
    else
        outputChatBox("Server: Wrong syntax, use /od [0-5|*]", player, 255, 0, 0)
     end
end
)