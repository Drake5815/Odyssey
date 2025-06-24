extends Node

@export var Component : Skill_Component

var Parent : Character_Component

func _ready() -> void:
	if Component.TYPE != Component.skill_type.Physical:
		print("NOT PHYSICAL ATTACK?!")
