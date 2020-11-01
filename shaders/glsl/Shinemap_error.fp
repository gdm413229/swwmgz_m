vec4 ProcessLight( vec4 color )
{
	float glow = .75+.25*sin(timer*8);
	return vec4(vec3(glow),color.a);
}

vec4 ProcessTexel()
{
	vec3 rnorm = normalize(vEyeNormal.xyz)*vec3(1,-1,1);
	return getTexel(rnorm.xy*.49+.5);
}
