tool
extends TextEdit


export var class_color: = Color(0.26, 1, 0.76, 1.0)
export var member_color: = Color(0.6, 1.0, 0.6)
export var keyword_color: = Color(1.0, 0.6, 0.6)
export var quotes_color: = Color(1.0, 1.0, 0.6)
export var comment_color: = Color(0.8, 0.81, 0.83, 0.5)
export(String, FILE, "*.json") var keyword_data_path: = "res://slide/widgets/text_edit/keywords.json"

export(Script) var target_script : Script = null setget _set_target_script


func _ready() -> void:
	add_color_region('"', '"', quotes_color)
	add_color_region("'", "'", quotes_color)
	add_color_region("#", "", comment_color)
	for c in ClassDB.get_class_list():
		add_keyword_color(c, class_color)
		for m in ClassDB.class_get_property_list(c):
			for key in m:
				add_keyword_color(key, member_color)

	var file: = File.new()
	file.open("res://src/slide/widgets/text_edit/keywords.json", file.READ)
	var keywords: Dictionary = parse_json(file.get_as_text())
	file.close()
	for k in keywords["list"]:
		add_keyword_color(k, keyword_color)

func _gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("save"):
		if target_script:
			target_script.source_code = text
			target_script.reload(true)
			get_parent().grab_focus()
			
	elif Input.is_action_just_pressed("ui_cancel"):
		get_parent().grab_focus()
	
func _set_target_script(script : Script) -> void:
	target_script = script
	if script:
		text = script.source_code
	else:
		text = ""