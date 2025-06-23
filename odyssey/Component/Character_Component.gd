class_name Character_Component
extends Resource

@export_group("NAME")
@export var Name : String

@export_group("TEXUTRES & ANIMATION")
@export var Sprite : Texture
@export var Injured_Animation : AnimationNode

@export_group("BASE STATS")
@export_range(0.0,9999.0) var Health : float
@export_range(0.0,9999.0) var Mana : float
@export var Damage : Damage_Component

@export_group("MODIFIERS")
enum modifier {
	Strength = 0,
	Dexterity = 1,
	Constitution = 2,
	Intelligence = 3,
	Wisdom = 4,
	Charisma = 5
}

@export_range(1,100) var Strength : float
@export_range(1,100) var Dexterity : float
@export_range(1,100) var Constitution : float
@export_range(1,100) var Intelligence : float
@export_range(1,100) var Wisdom : float
@export_range(1,100) var Charisma : float

@export var Main_Modifier : modifier

@export_group("SKILLS")
@export var skills : Array[Variant]

func _init() -> void:
	pass

func get_MainModifier()->float:
	match Main_Modifier:
		0 : return Strength
		1 : return Dexterity
		2 : return Constitution
		3 : return Intelligence
		4 : return Wisdom
		5 : return Charisma
		_ : return 0

func getString_MainModifier()->String:
	match Main_Modifier:
		0 : return "Strength"
		1 : return "Dexterity"
		2 : return "Constitution"
		3 : return "Intelligence"
		4 : return "Wisdom"
		5 : return "Charisma"
		_ : return "Good Luck!"
