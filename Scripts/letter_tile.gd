extends Panel

class_name LetterTile

const state_to_theme_variation = ["empty", "incorrect", "correct_wrong_placement", "correct_right_placement"]

var letter_value: String 

@onready var label = $Label

@export var letter: String:
	get:
		return letter_value
	set(value):
		letter_value = value
		if label != null:
			label.text = value.to_upper()

@export var state: Enums.State = Enums.State.Empty

func set_tile_state(new_state: Enums.State):
	state = new_state
	theme_type_variation = state_to_theme_variation[state]

func _ready():
	theme_type_variation = state_to_theme_variation[state]
	label.text = "" if state == Enums.State.Empty else letter
