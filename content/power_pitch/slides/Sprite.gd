
extends CanvasItem

var orbitX : float
var orbitY : float
var zoom : float

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP and zoom < 6:
			zoom += 1
			var m = get_material() as ShaderMaterial
			m.set_shader_param("zoom", zoom);
		elif event.button_index == BUTTON_WHEEL_DOWN and zoom > -20:
			zoom -= 1
			var m = get_material() as ShaderMaterial
			m.set_shader_param("zoom", zoom);

func _process(delta):
	if (Input.is_mouse_button_pressed(BUTTON_LEFT)):
		orbitX -= get_local_mouse_position().x/OS.get_screen_size().x*700.0 * delta
		orbitY += get_local_mouse_position().y/OS.get_screen_size().y*500.0 * delta
		orbitX = clamp(orbitX, -20.0, 20.0)
		orbitY = clamp(orbitY, -5.0, 8.0)
		var m = get_material() as ShaderMaterial
		m.set_shader_param("camOrbitX", orbitX);
		m.set_shader_param("camOrbitY", orbitY);
