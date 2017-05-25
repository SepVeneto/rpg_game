///buffer_read_uint16(buffer)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
*/
/// Read an unsigned 16-bit integer from a buffer
var buffer = argument0;
var byte1 = buffer_read(buffer, buffer_u8);
var byte2 = buffer_read(buffer, buffer_u8);
return (byte1 + (byte2 << 8));
