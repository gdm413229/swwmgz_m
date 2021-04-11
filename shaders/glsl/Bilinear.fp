// This should act as Bilinear filtering when texture filtering is disabled

vec4 ProcessTexel()
{
	vec2 size = textureSize(tex,0);
	vec2 pxsize = vec2(1./size.x,1./size.y);
	vec2 pos = vTexCoord.st;
	float a = fract(pos.x*size.x);
	float b = fract(pos.y*size.y);
	vec4 p0q0 = texture(tex,pos);
	vec4 p1q0 = texture(tex,pos+vec2(pxsize.x,0));
	vec4 p0q1 = texture(tex,pos+vec2(0,pxsize.y));
	vec4 p1q1 = texture(tex,pos+vec2(pxsize.x,pxsize.y));
	vec4 pInterp_q0 = mix(p0q0,p1q0,a);
	vec4 pInterp_q1 = mix(p0q1,p1q1,a);
	return mix(pInterp_q0,pInterp_q1,b);
}
