var i, j;
    for( i = 0; i < size * 2 + 2; i += 1 )
    {
        for( j = 0; j < size * 2 + 2; j += 1)
        {
            map[i,j] = 1;
        }
    }
    j = size * 2 + 2
    for( i = 0; i <= j; i += 1 )
    {
        map[0,i] = -1;
        map[i,j] = -1;
        map[i,0] = -1;
        map[j,i] = -1;
    }
