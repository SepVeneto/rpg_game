var seperator, __data, pos, count;
__data = string(argument0);
seperator = "_";
count = 0;

//variable[0] = 10;
//variable[1] = 10;
//variable[2] = 2000;


while( string_count(string(seperator), __data) > 0 )
{
    pos = string_pos(string(seperator), __data);
    
    variable[count] = string_copy(__data, 0, pos-1);
    //show_message(variable[0]);
    __data = string_copy(__data, pos+1, string_length(__data));
    count += 1;
}

