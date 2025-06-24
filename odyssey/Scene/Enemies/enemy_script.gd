class_name enemy_script
extends Node3D

@export var enemies : Array[Enemy]

const enemy_size_limit = 5
const enemy_size_row = 4
const enemy_size_column = 2

var current_size : int = enemy_size_limit

func check_enemy_sizes()->Array:
	var new_arr : Array[Enemy]
	for enemy in enemies:
		if enemy.Monster_Size < enemy_size_limit:
			current_size -= enemy.Monster_Size
			new_arr.append(enemy)
	return new_arr
