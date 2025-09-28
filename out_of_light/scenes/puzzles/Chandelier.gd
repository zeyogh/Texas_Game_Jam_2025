class_name Chandelier
extends Control

class BreakerSwitch:
	var links : Array[int]
	var button : TextureButton
	var startOn : bool
	
	func _init(l : Array[int], startAsOn : bool):
		links = l
		startOn = startAsOn

@onready var _hasBreakerBoxKey : bool = PlayerController.has_key
@onready var _breakerBox : GridContainer = $BreakerLatch/BreakerBox
const _breakerTexture : Texture2D = preload("res://resources/puzzleTextures/trackSwitch.png")
var breakers : Array[BreakerSwitch] = [
	BreakerSwitch.new([1,3],true),
	BreakerSwitch.new([0],true),
	BreakerSwitch.new([3],false),
	BreakerSwitch.new([0,2,6,8],false),
	BreakerSwitch.new([5],true),
	BreakerSwitch.new([0],true),
	BreakerSwitch.new([7],true),
	BreakerSwitch.new([6,17],false),
	BreakerSwitch.new([10,11],true),
	BreakerSwitch.new([],true),
	BreakerSwitch.new([8],true),
	BreakerSwitch.new([12],true),
	BreakerSwitch.new([10,3,14],true),
	BreakerSwitch.new([14,16],true),
	BreakerSwitch.new([15],true),
	BreakerSwitch.new([14,13,8,3],true),
	BreakerSwitch.new([],false),
	BreakerSwitch.new([],true)
]
var phone : int = 0
var phoneIsPowered : bool = false

func _ready() -> void:
	$BreakerDoor.position = Vector2(250,55)
	$BreakerDoor.texture_normal = load("res://resources/puzzleTextures/breakerDoorOuter.png")
	$BreakerLatch.visible = false

func _openBreaker() -> void:
	if !_hasBreakerBoxKey: return
	
	$BreakerDoor.position = Vector2(700,55)
	$BreakerDoor.texture_normal = load("res://resources/puzzleTextures/breakerDoorInner.png")
	$BreakerDoor.flip_h = true
	$BreakerLatch.visible = true
	$BreakerDoor/BreakerLabels.visible = true
	for idx : int in range(0, breakers.size()):
		var button = TextureButton.new()
		button.texture_normal = _breakerTexture
		button.button_down.connect(_toggleButton.bind(idx))
		button.flip_h = breakers[idx].startOn
		_breakerBox.add_child(button)
		breakers[idx].button = button

func _toggleButton(idx : int):
	if ProgressController.current_stage != ProgressEnum.Progress.STAGE_4: return
	idx = clamp(idx, 0, _breakerBox.get_child_count())
	breakers[idx].button.flip_h = !breakers[idx].button.flip_h
	for jdx in breakers[idx].links:
		breakers[jdx].button.flip_h = !breakers[jdx].button.flip_h
	
	breakers[17].button.flip_h = true
	
	match idx:
		3 when phone == 0:
			phone = 1
		0 when phone == 1:
			phone = 2
		16 when phone == 1:
			phone = 3
		7 when phone == 3:
			phone = 4
		7 when phone == 4:
			phone = 5
			for switch in breakers:
				switch.button.flip_h = true
			breakers[17].button.flip_h = false
		17 when phone == 5:
			phoneIsPowered = true
		_:
			phone = 0
	
	_checkBreakers()

func _checkBreakers() -> void:
	for idx : int in range(0,breakers.size()):
		if idx == 1 or idx == 2 or idx == 6 or idx == 7 or idx == 9 or idx == 13 or idx == 16:
			continue
		elif !breakers[idx].button.flip_h:
			return
	
	$BreakChandelierSound.play()
	await get_tree().create_timer(1).timeout
	PlayerController.is_phone_powered = phoneIsPowered
	ProgressController._change_current_stage(ProgressEnum.Progress.STAGE_5)
	ExitMinigame()

func ExitMinigame() -> void:
	get_tree().change_scene_to_packed(PlayerController.room_scenes[PlayerController.current_room])
