class_name Chandelier
extends Control

var breakers : Array[BreakerSwitch] = [
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0]),
	BreakerSwitch.new([0])
]

@onready var _breakerBox : GridContainer = $BreakerBox

func _ready() -> void:
	for breaker : BreakerSwitch in breakers:
		_breakerBox.add_child(breaker)
		print_debug(_breakerBox)
	

func toggleLinksOff(links : Array[int]) -> void:
	for idx : int in links:
		breakers[idx].flip_h = false
		breakers[idx].button_pressed = false
	
	_checkBreakers()

func _checkBreakers() -> void:
	for idx : int in range(0,breakers.size()):
		if idx == 9 or idx == 10:
			continue
		elif !breakers[idx].button_pressed:
			break
	
	print_debug("all necessary breakers on")
	#pass the minigame; if skipped breakers are also on, give extra credit
