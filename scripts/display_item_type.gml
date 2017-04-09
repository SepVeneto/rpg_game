/*
    argument0: 物品的编号
    return: 物品的类型
*/

var item_type, item_type_index;
item_type_index = argument0;
item_type = "";

switch( item_type_index )
{
    case 0:
        item_type = "单手武器";
        break;
    case 1:
        item_type = "双手武器";
        break;
    case 2:
        item_type = "副手武器";
        break;
    case 3:
        item_type = "天赋";
        break;
    case 4:
        item_type = "消耗品";
        break;
}
return item_type;

