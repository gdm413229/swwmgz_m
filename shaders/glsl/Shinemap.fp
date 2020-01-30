vec4 ProcessTexel()
{
	vec3 rnorm = normalize(vEyeNormal.xyz)*(1,-1,1);
	return getTexel(rnorm.xy*.49+.5);
}
