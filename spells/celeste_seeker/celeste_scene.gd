extends CharacterBody2D

var max_speed = 500
var acceleration = 2
var direction
var direction_alt = true

func _physics_process(delta):
	if direction_alt == true:
		direction = get_direction_to_enemy()
	var target_speed = direction * max_speed
	velocity = velocity.lerp(target_speed, 1 - exp(-delta * acceleration))
	move_and_slide()
	
func get_direction_to_enemy():
	var enemy = get_tree().get_first_node_in_group("Enemy") as Node2D
	if enemy != null:
		return (enemy.global_position - global_position).normalized()
	return Vector2.ZERO


func _on_star_area_area_entered(area):
	var spread_vector = (area.global_position - global_position).normalized()
	direction = spread_vector
	direction_alt = false

func _on_star_area_area_exited(area):
	direction_alt = true



func _on_collision_area_body_entered(enemy):
	enemy.damage(randi_range(250, 300))
	queue_free()
