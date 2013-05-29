/*
for mission init - define _devs as array of auth player uid
_devs = ["48467270"];
 if (getPlayerUID player in _devs) then
    {
        [] execVM "mmmyum\radio\commsMenu.sqf";
    };
	
	
*/
 
 //commsMenu.sqf thanks to deathly
 
 CUSTOM_menu = [
            ["YUM Menu",false],
            ["NearLocation",[2],"",-5,[["expression","[] execVM 'mmmyum\radio\yum\nearlocation.sqf'"]],"1","1"],
            ["NearLoc in yum_locations",[3],"",-5,[["expression","[] execVM 'mmmyum\radio\yum\nloc_in_yumloc.sqf'"]],"1","1"],
            ["Null",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\yum\null.sqf'"]],"1","1"],
            ["Null",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\yum\null.sqf'"]],"1","1"]
            ];
			
 CUSTOM_menu_create = [
            ["Create Menu",false],
            ["null1",[2],"",-5,[["expression","[] execVM 'mmmyum\radio\create\null1.sqf'"]],"1","1"],
            ["null2",[3],"",-5,[["expression","[] execVM 'mmmyum\radio\create\null2.sqf'"]],"1","1"],
            ["null3",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\create\null3.sqf'"]],"1","1"],
            ["null4",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\create\null4.sqf'"]],"1","1"]
            ];
 CUSTOM_menu_morph = [
            ["Morph Menu",false],
            ["null",[2],"",-5,[["expression","[] execVM 'mmmyum\radio\morph\null.sqf'"]],"1","1"],
            ["null",[3],"",-5,[["expression","[] execVM 'mmmyum\radio\morph\null.sqf'"]],"1","1"],
            ["null",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\morph\null.sqf'"]],"1","1"],
            ["null",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\morph\null.sqf'"]],"1","1"]
            ];
 CUSTOM_menu_teleport = [
            ["TP Menu",false],
            ["null",[2],"",-5,[["expression","[] execVM 'mmmyum\radio\teleport\null.sqf'"]],"1","1"],
            ["null",[3],"",-5,[["expression","[] execVM 'mmmyum\radio\teleport\null.sqf'"]],"1","1"],
            ["null",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\teleport\null.sqf'"]],"1","1"],
            ["null",[4],"",-5,[["expression","[] execVM 'mmmyum\radio\teleport\null.sqf'"]],"1","1"]
            ];
BIS_MENU_GroupCommunication = [
            ["mmmyum's Dev Commands", false],
            ["Debug",[2],"#USER:CUSTOM_menu",-5,[["expression",""]],"1","1"],
            ["Create",[3],"#USER:CUSTOM_menu_create",-5,[["expression",""]],"1","1"],
            ["Morph",[4],"#USER:CUSTOM_menu_morph",-5,[["expression",""]],"1","1"],
            ["Teleport",[5],"#USER:CUSTOM_menu_teleport",-5,[["expression",""]],"1","1"]
            ];
			
