/*
    抽奖
    return 物品在item_data中的序号
*/

var probability_first, probability_second, raffle_index, item_index, temp;

probability_first = irandom_range(1, 100)
if( probability_first <= 75 )
{
    raffle_index = 4;
}
else if( probability_first <= 90 )
{
    raffle_index = irandom(1);
}
else
{
    raffle_index = 2;
}

switch( raffle_index )
{
    case 0:
    case 1:
        temp = choose(1, 2, 3, 14, 15);
        break;
    case 2:
        temp = 16;
        break;
    case 4:
        temp = irandom_range(4, 13);
        break;
}

return temp;
