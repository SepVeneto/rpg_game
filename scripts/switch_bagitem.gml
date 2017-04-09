/*
    argument0 : 拖拽目标的序号
    argument1 : 待交换的目标
*/
var temp_drag;
// 交换物品的图标标号
temp_drag = item_site[argument1, ITEM_INDEX];
item_site[argument1, ITEM_INDEX] = item_site[argument0, ITEM_INDEX];
item_site[argument0, ITEM_INDEX] = temp_drag;
// 交换物品的数量
temp_drag = item_site[argument1, ITEM_NUM];
item_site[argument1, ITEM_NUM] = item_site[argument0, ITEM_NUM];
item_site[argument0, ITEM_NUM] = temp_drag;

