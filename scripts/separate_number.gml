/*
    argument0: num_total
*/

num_total = argument0;
obj_trading_item.num_one = num_total % 10;
obj_trading_item.num_ten = num_total / 10 % 10;
obj_trading_item.num_hundred = num_total / 100;
