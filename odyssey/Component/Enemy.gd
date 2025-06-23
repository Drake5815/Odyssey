class_name Enemy
extends Character_Component

enum monster_size {
	Small = 1,
	Medium = 2,
	Large = 3
}

@export_group("EXTRA MONSTER VALUES")
@export var Attack_Animation : AnimationNode
@export var Monster_Size : monster_size

func _to_string() -> String:
	return Name + " | Health : " + str(Health) + " | Mana : " + str(Mana) + " | Main_Modifier : " + getString_MainModifier()
