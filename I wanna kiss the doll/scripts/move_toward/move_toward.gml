// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_toward(from,to,by){
	
	if (abs(from-to) < by) {
		return to
	}
	
	if (from < to) {
		return from + by
	}
	
	return from - by
	
}