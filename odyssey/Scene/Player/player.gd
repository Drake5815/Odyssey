class_name Player
extends Node3D

@onready var Movement_State : Node = $State_Machine/Movement_State
@onready var Battle_State : Node = $State_Machine/Battle_State

var State : Dictionary = {
	Movement = Movement_State,
	Battle = Battle_State
}
