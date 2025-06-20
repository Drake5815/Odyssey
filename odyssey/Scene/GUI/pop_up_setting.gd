class_name Pop_up_Setting
extends Control

@onready var Resume_Button : TextureButton = $Resume
@onready var HTP_Button : TextureButton = $HowToPlay
@onready var Volume_Button : TextureButton = $Vloume
@onready var Exit_Button : TextureButton = $Exit

var parent
var texture_button : TextureButton = null

func _ready()->void:
	parent = get_parent()

func hovered()->void:
	texture_button.modulate.a = 0.35

func exit_hover()->void:
	texture_button.modulate.a = 1

func resume()->void:
	print("Resume")
	parent.Show_Setting_Screen.emit()
	get_tree().paused = false
func HTP()->void:
	print("How To Play!")
func Volume()->void:
	print("Volume")
func exit()->void:
	GameManager.exit.emit()

func _Resume_Button_hovered()->void:
	texture_button = Resume_Button
	hovered()
func _Resume_Button_Exit_hovered()->void:
	texture_button = Resume_Button
	exit_hover()
func _HTP_Button_hovered()->void:
	texture_button = HTP_Button
	hovered()
func _HTP_Button_Exit_hovered()->void:
	texture_button = HTP_Button
	exit_hover()
func _Volume_Button_hovered()->void:
	texture_button = Volume_Button
	hovered()
func _Volume_Button_Exit_hovered()->void:
	texture_button = Volume_Button
	exit_hover()
func _Exit_Button_hovered()->void:
	texture_button = Exit_Button
	hovered()
func _Exit_Button_Exit_hovered()->void:
	texture_button = Exit_Button
	exit_hover()
