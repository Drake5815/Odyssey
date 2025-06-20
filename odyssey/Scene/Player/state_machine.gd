class_name State_machin extends Node

@export var Movement_State : Node
@export var Combat_State : Node

signal Encounter
signal Battle_Finish

func _ready() -> void:
	Encounter.connect(on_Encounter)
	Battle_Finish.connect(on_Finish)
	
	Movement_State.Active = true
	Combat_State.Active = false

func on_Encounter()->void:
	Movement_State.Active = false
	Combat_State.Active = true 

func on_Finish()->void:
	Movement_State.Active = true
	Combat_State.Active = false 
