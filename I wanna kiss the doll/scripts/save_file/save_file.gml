function save_file(struct,fname){
	var _saveData = struct
	var _string = json_stringify(_saveData,true)
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string,_string)
	buffer_save(_buffer,fname)
	buffer_delete(_buffer)
}