class_name Skill_Component
extends Resource

enum skill_type {
	Physical,
	Magical,
	Ailments
}

@export var NAME : String
@export var DAMAGE : float
@export var TYPE : skill_type
