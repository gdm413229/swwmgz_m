vec4 ProcessLight( vec4 color )
{
	vec3 bright = texture(brighttex,vTexCoord.st).rgb;
	return vec4(min(color.rgb+bright,1.),color.a);
}

vec4 ProcessTexel()
{
	vec4 base = getTexel(vTexCoord.st);
	float mask = texture(masktex,vTexCoord.st).x;
	vec3 rnorm = normalize(vEyeNormal.xyz)*vec3(1,-1,1);
	return vec4(base.rgb+texture(envtex,rnorm.xy*.49+.5).rgb*mask,base.a);
}
