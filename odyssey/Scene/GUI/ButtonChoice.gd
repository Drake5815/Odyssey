class_name Button_Choice extends Button

signal button_index(index)

var index : int

func _onPress()->void:
	button_index.emit(index)
