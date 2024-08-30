/// @description Insert description here
// You can write your code in this editor
if(!wasSavedAt)
{
	wasSavedAt=true
	image_index=1
	other.spawnX = x
	other.spawnY = y
	with(obj_loader)
	{
		save()
	}
	audio_play_sound(snd_save,1000,false)
}