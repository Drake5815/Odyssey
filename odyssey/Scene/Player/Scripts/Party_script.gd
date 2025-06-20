class_name Party_Script
extends Control

signal Add_Character(Character)

@onready var CharacterCards_Array : Array[Player_Card] = [ $"Player-Card_01",$"Player-Card_02",$"Player-Card_03"]

var Characters : Dictionary

func _ready() -> void:
	Add_Character.connect(add_character_to_party)

func add_character_to_party(value:Character)->void:
	var index : int = 0
	for card in CharacterCards_Array:
		if !card.has_Character():
			card.Insert_Character(value)
		++index
