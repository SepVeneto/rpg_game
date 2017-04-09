/*
    argument0 : 待使用的物品的序号
    argument1 : 使用物品的数量
*/

var data, using_num, i;
using_num = argument1;
// 消耗品
if( item_data[item_site[argument0, ITEM_INDEX], ITEM_INDEX] <= 70 && item_data[item_site[argument0, ITEM_INDEX], ITEM_INDEX] >= 1 && item_site[argument0, ITEM_NUM] != 0)
{
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
    }
}
// 装备
else
{
    if( obj_bag.item_data[item_site[argument0, ITEM_INDEX], ITEM_TYPE] <= 1 )
    {
        // 单手装备
        if( obj_bag.item_data[item_site[argument0, ITEM_INDEX], ITEM_INDEX] <= 91 && item_data[item_site[argument0, ITEM_INDEX], ITEM_INDEX] >= 71 )
        {
            if( obj_equipment.equip_data[1, ITEM_INDEX] == 421 )
            {
                obj_equipment.equip_data[1, ITEM_INDEX] = 0;
            }
        }
        // 双手装备
        if( obj_bag.item_data[item_site[argument0, ITEM_INDEX], ITEM_TYPE] == 1 )
        {
            if( obj_equipment.equip_data[1, ITEM_INDEX] != 421 )
            {
                add_items(obj_equipment.equip_data[1, ITEM_INDEX], 1);
                obj_equipment.equip_data[1, ITEM_INDEX] = 421;
            }
            else
            {
                obj_equipment.equip_data[1, ITEM_INDEX] = 421;
            }
        } 
        switch_equipitem(argument0, 0);
    }
    // 副手装备
    else if( obj_bag.item_data[item_site[argument0, ITEM_INDEX], ITEM_TYPE] == 2 )
    {  
        if( obj_equipment.equip_data[1, ITEM_INDEX] == 421 )
        {
            add_items(obj_equipment.equip_data[0, ITEM_INDEX], 1);
            obj_equipment.equip_data[1, ITEM_INDEX] = 0;
            obj_equipment.equip_data[0, ITEM_INDEX] = 0;
        }
        switch_equipitem(argument0, 1);
    }   
}
calculate_data();
