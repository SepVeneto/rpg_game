/*
    argument0: 在迷宫中出现的位置
*/
var dir;
dir = argument0;
switch( global.character_index )
{
    case 1:
        switch( dir )
        {
            case dir_index.up:
                Player.sprite_index = spr_xiana_front;
                break;
            case dir_index.right:
                Player.sprite_index = spr_xiana_left;
                break;
            case dir_index.down:
                Player.sprite_index = spr_xiana_back;
                break;
            case dir_index.left:
                Player.sprite_index = spr_xiana_right;
                break;
        }
        break;
    case 2:
        switch( dir )
        {
            case dir_index.up:
                Player.sprite_index = spr_zhi_front;
                break;
            case dir_index.right:
                Player.sprite_index = spr_zhi_left;
                break;
            case dir_index.down:
                Player.sprite_index = spr_zhi_back;
                break;
            case dir_index.left:
                Player.sprite_index = spr_zhi_right;
                break;
        }
        break;
}
