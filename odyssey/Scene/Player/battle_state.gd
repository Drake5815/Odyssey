extends Node

signal Engage

var Active:bool = false

func _ready() -> void:
	self.Engage.connect(engage_enemy)

func get_character(val:Character)->Array:
	var arr : Array
	arr.append(val.name)
	arr.append(val.Dexterity)
	return arr
func get_party_matrix()->Array:
	var matrix : Array
	
	return matrix

func engage_enemy()->void:
	print("enemy")
