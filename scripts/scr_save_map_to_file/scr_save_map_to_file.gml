var data_to_save = argument[0];
var filename = argument[1];

var string_to_save = json_encode(data_to_save);
var buffer = buffer_create(string_byte_length(string_to_save) + 1, buffer_fixed, 1);
buffer_write(buffer, buffer_string, string_to_save);
buffer_save(buffer, filename);
buffer_delete(buffer);