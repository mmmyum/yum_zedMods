private ["_target", "_caller", "_id","_fuelLeft","_obj"]; //this script is executed on player action//_target = current vehicle, _caller  = player?, id = ?
 
_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_args = _this select 3;
_amount = _args select 0;

//yum add
_fuelLeft= _args select 1;
_obj = _args select 2;

 
if (isNil "ib_refueling_in_progress") then { ib_refueling_in_progress = false; };
 
if (!ib_refueling_in_progress) then {
 
        ib_refueling_in_progress = true;
 
        titleText ["Refueling", "PLAIN DOWN", 3];
 
        while {(vehicle _caller == _target) and (local _target)} do {
                private ["_velocity", "_cfcust"];
   
                _velocity = velocity _target;
                _cfcust = fuel _target;
 
                if ((_velocity select 0 > 1) or (_velocity select 1 > 1) or (_velocity select 2 > 1)) exitWith {
                        titleText ["Refueling Stopped", "PLAIN DOWN", 3];
                };
                if (_cfcust >= 1.0) exitWith {
                        titleText ["Done Refueling", "PLAIN DOWN", 3];
                };
 
                sleep 0.5;
 
                _cfcust = _cfcust + _amount;
                
                //yum add
                _fuelLeft = _fuelLeft - 1;
                if (_fuelLeft < 2) exitWith {  titleText ["Refueling Stopped: Out of Fuel", "PLAIN DOWN", 3]; };
 
 
                if (_cfcust >= 1.0) then { _cfcust = 1.0; };
 
                _target setFuel _cfcust;
        };
 
        titleFadeOut 1;
 		
        //yum add
        _obj setVariable ["FuelLeft", _fuelLeft, true];
        
        ib_refueling_in_progress = false;
};