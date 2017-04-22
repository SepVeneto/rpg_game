/*
    抽奖
    return 物品在item_data中的序号
*/

var probability_first, probability_second, raffle_index, item_index, temp;

// 判断抽取的是哪一类物品
probability_first = irandom_range(1, 100)
// 20%单手、双手装备
if( probability_first <= 20 )
{
    raffle_index = irandom(1);;
}
// 8%副手装备
else if( probability_first <= 28 )
{
    raffle_index = 2;
}
// 15%消耗品
else if( probability_first <= 43 )
{
    raffle_index = 4;
}
// 5%饰品
else if( probability_first <= 48 )
{
    raffle_index = 5;
}
// 1%任务物品
else if( probability_first <= 49 )
{
    raffle_index = 6;
}
// 51%杂物
else
{
    raffle_index = 7;
}

// 判断在此类物品中抽取的物品
probability_second = irandom_range(1, 100);
switch( raffle_index )
{
    case WEAPON_ONE_HAND:
        if( probability_second <= 70 )
        {
            temp = choose(1, 5);
        }
        else if( probability_second <= 85 )
        {
            temp = choose(2, 6);
        }
        else if( probability_second <= 95 )
        {
            temp = choose(3, 7);
        }
        else
        {
            temp = choose(4, 8);
        }
        break;
    case WEAPON_TWO_HAND:
        if( probability_second <= 70 )
        {
            temp = 9;
        }
        else if( probability_second <= 85 )
        {
            temp = 10;
        }
        else if( probability_second <= 95 )
        {
            temp = 11;
        }
        else
        {
            temp = 12;
        }
        break;
    case WEAPON_OFF_HAND:
        temp = choose(13, 14, 15, 16);
        break;
    case CONSUMABLES:
        if( probability_second <= 80 )
        {
            temp = choose(17, 18, 19);
        }
        else if( probability_second <= 92 )
        {
            temp = choose(20, 21, 22);
        }
        else if( probability_second <= 99 )
        {
            temp = choose(23, 24, 25);
        }
        else
        {
            temp = 26;
        }
        break;
    case DECORATION:
        if( probability_second <= 40 )
        {
            temp = 27;
        }
        else if( probability_second <= 70 )
        {
            temp = 28;
        }
        else if( probability_second <= 95 )
        {
            temp = 29;
        }
        else
        {
            temp = 30;
        }
        break;
    case MISSION_ITEM:
        if( probability_second <= 40 )
        {
            temp = 31;
        }
        else if( probability_second <= 65 )
        {
            temp = 32;
        }
        else if( probability_second <= 85 )
        {
            temp = 33;
        }
        else if( probability_second <= 95 )
        {
            temp = 34;
        }
        else
        {
            temp = 35;
        }
        break;
    case SUNDRY:
        if( probability_second <= 60 )
        {
            temp = 36;
        }
        else if( probability_second <= 90 )
        {
            temp = 37;
        }
        else
        {
            temp = 38;
        }
        break;
}

return temp;
