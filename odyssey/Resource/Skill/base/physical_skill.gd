extends Node

@export var Component : Skill_Component

@export var Parent : Resource

func _ready() -> void:
	if Component.TYPE != Component.skill_type.Physical:
		print("NOT PHYSICAL ATTACK?!")

func determine_parent()->Variant:
	return null

func get_modifier(parent_stat:float)->float:
	return 0
