///destroy_object_list(object_list)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
    Usage:
    destroy_object_list(object_list);
*/
var list = argument0;
var count = ds_list_size(list);
var i, map;
// Loop through all maps in the list
for(i=0; i<count; i++)
{
    map = list[| i];
    // Destroy possible x-points list
    if(ds_map_exists(map, "points_x"))
        ds_list_destroy(map[? "points_x"]);
    // Destroy possible y-points list
    if(ds_map_exists(map, "points_y"))
        ds_list_destroy(map[? "points_y"]);
    // Destroy the map
    ds_map_destroy(map);
}
// Finally destroy the list
ds_list_destroy(list);
