//[unit, selectionName, damage, source, projectile]
//will only run when local to the created object
//record any key hits to the required selection
private["_zed","_selection","_damage","_hitter","_projectile","_headShots","_damageOrg"];

_zed = 			_this select 0;
_selection = 	_this select 1;
_damage = 		_this select 2;
_hitter = 		_this select 3;
_projectile = 	_this select 4;

//Makes zombies almost headshot-only to kill
private ["_unit","_damage","_ammo","_gethit","_damMults"];
// Stolen from Celery, modifications by Nullkigan

_ammo=_this select 4;                //Type of damage unit takes

_damMults=[0.001,0.5,0.002,0.003,0.4];    //Structural, Head, Body, Hands, Legs

//player sideChat format ["%1 isKindOf BulletCore = %2, dealt %3 damage",_ammo,(_ammo isKindOf "BulletCore"),_damage];//Debug; tells you what hit the player and how much base damage it did

//if (!(_ammo isKindOf "BulletCore")) then {_damMults=[1.0,1.0,1.0,1.0,1.0];};                                        // Only modify damage if from a bullet; grenades and stuff still hurt! NB: .50 at point blank just kills instead of doing damage. 
//Comment out the above IF statement for resistance to ALL damage types. NB: As well as instakills, some weapons do tens or more damage per hit, which even after scaling can still kill units outright.

if (isNil {_zed getVariable "gethit"}) then {_zed setVariable ["gethit",[0,0,0,0]]};                                 // Fresh unit starts at full health
_gethit=_zed getVariable "gethit"; // load health of each part of body

switch (_this select 1) do {                                                                                           // Depending on which part of body is damaged
    case "":{                                                                                                         // Overall structure damage
        _damage=damage _zed+_damage*(_damMults select 0)                                                            // Total damage to unit + percentage of incoming damage
    };
    
    case "head_hit":{                                                                                                // damage applied to head
        _damage=(_gethit select 0)+(_damage-(_gethit select 0))*(_damMults select 1);_gethit set [0,_damage]        // damage dealt to head so far + damage from current shot (minus existing damage) * factor; essentially, damage accumulates with the number of shots you take
    };
    
    case "body":{
        _damage=(_gethit select 1)+(_damage-(_gethit select 1))*(_damMults select 2);_gethit set [1,_damage]        //As previously
    };    
    
    case "hands":{                                                                                                      // cannot kill a unit on own, only affect aim
        _damage=(_gethit select 2)+(_damage-(_gethit select 2))*(_damMults select 3);_gethit set [2,_damage]
    };        
    
    case "legs":{                                                                                                      // cannot kill a unit on own, only affect movement
        _damage=(_gethit select 3)+(_damage-(_gethit select 3))*(_damMults select 4);_gethit set [3,_damage]
    }; 
};      

// Do not put a semicolon or comment after the next line otherwise the script will not output the correct result

if (local _zed) then {
	if (_damage > 1 and _projectile != "") then {
		//Record deliberate critical damages
		switch (_selection) do {
			case "head_hit": {
				if (!(_zed getVariable["hitRegistered",false])) then {
					_headShots = _hitter getVariable["headShots",0];
					_hitter setVariable["headShots",(_headShots + 1),true];
					_zed setVariable["hitRegistered",true];
				};
			};
		};
		if (_projectile isKindOf "Bolt") then {
			_damageOrg = _hitter getVariable["firedDamage",0]; //_unit getVariable["firedSelection",_selection];
			if (_damageOrg < _damage) then {
				_hitter setVariable["firedHit",[_zed,_selection],true];
				_hitter setVariable["firedDamage",_damage,true];
			};
		};
	};
};
_damage