extends Node

func _process(delta):
	if Input.is_action_just_pressed("mouseLeft"):
		var cooldown = get_tree().get_first_node_in_group("Cooldown").get_node("LightningCooldown") as Timer
		if cooldown.time_left > 0:
			print("Lightning Strike em cooldown!\nDisponível em: {time}".format({"time": floor(cooldown.time_left)}))
			return
		print("lightning_strike")
		cooldown.start()
