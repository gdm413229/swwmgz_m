float rnd2( in vec2 sd )
{
    return fract(cos(dot(sd*floor(Timer*15.0),vec2(145.34,142.55)))*2745.84);
}
float rnd( in float sd )
{
    return rnd2(vec2(sd,1.0));
}

void main()
{
	vec2 coord = TexCoord;
	vec2 uv_c[3] = vec2[3](coord,coord,coord);
	vec2 blka = floor(coord*vec2(22.0,12.0));
	vec2 blkb = floor(coord*vec2(6.0,9.0));
	float noiz = pow(rnd2(blka),6.4)*pow(rnd2(blkb),8.6)-pow(rnd(4.53),19.3)*str2;
	uv_c[0].x += str1*noiz*(rnd(3.35)-0.5);
	uv_c[1].x += str1*noiz*(rnd(4.63)-0.5);
	uv_c[2].x += str1*noiz*(rnd(5.62)-0.5);
	uv_c[0].y += str1*noiz*(rnd(4.55)-0.5);
	uv_c[1].y += str1*noiz*(rnd(3.67)-0.5);
	uv_c[2].y += str1*noiz*(rnd(5.54)-0.5);
	vec4 res;
	res.r = texture(InputTexture,uv_c[0]).r;
	res.g = texture(InputTexture,uv_c[1]).g;
	res.b = texture(InputTexture,uv_c[2]).b;
	res.a = 1.0;
	FragColor = res;
}
