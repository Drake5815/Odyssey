class_name Stat_Component
extends Resource

@export var max_value : float
var value : float

func _init()->void:
	value = max_value

func heal(new_value:float)->void:
	if value + new_value == max_value:
		value = max_value
	value += new_value

func damage(new_value:float)->bool:
	if value - new_value == 0:
		return true
	value -= new_value
	return false
