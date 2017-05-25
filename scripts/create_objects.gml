///create_objects(object_list)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
    Usage:
    create_objects(object_list);
*/
// Declare temporary variables
var list = argument0;
var count = ds_list_size(list);
var i, map, shape, type, inst;
// Create a map that connects object type stored in Tiled with object index in Gamemaker
// You can connects objects in any other way you see fit (custom properties, number etc.)
var objects = ds_map_create();
ds_map_add(objects, "Hero", obj_hero);
ds_map_add(objects, "Enemy", obj_enemy);
ds_map_add(objects, "Rectangle", obj_rectangle);
ds_map_add(objects, "Ellipse", obj_ellipse);
ds_map_add(objects, "Polygon", obj_polygon);
ds_map_add(objects, "Polyline", obj_polyline);
// Loop through all the maps in the list
for(i=0; i<count; i++)
{
    // Get map
    map = list[| i];
    // Store shape and type in temporary variables
    shape = map[? "shape"];
    type = map[? "type"];
    // Check if there is an object index for the object name
    if(ds_map_exists(objects, type)) 
    { 
        // Create the instance
        inst = instance_create(map[? "x"], map[? "y"], objects[? type]);
        // Set instance variables, here you would also use custom attributes etc.
        if(shape <= 2) { // Tile, Rectangle, Ellipse
            inst.width = map[? "width"];
            inst.height = map[? "height"];
        }
        else { // Polygon, Polyline
            inst.points_x = map[? "points_x"];
            inst.points_y = map[? "points_y"];
        }
    }
    else
        // For debugging (show message if an object index for object name is not found
        show_message("Object index for: '" + type + "' is not defined!");
}
