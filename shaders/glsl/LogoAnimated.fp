// animated SWWM GZ logo

#define overlay(a,b) (a<0.5)?(2.0*a*b):(1.0-(2.0*(1.0-a)*(1.0-b)))
const float pi = 3.14159265358979323846;

vec2 warpcoord( in vec2 uv )
{
	vec2 offset;
	offset.y = sin(pi*2.*(uv.x*8.+timer*.25))*.005;
	offset.x = cos(pi*2.*(uv.y*4.+timer*.25))*.005;
	return uv+offset;
}

// based on gimp color to alpha, but simplified
vec4 blacktoalpha( in vec4 src )
{
	vec4 dst = src;
	float alpha = 0.;
	float a;
	a = clamp(dst.r,0.,1.);
	if ( a > alpha ) alpha = a;
	a = clamp(dst.g,0.,1.);
	if ( a > alpha ) alpha = a;
	a = clamp(dst.b,0.,1.);
	if ( a > alpha ) alpha = a;
	if ( alpha > 0. )
	{
		float ainv = 1./alpha;
		dst.rgb *= ainv;
	}
	dst.a *= alpha;
	return dst;
}
#ifdef NO_BILINEAR
#define BilinearSample(x,y,z,w) texture(x,y)
#else
vec4 BilinearSample( in sampler2D tex, in vec2 pos, in vec2 size, in vec2 pxsize )
{
	vec2 f = fract(pos*size);
	pos += (.5-f)*pxsize;
	vec4 p0q0 = texture(tex,pos);
	vec4 p1q0 = texture(tex,pos+vec2(pxsize.x,0));
	vec4 p0q1 = texture(tex,pos+vec2(0,pxsize.y));
	vec4 p1q1 = texture(tex,pos+vec2(pxsize.x,pxsize.y));
	vec4 pInterp_q0 = mix(p0q0,p1q0,f.x);
	vec4 pInterp_q1 = mix(p0q1,p1q1,f.x);
	return mix(pInterp_q0,pInterp_q1,f.y);
}
#endif

void SetupMaterial( inout Material mat )
{
	// store these to save some time
	vec2 size = vec2(textureSize(Layer1,0));
	vec2 pxsize = 1./size;
	// y'all ready for this multilayered madness?
	vec2 uv = vTexCoord.st;
	// base blank layer
	vec4 base = vec4(0.,0.,0.,1.);
	// first layer, blend
	vec4 tmp = BilinearSample(Layer1,uv,size,pxsize);
	base.rgb = mix(base.rgb,tmp.rgb,tmp.a);
	// second layer, warp then add
	tmp = BilinearSample(Layer2,warpcoord(uv),size,pxsize);
	base.rgb += tmp.rgb;
	// third layer, multiply
	tmp = BilinearSample(Layer3,uv,size,pxsize);
	base.rgb *= tmp.rgb;
	// fourth layer, add
	tmp = BilinearSample(Layer4,uv,size,pxsize);
	base.rgb += tmp.rgb;
	// fifth layer, add
	tmp = BilinearSample(Layer5,uv,size,pxsize);
	base.rgb += tmp.rgb;
	// first layer again, overlay (w/ alpha blend)
	tmp = BilinearSample(Layer1,uv,size,pxsize);
	vec4 tmp2;
	tmp2.r = overlay(base.r,tmp.r);
	tmp2.g = overlay(base.g,tmp.g);
	tmp2.b = overlay(base.b,tmp.b);
	base.rgb = mix(base.rgb,tmp2.rgb,tmp.a);
	// black to alpha
	base = blacktoalpha(base);
	// add alpha of first layer
	base.a += BilinearSample(Layer1,uv,size,pxsize).a;
	// clamp
	base = clamp(base,vec4(0.),vec4(1.));
	// sixth layer, alpha blend
	tmp = BilinearSample(Layer6,uv,size,pxsize);
	tmp2.a = tmp.a+base.a*(1-tmp.a);
	tmp2.rgb = (tmp.rgb*tmp.a+base.rgb*base.a*(1-tmp.a))/tmp2.a;
	// ding, logo's done
	mat.Base = tmp2;
}
