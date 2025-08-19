extends Node2D

func play_pressed()->void:
	GameManager.transition_change("res://Scene/Map/test_world.tscn")

func option_pressed()->void:
	pass

func exit_pressed()->void:
	GameManager.exit.emit()
