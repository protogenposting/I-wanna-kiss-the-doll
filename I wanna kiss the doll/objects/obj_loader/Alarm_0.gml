for(var i = 0; i<instance_number(obj_save_point);i++)
{
	if(i == loadedFile.checkPoint)
	{
		var _inst = instance_find(obj_save_point,i)
		
		obj_player.x = _inst.x
		obj_player.y = _inst.y
	}
}