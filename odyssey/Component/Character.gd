class_name Character
extends Character_Stats

@export var Name : String

@export var Health : Stat_Component
@export var Mana : Stat_Component
@export var Damage : Damage_Component

@export var Sprite_Icon : Texture
@export var Sprite_Full : Texture

@export_range(1,30) var Strength : int
@export_range(1,30) var Dexterity : int
@export_range(1,30) var Constitution : int
@export_range(1,30) var Intelligence : int
@export_range(1,30) var Wisdom : int	
@export_range(1,30) var Charisma : int

var Inventory : Dictionary = {}

func _init()->void:
	super(Strength, Dexterity, Constitution, Intelligence, Wisdom, Charisma)
	self.Main_Stats["Health"] = Health.max_value + self.Modifier(Dexterity) + self.Modifier(Constitution)
	self.Main_Stats["Mana"]   = self.Modifier(Wisdom) + self.Modifier(Charisma)
	self.Main_Stats["Damage"] = self.Modifier(Strength) + self.Modifier(Intelligence)
	Health.max_value = self.Main_Stats["Health"]
	Mana.max_value = self.Main_Stats["Mana"]
	Damage.Damage = self.Main_Stats["Damage"]

func Update_Modifier(name:String,value:float)->void:
	if not Main_Stats.has(name):
		push_error("Error " + name + " not found in Match_Stats")
		return
	var stat : String
	match name:
		"Strength" : stat = "Damage"
		"Intelligence" : stat = "Damage"
		"Dextrity" : stat = "Health"
		"Constitution" : stat = "Health"
		"Wisdom" : stat = "Mana"
		"Charisma" : stat = "Mana"
	Main_Stats[stat] += value
