extends CharacterBody2D

@export var max_speed = 400
const ACCELERATION = 10
var clickPosition = Vector2()
var direction

func _physics_process(delta):
	if Input.is_action_pressed("mouseRight"):
		clickPosition = get_global_mouse_position()
	
	direction = (clickPosition - global_position).normalized()
	if global_position.distance_squared_to(clickPosition) <= 9:
		direction = Vector2.ZERO
	
	var target_velocity = max_speed * direction
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION))
	if global_position.distance_squared_to(clickPosition) > 9:
		move_and_slide()

func get_area():
	return $%cast_area.shape.radius
	
func stop():
	clickPosition = global_position
