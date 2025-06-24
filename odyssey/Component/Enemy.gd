class_name Enemy
extends Character_Component

enum monster_size {
	Small = 0,
	Medium = 1,
	Large = 2,
	miniBoss = 3,
	BOSS = 5
}

@export_group("EXTRA MONSTER VALUES")
@export var Attack_Animation : AnimationNode
@export var Monster_Size : monster_size

func _to_string() -> String:
	return Name + " | Health : " + str(Health) + " | Mana : " + str(Mana) + " | Main_Modifier : " + getString_MainModifier()
