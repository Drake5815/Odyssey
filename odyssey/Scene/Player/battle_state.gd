extends Node


var Active:bool = false

func get_character(val:Character)->Array:
	var arr : Array
	arr.append(val.name)
	arr.append(val.Dexterity)
	return arr

func get_party_matrix()->Array:
	var matrix : Array
	
	return matrix
