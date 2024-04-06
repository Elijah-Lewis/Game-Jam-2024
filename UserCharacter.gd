extends CharacterBody2D

@export var MAX_SPEED = 300
@export var ACCELERATION = 1500

@onready var axis2 = Vector2.ZERO

func _physics_processes(delta):
	move(delta)
	
func get_input_axis():
	axis.x = int(Input.is_action_pressed("moveRight")) - int(Input.is_action_pressed("moveLeft"))
	axis.y = int(Input.is_action_pressed("moveDown")) - int(Input.is_action_pressed("moveUp"))
	return axis.normalized()
func move(delta):
	axis = get_input_axis()
	
	if axis == Vector2.Zero:
		pass #ignore for now
	else:
		#apply movement
		apply_movement(axis * ACCELERATION * delta)
	
	move_and_slide()
	
func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(MAX_SPEED)
	
