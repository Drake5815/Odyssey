class_name Game_Manager
extends Node

signal pause
signal exit
signal save

var player_node
var current_scene

func _ready() -> void:
	## SIGNALS
	self.pause.connect(_pause)
	self.exit.connect(_exit)
	self.save.connect(save_game)
	## DISPLAY SIZE
	get_viewport().size = DisplayServer.window_get_size()

###########################
## GAME SCENE TRANSITION ##
###########################
func transition_change(scene:String)->void:
	get_tree().change_scene_to_file(scene)

func add_option_scree()->void:
	var option = load("res://Scene/GUI/Option/Option.tscn").instantiate()
	get_tree().root.add_child(option)

######################
## SIGNAL FUNCTIONS ##
######################
func save_game()->void:
	pass

func _pause()->void:
	get_tree().paused = true

func _exit()->void:
	get_tree().quit()

##################################################################
## 
##################################################################
