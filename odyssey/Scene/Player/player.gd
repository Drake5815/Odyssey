class_name Player
extends Node3D

@export var Camera : Camera3D
@export var Party : Party_Script

func fill_party(character_array:Array[Character])->void:
	if character_array == null :
		return 
	for char in character_array:
		if char.name != null:
			Party.add_character_to_party(char)

func recruit_character(Char:Character)->void:
	if !Party.isPartyFull() and Char.name != null:
		Party.add_character_to_party(Char)

func Camera_Positon()->void:
	Camera.position = self.position
	Camera.transform.basis = self.transform.basis

func _process(delta: float) -> void:
	Camera_Positon()
