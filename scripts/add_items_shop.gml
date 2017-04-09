/*
    argument0: 物品的编号
*/

var i;
for( i = 0; i < 36; i += 1 )
{
    if( !obj_shop.item_site[i, ITEM_INDEX] )
    {
        obj_shop.item_site[i, ITEM_INDEX] = argument0;
        exit;
    }
}

