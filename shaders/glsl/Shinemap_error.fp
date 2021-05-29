// pseudo-matcap + ambient glow

void SetupMaterial( inout Material mat )
{
	vec3 rnorm = normalize(vEyeNormal.xyz)*vec3(1,-1,1);
	float glow = .75+.25*sin(timer*8);
	mat.Base = getTexel(rnorm.xy*.49+.5);
	mat.Bright = vec4(vec3(glow),1.);
}
