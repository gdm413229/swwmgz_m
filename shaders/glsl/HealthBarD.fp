// bloomy healthbar with flicker

void SetupMaterial( inout Material mat )
{
	float gauss10[10] = float[10]
	(
		.199471, .176033, .120986, .064759, .026996,
		.008764, .002216, .000436, .000067, .000008
	);
	vec2 coord = vTexCoord.st;
	vec2 bresl = textureSize(tex,0);
	vec2 bof = 1./bresl;
	bof *= .9+.4*texture(noisetex,vec2(fract(timer*.05))).x;
	vec4 col = texture(tex,coord);
	int i, j;
	for ( j=-9; j<=9; j++ ) for ( i=-9; i<=9; i++ )
		col += gauss10[abs(i)]*gauss10[abs(j)]*texture(tex,coord+vec2(i,j)*bof);
	mat.Base = vec4(col.rgb,1.);
}
