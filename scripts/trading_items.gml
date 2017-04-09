/*
    argument0: 交易物品编号
    argument1: 买或卖
*/

item_index = argument0;
trade_action = argument1;

switch( trade_action )
{
    case BUY:
        if( obj_bag.item_data[obj_shop.item_site[item_index, ITEM_INDEX], ITEM_TYPE] == 4 )
        {
            instance_create(view_xview+230, view_yview+170, obj_trading_item);
            obj_trading_item.choose_item = argument0;
            obj_trading_item.trade_action = BUY;
            obj_trading_item.max_limit = floor(obj_bag.player_money / obj_bag.item_data[obj_shop.item_site[item_index, ITEM_INDEX], ITEM_VALUE]);
        }
        else
        {
            buying_item(item_index, 1);
        } 
        break;
    case SELL:
        if( obj_bag.item_site[item_index, ITEM_NUM] != 1 )
        {
            instance_create(view_xview+230, view_yview+170, obj_trading_item);
            obj_trading_item.choose_item = argument0;
            obj_trading_item.trade_action = SELL;
            obj_trading_item.max_limit = obj_bag.item_site[item_index, ITEM_NUM];
        }
        else
        {
            selling_item(item_index, 1);
        }
        break;
}

