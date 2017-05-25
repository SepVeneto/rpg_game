///destroy_tile_layer_list(tilemap)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
    Usage:
    destroy_tile_layer_list(tilemap);
*/
var list = argument0;
var count = ds_list_size(list);
var i, grid;
// Loop through all grids in the list
for(i=0; i<count; i++)
{
    grid = list[| i];
    // Destroy the grid
    ds_grid_destroy(grid);
}
// Finally destroy the list
ds_list_destroy(list);
