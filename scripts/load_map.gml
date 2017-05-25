///load_map(binary_file_name)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
*/
// Get arguments
var file_name = argument0;
// Open the binary file
var buffer = buffer_load(file_name);
var tile_map = ds_map_create();
var list = ds_list_create();
// Read header data
// Orientation
tile_map[? "orientation"] = buffer_read(buffer, buffer_u8);
// Stagger axis
tile_map[? "stagger_axis"] = buffer_read(buffer, buffer_u8);
// Stagger index
tile_map[? "stagger_index"] = buffer_read(buffer, buffer_u8);
// Hex side length
tile_map[? "hex_side_length"] = buffer_read_uint16(buffer);
// Map width
tile_map[? "width"] = buffer_read_uint16(buffer);
// Map height
tile_map[? "height"] = buffer_read_uint16(buffer);
// Tile width
tile_map[? "tile_width"] = buffer_read_uint16(buffer);
// Tile height
tile_map[? "tile_height"] = buffer_read_uint16(buffer);
// Tile bits (16-bit only currently)
var tile_bits = buffer_read(buffer, buffer_u8);
// Run length encoding (0=false, 24=24bit, 32=32bit)?
var rle = buffer_read(buffer, buffer_u8);
// Number of layers
tile_map[? "layer_count"] = buffer_read_uint16(buffer);
// Add list to map
tile_map[? "layers"] = list;
var layer_size = tile_map[? "width"] * tile_map[? "height"];
var pos, grid, xpos, ypos, i;
if(rle == 0) // --- Uncompressed layers ---
{
    // Read all layers to separate grids
    for(i = 0; i < tile_map[? "layer_count"]; i++)
    {
        grid = ds_grid_create(tile_map[? "width"], tile_map[? "height"]);
        xpos = 0;
        ypos = 0;
        pos = 0;
        while(pos < layer_size)
        {
            // Read the next tile number
            value = buffer_read_uint16(buffer);
            // Add the value to the grid
            ds_grid_set(grid, xpos, ypos, value);
            // Increase x-position
            xpos++;
            // If x-position equals the map width, then set x-position to zero and increase y-position
            if(xpos == tile_map[? "width"]) {
                xpos = 0;
                ypos++;
            }
            // Increase read position
            pos++;
        }
        // Add the layer grid to the list of grids
        ds_list_add(list, grid);
    }
}
else if(rle == 24) // --- 24-bit run length encoding ---
{
    // Read all layers to separate grids
    for(i = 0; i < tile_map[? "layer_count"]; i++)
    {
        grid = ds_grid_create(tile_map[? "width"], tile_map[? "height"]);
        xpos = 0;
        ypos = 0;
        pos = 0;
        while(pos < layer_size)
        {
            // Read the count for the next tile number
            count = buffer_read_uint24(buffer);
            // Read the tile number
            value = buffer_read_uint16(buffer);
            // Add tile number to the grid
            for(j=0; j<count; j++)
            {
                // Add the value to the grid
                ds_grid_set(grid, xpos, ypos, value);
                // Increase x-position in grid
                xpos++;
                // If x-position equals the map width, then set x-position to zero and increase y-position
                if(xpos == tile_map[? "width"])
                {
                    xpos = 0;
                    ypos++;
                }
                // Increase read position
                pos++;
            }
        }
        // Add the layer grid to the list of grids
        ds_list_add(list, grid);
    }
}
else if(rle == 32) // --- 32-bit run length encoding ---
{
    // Debug message
    show_message("32-bit RLE is not supported, enable 24-bit RLE in the converter!");
}
// Delete the buffer
buffer_delete(buffer);
// Return the ds_map
return tile_map;
