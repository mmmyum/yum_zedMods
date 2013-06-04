//PLAYER RADIO WARNING 0.11a mmmyum - attempt 2
/*
 //First we add a line to server_airraid.sqf to tell the clients what city tha airraid will hit next
/////ADD ONLY THIS LINE:
 
AirraidPlayerMsg = _city; publicVariable "AirraidPlayerMsg";
 
EVERYTHING ELSE GOES INTO A NEW SCRIPT (Below stuff)
 -----try for crash sites NewCrashSiteYum = _pos; publicVariable "NewCrashSiteYum";
*/    
 
    //Radio -- loop every two mins, perform checks
                                //note that this will check for a new message every few mins
private ["_playerRadio","_city","_lastCity"];
_lastCity = "null";
_runTimeMsg = time + 2640;
sleep 40;
while {true} do {
	_city = AirraidPlayerMsg;
	_playerRadio = "ItemRadio" in items player;
	if (_playerRadio) then {
		if (_city != _lastCity) then {
			playSound "radionoise1";
			sleep 1;
			cuttext [format["RADIO:     ch-SOUND THE ALA--...... BOMBER STRI--...... OH GOD RUN"], "PLAIN DOWN"];
			sleep 1;
			playSound "radionoise1";
			sleep 9;
			cuttext [format["RADIO:     WARNING! AIRRAID in " + _city], "PLAIN DOWN"];
			sleep 10;
			cuttext [format["RADIO:     BOMBER INBOUND, EVACUATE!"], "PLAIN DOWN"];
			sleep 1;
			playSound "radionoise1";
			_lastCity = _city;
		};
		if ((time - _runTimeMsg) > 3000) then {
			playSound "radionoise1";
			cuttext [format["RADIO:     AUTOMATED MESSAGE: Begin transmission..."], "PLAIN DOWN"];
			cuttext [format["RADIO:     chh---My group has set up camp in the midwest mountains near Sosnovka  --chh...."], "PLAIN DOWN"];
			sleep 10;
			cuttext [format["RADIO:     We are taking in survivors --especially unarmed women and children"], "PLAIN DOWN"];
			sleep 10;
			cuttext [format["RADIO:     Please bring us your resources, and possibly your --CHH..."], "PLAIN DOWN"];
			playSound "radionoise1";
			sleep 10;
			cuttext [format["RADIO:     Watch the skies, darlings...We are everywhere"], "PLAIN DOWN"];
			sleep 10;
			cuttext [format["RADIO:     But don't worry, we're friendly, we swear..yes...And long live Sosnovka!"], "PLAIN DOWN"];
			sleep 10;
			cuttext [format["RADIO:     AUTOMATED MESSAGE: End transmission..."], "PLAIN DOWN"];
			playSound "radionoise1";
			_runTimeMsg = time;
		};
	};
	sleep 210; //break between rechecks
};