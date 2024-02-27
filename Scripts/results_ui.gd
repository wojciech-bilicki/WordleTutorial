extends ColorRect

class_name ResultsUI

@export var win_color: Color
@export var lose_color: Color
@export var alpha_factor: float = .4

@onready var word_label = %WordLabel
@onready var results_label = %ResultsLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()

func show_results(has_won: bool, word: String, number_of_moves: int):
	var clear_color = win_color if has_won else lose_color
	var color_with_alpha = Color(clear_color, alpha_factor)
	word_label.text = word
	word_label.add_theme_color_override("font_color", clear_color)
	
	var moves_string = "move" if number_of_moves == 1 else "moves"
	
	results_label.text = "You have won in " + str(number_of_moves) + " " + moves_string if has_won else "You have lost"
	color = color_with_alpha
	show()


func _on_button_pressed():
	get_tree().reload_current_scene()
