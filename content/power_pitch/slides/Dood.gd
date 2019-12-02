extends KinematicBody2D

const MOVE_SPEED = 400.0
const JUMP_FORCE = 2000.0
const GRAVITY = 75

var y_vel = 0

onready var start_pos = position

func _process(delta):
	if Input.is_action_just_pressed("reset_player"):
		position = start_pos
		y_vel = 0

func _physics_process(delta):
	var x_vel = 0
	if Input.is_key_pressed(KEY_D):
		x_vel += MOVE_SPEED
	
	if Input.is_key_pressed(KEY_A):
		x_vel -= MOVE_SPEED
	
	move_and_slide(Vector2(x_vel, y_vel), Vector2(0, -1))

	y_vel += GRAVITY
	var grounded = is_on_floor()
	if Input.is_action_just_pressed("jump"):
		y_vel -= JUMP_FORCE
	elif grounded:
		y_vel = 10
	
	
