class_name Party_Script
extends Control

signal Add_Character(Character)

@onready var CharacterCards_Array : Array[Player_Card] = [ $"Player-Card_01",$"Player-Card_02",$"Player-Card_03"]

var Character_Array:Array[Character]
var index : int = 0

func _ready() -> void:
	Add_Character.connect(add_character_to_party)

func add_character_to_party(value:Character)->void:
	if index == 3 or value == null:
		return
	value._setup()
	print(value.to_string())
	for card in CharacterCards_Array:
		if !card.has_Character and index != 3:
			Character_Array.append(value)
			card.Insert_Character(value)
			++index
			return

func remove_character(value:Character)->void:
	if index == 1:
		return
	if !Character_Array.has(value):
		print("true")

func PlayerExist(name:String)->bool:
	for characters in Character_Array:
		if characters.Name == name:
			return true
	return false

func isPartyFull()->bool:
	for card in CharacterCards_Array:
		if !card.has_Character:
			return false
	return true
