extends Label

var startTime : float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var now := OS.get_system_time_msecs()
	var elapsed = now - startTime

	text = String(elapsed/1000.0)


func _on_Button_pressed():
	startTime = OS.get_system_time_msecs()

