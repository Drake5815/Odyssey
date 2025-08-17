@tool
class_name MainMenu_Button
extends Button

var tween

@export var btnNormal : Color
@export var btnHover  : Color

func _enter_tree() -> void:
	###################
	## Base Settings ##
	###################
	self.flat = true
	##############
	## Override ##
	##############
	# COLOR = NORMAL | HOVER
	add_theme_color_override("font_color", Color.BLACK)
	add_theme_color_override("font_hover_color", Color.LIGHT_GREEN)
	# FONTS
	add_theme_font_override("font", load("res://Assets/Fonts/FreeSansBold.otf"))
	add_theme_font_size_override("font_size", 28)

func _ready() -> void:
	pass

####################################################################
## 
####################################################################
