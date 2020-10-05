void main()
{
	vec2 coord = TexCoord;
	vec4 res = texture(InputTexture,coord)*16.;
	float cnt = 16.;
	vec2 px = 1./textureSize(InputTexture,0);
	vec2 nc;
	int i, j;
	for ( j=-2; j<=2; j++ ) for ( i=-2; i<=2; i++ )
	{
		nc = coord+px*vec2(i,j);
		res += texture(InputTexture,nc);
		cnt += 1.;
	}
	res /= cnt;
	res.rgb *= vec3(1.19,.94,.87);
	res.rgb = pow(res.rgb,vec3(.81,.99,1.17));
	vec2 uv = TexCoord.xy*(1.-TexCoord.yx)*4.;
	float dist = 1.-(uv.x*uv.y);
	dist = clamp(pow(dist,1.5)*1.2-.3,0.,1.);
	res.rgb = mix(res.rgb,vec3(0.),dist);
	FragColor = res;
}
