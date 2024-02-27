extends Panel

@onready var label = $Label
@onready var timer = $Timer

func _ready():
	hide()

func show_with_text(text: String):
	label.text = text
	show()
	timer.start()


func _on_timer_timeout():
	hide()
