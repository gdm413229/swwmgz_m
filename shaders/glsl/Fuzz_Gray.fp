float rnd( in vec2 sd )
{
	//return cos(sd.y*3874.8674+sd.x*6783.5325)*2737.8474;
	// use noise tex instead of trig-based PRNG, much better and doesn't break on intel
	return texelFetch(noisetex,ivec2(mod(sd.x,256.),mod(sd.y,256.)),0).x;
}

// haha are you telling me I can't declare arrays like in C?
// what the fuck even is this insane syntax?
const vec3 layers[3] =
vec3[](
	vec3(1.01,1.07,1.05),
	vec3(1.06,1.04,1.03),
	vec3(1.05,1.03,1.01)
);
const float speed[3] =
float[](
	.5526,
	.7843,
	.3725
);
const float zoom[3] =
float[](
	1.,
	2.,
	3.
);

void SetupMaterial( inout Material mat )
{
	vec2 coord;
	vec3 col = vec3(1.);
	for ( int i=0; i<3; i++ )
	{
		coord = floor(vTexCoord.st*vec2(100.,12.)/zoom[i]);
		col *= layers[i]*2.0*abs(fract(rnd(coord)+timer*speed[i])-0.5);
	}
	col += getTexel(vTexCoord.st).rgb;
	mat.Base = vec4(col,1.);
}
