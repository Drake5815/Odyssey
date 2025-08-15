class_name DialogSystem extends Control

################
## PARSE NODE ##
################
@onready var button_obj = preload("res://Scene/GUI/ButtonChoice.tscn")
@onready var DialogNode = $EzDialogue

#########################
## DIALOGUE DICTIONARY ##
#########################
@onready var dict_state = {}

###########
## ARRAY ##
########### 
var choice_buttons:Array[Button_Choice] = []

############
## _READY ##
############
func _ready() -> void:
	start_dialog(load("res://json-files/Dialog/Introduction.json"), "Introduction")

#####################
## DIALOGUE SYSTEM ##
#####################
func add_text(text:String)->void:
	$VBoxContainer/Text.text = text

func clear_dialog_box()->void:
	$VBoxContainer/Text.text = ""
	for obj in choice_buttons:
		$VBoxContainer.remove_child(obj)
	choice_buttons = []

####################
## DIALOGUE INDEX ##
####################
func create_choices(button_text : String)->void:
	var obj_inst : Button_Choice = button_obj.instantiate()
	obj_inst.text = button_text
	obj_inst.index = choice_buttons.size()
	obj_inst.button_index.connect(on_ButtonIndex_selected)
	choice_buttons.push_back(obj_inst)
	$VBoxContainer.add_child(obj_inst)

func on_ButtonIndex_selected(choice_index:int)->void:
	DialogNode.next(choice_index)

#######################
## DIALOG MANAGEMENT ##
#######################
func start_dialog(json_file:JSON, instDialogue:String)->void:
	DialogNode.start_dialogue(json_file, dict_state, instDialogue)

func _on_ez_dialogue_dialogue_generated(response: DialogueResponse) -> void:
	## RESET LABEL ##
	self.clear_dialog_box()
	## --- ##
	self.add_text(response.text)
	for child in response.choices:
		self.create_choices(child)
