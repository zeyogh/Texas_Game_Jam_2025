class_name BreakerSwitch
extends TextureButton

var linkedSwitches : Array[int]
signal toggledOff(linked : Array[int])

func _init(links : Array[int]) -> void:
	linkedSwitches = links

func _turnBreakerOn() -> void:
	print_debug(button_pressed)
	if !button_pressed:
		flip_h = true
		toggledOff.emit(linkedSwitches)
	else:
		flip_h = false
