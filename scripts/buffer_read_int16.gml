///buffer_read_int16(buffer)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
*/
/// Read a signed 16-bit integer from a buffer
var buffer = argument0;
var byte1 = buffer_read(buffer, buffer_u8);
var byte2 = buffer_read(buffer, buffer_u8);
var value = byte1 + (byte2 << 8);
if(value >= 32768) // Convert from signed short bytes (all values above 32767 are actually negative values)
    value -= 65536;
return value;
