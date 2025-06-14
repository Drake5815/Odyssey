class_name Game_Manager
extends Node

signal pause
signal exit

func _ready() -> void:
	self.pause.connect(_pause)
	self.exit.connect(_exit)

func _pause()->void:
	print("Paused")
	get_tree().paused = true

func _exit()->void:
	get_tree().quit()
