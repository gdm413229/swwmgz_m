const float pi = 3.14159265358979323846;

vec4 ProcessTexel()
{
	vec2 p = 2.*(vTexCoord.st-.5);
	float a = atan(p.y,p.x);
	float r = length(p);
	// noise burst
	vec2 ccoord = vec2(.1/r-.06*timer+.5*r,a/pi+.04*timer);
	vec3 nz = texture(warptex,ccoord).rgb;
	ccoord = vec2(.4/r-.08*timer+1.4*r,a/pi-.04*timer);
	nz += texture(warptex,ccoord).rgb;
	nz = clamp((nz-1.)*.5,-1.,1.);
	nz *= abs(2.*r-1.);
	// sample ring
	vec3 col = getTexel(vTexCoord.st+(nz.xy*.1)).rgb;
	// debug: uncomment to show bumpmap
	//col = vec3((nz.x+.5)*.5,(nz.y+.5)*.5,1.);
	return vec4(col,1.);
}
