HardwareShader PostProcess beforebloom
{
	Name "BarrierShader"
	Shader "shaders/glsl/Barrier.fp" 330
	Texture WarpTex "textures/heattex.png"
	Uniform float timer
}
HardwareShader PostProcess beforebloom
{
	Name "GhostShader"
	Shader "shaders/glsl/Ghostscreen.fp" 330
}
HardwareShader PostProcess scene
{
	Name "InvinciShader"
	Shader "shaders/glsl/Invinciscreen.fp" 330
	Uniform float str
}

HardwareShader PostProcess scene
{
	Name "RagekitShader"
	Shader "shaders/glsl/Ragescreen.fp" 330
	Texture WarpTex "textures/ragewarp.png"
	Texture NoiseTex "textures/graynoise.png"
	Uniform float timer
	Uniform float xtrastr
}

HardwareShader PostProcess scene
{
	Name "Glitch"
	Shader "shaders/glsl/Glitch.frag" 330
	Uniform float Timer
	Uniform float str1
	Uniform float str2
}
HardwareShader PostProcess scene
{
	Name "Grain"
	Shader "shaders/glsl/Grain.frag" 330
	Uniform float Timer
	Uniform float ni
	Texture NoiseTexture "textures/rgbnoise.png"
}
