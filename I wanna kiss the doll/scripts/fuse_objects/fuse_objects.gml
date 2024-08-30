// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fuse_objects(objectType){
	if(instance_exists(objectType))
	{
		fuse_objects_horizontal(objectType)
		fuse_objects_vertical(objectType)
	}
}