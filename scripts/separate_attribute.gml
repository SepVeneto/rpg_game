/*
    argument0: 物品的具体属性
*/

var i;
count = 0;
entire_text = argument0;
max_position = string_length(entire_text);
current_position = 0;
previouse_position = 1;
for( i = 1; i <= max_position; i += 1 )
{
    if( string_char_at(entire_text, i) == ',' )
    {
        current_position = i;
        variable[count] = string_copy(entire_text,previouse_position, current_position-previouse_position)
        previouse_position = current_position+1;
        count += 1;
    }
}
return count;

