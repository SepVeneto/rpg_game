/*
     argument0 = text
     argument1 = colour
*/
if( !instance_exists(obj_textbox) )
{
    
    global.textbox_text = argument0;
    t = instance_create(0, 0, obj_textbox);
    if( argument1 )
    {
        t.colour = argument1;
    }
}
