/// @description Insert description here
// You can write your code in this editor
var _dir = point_direction(x,y,other.x,other.y)

other.horizontalSpeed = lengthdir_x(shootSpeed,_dir)

other.verticalSpeed = lengthdir_y(shootSpeed/2,_dir)

other.jumpsLeft = 2