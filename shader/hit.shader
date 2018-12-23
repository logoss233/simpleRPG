shader_type canvas_item;
uniform bool isOn=false;
void fragment() {
	COLOR=texture(TEXTURE,UV);
	if (isOn){
		COLOR.gb=vec2(0.0,0.0);
	}
}