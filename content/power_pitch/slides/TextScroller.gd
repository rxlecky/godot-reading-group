extends RichTextLabel

var delayTime = 2.0

func _ready():
	percent_visible = 0.0

func _process(delta):
	percent_visible += delta * 0.01
	delayTime -= delta
	if delayTime < 0:
		rect_position.y -= delta * 140.0
