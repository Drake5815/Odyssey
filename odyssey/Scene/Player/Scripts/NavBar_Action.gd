class_name NavigationBar_Action
extends Control

signal set_HeaderText(String)
signal set_TurnText(String)

signal Show_Setting_Screen

@onready var Setting : TextureRect = $Settings
@onready var Header_Texts:Label = $HEADER/Label
@onready var Turn_Text : Label = $Header_Turn_Label/Label2
@onready var Setting_Screen : Control = $"Pop-Up"

var turn : int = 1

var setting_hover : bool = false

func _ready() -> void:
	## CHANGE HEADER_TEXT TO EMPTY & CHANGE TURN TEXT = turn
	Header_Texts.text = ""
	Turn_Text.text = str(turn)
	## SIGNALE CHANGE TEXT
	self.set_HeaderText.connect(change_header_text)
	self.set_TurnText.connect(change_turn_text)
	## Hide Pop-Up
	Setting_Screen.visible = false
	self.Show_Setting_Screen.connect(setting_pop)

func setting_hovered()->void:
	setting_hover = true
func setting_exit_hover()->void:
	setting_hover = false

func change_header_text(value:String)->void:
	Header_Texts.text = value
func change_turn_text(value:String)->void:
	Turn_Text.text = value

func setting_pop()->void:
	if !setting_hover:
		setting_hover = true
		Setting_Screen.visible = true
	else:
		setting_hover = false
		Setting_Screen.visible = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and setting_hover:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Setting_Screen.visible:
				Setting_Screen.visible = false
			else:
				setting_press()
	if event.is_action_pressed("Setting_Button"):
		if Setting_Screen.visible:
			Setting_Screen.visible = false
		else:
			setting_press()

func setting_press()->void:
	## PAUSE STATE! == signal [pause_state](Callable)
	GameManager.pause.emit()
	## SHOW NEW TEXTURE FOR SETTINGS : 'RESUME', 'HOW TO PLAY' , 'VOLUME', 'EXIT'
	Setting_Screen.visible = true

func _process(delta: float) -> void:
	pass
