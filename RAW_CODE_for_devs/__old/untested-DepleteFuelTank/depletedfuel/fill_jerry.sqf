private["_hasFood","_item","_text","_qty","_obj","_fuelLeft"];

player removeAction s_player_fillfuel;        /////////////////////////////////////////////////
s_player_fillfuel = -1;

_qty = {_x == "ItemJerrycanEmpty"} count magazines player;



/////////////////////////////////////////////////////////////////////////////
_obj = cursorTarget;
_fuelLeft = _obj getVariable ["FuelLeft", 100]; // get variable for object, fueltank defaulted to 100
	if ("ItemJerrycanEmpty" in magazines player) then {
    	if (_fuelLeft > 100) then {  
			for "_x" from 1 to _qty do {
				player removeMagazine "ItemJerrycanEmpty";
				player addMagazine "ItemJerrycan";
                _fuelLeft = _fuelLeft -1;
			};
        };
	player playActionNow "Medic";
     _obj setVariable ["FuelLeft", _fuelLeft, true];
/////////////////////////////////////////////////////////	
    
    
    
	_dis=10;
	_sfx = "refuel";
	[player,_sfx,0,false,_dis] call dayz_zombieSpeak;  
	[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

	cutText [format[(localize  "str_player_09"),_qty], "PLAIN DOWN"];
} else {
	cutText [(localize "str_player_10") , "PLAIN DOWN"];
};
