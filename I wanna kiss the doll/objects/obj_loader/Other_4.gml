/// @description Insert description here
// You can write your code in this editor
checkpoints=[]

fuse_objects(obj_collision)

for(var i = 0; i<instance_number(obj_save_point);i++)
{
	checkpoints[i] = instance_find(obj_save_point,i)
}

if(room != rm_cutscene1 && room != rm_cutscene2)
{
	if(!audio_is_playing(snd_music))
	{
		audio_play_sound(snd_music,1000,true)
	}
}
else
{
	audio_stop_all()
}