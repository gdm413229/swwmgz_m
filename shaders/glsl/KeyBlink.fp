vec4 ProcessLight( vec4 color )
{
	if ( mod(timer*35.,20.) < 10. )
		color.rgb = vec3(1.);
	return color;
}

vec4 ProcessTexel()
{
	vec2 uv = vTexCoord.st*vec2(.5,1.);
	if ( mod(timer*35.,20.) >= 10. ) uv.x += .5;
	return getTexel(uv);
}
