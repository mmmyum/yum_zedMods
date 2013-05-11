class CfgPatches   {
class undeadYum
 {
 units[]={};
 weapons[]={};
 requiredAddons[]= {dayz_anim,dayz_code,dayz_weapons,dayz_equip,dayz_vehicles};
};
};

class CfgMovesZombie : CfgMovesBasic {
        skeletonName = "OFP2_ManSkeleton";
        gestures = "CfgGesturesMale";

        class AmovPercMwlkSnonWnonDf { //removed : AmovPercMstpSnonWnonDnon
                                file = "\yum_zedUndead\zmb\zombie3_walk"; // new animation file
                                speed = 0.6; //originally 0.2 in dayz
                                //duty = -0.7;
                        };
};
