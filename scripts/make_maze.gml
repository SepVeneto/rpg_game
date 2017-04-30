enum dir_index
{
    up = 1,
    right,
    down,
    left
};
var dir_origin, dir_end;
random_set_seed(current_time);
dir_origin = choose(dir_index.up, dir_index.right, dir_index.down, dir_index.left);
dir_end = choose(dir_index.up, dir_index.right, dir_index.down, dir_index.left);
while( dir_end == dir_origin )
{
    dir_end = choose(dir_index.up, dir_index.right, dir_index.down, dir_index.left);
}

switch( dir_origin )
{
    case dir_index.up:
        origin_x = irandom_range(2,size);
        origin_y = 1;
        character_direction(dir_index.up);
        break;
    case dir_index.right:
        origin_x = 2*size+1;
        origin_y = irandom_range(2,size);
        character_direction(dir_index.right);
        break;
    case dir_index.down:
        origin_x = irandom_range(2,size);
        origin_y = 2*size+1;
        character_direction(dir_index.down);
        break;
    case dir_index.left:
        origin_x = 1;
        origin_y = irandom_range(2,size);
        character_direction(dir_index.left);
        break;
}

switch( dir_end )
{
    case dir_index.up:
        end_x = irandom_range(2,2*size);
        end_y = 1;
        break;
    case dir_index.right:
        end_x = 2*size+1;
        end_y = irandom_range(2,2*size);
        break;
    case dir_index.down:
        end_x = irandom_range(2,2*size);
        end_y = 2*size+1;
        break;
    case dir_index.left:
        end_x = 1;
        end_y = irandom_range(2,2*size);
        break; 
}
map[origin_x,origin_y] = 0;
map[end_x,end_y] = 0;
Player.x = origin_x*32+16;
Player.y = origin_y*32+28;
search_path(irandom_range(2,size), irandom_range(2,size));
