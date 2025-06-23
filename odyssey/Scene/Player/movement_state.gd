extends Node

@export var Parent : Node3D
@export var Front_RayCast : RayCast3D
@export var Back_RayCast : RayCast3D

const Vertical_Time_Travel : float = 0.3
const Horizontal_Time_Travel : float = 0.5

var mouse_position:Vector2

var Active : bool = true
var LeftMouse_Pressed : bool = false

var tween

func Vertical_Movement(val:int)->void:
	tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(Parent, "transform", Parent.transform.translated((val*Parent.transform.basis.z)*2), Vertical_Time_Travel)

func Horizontal_Movement(val:int)->void:
	tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(Parent, "transform:basis", Parent.transform.basis.rotated(Vector3.UP,(val*PI)/2), Horizontal_Time_Travel)

func _input(event: InputEvent) -> void:
	if Active:
		if tween is Tween:
			if tween.is_running():
				return
		if event.is_action_pressed("Forward") and not Front_RayCast.is_colliding():
			Vertical_Movement(-1)
		if event.is_action_pressed("Backward") and not Back_RayCast.is_colliding():
			Vertical_Movement(1)
		if event.is_action_pressed("Right"):
			Horizontal_Movement(-1)
		if event.is_action_pressed("Left"):
			Horizontal_Movement(1)
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				LeftMouse_Pressed = true
				mouse_position = event.position
			else:
				LeftMouse_Pressed = false
				mouse_position = Vector2.ZERO
		if event is InputEventMouseMotion and LeftMouse_Pressed:
			var curr_pos = event.position
			var horizontal_pos = curr_pos.x - mouse_position.x
			var vertical_pos = curr_pos.y - mouse_position.y
			print("horizontal: " , str(horizontal_pos) , " vertical: " , str(vertical_pos))
			if horizontal_pos < -5:
				Horizontal_Movement(1)
				LeftMouse_Pressed = false
				mouse_position = Vector2.ZERO
			if horizontal_pos > 5:
				Horizontal_Movement(-1)
				LeftMouse_Pressed = false
				mouse_position = Vector2.ZERO
			if vertical_pos < -5 and not Front_RayCast.is_colliding():
				Vertical_Movement(-1)
				LeftMouse_Pressed = false
				mouse_position = Vector2.ZERO
			if vertical_pos > 5 and not Back_RayCast.is_colliding():
				Vertical_Movement(1)
				LeftMouse_Pressed = false
				mouse_position = Vector2.ZERO
