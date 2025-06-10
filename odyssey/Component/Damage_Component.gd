class_name Damage_Component
extends Resource

@export var Damage : float
@export var Crit_Rate : float
@export var Crit_Multiplier : float

func max_Crit()->float:
	return Crit_Rate if Crit_Rate * 100 < 300 else 3

func max_Crit_Multiplier()->float:
	return Crit_Multiplier if Crit_Multiplier * 100 < 500 else 5 

func damage()->float:
	return Damage if randf_range(0, max_Crit()) < Crit_Rate else Damage + (Damage * max_Crit_Multiplier())
