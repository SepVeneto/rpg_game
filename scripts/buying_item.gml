/*
    argument0 = 物品的序号
    arguemnt1 = 物品的数量
*/

buy_item = argument0;
buy_num = argument1;

if( !buy_num )
{
    exit;
}
if( obj_bag.item_data[obj_shop.item_site[buy_item, ITEM_INDEX], ITEM_VALUE] * buy_num > obj_bag.player_money )
{
    show_message("没有足够的金钱！");
    exit;
}
obj_bag.player_money -= obj_bag.item_data[obj_shop.item_site[buy_item, ITEM_INDEX], ITEM_VALUE] * buy_num;
add_items(obj_shop.item_site[buy_item, ITEM_INDEX], buy_num);
