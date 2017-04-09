/*
    argument0: 物品在背包中的位置
*/
max_width = 200;
item_index = argument0;
attribute_text = item_data[item_site[item_index, ITEM_INDEX],ITEM_EFFECT]
count = separate_attribute(attribute_text);
attribute_num = count;
text_length = string_length(attribute_text);
text_height = string_height(attribute_text);
surface_height = count * string_height(attribute_text)

display_surface = surface_create(200, 100+surface_height);
surface_set_target(display_surface);
// 绘制物品信息显示框
draw_rectangle_colour(0, 0, x+8+(j*32)+32, y+40+floor(i/6)*32+32+100, c_white, c_white, c_gray, c_gray, false);
// 显示物品的描述

draw_text(0+(max_width/2-20*(text_length/2)), 0, item_data[item_site[item_index, ITEM_INDEX],ITEM_DESCRIBE]);
// 分割线
draw_line_colour(x+8+(j*32)+32-max_width, y+40+floor(i/6)*32+32+30, x+8+(j*32)+32, y+40+floor(i/6)*32+32+30, c_teal, c_teal);
// 显示物品的属性
for( i = 0; i < attribute_num; i += 1 )
{
    draw_text(0, 0+50+(i+1)*text_height, variable[i]);
}
// 显示物品的价值
draw_text(0, 0+surface_height+30, string("出售价格：")+string(item_data[item_site[item_index, ITEM_INDEX], ITEM_VALUE]/4) );

//x+8+( j*32 )+32-max_width, y+40+floor(i/6)*32+32
