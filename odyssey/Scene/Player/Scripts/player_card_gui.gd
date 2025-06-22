class_name Player_Card
extends Control

signal Damage(float)
signal ManaConsumption(float)

@onready var Health_ProgressionBar : TextureProgressBar = $Progression_Bar/Health_ProgressionBar
@onready var Mana_ProgressionBar : TextureProgressBar = $Progression_Bar/Mana_ProgressionBar
@onready var Character_Icon : TextureRect = $Player_Icon

@onready var Character_Name : Label = $Changable_Label/Character_Name

var party_Character : Character
var has_Character:bool = false

func _ready() -> void:
	Damage.connect(Take_Damage)
	ManaConsumption.connect(Mana_Consumption)
	Character_Icon.flip_h = false

func Insert_Character(character:Character)->void:
	party_Character = character
	has_Character = true
	Character_Name.text = character.Name
	Health_ProgressionBar.max_value = character.Main_Stats["Health"]
	Health_ProgressionBar.value = character.Main_Stats["Health"]
	Mana_ProgressionBar.max_value = character.Main_Stats["Mana"]
	Mana_ProgressionBar.value = character.Main_Stats["Mana"]
	Character_Icon.texture = character.Sprite_Icon

func Take_Damage(value:float)->void:
	if Health_ProgressionBar.value - value == 0:
		Health_ProgressionBar.value = 0
		print("Player Dead!!")
	else:
		Health_ProgressionBar.value -= value

func Mana_Consumption(value:float)->void:
	if Mana_ProgressionBar.value == 0 or Mana_ProgressionBar.value - value == 0:
		print("Insufecient Mana!!")
		return
	else:
		Mana_ProgressionBar.value -= value

func _update()->void:
	pass
