//[...yum begin partial file...]

//Load in compiled functions
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
call compile preprocessFileLineNumbers "fixes\variables.sqf";  //YUM
//variables = compile preprocessFileLineNumbers "fixes\variables.sqf"; //YUM
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
//my changes /////////////////////////////////custom overrides
call compile preprocessFileLineNumbers "fixes\compiles.sqf"; //Compile regular functions
zombie_findTargetAgent = compile preprocessFileLineNumbers "fixes\zombie_findTargetAgent.sqf";
zombie_generate = compile preprocessFileLineNumbers "fixes\zombie_generate.sqf";
building_spawnZombies = compile preprocessFileLineNumbers "fixes\building_spawnZombies.sqf";
control_zombieAgent = compile preprocessFileLineNumbers "fixes\control_zombieAgent.sqf";
player_spawnCheck = compile preprocessFileLineNumbers "fixes\player_spawnCheck.sqf";
player_zombieCheck = compile preprocessFileLineNumbers "fixes\player_zombieCheck.sqf";
player_zombieAttack = compile preprocessFileLineNumbers "fixes\player_zombieAttack.sqf";
zombie_findOwner = compile preprocessFileLineNumbers "fixes\zombie_findOwner.sqf";
stream_locationCheck = {};
//yum uncomment for yum_skins//player_wearClothes = compile preprocessFileLineNumbers "fixes\player_wearClothes.sqf";
//end
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";


if ((!isServer) && (isNull player) ) then
{
waitUntil {!isNull player};
waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
  waitUntil {time > 3};
};

if (isServer) then {
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
//[.....end file yum]