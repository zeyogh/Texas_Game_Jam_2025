extends Control

var texts = ["", "Light candles", "Grab the Flashlight",
			 "Turn On the Weather Broadcast", "Get Emergency Power Running",
			 "Get the Lighthouse Back in Operation", ""]

var index = -1

func _ready() -> void:
	_display_next_text()

func _display_next_text() -> void:
	index += 1
	$CurrentGoal.text = texts[index]
