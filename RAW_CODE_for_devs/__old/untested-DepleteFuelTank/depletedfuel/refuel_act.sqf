private ["_vehicle", "_vehicle_refuel_id"];//needs updating
_vehicle = objNull;
diag_log "Running ""kh_actions"".";
 
_distance = 15; // Distance from object to display Refuel Message
_amount= 0.005; // Amount of fuel to add per loop. Default was 0.005
 
while {true} do
{
    if (!isNull player) then {
        private ["_currentVehicle", "_isNearFeed", "_countFuel"];
                _currentVehicle = vehicle player;
                _countFuel = (count ((position _currentVehicle) nearObjects ["Land_Fuel_tank_big", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_A_FuelStation_Feed", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall2", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall2_EP1", _distance]));
                _countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_fuel_tank_stairs", _distance]));
                _isNearFeed = _countFuel > 0;
 
        if (_vehicle != _currentVehicle) then {
            if (!isNull _vehicle) then {
                _vehicle removeAction _vehicle_refuel_id;
                _vehicle = objNull;
            };
 
            if (_currentVehicle != player && _isNearFeed && !(_currentVehicle isKindof "Bicycle")) then {
            //mmmyum
            	_obj = _countFuel select 0;
              _fuelLeft = _obj getVariable ["FuelLeft", 100]; // get variable for object, fueltank defaulted to 100
                if (_fuelLeft > 100) then {            
                	_vehicle = _currentVehicle;
               	 	_vehicle_refuel_id = _vehicle addAction ["Refuel", "Scripts\kh_vehicle_refuel.sqf", [
                    _amount,_fuelLeft,_obj], -1, false, true, "", "vehicle _this == _target && local _target"];
            	} else {
            		_vehicle removeAction _vehicle_refuel_id;            
                };
            };
            //end yum changes
        };
   
        if (!_isNearFeed) then {
            _vehicle removeAction _vehicle_refuel_id;
            _vehicle = objNull;
        };
    };
    sleep 2;
}
