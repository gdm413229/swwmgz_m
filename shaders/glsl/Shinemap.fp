// pseudo-matcap

void SetupMaterial( inout Material mat )
{
	vec3 rnorm = normalize(vEyeNormal.xyz)*vec3(1,-1,1);
	mat.Base = getTexel(rnorm.xy*.49+.5);
	mat.Normal = ApplyNormalMap(vTexCoord.st);
}
