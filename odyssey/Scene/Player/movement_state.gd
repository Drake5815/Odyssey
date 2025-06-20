extends Node

@export var Front_RayCast : RayCast3D
@export var Back_RayCast : RayCast3D

var Active_State : bool = true
var tween

func Tween_Movement()->void:
	pass

func _physics_process(delta: float) -> void:
	pass
