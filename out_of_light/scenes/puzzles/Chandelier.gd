class_name Chandelier
extends Control

@onready var _breakerBox : GridContainer = $BreakerBox
@onready var breakers : Array[Node] = _breakerBox.get_children()

func toggleLinksOff(links : Array[int]) -> void:
	for idx : int in links:
		breakers[idx].flip_h = false
		breakers[idx].button_pressed = false
	
	_checkBreakers()

func _checkBreakers() -> void:
	for idx : int in range(0,breakers.size()):
		if idx == 9 or idx == 10:
			continue
		elif !breakers[idx].flip_h:
			break
	
	print_debug("all necessary breakers on")
	#pass the minigame; if skipped breakers are also on, give extra credit

func _toggleTest() -> void:
	print_debug("goggle")
