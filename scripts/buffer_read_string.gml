///buffer_read_string(buffer)
/*
    This script is part of the Tiled binary importer
    by Mikael Norrgard @ GamePhase
    You can get the Tiled To Binary Comverter tool here:
    http://www.gamephase.net/tiled-to-binary-converter/
    This script is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
    http://creativecommons.org/licenses/by-sa/4.0/
*/
/// Read an ASCII string from a buffer, first byte is string length
var buffer = argument0;
text_length = buffer_read_uint16(buffer);
text = "";
for(i=0;i<text_length;i++)
  text += chr(buffer_read(buffer, buffer_u8));
return text;
