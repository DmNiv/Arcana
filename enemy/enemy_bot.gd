extends CharacterBody2D

func damage(number):
	print("recebi {number} de dano".format({"number": number}))

func get_area():
	return $%cast_area.shape.radius
