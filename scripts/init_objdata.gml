obj_bag_button.x = view_xview + 550;
obj_bag_button.y = view_yview + 424;
obj_bag.x = view_xview + 640-238;
obj_bag.y = view_yview;

obj_equipment_button.x = view_xview + 500;
obj_equipment_button.y = view_yview + 424;
obj_equipment.x = view_xview;
obj_equipment.y = view_yview;

obj_mission_button.x = view_xview + 450;
obj_mission_button.y = view_yview + 424;
obj_mission.x = view_xview + 160;
obj_mission.y = view_yview + 32;


if( instance_exists(obj_xiana) )
{
    instance_create(Player.x, Player.y, obj_ChaHappenBoxXiana);
    Player.current_character = "夏娜";
}
else if( instance_exists(obj_zhi) )
{
    instance_create(Player.x, Player.y, obj_ChaHappenBoxZhi);
    Player.current_character = "三千院凪";
}

instance_create(NPCs.x, NPCs.y, obj_hitbox);
NPCs.dialoge_bubble = instance_create(NPCs.x + 8, NPCs.y - 65, obj_dialoge);
instance_deactivate_object(obj_dialoge);
