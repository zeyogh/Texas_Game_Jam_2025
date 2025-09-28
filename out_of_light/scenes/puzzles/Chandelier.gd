class_name Chandelier
extends Control

class BreakerSwitch:
	var links : Array[int]
	var button : TextureButton
	var startOn : bool
	
	func _init(l : Array[int], startAsOn : bool):
		links = l
		startOn = startAsOn

@onready var _breakerBox : GridContainer = $BreakerBox
const _breakerTexture : Texture2D = preload("res://resources/puzzleTextures/trackSwitch.png")
var breakers : Array[BreakerSwitch] = [
	BreakerSwitch.new([1],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([],true)
]

func _ready() -> void:
	for idx : int in range(0, breakers.size()):
		var button = TextureButton.new()
		button.texture_normal = _breakerTexture
		button.button_down.connect(_toggleButton.bind(idx))
		button.flip_h = breakers[idx].startOn
		_breakerBox.add_child(button)
		breakers[idx].button = button

func _toggleButton(idx : int):
	idx = clamp(idx, 0, _breakerBox.get_child_count())
	breakers[idx].button.flip_h = !breakers[idx].button.flip_h
	for jdx in breakers[idx].links:
		breakers[jdx].button.flip_h = !breakers[jdx].button.flip_h
	
	#_checkBreakers()

func _checkBreakers() -> void:
	for idx : int in range(0,breakers.size()):
		if idx == 9 or idx == 10:
			continue
		elif !breakers[idx].button.flip_h:
			break
	
	print_debug("all necessary breakers on")
	#pass the minigame; if skipped breakers are also on, give extra credit
