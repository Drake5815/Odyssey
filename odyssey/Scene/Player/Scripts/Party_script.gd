class_name Party_Script
extends Control

signal Add_Character(Character)

@onready var CharacterCards_Array : Array[Player_Card] = [ $"Player-Card_01",$"Player-Card_02",$"Player-Card_03"]

var Character_Array:Array[Character]
var index : int = 0

func _ready() -> void:
	Add_Character.connect(add_character_to_party)

func add_character_to_party(value:Character)->void:
	if index == 3 :
		return
	for card in CharacterCards_Array:
		if !card.has_Character():
			Character_Array.append(value)
			card.Insert_Character(value)
		++index

func remove_character(value:Character)->void:
	if index == 1:
		return
	if !Character_Array.has(value):
		print("true")
