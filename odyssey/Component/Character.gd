class_name Character
extends Character_Component

func _setup()->void:
	Health += _modifier(Strength) + _modifier(Constitution)
	Mana += _modifier(Intelligence) + _modifier(Wisdom)

func _modifier(stat_value:float)->float:
	var mod_value : float = 0
	match stat_value:
		1.0 , 2.0 : mod_value = -5
		3.0 , 4.0 : mod_value = -4
		5.0 , 6.0 : mod_value = -3
		7.0 , 8.0 : mod_value = -2
		9.0 , 10.0 : mod_value = -1
		11.0 , 12.0 : mod_value = 0
		13.0 , 14.0 : mod_value = 1
		15.0 , 16.0 : mod_value = 2
		17.0 , 18.0 : mod_value = 3
		19.0 , 20.0 : mod_value = 4
		21.0 , 22.0 : mod_value = 5
		23.0 , 24.0 : mod_value = 6
		25.0 , 26.0 : mod_value = 7
		27.0 , 28.0 : mod_value = 8
		29.0 , 30.0 : mod_value = 9
		_: mod_value = 10
	return mod_value

func basic_Damage()->float:
	return Damage.damage() + _modifier(get_MainModifier())

func _to_string() -> String:
	return Name + " | Health : " + str(Health) + " | Mana : " + str(Mana) + " | Main_Modifier : " + getString_MainModifier()
