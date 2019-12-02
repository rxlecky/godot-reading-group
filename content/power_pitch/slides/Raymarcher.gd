extends Control

onready var player: = $ColorRect/AnimationPlayer

func _ready():
	player.connect('animation_finished', self, "_on_animation_finished")

func play(anim_name: String) -> void:
	player.play(anim_name)
	yield(player, "animation_finished")
