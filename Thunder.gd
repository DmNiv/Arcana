extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("mouseLeft"):
		var cooldown = get_tree().get_first_node_in_group("Cooldown").get_node("ThunderCooldown") as Timer
		if cooldown.time_left > 0:
			print("Thunder está em cooldown!\nDisponível em: {timer}".format({"timer": floor(cooldown.time_left)}))
			return
		var mouse_pos = get_global_mouse_position()
		var root = get_tree().get_root()
		var thunder = preload("res://spells/thunder/thunder_scene.tscn").instantiate()
		root.add_child(thunder)
		thunder.global_position = mouse_pos
		cooldown.start()
