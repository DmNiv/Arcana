extends Node

@onready var spell_load
@onready var player = get_tree().get_first_node_in_group("Player") as Node2D

func spell(combination):
	match combination:
		"QQQ":
			spell_load = preload("res://spells/lightning_strike.tscn").instantiate()
		"QQW":
			return ("A")
		"EQQ":
			return ("B")
		"QQR":
			return ("s")
		"QWW":
			return ("s")
		"EQW":
			return ("s")
		"QRW":
			return ("s")
		"EEQ":
			return ("s")
		"EQR":
			return ("s")
		"QRR":
			return ("s")
		"WWW":
			return ("s")
		"EWW":
			return ("s")
		"RWW":
			return ("s")
		"EEW":
			return ("s")
		"ERW":
			return ("s")
		"RRW":
			return ("s")
		"EEE":
			return ("s")
		"EER":
			return ("s")
		"ERR":
			return ("s")
		"RRR":
			spell_load = preload("res://spells/celeste_seeker/celeste_seeker.tscn").instantiate()
			get_tree().get_first_node_in_group("Area").change_area(360 ,270)
	
	player.get_node("Systems/SpellSlot").add_spell(spell_load)
