extends KinematicBody2D

const MOVE_SPEED = 1000.0
const JUMP_FORCE = 1500.0
const GRAVITY = 100.0

var velocity := Vector2(0, 0)

func _physics_process(delta) -> void:
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += MOVE_SPEED
	if Input.is_action_pressed("move_left"):
		velocity.x -= MOVE_SPEED
																									#########################
																									#########################
																									#########################

	velocity.y += GRAVITY
	if Input.is_action_just_pressed("jump"):
		velocity.y -= JUMP_FORCE
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
															#########################
															#########################
															#########################
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################
