// invinciball radial sharpening

vec3 sharpened( vec2 uv )
{
	vec3 col = texture(InputTexture,uv).rgb*9.;
	vec2 bresl = vec2(textureSize(InputTexture,0));
	vec2 bof = vec2(1./bresl.x,1./bresl.y);
	col -= texture(InputTexture,uv+vec2(bof.x,0)).rgb;
	col -= texture(InputTexture,uv+vec2(2.*bof.x,0)).rgb;
	col -= texture(InputTexture,uv+vec2(-bof.x,0)).rgb;
	col -= texture(InputTexture,uv+vec2(-2.*bof.x,0)).rgb;
	col -= texture(InputTexture,uv+vec2(0,bof.y)).rgb;
	col -= texture(InputTexture,uv+vec2(0,2.*bof.y)).rgb;
	col -= texture(InputTexture,uv+vec2(0,-bof.y)).rgb;
	col -= texture(InputTexture,uv+vec2(0,-2.*bof.y)).rgb;
	return col;
}

void main()
{
	vec2 uv = TexCoord;
	vec3 col = texture(InputTexture,uv).rgb;
	float p = distance(uv,vec2(.5));
	for ( float i=0.; i<4.; i+=1. )
	{
		vec2 suv = fract((uv-.5)*(1.-.01*i*(.3+str*4.))+.5);
		col += sharpened(suv)*pow(p,2.4)*vec3(1.2,.7,.2)*(.4+str);
	}
	FragColor = vec4(col,1.0);
}
