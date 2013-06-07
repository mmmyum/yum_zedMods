private ["_unit","_source","_chance","_inAngle","_dir","_neckPos","_isProne"];

_unit = _this select 0;
_source = _this select 1;
_chance = random 1;

_neckPos = _unit selectionPosition "Neck" select 2;
_isProne = (_neckPos < 0.5);

if (time - player_lastKnockedDown > 10.0) then {
	if (!player_isKnockedDown and !r_player_unconscious and !_isProne) then {
		_inAngle = [getPosASL _source,direction _source,80,getPosASL _unit] call fnc_inAngleSector;
		if (_inAngle) then {
			player_lastKnockedDown = time;
			if (_chance < 0.6) then {
				player_isKnockedDown = true;
				sleep 0.1;
				
				_dir = [_source,_unit] call BIS_Fnc_dirTo;
				_source setDir _dir;
				_source playMove "ZombieStandingAttack1";
				sleep 0.3;
				
				cutText ["Knockdown hit", "PLAIN DOWN"];
				[_unit,"hit",3,true] call dayz_zombieSpeak;
				player switchMove "AmovPpneMstpSnonWnonDnon_healed";
				sleep 0.1;
				
				[_unit,"scream",4,false] call dayz_zombieSpeak;
				sleep 2;
				
				player_isKnockedDown = false;
			};
		};
	};
};