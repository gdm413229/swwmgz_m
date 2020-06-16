#define PI 3.14159265

void main()
{
	vec2 uv = TexCoord.st;
	vec3 base = texture(InputTexture,uv).rgb;
	vec2 bof = 1.0/textureSize(InputTexture,0);
	int rsamples, tstep = 1;
	vec2 bstr = bof*4.0;
	float bstep;
	vec2 rcoord;
	for ( int i=1; i<=5; i++ )
	{
		rsamples = i*3;
		for ( int j=0; j<rsamples; j++ )
		{
			bstep = PI*2.0/rsamples;
			rcoord = vec2(cos(j*bstep),sin(j*bstep))*i;
			tstep++;
			base.rgb += texture(InputTexture,uv+rcoord*bstr).rgb;
		}
	}
	base /= tstep;
	vec2 p = vec2(.5)-uv;
	vec2 sz = textureSize(InputTexture,0);
	if ( sz.x > sz.y ) p.x *= sz.x/sz.y;
	else p.y *= sz.y/sz.x;
	vec3 col = texture(InputTexture,uv+p*pow(length(p),8.)*20.).rgb;
	col = (col+.02)*.98*vec3(1.2,.6,.15);
	float fade = 1.-clamp(pow(length(p)*2.,40.),0.,1.);
	FragColor = vec4(mix(base*.05,col,vec3(fade)),1.);
}
