#define TWOPI 6.28318530718

void main()
{
	vec2 uv = TexCoord;
	vec3 col = texture(InputTexture,uv).rgb;
	col *= vec3(.8)+texture(WarpTex,vec2(fract(uv.x+.1*sin(uv.y*TWOPI)),fract(uv.y-timer*.1))).rgb*xtrastr*.4;
	col *= vec3(.8)+texture(WarpTex,2.*vec2(fract(uv.x+.1*cos(uv.y*TWOPI)),fract(uv.y-timer*.1))).rgb*xtrastr*.4;
	for ( float i=0.; i<3.; i+=1. )
	{
		float str = texture(NoiseTex,vec2(fract(timer*.2),fract(timer*.02))).x*.007;
		str *= pow(xtrastr,2.);
		float p = distance(uv,vec2(.5));
		vec2 suv = (uv-.5)*(1.-(str*i*p))+.5;
		col += texture(InputTexture,suv).rgb+pow(p,5.)*vec3(.45,.05,0.)*xtrastr;
	}
	col /= 4.;
	col *= vec3(1.1,.95,.85);
	FragColor = vec4(col,1.0);
}
