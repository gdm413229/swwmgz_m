float rnd2( in vec2 sd )
{
	float rnv = sin(sd.x*3436.351)*cos(sd.y*1235.734)*6734.342;
	rnv = float(int(rnv)%256)/256.;
	return rnv;
}
float rnd( in float sd )
{
	return rnd2(vec2(sd,1.));
}
void main()
{
	vec2 coord = TexCoord;
	vec4 res = texture(InputTexture,coord+.02*vec2(rnd(Timer*.4536),rnd(Timer*.7835)));
	res += texture(InputTexture,coord-.02*vec2(rnd(Timer*.6735),rnd(Timer*.4335)));
	res = .6*texture(InputTexture,coord)+.4*res;
	FragColor = res;
}
