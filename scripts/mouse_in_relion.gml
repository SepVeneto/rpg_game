/*
    argument0 = xx;
    argument1 = yy;
    argument2 = xxx;
    argument3 = yyy;
*/
var xx, yy, xxx, yyy;
xx = argument0;
yy = argument1;
xxx = argument2;
yyy = argument3;

if( mouse_x < xxx && mouse_x > xx && mouse_y < yyy && mouse_y > yy )
{
    return true;
}
else 
{
    return false;
}
