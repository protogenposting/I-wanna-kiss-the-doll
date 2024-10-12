video_open("cutscene1.mp4")

var _format = video_get_format();
if (_format == video_format_yuv)
{
    videochromasampler = shader_get_sampler_index(shader_YUV, "v_chroma");
}