extends Node

@export var Parent : Node3D
@export var Front_RayCast : RayCast3D
@export var Back_RayCast : RayCast3D

const Vertical_Time_Travel : float = 0.3
const Horizontal_Time_Travel : float = 0.5

var Active : bool = true
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
