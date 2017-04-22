var i, j;

for( i = 0; i <= size * 2 + 2; i += 1 )
{
    for( j = 0; j <= size * 2 + 2; j += 1 )
    {
        if( map[i,j] == 1 )
        {
            instance_create(32*i, 32*j, obj_wall);
        }
    }
}

//instance_create(end_x*32, end_y*32, obj_treasure_box);
