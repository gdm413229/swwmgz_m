void main()
{
	vec2 uv = TexCoord;
	vec3 col = texture(InputTexture,uv).rgb;
	float p = distance(uv,vec2(.5))/sqrt(2.);
	for ( float i=0.; i<4.; i+=1. )
	{
		vec2 suv = fract((.5-uv)*(1.-i*p*p)+.5);
		col += texture(InputTexture,suv).rgb*pow(p,2.)*vec3(.6,.8,1.3);
	}
	FragColor = vec4(col,1.0);
}
