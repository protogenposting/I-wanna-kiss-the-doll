saveName = game_save_id+"save_data.json"

loadedFile = load_file(saveName)

checkpoints=[]

audio_play_sound(snd_music,1000,true)

if(loadedFile!=false)
{
	room_goto(loadedFile.room)
	alarm[0]=2
}
else
{
	loadedFile = {
		room : rm_level1,
		checkPoint : 0
	}
	room_goto(loadedFile.room)
	alarm[0]=2
}

function save(){
	loadedFile.room = room
	for(var i = 0; i<instance_number(obj_save_point);i++)
	{
		with(instance_find(obj_save_point,i))
		{
			if(place_meeting(x,y,obj_player))
			{
				other.loadedFile.checkPoint = i
			}
		}
	}
	save_file(loadedFile,saveName)
}