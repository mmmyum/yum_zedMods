private["_agent","_inAngle","_buildingTypes","_fires","_buildings","_target","_humanTypes","_carTypes","_foundhuman","_thrownTypes","_objects","_canSee","_tempTarget","_zombies","_vehicles","_targets","_humans","_targetDistance"];

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
		//if (vehicle _target == _target) then {
		//	[_target,_agent] spawn player_knockedDown;
		//};
		_foundhuman = true;
	};
	
	if (!_foundhuman) then{
	//running vehicles check
		_vehicles = nearestObjects [_agent,_carTypes,50];
		//_vehicles = (position _agent) nearEntities [_carTypes,50];
		if (count _vehicles > 0) then {
			{
				if ((!(_x isKindOf "Bicycle")) and (isEngineOn _x) and (!(_x in _targets))) exitWith {
					_tempTarget = _x;
					_targets set [count _targets,_x];
				};
			} forEach _vehicles;
		
			if (isNull _tempTarget) then {
	//fire check
				_fires = nearestObjects [_agent,["Land_Fire_barrel","Land_Fire"],50];
				//_fires = (position _agent) nearEntities [["Land_Fire_barrel","Land_Fire"],50];
				if (count _fires > 0) then {
					{
						if ((!(_x in _targets))) exitWith {
							_tempTarget = _x;
							_targets set [count _targets,_x];
						};
					} forEach _fires;
				};
				
				if (isNull _tempTarget) then {
//objects check
					_objects = nearestObjects [_agent,_thrownTypes,30];
					//_objects = (position _agent) nearEntities [_thrownTypes,30];
					if (count _objects > 0) then {
						{
							if (!(_x in _targets)) exitWith {
								_targets set [count _targets,_x];
							};
						} forEach _objects
					};
					
					if (isNull _tempTarget) then {
//zombie bodies check
						_zombies = nearestObjects [_agent,["zZombie_Base"],30];
						//_zombies = (position _agent) nearEntities [["zZombie_Base"],30];
						if (count _zombies > 0) then {
							{
								if (!(alive _x)) exitWith {
									_tempTarget = _x;
									_targets set [count _targets,_x];
								};
							} forEach _zombies;
						};
					};
				};
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
	};
};
_target