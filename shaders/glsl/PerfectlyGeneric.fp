void SetupMaterial( inout Material mat )
{
	vec3 light = vec3(-.6,.7,.8);
	vec4 col = getTexel(vTexCoord.st);
	col.rgb *= max(dot(normalize(vEyeNormal.xyz),light),.25);
	col.rgb += vec3(.2)*pow(max(dot(normalize(vEyeNormal.xyz),light),0.),4.);
	mat.Base = col;
}
