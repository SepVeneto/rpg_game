// argument0 = global.textbox_text

draw_set_font(font_textbox);
var start_pos, txt;
txt = argument0;
start_pos = 1;
for( i = 1; i <= string_length(txt); i += 1 )
{
    w = string_width(string_copy(txt, start_pos, i-start_pos));
    if( w >= 10000 && string_char_at(txt, i) != " " )//185
    {
        var char, pos;
        pos = i;
        char = "";
        while( char != " " )
        {
            pos -= 1;
            char = string_char_at(txt, pos);
        }
        txt = string_delete(txt, pos, 1);
        txt = string_insert("#", txt, pos);
        start_pos = pos;
    }
}
return txt;

