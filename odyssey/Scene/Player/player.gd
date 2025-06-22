class_name Player
extends Node3D

@export var Camera : Camera3D
@export var Party : Party_Script

var char_arr : Array[Character]

func recruit_character(Char:Character)->void:
	if !Party.isPartyFull() and Char.name != null:
		Party.Add_Character.emit(Char)
	else:
		print("PARTY IS FULL")

func Camera_Positon()->void:
	Camera.position = self.position
	Camera.transform.basis = self.transform.basis

func _process(delta: float) -> void:
	Camera_Positon()
