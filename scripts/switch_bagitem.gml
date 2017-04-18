/*
    argument0 : 拖拽目标的序号
    argument1 : 待交换的目标
*/
var temp_drag, remain;
if( ( obj_bag.item_data[item_site[argument1, ITEM_INDEX], ITEM_TYPE] == 4 || obj_bag.item_data[item_site[argument1, ITEM_INDEX], ITEM_TYPE] == 7 ) && item_site[argument1, ITEM_NUM] < 99 && obj_bag.item_data[item_site[argument1, ITEM_INDEX], ITEM_INDEX] == obj_bag.item_data[item_site[argument0, ITEM_INDEX], ITEM_INDEX] && argument1 != argument0 )
{
    remain = 99 - item_site[argument1, ITEM_NUM];
    if( item_site[argument0, ITEM_NUM] <= remain )
    {
        item_site[argument1, ITEM_NUM] += item_site[argument0, ITEM_NUM];
        item_site[argument0, ITEM_INDEX] = 0;
        item_site[argument0, ITEM_NUM] = 0;
    }
    else
    {
        item_site[argument1, ITEM_NUM] = 99;
        item_site[argument0, ITEM_NUM] -= remain;
    }
    exit;
}
else
{
    // 交换物品的图标标号
    temp_drag = item_site[argument1, ITEM_INDEX];
    item_site[argument1, ITEM_INDEX] = item_site[argument0, ITEM_INDEX];
    item_site[argument0, ITEM_INDEX] = temp_drag;
    // 交换物品的数量
    temp_drag = item_site[argument1, ITEM_NUM];
    item_site[argument1, ITEM_NUM] = item_site[argument0, ITEM_NUM];
    item_site[argument0, ITEM_NUM] = temp_drag;
}

