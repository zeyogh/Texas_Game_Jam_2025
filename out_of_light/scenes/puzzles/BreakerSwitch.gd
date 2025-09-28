class_name BreakerSwitch
extends TextureButton

@export var linkedSwitches : Array[int]
signal toggledOff(linked : Array[int])

func _init(links : Array[int]) -> void:
	linkedSwitches = links
	button_up.connect(_toggleBreaker)

func _toggleBreaker() -> void:
	print_debug("toggle")
	if !flip_h:
		flip_h = true
		toggledOff.emit(linkedSwitches)
	else:
		flip_h = false
