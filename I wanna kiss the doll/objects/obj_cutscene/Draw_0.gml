var _data = video_draw();
if(_data[0] == 0)
{
	switch(video_get_format())
	{
		case video_format_rgba:
			var _surf = _data[1];
			draw_surface(_surf,0,0);
		break;
	
		//  #### YUV PART HERE ####
		case video_format_yuv:
			var _surf = _data[1];
			var _chromasurf = _data[2];
			if(surface_exists(_surf) and surface_exists(_chromasurf))
			{
				var _videochromasampler = shader_get_sampler_index(shader_YUV, "v_chroma");
				shader_set(shader_YUV);
			
				var _tex_id = surface_get_texture(_surf);
				var _chroma_tex_id = surface_get_texture(_chromasurf);
				texture_set_stage(_videochromasampler, _chroma_tex_id);
				gpu_set_texfilter(false);
			
				draw_primitive_begin_texture(pr_trianglestrip, _tex_id);
			        draw_vertex_texture(0, 0, 0, 0);
				draw_vertex_texture(surface_get_width(_chromasurf), 0, 1, 0);
				draw_vertex_texture(0, surface_get_height(_chromasurf), 0, 1);
				draw_vertex_texture(surface_get_width(_chromasurf), surface_get_height(_chromasurf), 1, 1);
				draw_primitive_end();
			
				gpu_set_texfilter(true);
				shader_reset();
			}
		break;
	}
}

if(video_get_status() == video_status_closed)
{
	room_goto(rm_level1)
}