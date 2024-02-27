extends VBoxContainer

class_name Keyboard

signal letter_pressed(letter: String)
signal backspace_pressed
signal enter_pressed


func _on_keyboard_button_pressed(letter: String):
	letter_pressed.emit(letter)

func _on_backspace_button_pressed():
	backspace_pressed.emit()

func _on_enter_pressed():
	enter_pressed.emit()

func on_letters_validated(used_letters, validation_result):
	var keys = get_tree().get_nodes_in_group("keyboard") as Array[KeyboardButton]
	
	for key in keys:
		var used_letter_index = used_letters.find(key.name.to_lower())
		if used_letter_index != -1:
			key.set_state(validation_result[used_letter_index])
