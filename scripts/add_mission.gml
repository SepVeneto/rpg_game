/*
    argument0: 接受任务的编号
*/

var i;
for( i = 0; i < 5; i += 1 )
{
    if(obj_mission.mission_bar[i] == -1 )
    {
        obj_mission.mission_bar[i] = argument0;
        draw_set_font(font_mission_describe);
        display_mission_describe(argument0);
        break;
    }
}
