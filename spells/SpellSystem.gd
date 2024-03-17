extends Node

var spell_arr = []
var spell_comb

func arr_to_string(arr: Array):
	var s = ""
	for i in arr:
		s += str(i)
	return s

func _process(delta):
	if Input.is_action_just_pressed("q"):
		spell_arr.push_back("Q")
	elif Input.is_action_just_pressed("w"):
		spell_arr.push_back("W")
	elif Input.is_action_just_pressed("e"):
		spell_arr.push_back("E")
	elif Input.is_action_just_pressed("r"):
		spell_arr.push_back("R")
	if len(spell_arr) > 3:
			spell_arr.pop_front()
	
	if Input.is_action_just_pressed("ui_accept") and len(spell_arr) == 3:
		spell_comb = spell_arr.duplicate()
		spell_comb.sort()
		spell_comb = arr_to_string(spell_comb)
		get_tree().get_first_node_in_group("Invoke").spell(spell_comb)
	
	
