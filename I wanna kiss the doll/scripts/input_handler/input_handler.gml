global.inputs=ds_map_create()

enum controlTypes{
	keyboard,
	gamepad,
	gamepadAxis
}

global.gamepadDevice=0

/// @function                add_input(_key,_name,[_type],[_axisSide])
/// @description             Adds a new input
/// @param {Real}     _key  The key to bind the name to.
/// @param {String}  _name The input's name
/// @param {controlTypes}  _type The input's type (either keyboard gamepad or gamepadaxis)
/// @param {Real}  _axisSide  If your using gamepadaxis, this variable defines what direction the gamepad should be in to return true

function add_input(_key,_name,_type=controlTypes.keyboard,_axisSide=1){
    var _value=ds_map_find_value(global.inputs,_name)
	var _struct={key: _key,type: _type,axisSide: _axisSide}
    if(_value==undefined)
    {
        ds_map_add(global.inputs,_name,[_struct])
    }
    else
    {
        array_push(_value,_struct)
    }
}

/// @function                check_input(_name)
/// @description             Returns true if any inputs assigned to this input are active. Can also check axises
/// @param {String}     _name  The input name to check
function check_input(_name)
{
    var _keys=ds_map_find_value(global.inputs,_name)
    
    for(var i=0; i<array_length(_keys); i++)
    {
        if(
			_keys[i].type==controlTypes.keyboard && keyboard_check(_keys[i].key)
			||
			_keys[i].type==controlTypes.gamepad && gamepad_button_check(global.gamepadDevice,_keys[i].key)
		)
        {
            return true
        }
		if(_keys[i].type==controlTypes.gamepadAxis && sign(gamepad_axis_value(global.gamepadDevice,_keys[i].key))==_keys[i].axisSide)
		{
			return abs(gamepad_axis_value(global.gamepadDevice,_keys[i].key))
		}
    }
    
    return false
}

/// @function                check_input_pressed(_name)
/// @description             Returns true if any inputs assigned to this input are pressed
/// @param {String}     _name  The input name to check

function check_input_pressed(_name)
{
    var _keys=ds_map_find_value(global.inputs,_name)
    
    for(var i=0; i<array_length(_keys); i++)
    {
        if(
			_keys[i].type==controlTypes.keyboard && keyboard_check_pressed(_keys[i].key)
			||
			_keys[i].type==controlTypes.gamepad && gamepad_button_check_pressed(global.gamepadDevice,_keys[i].key)
		)
		{
            return true
        }
    }
    
    return false
}

/// @function                check_input_released(_name)
/// @description             Returns true if any inputs assigned to this input are released
/// @param {String}     _name  The input name to check

function check_input_released(_name)
{
    var _keys=ds_map_find_value(global.inputs,_name)
    
    for(var i=0; i<array_length(_keys); i++)
    {
        if(
			_keys[i].type==controlTypes.keyboard && keyboard_check_released(_keys[i].key)
			||
			_keys[i].type==controlTypes.gamepad && gamepad_button_check_released(global.gamepadDevice,_keys[i].key)
		)
		{
            return true
        }
    }
    
    return false
}