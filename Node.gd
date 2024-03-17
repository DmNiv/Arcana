extends Node

var player
var enemy

func _ready():
	player = get_tree().get_first_node_in_group("Player") as Node2D
	enemy = get_tree().get_first_node_in_group("Enemy") as Node2D
	
func change_area(player_area, enemy_area):
	player.get_node("%cast_area").shape.radius = player_area
	enemy.get_node("%cast_area").shape.radius = enemy_area
