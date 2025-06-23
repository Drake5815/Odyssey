class_name Character_Stats
extends Resource

var Main_Stats : Dictionary = {
	"Health" = 0.0,
	"Mana"   = 0.0,
	"Damage" = 0.0
}

var Base_Stats : Dictionary = {
	"Strength" = 0,
	"Dexterity" = 0, 
	"Constitution" = 0,
	"Intelligence" = 0,
	"Wisdom" = 0,
	"Charisma" = 0
} 

func _init(Str:int, Dex:int, Cons:int, Int:int, Wis:int, Cha:int) -> void:
	Base_Stats["Strength"] = Str
	Base_Stats["Dexterity"] = Dex
	Base_Stats["Constitution"] = Cons
	Base_Stats["Intelligence"] = Int
	Base_Stats["Wisdom"] = Wis
	Base_Stats["Charisma"] = Cha

func Modifier(val:float)->float:
	var value_modifire : float
	match val:
		1.0 : value_modifire = -5
		2.0, 3.0 : value_modifire = -4
		4.0, 5.0 : value_modifire = -3
		6.0, 7.0 : value_modifire = -2
		8.0, 9.0 : value_modifire = -1
		10.0, 11.0 : value_modifire = 0
		12.0, 13.0 : value_modifire = 1
		14.0, 15.0 : value_modifire = 2
		16.0, 17.0 : value_modifire = 3
		18.0, 19.0 : value_modifire = 4
		20.0, 21.0 : value_modifire = 5
		22.0, 23.0 : value_modifire = 6
		24.0, 25.0 : value_modifire = 7
		26.0, 27.0 : value_modifire = 8
		28.0, 29.0 : value_modifire = 9
		_ : value_modifire = 10
	return value_modifire

func UI_Print(Name:String)->String:
	if not Main_Stats.has(Name):
		push_error(Name , ": not found!")
		return ""
	var Stat : float = 0
	match Name:
		"Health" :
			Stat = Base_Stats["Dexterity"] + Base_Stats ["Constitution"]
		"Mana" :
			Stat = Base_Stats["Wisdom"] + Base_Stats["Charisma"]
		"Damage" :
			Stat = Base_Stats["Strength"] + Base_Stats["Intelligence"]
	return Name + ": " + Main_Stats["Name"] + " + " + Stat 
