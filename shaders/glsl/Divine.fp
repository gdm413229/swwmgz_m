// divine sprite corona

const float pi = 3.14159265358979323846;

void SetupMaterial( inout Material mat )
{
	vec2 p = 2.*(vTexCoord.st-.5);
	float a = atan(p.y,p.x);
	float a2 = atan(p.y,abs(p.x));
	a = floor((a*16.)/pi);
	float r = length(p);
	// shimmering flare
	vec3 col = vec3(.98,.92,.94)*(.5-r*2.);
	vec2 ccoord = vec2(2.*a/pi-timer*.05,0.);
	vec2 ccoord2 = vec2(2.*a2/pi-timer*.05,0.);
	col += textureGrad(snoisetex,ccoord,dFdx(ccoord2),dFdy(ccoord2)).xxx;
	col = pow(max(col*.5,0.),vec3(1.5));
	// glow
	col += vec3(.6,0.9,1.)*pow(max(1.-r,0.),3.5+texture(snoisetex,vec2(timer*.1)).x*.5);
	mat.Base = vec4(col,1.);
	mat.Normal = ApplyNormalMap(vTexCoord.st);
}
