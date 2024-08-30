// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro MAXOFFSET 12
#macro MOVESPEED -1

function CameraBar(_screenPosition) constructor{
	screenPosition = _screenPosition
	progress = 1
	targetProgress = 1
	function update_progress(){
		progress -= (progress - targetProgress)/10
	}
}

function Camera() constructor{
	bars = [new CameraBar(1),new CameraBar(-1)]
	zoom=1
	zoomTarget=1
	defaultWidth = camera_get_view_width(view_camera[0])
	defaultHeight = camera_get_view_height(view_camera[0])
	shakeTime=0
	shakeIntensity=0
	function CameraMove(_target,_xSpeed,_ySpeed){	
		static _offsetX = 0
		static _offsetY = 0
	
		if(abs(_offsetX) < MAXOFFSET)
		{
			_offsetX += sign(_xSpeed) * MOVESPEED
		}
		if(_xSpeed == 0)
		{
			_offsetX-=sign(_offsetX)
		}
		if(abs(_offsetY) < MAXOFFSET)
		{
			_offsetY += sign(_ySpeed) * MOVESPEED
		}
		if(_ySpeed == 0)
		{
			_offsetY -= sign(_offsetY)
		}
	
		var _width = camera_get_view_width(view_camera[0])
		var _height = camera_get_view_height(view_camera[0])
	
		var _posX = _target.x
	
		var _posY = _target.y
	
		var _camX = _posX-_width/2 + _offsetX
	
		var _camY = _posY-_height/2 + _offsetY
		
		shakeTime--
		
		if(shakeTime>=0)
		{
			_camX+=random_range(-shakeIntensity,shakeIntensity)
			_camY+=random_range(-shakeIntensity,shakeIntensity)
		}
	
		camera_set_view_pos(view_camera[0],_camX,_camY)
	}
	
	function CameraDraw(){
		zoom -= (zoom - zoomTarget)/10
		camera_set_view_size(view_camera[0],defaultWidth*zoom,defaultHeight*zoom)
		CameraDrawBars()
	}

	function CameraDrawBars(){
		draw_set_color(c_black)
		for(var i=0;i<array_length(bars);i++)
		{
			bars[i].update_progress()
			var _viewWidth=camera_get_view_width(view_camera[0])
			var _viewHeight=camera_get_view_height(view_camera[0])
			var _yOrigin=_viewHeight/2 + (_viewHeight/2)*bars[i].progress*bars[i].screenPosition
			draw_rectangle(0,_yOrigin,
			_viewWidth,_viewHeight/2+(_viewHeight/2)*bars[i].screenPosition,false)
			show_debug_message(_yOrigin)
		}
		draw_set_color(c_white)
	}

	function CameraSetBarTargetProgress(_id,_progress){
		bars[_id].targetProgress=_progress
	}
	function CameraSetZoomTargetProgress(_progress){
		zoomTarget=_progress
	}
	function Shake(_time,_intensity){
		shakeTime=_time
		shakeIntensity=_intensity
	}
}