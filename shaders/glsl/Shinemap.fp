vec4 ProcessTexel( vec4 color )
{
	return vec4(1.);
}

vec4 ProcessTexel()
{
	vec3 rnorm = normalize(vEyeNormal.xyz)*(1,-1,1);
	return getTexel(rnorm.xy*.49+.5);
}
