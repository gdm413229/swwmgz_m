HardwareShader PostProcess beforebloom
{
	Name "WaterWarp"
	Shader "shaders/pp/WaterWarp.fp" 330
	Texture warptex "textures/warptex.png"
	Texture fluidtex "textures/wetwarp.png"
	Uniform float dfact
	Uniform float timer
	Uniform vec3 lightcol
}
HardwareShader PostProcess beforebloom
{
	Name "LavaWarp"
	Shader "shaders/pp/LavaWarp.fp" 330
	Texture warptex "textures/warptex.png"
	Texture fluidtex "textures/lavawarp.png"
	Uniform float dfact
	Uniform float timer
	Uniform vec3 lightcol
}
HardwareShader PostProcess beforebloom
{
	Name "SlimeWarp"
	Shader "shaders/pp/SlimeWarp.fp" 330
	Texture warptex "textures/warptex.png"
	Texture fluidtex "textures/slimewarp.png"
	Uniform float dfact
	Uniform float timer
	Uniform vec3 lightcol
}
HardwareShader PostProcess beforebloom
{
	Name "ZoomBlur"
	Shader "shaders/pp/ZoomBlur.fp" 330
	Uniform float Str
	Uniform float Fade
	Uniform vec2 CenterSpot
}
HardwareShader PostProcess beforebloom
{
	Name "SilverScope"
	Shader "shaders/pp/SilverScope.fp" 330
}
HardwareShader PostProcess beforebloom
{
	Name "BarrierShader"
	Shader "shaders/pp/Barrier.fp" 330
	Texture WarpTex "textures/heattex.png"
	Uniform float timer
}
HardwareShader PostProcess beforebloom
{
	Name "GhostShader"
	Shader "shaders/pp/Ghostscreen.fp" 330
}
HardwareShader PostProcess scene
{
	Name "InvinciShader"
	Shader "shaders/pp/Invinciscreen.fp" 330
	Uniform float str
}

HardwareShader PostProcess scene
{
	Name "RagekitShader"
	Shader "shaders/pp/Ragescreen.fp" 330
	Texture WarpTex "textures/ragewarp.png"
	Texture NoiseTex "textures/graynoise.png"
	Uniform float timer
	Uniform float xtrastr
}
HardwareShader PostProcess scene
{
	Name "RagekitAltShader"
	Shader "shaders/pp/RagescreenAlt.fp" 330
	Texture WarpTex "textures/ragewarp.png"
	Texture NoiseTex "textures/graynoise.png"
	Uniform float timer
	Uniform float xtrastr
}

HardwareShader PostProcess scene
{
	Name "Glitch"
	Shader "shaders/pp/Glitch.fp" 330
	Uniform float Timer
	Uniform float str1
	Uniform float str2
}
HardwareShader PostProcess scene
{
	Name "Grain"
	Shader "shaders/pp/Grain.fp" 330
	Uniform float Timer
	Uniform float ni
	Texture NoiseTexture "textures/rgbnoise.png"
}
