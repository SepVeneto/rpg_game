/*
    argument0: 物品的所有信息
*/

var entire_text, current_position, max_position;
entire_text = argument0;
current_position = 0;
max_position = string_length(entire_text);

var i, previous_i;
temp_i = 0;
for( i = 1; i <= max_position; i += 1 )
{
    switch( string_char_at(entire_text, i) )
    {
        case "!":
            obj_bag.item_index = string_copy(entire_text, 1, i-1);
            //show_message(obj_bag.item_index);
            previous_i = i+1;
            break;
        case "@":
            obj_bag.item_describe = string_copy(entire_text, previous_i, i-previous_i);
            //show_message(obj_bag.item_describe);
            previous_i = i+1;
            break;
        case "#":
            obj_bag.item_effect = string_copy(entire_text, previous_i, i-previous_i);
            //show_message(obj_bag.item_effect);
            previous_i = i+1;
            break;
        case "$":
            obj_bag.item_attribute = string_copy(entire_text, previous_i, i - previous_i);
            previous_i = i+1;
            break;
        case "%":
            //show_message(obj_bag.item_attribute);
            obj_bag.item_type = string_copy(entire_text, previous_i, 1);
            //show_message(obj_bag.item_type);
            previous_i = i+1;
            obj_bag.item_value = string_copy(entire_text, previous_i, max_position - i);
            //show_message(obj_bag.item_value);
            break;
    }
            
    /*if( string_char_at(entire_text, i) == "!" )
    {
        previous_i = i;
        obj_bag.item_index = string_copy(entire,1, previous_i);
    }
    else if( string_char_at(eintire_text, i) == "@" )
    {
        obj_bag.item_describe = string_copy(entire, previous_i, i - previous_i);
        previous_i = i;
    }
    else if( string*/
}


