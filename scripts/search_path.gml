/*
    argument0: y;
    argument1: x;
*/
var turn, next;
dir[0,0] = 0;
dir[0,1] = 1;
dir[1,0] = 1;
dir[1,1] = 0;
dir[2,0] = 0;
dir[2,1] = -1;
dir[3,0] = -1;
dir[3,1] = 0; 

var xx, yy, next, turn;
xx = argument1 * 2;
yy = argument0 * 2;
next = irandom_range(0,3);
turn = choose(1, 3);
map[yy,xx] = 0;

var i;
for( i = 0; i < 4; ++i )
{
    if( map[yy + 2 * dir[next,0],xx + 2 * dir[next,1]] == 1)
    {
        map[yy + dir[next,0],xx + dir[next,1]] = 0;
        search_path(argument0 + dir[next,0], argument1 + dir[next,1]);
    }
    next = (next + turn) % 4;
}
return 0;
