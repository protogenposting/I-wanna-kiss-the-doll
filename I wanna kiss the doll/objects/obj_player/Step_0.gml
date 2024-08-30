for(var i=0;i<gamepad_get_device_count();i++)
{
	if(gamepad_is_connected(i))
	{
		global.gamepadDevice=i
		gamepad_set_axis_deadzone(i,0.1)
	}
}

if(alarm[0]>0)
{
	exit;
}

var _moveHorizontal = check_input("Right")-check_input("Left") //the horizontal direction pressed

if(_moveHorizontal!=0)
{
	//if we're moving, accelerate
	horizontalSpeed = move_toward(horizontalSpeed,moveSpeed*_moveHorizontal,acceleration)
	facing=sign(_moveHorizontal)
}
else
{
	//if we're not moving, deccelerate
	horizontalSpeed = move_toward(horizontalSpeed,0,decceleration)
}

if(verticalSpeed<maxFallSpeed)
{
	verticalSpeed += grav
}

if(is_on_ground())
{
	jumpsLeft = 2
}

if(check_input_pressed("Jump")&&jumpsLeft>0)
{
	verticalSpeed=jumpForce
	if(jumpsLeft==2)
	{
		audio_play_sound(snd_jump1,100,false)
	}
	if(jumpsLeft==1)
	{
		audio_play_sound(snd_jump2,100,false)
	}
	jumpsLeft--
}

//horizontal collision check!!!
if(place_meeting(x+horizontalSpeed,y,obj_collision))
{
	while(!place_meeting(x+sign(horizontalSpeed),y,obj_collision))
	{
		x+=sign(horizontalSpeed)
	}
	horizontalSpeed=0
}

x += horizontalSpeed //move horizontally

//vertical collision check!!!
if(place_meeting(x,y+verticalSpeed,obj_collision))
{
	while(!place_meeting(x,y+sign(verticalSpeed),obj_collision))
	{
		y+=sign(verticalSpeed)
	}
	verticalSpeed=0
}

y += verticalSpeed //move vertically

camera.CameraMove(id,horizontalSpeed,0)

if(y>room_height)
{
	die()
}

state_update()