/*
    argument0 : 待卖出的物品的序号
    argument1 : 卖出物品的数量
*/

sell_index = argument0;
sell_num = argument1;
obj_bag.item_site[sell_index, ITEM_NUM] -= sell_num;
obj_bag.player_money += (obj_bag.item_data[obj_bag.item_site[sell_index, ITEM_INDEX], ITEM_VALUE]/4) * sell_num;
if( !obj_bag.item_site[sell_index, ITEM_NUM] )
{
    obj_bag.bag_room -= 1;
    obj_bag.item_site[sell_index, ITEM_INDEX] = 0;
}

