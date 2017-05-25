///create_tile_layers(tilemap, map_type, tileset, tilewidth, tileheight, xoffset_in_room, yoffset_in_room)
/*
  This script is part of the Tiled binary importer
  by Mikael Norrgard @ GamePhase
  You can get the Tiled To Binary Comverter tool here:
  http://www.gamephase.net/tiled-to-binary-converter/
  This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
  http://creativecommons.org/licenses/by-sa/4.0/
  Usage:
  create_tile_layers(tilemap, map_type, tileset, tilewidth, tileheight, xoffset_in_room, yoffset_in_room);
  The isometric and hexagonal tilesets are from the examples folder of Tiled.
*/
var map = argument0;
var type = argument1; // 0 = orthogonal, 1 = isometric, 2 = hexagonal
var tileset = argument2;
var tile_width = argument3;
var tile_height = argument4;
var xoffset = argument5;
var yoffset = argument6;
var list = map[? "layers"];
var map_width = map[? "width"];
var map_height = map[? "height"];
var map_tile_width = map[? "tile_width"];
var map_tile_height = map[? "tile_height"];
var map_hex_side_length = map[? "hex_side_length"];
var tileset_width = background_get_width(tileset) div tile_width;
var layer_count = ds_list_size(list);
var xpos, ypos, value, grid, i, even;
// Set map x-offset
var map_xoffset = 0;
if(type==1) // isometric
  map_xoffset = map_width*(map_tile_width/2);
// Layer depths, change to whatever you need, 
// in this demo only the two first ones are used
var depths;
depths[0] = 1000;
depths[1] = 800;
depths[2] = 600;
depths[3] = 400;
depths[4] = 200;
depths[5] = 0;
depths[6] = -200;
depths[7] = -400;
depths[8] = -600;
depths[9] = -800;
for(i = 0; i < layer_count; i++)
{
  grid = list[| i];
  for(ypos = 0; ypos < map_height; ypos++)
  {
    for(xpos = 0; xpos < map_width; xpos++)
    {
      // Get value from grid at position
      value = grid[# xpos, ypos];
      if(type == 1) // Isometric
        tile_add(tileset, ((value-1) mod tileset_width)*tile_width, ((value-1) div tileset_width)*tile_height, tile_width, tile_height, map_xoffset+xoffset+(xpos-ypos)*(map_tile_width/2), yoffset+(xpos+ypos)*(map_tile_height/2), depths[i]);
      else if(type == 2) { // Hexagonal
        if (ypos mod 2 == 0) // Even y value
          tile_add(tileset, ((value-1) mod tileset_width)*tile_width, ((value-1) div tileset_width)*tile_height, tile_width, tile_height, xoffset+xpos*map_tile_width, yoffset+ypos*(map_tile_height-(map_hex_side_length div 2)), depths[i]);
        else // Offset tiles on odd y values
          tile_add(tileset, ((value-1) mod tileset_width)*tile_width, ((value-1) div tileset_width)*tile_height, tile_width, tile_height, xoffset+(map_tile_width div 2)+xpos*map_tile_width, yoffset+ypos*(map_tile_height-(map_hex_side_length div 2)), depths[i]);      
      }
      else // Assume orthogonal
        tile_add(tileset, ((value-1) mod tileset_width)*tile_width, ((value-1) div tileset_width)*tile_height, tile_width, tile_height, xoffset+xpos*map_tile_width, yoffset+ypos*map_tile_height, depths[i]);
    }
  }
}
