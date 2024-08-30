function load_file(fname){
	if(file_exists(fname))
	{
		
		var _buffer = buffer_load(fname)
		var _string = buffer_read(_buffer,buffer_string)
		buffer_delete(_buffer)
		
		var _loadData = json_parse(_string)
		return _loadData;
	}
	else
	{
		return false;
	}
}