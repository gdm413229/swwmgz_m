// perfectly generic cube fake shading

void SetupMaterial( inout Material mat )
{
	mat.Base = getTexel(vTexCoord.st);
	mat.Normal = ApplyNormalMap(vTexCoord.st);
}

vec4 ProcessLight( Material mat, vec4 color )
{
	vec3 light = vec3(-.6,.7,.8);
	float val = max(dot(normalize(vEyeNormal.xyz),light),.25);
	val += .2*pow(max(dot(normalize(vEyeNormal.xyz),light),0.),4.);
	float mixfct = mix(1.,.5,floor(abs(vTexCoord.s-.5)*2.133333));
	mixfct = mix(mixfct,.5,floor(abs(vTexCoord.t-.5)*2.13333));
	val *= mixfct;
	return vec4(vec3(val),color.a);
}
