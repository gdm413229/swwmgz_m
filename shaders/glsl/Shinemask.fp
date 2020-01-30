vec4 ProcessLight( vec4 color )
{
	float mask = texture(masktex,vTexCoord.st).x;
	vec3 rnorm = normalize(vEyeNormal.xyz)*(1,-1,1);
	return vec4(color.rgb*(1.+mask.x),color.a);
}

vec4 ProcessTexel()
{
	vec4 base = getTexel(vTexCoord.st);
	float mask = texture(masktex,vTexCoord.st).x;
	vec3 rnorm = normalize(vEyeNormal.xyz)*(1,-1,1);
	return vec4(base.rgb+texture(envtex,rnorm.xy*.49+.5).rgb*mask,base.a);
}
