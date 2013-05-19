private["_agent","_inAngle","_buildingTypes","_buildings","_target","_humanTypes","_carTypes","_foundhuman","_thrownTypes","_objects","_canSee","_tempTarget","_zombies","_vehicles","_targets","_humans","_targetDistance"];

_agent = _this;
_target = objNull;
_tempTarget = objNull;
_targets = [];
_targetDistance = 300;

_humanTypes = ["SoldierEB","SoldierWB","SoldierGB"];
_carTypes = ["Car","MotorCycle","Tank","Air","Ship"];
_thrownTypes = ["ThrownObjects","LitObject","SmokeShell"];
_buildingTypes = ["Land_garaze","Land_fuelstation_w","Land_A_GeneralStore_01a","Land_A_GeneralStore_01","Land_A_Hospital","MASH","USMC_WarfareBFieldhHospital","Land_Mil_ControlTower","Land_Mil_Barracks_i","UralWreck","Land_A_statue01","Land_Church_01","Land_Church_03","Land_Church_02","Land_Church_02a","Land_Church_05R","Land_Hangar_2"];
_foundhuman = false;
_humanThreatDist = 20;

_targets = _agent getVariable ["targets",[]];

if (count _targets > 0) then {
	{
		_tempTarget = _targets select 0;
		if ((_x isKindOf "SoldierEB") or (_x isKindOf "SoldierWB") or (_x isKindOf "SoldierGB")) then {
			if (_agent distance _x < 180) then {
				if ((_agent distance _tempTarget) > (_agent distance _x)) then {
					_foundhuman = true;
					_tempTarget = _x;
				};
			};
		};
	} forEach _targets;
	_target = _tempTarget;
};

if (!_foundhuman) then {
	//near humans check
	//_humans = nearestObjects [_agent,["SoldierEB","SoldierWB","SoldierGB"],5];
	_humans = (position _agent) nearEntities [_humanTypes,4];
	if (count _humans > 0) then {
		_tempTarget = _humans select 0;		
		{
			if ((_agent distance _tempTarget) > (_agent distance _x)) then {
				_tempTarget = _x;
			};
		} forEach _targets;
		_target = _tempTarget;
		//[_target,_agent] spawn player_knockedDown;
		_foundhuman = true;
	};
	
	if (!_foundhuman) then{
		//running vehicles check
		_vehicles = nearestObjects [_agent,_carTypes,50];
		if (count _vehicles > 0) then {
			_tempTarget = _vehicles select 0;
			{
				if ((!(_x isKindOf "Bicycle")) and (isEngineOn _x)) then {
					if ((_agent distance _tempTarget) > (_agent distance _x)) then {
						_tempTarget = _x;
					};
				};
			} forEach _vehicles;
			
			if (!(_tempTarget in _targets)) then {
				_targets set [count _targets,_tempTarget];
			};
		};
			
		//objects check
		_objects = nearestObjects [_agent,_thrownTypes,30];
		if (count _objects > 0) then {
			_tempTarget = _objects select 0;
			if (!(_tempTarget in _targets)) then {
				_targets set [count _targets,_tempTarget];
			};
		};
		
	//zombie bodies check
		_zombies = nearestObjects [_agent,["zZombie_Base"],30];
		if (count _zombies > 0) then {
			_tempTarget = _zombies select 0;
			{
				if (!(alive _x)) then {
					if ((_agent distance _tempTarget) > (_agent distance _x)) then {
						_tempTarget = _x;
					};
				};
			} forEach _zombies;
				
			if (!(_tempTarget in _targets)) then {
					_targets set [count _targets,_tempTarget];
			};
		};

		if (!isNull _tempTarget) then {
			if (!(_tempTarget in _targets)) then {
				_targets set [count _targets,_tempTarget];
			};
			
			if (count _targets > 0) then {
				_tempTarget = _targets select 0;
				{
					if ((_agent distance _tempTarget) > (_agent distance _x)) then {
						_tempTarget = _x;
					};
				} forEach _targets;
			};
			
			if ((_agent distance _tempTarget) < _targetDistance) then {
				_target = _tempTarget;
				_agent setVariable ["myDest",getPos _target,true];
				_agent setVariable ["targets",_targets,true];
			} else {
				_tempTarget = objNull;
			};
			
			_target = _tempTarget;
		};
	} else {
		_agent setVariable ["targets",[_target],true];
	};
} else {
	_agent setVariable ["targets",[_target],true];
};
_target