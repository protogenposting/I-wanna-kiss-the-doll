/// @description Insert description here
// You can write your code in this editor
checkpoints=[]

fuse_objects(obj_collision)

for(var i = 0; i<instance_number(obj_save_point);i++)
{
	checkpoints[i] = instance_find(obj_save_point,i)
}