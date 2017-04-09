/*
    argument0: 已接受任务的具体描述
    argument1: 任务栏的编号
*/
    
    //show_message("ok");
    mission_text = global.mission[argument0,1];
    var current_position, max_position, per_letter, draw_x, draw_y;
    current_position = 1;
    max_position = string_length(mission_text) +1;
    per_letter = "";
    draw_x = 0;
    draw_y = 0;
    
    while(current_position < max_position )
    {
        per_letter = string_copy(mission_text, current_position, 1);
        surface_set_target(obj_mission.surface_mission_describe[argument0]);
        draw_text(246+draw_x, 45+draw_y, per_letter);
        surface_reset_target();
        draw_x += string_width(per_letter);
        if( draw_x > 143 )
        {
            draw_x = 0
            draw_y += 40;
        }
        current_position += 1;
    }

