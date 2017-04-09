spr_x = 250;
spr_y = 300;
num_one = 0;
num_ten = 0;
num_hundred = 0;

if( mouse_in_relion(spr_x+186, spr_y+5, spr_x+237, spr_y+41) && mouse_check_button(mb_left) )
{
    num_one += 1;
    if( num_one == 9 )
    {
        num_one = 0;
        num_ten += 1;
        if( num_ten == 9 )
        {
            num_ten = 0;
            num_hundred += 1;
        }
    }
}

draw_sprite(spr_trading_window, 0, 250, 300);
draw_sprite(spr_num, num_hundred, spr_x+26, spr_y+20);
draw_sprite(spr_num, num_ten, spr_x+75, spr_y+20);
draw_sprite(spr_num, num_one, spr_x+129, spr_y+20);

/*if( mouse_in_relion(obj_

num_one;
num_ten;
num_hundred;*/
