class_name State_machine extends Node

@export var Movement_State : Node
@export var Combat_State : Node

signal Encounter
signal Battle_Finish
signal in_State

func _ready() -> void:
	Encounter.connect(on_Encounter)
	Battle_Finish.connect(on_Finish)
	in_State.connect(current_state)
	
	Movement_State.Active = true
	Combat_State.Active = false

func on_Encounter()->void:
	Movement_State.Active = false
	Combat_State.Active = true 

func on_Finish()->void:
	Movement_State.Active = true
	Combat_State.Active = false 

func current_state()->String:
	return "Movement" if Movement_State.Active else "Combat"
