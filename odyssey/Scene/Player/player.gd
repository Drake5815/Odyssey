class_name Player
extends Node3D

@export var Camera : Camera3D

func Camera_Positon()->void:
	Camera.position = self.position
	Camera.transform.basis = self.transform.basis

func _process(delta: float) -> void:
	Camera_Positon()
