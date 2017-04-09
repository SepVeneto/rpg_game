/*
    argument0: 已完成任务的编号
*/

var i;
for( i = 0; i < 5;  i += 1 )
{
    if( obj_mission.mission_bar[i] == argument0 )
    {
        obj_mission.mission_bar[i] = -1;
        surface_free(obj_mission.surface_mission_describe[argument0]);
        break;
    }
}
