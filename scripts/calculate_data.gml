/*
人物属性由装备附加的属性和人物自身的属性相加
*/
//初始化人物自身属性
Player.force = obj_bag.force_self;
Player.intellect = obj_bag.intellect_self;
Player.income = obj_bag.income_self;

// 计算相应装备位置所带来的属性加成
if( obj_equipment.equip_data[0, ITEM_INDEX] )
{
    data = obj_bag.item_data[obj_equipment.equip_data[0, ITEM_INDEX], ITEM_ATTRIBUTE];
    string_decode(data);
    Player.force += real(variable[0]);
    Player.intellect += real(variable[1]);
    Player.income += real(variable[2]);
}

if( obj_equipment.equip_data[1, ITEM_INDEX] && obj_equipment.equip_data[1, ITEM_INDEX] != 421 )
{
    data = obj_bag.item_data[obj_equipment.equip_data[1, ITEM_INDEX], ITEM_ATTRIBUTE]
    string_decode(data);
    Player.force += real(variable[0]);
    Player.intellect += real(variable[1]);
    Player.income += real(variable[2]);
}

if( obj_equipment.equip_data[2, ITEM_INDEX] )
{
    data = obj_bag.item_data[obj_equipment.equip_data[2, ITEM_INDEX], ITEM_ATTRIBUTE]
    string_decode(data);
    Player.force += real(variable[0]);
    Player.intellect += real(variable[1]);
    Player.income += real(variable[2]);
}
