class_name NavigationBar_Action
extends Control

signal set_HeaderText(String)
signal set_TurnText(String)

@onready var Nav : TextureRect = $TextureRect
@onready var Header_Texts:Label = $HEADER/HeaderLabel
@onready var Turn_Text : Label = $Header_Turn_Label/Label2

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
