class_name Player_Card
extends Control

@onready var Health_ProgressionBar : TextureProgressBar = $Progression_Bar/Health_ProgressionBar
@onready var Mana_ProgressionBar : TextureProgressBar = $Progression_Bar/Mana_ProgressionBar

@onready var Character_Name : Label = $Changable_Label/Character_Name

var player_party_Character : Character

var character_name : String
var Stats : Dictionary

func _ready() -> void:
	pass

func get_information_parent()->void:
	character_name = player_party_Character.Name
	Stats["Health"] = player_party_Character.Main_Stats["Health"]
	Stats["Mana"] = player_party_Character.Main_Stats["Mana"]

func _update()->void:
	pass
