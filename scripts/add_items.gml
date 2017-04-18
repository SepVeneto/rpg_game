/*
    argument0 = 物品在item_data中的序号
    arguemnt1 = 物品的数量
*/
global.acquire_item[global.acquire_number] = argument0;
global.acquire_number += 1;

var i, temp_room;
temp_room = obj_bag.bag_room;
for( i = 0; i < 36; i += 1 )
{
    if( obj_bag.item_site[i, ITEM_INDEX] == argument0 && ( obj_bag.item_data[argument0, ITEM_TYPE] == 4 || obj_bag.item_data[argument0, ITEM_TYPE] == 7 ) && obj_bag.item_site[i, ITEM_NUM] <= 99 )
    {
        if( obj_bag.item_site[i, ITEM_NUM] < 99 )
        {
            obj_bag.item_site[i, ITEM_NUM] += argument1;
            exit;
        }
    }
    
}

for( i = 0; i < 36; i += 1 )
{
    if( !obj_bag.item_site[i, ITEM_INDEX] )
    {
        obj_bag.item_site[i, ITEM_INDEX] = argument0;
        obj_bag.item_site[i, ITEM_NUM] += argument1;
        obj_bag.bag_room = temp_room + 1;
        exit;
    }
}
show_message("背包满了");





