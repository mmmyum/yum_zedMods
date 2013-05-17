This is not a release for the inexperienced.




ZED STUFF:
Essentials:
player_spawnCheck.sqf
building_spawnZombies.sqf
zombie_generate.sqf ---change the loot part to suit your needs, i have it spawning my yum_skins

Respawn: ------ still is counting dead zeds for respawn, not a big deal, only happens on disconnect
building_REspawnZombies.sqf 
zombie_agent.fsm --- rewritten from scratch for walking zeds, needs more work still, respawn count
control_zombieAgent.sqf - set zed speeds, call zombie_agent
zombie_findOwner.sqf - set respawn count

LOOT STUFF:
building_spawnLoot.sqf - required for perma, minor changes
spawn_permaLoot.sqf - my script to spawn permanent loot
server_cleanup.fsm - might as well remove the stuff that removes loot


ADDITIONAL:
compiles.sqf
fn_damageHandler - damage player (push down to ground - does not work)
fn_damageHandlerZ - damage zeds (HS only)
player_spawn_2 - debug monitor
player_zombieAttack - zed damages player
player_zombieCheck - zed detects player
player_wearClothes - for yum_skins addon





NOTE!!!!! NOTE!!!!! NOTE! ! ! ! ! ! ! ! ! ! ! ! !
Some files are dependent on others, you may have to edit the commands to execute other
scripts as they may point to my fixes folder (if you don't use everything).  Some file need compiles.sqf to override
Most things will just be done in the mission init.sqf - like so (exerpt from my init.sqf follows)
server_cleanup.fsm is in dayz_server - edit there or override. 

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
building_REspawnZombies = compile preprocessFileLineNumbers "fixes\building_REspawnZombies.sqf";
stream_locationCheck = {};
//end
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
player_spawn_2 = compile preprocessFileLineNumbers "fixes\player_spawn_2.sqf"; //YUM


This is as much install instruction as I will give at this time.  This is not for the inexperienced. 
Major tweaking may be required, variables.sqf is where the number of zeds is set (maxLocalZombies).

This is not a release for the inexperienced.