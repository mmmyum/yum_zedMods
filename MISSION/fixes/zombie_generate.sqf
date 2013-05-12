private ["_position","_unitTypes","_isNoone","_loot","_array","_agent","_type","_radius","_method","_myDest","_newDest","_id"];
_position =    _this select 0;
_unitTypes =    _this select 1;
_isNoone =    {isPlayer _x} count (_position nearEntities ["AllVehicles",25]) == 0;
_loot =    "";
_array =    [];
_agent =    objNull;

if (dayz_maxCurrentZeds > dayz_maxZeds) exitwith {};
if (dayz_CurrentZombies > dayz_maxGlobalZombies) exitwith {}; 
if (dayz_spawnZombies > dayz_maxLocalZombies) exitwith {}; 

//Exit if a player is nearby
if (!_isNoone) exitWith {};
if (count _unitTypes == 0) then {
    _unitTypes =    []+ getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
};
_type = _unitTypes call BIS_fnc_selectRandom;
 
//Create the Group and populate it
_radius = 50;
_method = "CAN_COLLIDE";
_radius = 50;
_method = "NONE";
_agent = createAgent [_type, _position, [], _radius, _method];
_agent setPosATL _position;
//_agent setVariable ["origPosYum",_position];
dayz_spawnZombies = dayz_spawnZombies + 1;
_position = getPosATL _agent;
if (random 1 > 0.7) then {
    _agent setUnitPos "Middle";
};       
_agent setDir round(random 180); //I ADDED THIS
_agent setPos _position;   
_myDest = getPosATL _agent;
_newDest = getPosATL _agent;
_agent setVariable ["myDest",_myDest];
_agent setVariable ["newDest",_newDest];
 
//Add some loot
//_rnd = random 1;
//if (_rnd > 0.3) then {
//    _lootType = configFile >> "CfgVehicles" >> _type >> "zombieLoot";
//    if (isText _lootType) then {
//        _array = []+ getArray (configFile >> "cfgLoot" >> getText(_lootType));
//        if (count _array > 0) then {
//            _loot = _array call BIS_fnc_selectRandomWeighted;
//            if(!isNil "_array") then {
//                _agent addMagazine _loot;
//            };
//        };
//    };
//};
 
//Start behavior
//_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_agent.fsm"; //original
_id = [_position,_agent] execFSM "fixes\zombie_agent.fsm"; //new zombie agent