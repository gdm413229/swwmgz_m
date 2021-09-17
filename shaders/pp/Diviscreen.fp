// the ultimate refreshment

void main()
{
	vec2 uv = TexCoord;
	vec2 bresl = textureSize(InputTexture,0);
	vec2 sr = vec2(1.,bresl.y/bresl.x);
	vec3 ice = texture(BumpTex,uv*sr*4.).xyz;
	vec2 ofs = (ice.xy-.5)*2.;
	ofs *= pow(length(ofs),.25)*.4*str;
	float dist = distance(uv,vec2(.5))*2.;
	float distfct = clamp(pow(dist,1.2)*.85-(.75+.5*(1.-str)),0.,1.);
	ofs *= distfct;
	vec3 col = texture(InputTexture,uv+ofs).rgb;
	col += pow(max(0,ice.z),1.45)*.65*str*distfct;
	float str2 = str*(.9+texture(NoiseTex,vec2(timer*.05)).x*.2);
	float ang = timer*.05;
	uv *= sr;
	uv.x += 1.*sr.x;
	vec2 uv2 = vec2(uv.x*cos(ang)-uv.y*sin(ang),uv.y*cos(ang)+uv.x*sin(ang))*1.3;
	float smk = texture(WarpTex,uv2).x;
	uv.y -= 2.*sr.y;
	ang = timer*.03;
	uv2 = vec2(uv.x*cos(ang)-uv.y*sin(ang),uv.y*cos(ang)+uv.x*sin(ang))*1.5;
	smk += texture(WarpTex,uv2).x;
	uv.x -= 3.*sr.x;
	ang = timer*.04;
	uv2 = vec2(uv.x*cos(ang)-uv.y*sin(ang),uv.y*cos(ang)+uv.x*sin(ang))*1.6;
	smk += texture(WarpTex,uv2).x;
	uv.y += 4.*sr.y;
	ang = timer*.02;
	uv2 = vec2(uv.x*cos(ang)-uv.y*sin(ang),uv.y*cos(ang)+uv.x*sin(ang))*1.2;
	smk += texture(WarpTex,uv2).x;
	smk = pow(max(0,smk*.25),4.);
	col += vec3(.8,1.,1.2)*smk*2.*str2;
	FragColor = vec4(col,1.);
}
