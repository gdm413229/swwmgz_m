#define overlay(a,b) (a<0.5)?(2.0*a*b):(1.0-(2.0*(1.0-a)*(1.0-b)))
const float pi = 3.14159265358979323846;

vec2 warpcoord( in vec2 uv )
{
	vec2 offset = vec2(0,0);
	offset.y = sin(pi*2.*(uv.x*8.+timer*.25))*.005;
	offset.x = cos(pi*2.*(uv.y*4.+timer*.25))*.005;
	return fract(uv+offset);
}

// based on gimp color to alpha, but simplified
vec4 blacktoalpha( in vec4 src )
{
	vec4 dst = src;
	float dist = 0., alpha = 0.;
	float d, a;
	a = clamp(dst.r,0.,1.);
	if ( a > alpha )
	{
		alpha = a;
		dist = d;
	}
	a = clamp(dst.g,0.,1.);
	if ( a > alpha )
	{
		alpha = a;
		dist = d;
	}
	a = clamp(dst.b,0.,1.);
	if ( a > alpha )
	{
		alpha = a;
		dist = d;
	}
	if ( alpha > 0. )
	{
		float ainv = 1./alpha;
		dst.rgb *= ainv;
	}
	dst.a *= alpha;
	return dst;
}

void SetupMaterial( inout Material mat )
{
	// y'all ready for this multilayered madness?
	vec2 uv = vTexCoord.st;
	// base blank layer, copy
	vec4 base = texture(LogoTex,uv*vec2(.5,.25));
	// first layer, blend
	vec4 tmp = texture(LogoTex,uv*vec2(.5,.25)+vec2(0.,.25));
	base.rgb = mix(base.rgb,tmp.rgb,tmp.a);
	// second layer, warp then add
	tmp = texture(LogoTex,warpcoord(uv)*vec2(.5,.25)+vec2(0.,.5));
	base.rgb += tmp.rgb;
	// third layer, multiply
	tmp = texture(LogoTex,uv*vec2(.5,.25)+vec2(0.,.75));
	base.rgb *= tmp.rgb;
	// fourth layer, add
	tmp = texture(LogoTex,uv*vec2(.5,.25)+vec2(.5,0.));
	base.rgb += tmp.rgb;
	// fifth layer, add
	tmp = texture(LogoTex,uv*vec2(.5,.25)+vec2(.5,.25));
	base.rgb += tmp.rgb;
	// sixth layer, overlay (w/ alpha blend)
	tmp = texture(LogoTex,uv*vec2(.5,.25)+vec2(.5,.5));
	vec4 tmp2;
	tmp2.r = overlay(base.r,tmp.r);
	tmp2.g = overlay(base.g,tmp.g);
	tmp2.b = overlay(base.b,tmp.b);
	base.rgb = mix(base.rgb,tmp2.rgb,tmp.a);
	// black to alpha
	base = blacktoalpha(base);
	// add alpha of first layer
	tmp = texture(LogoTex,uv*vec2(.5,.25)+vec2(0.,.25));
	base.a += tmp.a;
	// clamp
	base = clamp(base,0.,1.);
	// seventh layer, alpha blend
	tmp = texture(LogoTex,uv*vec2(.5,.25)+vec2(.5,.75));
	tmp2.a = tmp.a+base.a*(1-tmp.a);
	tmp2.rgb = (tmp.rgb*tmp.a+base.rgb*base.a*(1-tmp.a))/tmp2.a;
	if ( tmp2.a == 0. ) tmp2.rgb = vec3(0.);
	// clamp borders
	vec2 sz = vec2(256,128);
	vec2 px = uv*sz;
	if ( (px.x <= 1) || (px.x >= (sz.x-1)) || (px.y <= 1) || (px.y >= (sz.y-1)) )
		tmp2 = vec4(0.);
	// ding, logo's done
	mat.Base = tmp2;
}

