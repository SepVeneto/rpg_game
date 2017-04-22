dir[0,0] = 0;
dir[0,1] = 1;
dir[1,0] = 1;
dir[1,1] = 0;
dir[2,0] = 0;
dir[2,1] = -1;
dir[3,0] = -1;
dir[3,1] = 0;

var i, temp_x, temp_y, count;
count = 0;
for( i = 0; i < 4; i += 1 )
{
    temp_x = obj_maze_create.origin_x + dir[i,0];
    temp_y = obj_maze_create.origin_y + dir[i,1];
    
    if( map[temp_x,temp_y] == 1 )
    {
        count += 1;
        continue;
    }
}
if( count != 2 )
{
    access = false;
    exit;
}
else
{
    access = true;
}

count = 0;
for( i = 0; i < 4; i += 1 )
{
    temp_x = obj_maze_create.end_x + dir[i,0];
    temp_y = obj_maze_create.end_y + dir[i,1];
    
    if( map[temp_x,temp_y] == 1 )
    {
        count += 1;
        continue;
    }
}
if( count != 2 )
{
    access = false;
    exit
}
else
{
    access = true;
}
