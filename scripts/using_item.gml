/*
    argument0 : 待使用的物品的序号
    argument1 : 使用物品的数量
*/

var data, using_num, i, temp_room;
using_num = argument1;
temp_room = obj_bag.bag_room;

switch( obj_bag.item_data[item_site[argument0, ITEM_INDEX], ITEM_TYPE] )
{
    case WEAPON_ONE_HAND:
        obj_bag.bag_room = temp_room -1;
        if( obj_equipment.equip_data[1, ITEM_INDEX] == 421 )
        {
            obj_equipment.equip_data[1, ITEM_INDEX] = 0;
        }
        switch_equipitem(argument0, 0);
        break;
    case WEAPON_TWO_HAND:
        obj_bag.bag_room -= 1;
        if( obj_equipment.equip_data[1, ITEM_INDEX] != 421 && obj_equipment.equip_data[1, ITEM_INDEX] != 0 )
        {
            add_items(obj_equipment.equip_data[1, ITEM_INDEX], 1);
            obj_equipment.equip_data[1, ITEM_INDEX] = 421;
        
        }
        else
        {
            obj_equipment.equip_data[1, ITEM_INDEX] = 421;
        }
        switch_equipitem(argument0, 0);
        break;
    case WEAPON_OFF_HAND:
        obj_bag.bag_room = temp_room - 1;
        if( obj_equipment.equip_data[1, ITEM_INDEX] == 421 )
        {
            add_items(obj_equipment.equip_data[0, ITEM_INDEX], 1);
            obj_equipment.equip_data[1, ITEM_INDEX] = 0;
            obj_equipment.equip_data[0, ITEM_INDEX] = 0;
        }
        switch_equipitem(argument0, 1);
        break;
    case TALENT:
        break;
    case CONSUMABLES:
        data = obj_bag.item_data[item_site[argument0, ITEM_INDEX], ITEM_ATTRIBUTE];
        string_decode(data);
        for( i = 0; i < using_num; i += 1 )
        {
            obj_bag.force_self += real(variable[0]);
            obj_bag.intellect_self += real(variable[1]);
            obj_bag.income_self += real(variable[2]);
            item_site[argument0, ITEM_NUM] -= 1;
        }
        if( item_site[argument0, ITEM_NUM] == 0 )
        {
            item_site[argument0, ITEM_INDEX] = 0;
            obj_bag.bag_room -= 1;
        }
        break;
    case DECORATION:
        obj_bag.bag_room = temp_room - 1;
        switch_equipitem(argument0, 2);
        break;
    case MISSION_ITEM:
        break;
    case SUNDRY:
        break;        
}

calculate_data();
