///load_object_list(binary_file_name, tile_height)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
    Object binary file structure
    ---------------------------------------------
    Header
    Object count       2 bytes
    Names              1 byte (0=false, 1=true)
    Types              1 byte (0=false, 1=true)
    Properties         1 byte (0=false, 1=true)
    Value bits         1 byte (16=16bit values, 32=32bit values, currently hardcoded to 16)
    The order of the data in the binary file for each object is
    X-position on map  2 bytes
    Y-position on map  2 bytes
    Object number      2 bytes (for tile)
    width              2 bytes (for tile, rectangle, ellipse)
    height             2 bytes (for tile, rectangle, ellipse)
    rotation           2 bytes (signed short)
    Name length (n)    2 bytes
    Name               n bytes
    Type length (n)    2 bytes
    Type               n bytes
    Properties count   2 bytes
    -- Properties (for every property) ---
    Name length (n)    2 bytes
    Name               n bytes
    Type               1 byte (0=short, 1=real, 2=string)
    Value              2 bytes for short, 2 + n bytes for real and string
*/
var file_name = argument0;
var tile_height = argument1;
// Load the binary file to a buffer
buffer = buffer_load(file_name);
var point_count; 
var i, n, val, xpos, ypos, width, height, rotation, name, type, shape, num_properties, inst, number;
var list, map;
var points_x;
var points_y;
// Read header
// Object count
var object_count = buffer_read_uint16(buffer);
// Names included?
var name_inc = buffer_read(buffer, buffer_u8);
// Types included?
var type_inc = buffer_read(buffer, buffer_u8);
// Properties included?
var properties_inc = buffer_read(buffer, buffer_u8);
// Value bits (currently 16bits supported only)
var value_bits = buffer_read(buffer, buffer_u8);
// Create the list where we will store all maps
list = ds_list_create();
// Read every object
repeat(object_count)
{
    map = ds_map_create();
    // Object type (0=tile, 1=rectangle, 2=ellipse, 3=polygon, 4=polyline)
    shape = buffer_read(buffer, buffer_u8);
    ds_map_add(map, "shape", shape);
    // Read name
    if(name_inc > 0)
        ds_map_add(map, "name", buffer_read_string(buffer));
    // Read type
    if(type_inc > 0)
        ds_map_add(map, "type", buffer_read_string(buffer));
    // Read x-position on map
    ds_map_add(map, "x", buffer_read_uint16(buffer));
    // Read y-position on map
    if(shape == 0)
        ds_map_add(map, "y", buffer_read_uint16(buffer)-tile_height); // We reduce tile height since Tiled saves bottom position
    else
        ds_map_add(map, "y", buffer_read_uint16(buffer));
    // Read rotation as short
    ds_map_add(map, "rotation", buffer_read_int16(buffer));
    // Read object number (this is the same as tile number for tile layers)
    if(shape == 0)
        ds_map_add(map, "number", buffer_read_uint16(buffer));
    // Read width and height
    if(shape <= 2)
    {
        ds_map_add(map, "width", buffer_read_uint16(buffer));
        ds_map_add(map, "height", buffer_read_uint16(buffer));
    }
    if(shape >= 3)
    {
        point_count = buffer_read_uint16(buffer);
        points_x = ds_list_create();
        points_y = ds_list_create();
        for(var i=0; i<point_count; i++)
        {
            ds_list_add(points_x,buffer_read_int16(buffer));
            ds_list_add(points_y,buffer_read_int16(buffer));
        }
        ds_map_add(map, "points_x", points_x);
        ds_map_add(map, "points_y", points_y);
    }
    if(properties_inc > 0)
    {
        // Read properties
        num_properties = buffer_read_uint16(buffer);
        repeat(num_properties)
        {
            // Read property name
            prop_name = buffer_read_string(buffer);
            // Read type (0=short, 1=string)
            n = buffer_read(buffer, buffer_u8);
            if(n == 0) {
                // Read property as short
                ds_map_add(map, prop_name, buffer_read_int16(buffer));
            }
            else
            {
                // Read property as string
                val = buffer_read_string(buffer);
                // Is it a "real" value?
                if(n == 1)
                    ds_map_add(map, prop_name, real(val)); // real with decimals
                else
                    ds_map_add(map, prop_name, val); // string
            }
        }
    }
    // Add the map to the list
    ds_list_add(list, map);
}
// Delete the buffer
buffer_delete(buffer);
// Return the list
return list;
