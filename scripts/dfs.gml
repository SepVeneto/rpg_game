/*
    argument0: x;
    argument1: y;
    argument2: count;
*/

dir[0,0] = 0;
dir[0,1] = 1;
dir[1,0] = 1;
dir[1,1] = 0;
dir[2,0] = 0;
dir[2,1] = -1;
dir[3,0] = -1;
dir[3,1] = 0; 

if( argument0 == obj_maze_create.end_x && argument1 == obj_maze_create.end_y )
{
    access = true;
    return 0
}

var i, temp_x, temp_y;
for( i = 0; i < 4; i += 1 )
{
    temp_x = argument0 + dir[i,0];
    temp_y = argument1 + dir[i,1];
    
    if( temp_x < 1 || temp_x > size * 2 + 2 || temp_y < 1 || temp_y > size * 2 + 2 )
    {
        continue;
    }

    if( book[temp_x,temp_y] == 0 && map[temp_x, temp_y] == 0)
    {
        book[temp_x,temp_y] = 1;
        dfs(temp_x, temp_y);
        book[temp_x,temp_y] = 0;
    }
}
