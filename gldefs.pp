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
