extends Node2D


func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var enemy = get_tree().get_first_node_in_group("Enemy") as Node2D
	var player = get_tree().get_first_node_in_group("Player") as Node2D
	if Input.is_action_just_pressed("mouseLeft"):
		if mouse_pos.distance_squared_to(enemy.global_position) < pow(enemy.get_area(), 2):
			return
		var cooldown = get_tree().get_first_node_in_group("Cooldown").get_node("CelesteCooldown") as Timer
		if cooldown.time_left > 0:
			print("Celeste Seeker em cooldown!\nDisponível em: {time}".format({"time": floor(cooldown.time_left)}))
			return
		var root = get_tree().get_root()
		var angle = 0
		for i in range(3):
			var celeste_seeker = preload("res://spells/celeste_seeker/celeste_scene.tscn").instantiate()
			root.add_child(celeste_seeker)
			celeste_seeker.global_position = mouse_pos + (Vector2.RIGHT.rotated(angle) * 50)
			angle += 90
		cooldown.start()
	
	enemy.get_node("%cast_area").debug_color = Color(1, 0, 0, clamp(enemy.get_area() / (mouse_pos.distance_to(enemy.global_position) * 2), 0.2, 0.5))
