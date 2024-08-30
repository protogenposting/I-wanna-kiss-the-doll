// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fuse_objects_vertical(objectType){
	var fusedObjects=2
    var totalFusedObjects=0
    while(fusedObjects>0)
    {
        //YO CARSON GET SOME HELP WITH THIS ITS UNOPTIMIZED AS HELL AND DOESNT EVEN WORK RIGHT
        fusedObjects=0
        var objectsToDestroy=[]
        for(var i=0;i<instance_number(objectType);i++)
        {
            try{
                var _inst=instance_find(objectType,i)
                for(var t=0;t<instance_number(objectType);t++)
                {
                    var _inst2=instance_find(objectType,t)
                    if(_inst!=_inst2&&_inst.object_index==objectType&&_inst2.object_index==objectType&&_inst.alarm[0]<=0&&_inst.alarm[0]<=0)
                    {
						var _bothColored=variable_instance_exists(_inst,"colorID")&&variable_instance_exists(_inst2,"colorID")&&_inst.colorID==_inst2.colorID
						if(instance_exists(_inst)&&instance_exists(_inst2)&&(!variable_instance_exists(_inst,"colorID")&&!variable_instance_exists(_inst2,"colorID")||_bothColored))
						{
	                        if(_inst.bbox_right==_inst2.bbox_right&&_inst.bbox_left==_inst2.bbox_left&&abs(_inst.bbox_top-_inst2.bbox_bottom)<2)
	                        {
								var combinedYscale=_inst.image_yscale+_inst2.image_yscale
	                            var _newInstPosition={x:_inst.x,y: (_inst.y*_inst.image_yscale+_inst2.y*_inst2.image_yscale)/combinedYscale}
	                            var _inst3=instance_create_depth(_newInstPosition.x,_newInstPosition.y,_inst.depth,objectType)
	                            _inst3.image_yscale=combinedYscale
								_inst3.image_xscale=max(_inst.image_xscale,_inst2.image_xscale)
								if(_bothColored)
								{
									_inst3.colorID=_inst.colorID
								}
	                            fusedObjects++
	                            totalFusedObjects++
	                            instance_destroy(_inst)
	                            instance_destroy(_inst2)
	                        }
						}
                    }
                }
            }
            catch(e){
                i--
				//show_debug_message(e)
            }
        }
        show_debug_message("fused "+string(totalFusedObjects)+" objects!")
    }
}