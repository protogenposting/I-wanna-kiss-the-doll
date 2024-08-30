horizontalSpeed = 0

verticalSpeed = 0

grav = 0.75

maxFallSpeed = 10

jumpForce = -10

camera = new Camera()

moveSpeed = 5

acceleration = 1

decceleration = 0.5

jumpsLeft = 0

facing=1

spawnX = x

spawnY = y

add_input(ord("A"),"Left")

add_input(gp_axislh,"Left",controlTypes.gamepadAxis,-1)

add_input(ord("D"),"Right")

add_input(gp_axislh,"Right",controlTypes.gamepadAxis,1)

add_input(vk_space,"Jump")

add_input(gp_face1,"Jump",controlTypes.gamepad)

function is_on_ground()
{
	return place_meeting(x,y+1,obj_collision)
}

function state_update()
{
	if(!is_on_ground())
	{
		sprite_change(spr_player_jump)
	}
	else if(abs(horizontalSpeed)>0)
	{
		sprite_change(spr_player_walk)
	}
	else
	{
		sprite_change(spr_player_idle)
	}
}

function die()
{
	if(alarm[0]<=0)
	{
		audio_play_sound(snd_die,1000,false)
		alarm[0]=15
	}
}

function reset()
{
	x=spawnX
	y=spawnY
	
	horizontalSpeed = 0
	verticalSpeed = 0
	
	jumpsLeft = 0
}