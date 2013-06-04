if (isServer) then {
	waitUntil{dayz_preloadFinished};
};
_id = [] execFSM "fixes\player_monitor.fsm";