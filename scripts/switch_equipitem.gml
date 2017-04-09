/*
    argument0 : 背包物品
    argument1 : 装备栏物品
*/

var temp;

temp = obj_equipment.equip_data[argument1, ITEM_INDEX];
obj_equipment.equip_data[argument1, ITEM_INDEX] = obj_bag.item_site[argument0, ITEM_INDEX];
obj_bag.item_site[argument0, ITEM_INDEX] = temp;

    
    

