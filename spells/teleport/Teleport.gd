extends Node2D

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var player = get_tree().get_first_node_in_group("Player") as Node2D
	if Input.is_action_just_pressed("mouseLeft"):
		var cooldown = get_tree().get_first_node_in_group("Cooldown").get_node("TeleportCooldown") as Timer
		if cooldown.time_left > 0:
			print("Teleport em cooldown!\nDisponível em: {time}".format({"time": floor(cooldown.time_left)}))
			return
		player.global_position = mouse_pos
		player.stop()
		cooldown.start()
