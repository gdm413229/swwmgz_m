const float pi = 3.14159265358979323846;

void SetupMaterial( inout Material mat )
{
	vec2 p = 2.*(vTexCoord.st-.5);
	float a = atan(p.y,p.x);
	float a2 = atan(p.y,abs(p.x));
	float r = length(p);
	// noise burst
	vec2 ccoord = vec2(.1/r-.06*timer+.5*r,a/pi+.04*timer);
	vec2 ccoord2 = vec2(ccoord.x,a2/pi+.04*timer);
	vec3 nz = textureGrad(warptex,ccoord,dFdx(ccoord2),dFdy(ccoord2)).rgb;
	ccoord = vec2(.4/r-.08*timer+1.4*r,a/pi-.04*timer);
	ccoord2 = vec2(ccoord.x,a2/pi-.04*timer);
	nz += textureGrad(warptex,ccoord,dFdx(ccoord2),dFdy(ccoord2)).rgb;
	nz = clamp((nz-1.)*.5,-1.,1.);
	nz *= abs(2.*r-1.);
	// shimmering flare
	vec3 flr = vec3(1.-r*2.);
	ccoord = vec2(2.*a/pi-timer*.05,0.);
	ccoord2 = vec2(2.*a2/pi-timer*.05,0.);
	flr += vec3(.6,.3,.4)*textureGrad(snoisetex,ccoord,dFdx(ccoord2),dFdy(ccoord2)).r;
	ccoord = vec2(3.*a/pi+timer*.07,0.);
	ccoord2 = vec2(3.*a2/pi+timer*.07,0.);
	flr += vec3(.1,.2,.9)*textureGrad(snoisetex,ccoord,dFdx(ccoord2),dFdy(ccoord2)).g;
	ccoord = vec2(a/pi-timer*.09,0.);
	ccoord2 = vec2(a2/pi-timer*.09,0.);
	flr += vec3(.4,.7,.3)*textureGrad(snoisetex,ccoord,dFdx(ccoord2),dFdy(ccoord2)).b;
	// readjust flare
	flr = pow(max(flr,0.),vec3(.5));
	// distort by flare
	nz.x -= p.x*min(min(flr.r,flr.g),flr.b)*max(1.-r,0.);
	nz.y -= p.y*min(min(flr.r,flr.g),flr.b)*max(1.-r,0.);
	// readjust flare
	flr = pow(max(flr,0.),vec3(8.));
	// color flicker
	flr *= .4+.6*texture(snoisetex,vTexCoord.st*.02/r+.02*timer).rgb;
	// sample ring
	vec3 col = getTexel(vTexCoord.st+(nz.xy*.1)).rgb;
	// overlay flare
	col *= max(1.-pow(flr.b,.25),0.);
	col += flr;
	// debug: uncomment to show bumpmap
	//col = vec3((nz.x+.5)*.5,(nz.y+.5)*.5,1.);
	mat.Base = vec4(col,1.);
}
