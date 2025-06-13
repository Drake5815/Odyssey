class_name Game_Manager
extends Node

signal pause


func _ready() -> void:
	self.pause.connect(_pause)


func _pause()->void:
	pass
