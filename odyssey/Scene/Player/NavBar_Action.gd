class_name NavigationBar_Action
extends Control

signal set_HeaderText(String)
signal set_TurnText(String)

@onready var Setting : TextureRect = $Settings
@onready var Header_Texts:Label = $HEADER/Label
@onready var Turn_Text : Label = $Header_Turn_Label/Label2

var turn : int = 1
var State: int = 0

var setting_hover : bool = false

func _ready() -> void:
	## CHANGE HEADER_TEXT TO EMPTY & CHANGE TURN TEXT = turn
	Header_Texts.text = ""
	Turn_Text.text = str(turn)

func setting_hovered()->void:
	setting_hover = true
func setting_exit_hover()->void:
	setting_hover = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and setting_hover:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			setting_press()

func setting_press()->void:
	## PAUSE STATE! == signal [pause_state](Callable)
	
	## SHOW NEW TEXTURE FOR SETTINGS : 'RESUME', 'HOW TO PLAY' , 'VOLUME', 'EXIT'
	pass

func _process(delta: float) -> void:
	pass
