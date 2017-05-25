///textbox_choose(text, choose1_text, choose2_text, c_colour, mission_index);
/*
     argument0: text
     argument1: 选项1的后续对话
     argument2: 选项2的后续对话
     argument3: 字体默认颜色
     argument4: 当前任务的编号
*/
if( !instance_exists(obj_textbox_choose) )
{
    global.textbox_text = argument0;
    global.textbox_option1 = argument1;
    global.textbox_option2 = argument2;
    
    temp_object = instance_create(0, 0, obj_textbox_choose);
    temp_object.current_mission = argument4;

    temp_object.colour = argument3;
}
