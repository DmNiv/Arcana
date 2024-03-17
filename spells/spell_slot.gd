extends Node

var current_spell: Node
var spells = []

func add_spell(spell):
	current_spell = spell
	for item in spells.duplicate():
		item.queue_free()
	spells.clear()
	spells.append(spell)
	add_child(spell)
