class_name Game_Manager
extends Node

signal pause
signal exit
signal save

const MainMenu_Window : Vector2i = Vector2i(800, 600)
const Game_Window : Vector2i = Vector2i(1280,720)

var player_node
var current_scene

func _ready() -> void:
	## SIGNALS
	self.pause.connect(_pause)
	self.exit.connect(_exit)
	self.save.connect(save_game)
	## START GAME

###########################
## GAME SCENE TRANSITION ##
###########################
func main_menu()->void:
	DisplayServer.window_set_size(MainMenu_Window)

func Game_Initialize()->void:
	DisplayServer.window_set_size(Game_Window)

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
