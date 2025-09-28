class_name TVStand
extends Control

@export var hasPocketKnife : bool = PlayerController.has_razor
@export var hasFuse : bool = PlayerController.has_fuse

@onready var _plug : TextureButton = $Plug
@onready var _dial : TextureButton = $TvScreen/ChannelDial

var _fuseReplaced : bool = false
var _grabbingPlug : bool = false
var _grabbingDial : bool = false
var _tvPowerOn : bool = false

var _radioChannel : float = 156.8
const _tvChannels : Array[Texture2D] = [
	preload("res://resources/puzzleTextures/tvDisplayOff.png"),
	preload("res://resources/puzzleTextures/tvDisplayStatic.png"),
	preload("res://resources/puzzleTextures/tvDisplayWeather.png")
]

func ReplaceFuse() -> void:
	if hasPocketKnife and hasFuse:
		$Plug/FuseButton.texture_normal = load("res://resources/puzzleTextures/fuse.png")
		_fuseReplaced = true

func GrabPlug() -> void:
	if _fuseReplaced and !_tvPowerOn: _grabbingPlug = true

func GrabDial() -> void:
	if _tvPowerOn: _grabbingDial = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if _grabbingPlug:
			_plug.global_position.y = get_global_mouse_position().y - _plug.texture_normal.get_height()/4
		elif _grabbingDial:
			_dial.global_position.x = clamp(get_global_mouse_position().x - _dial.texture_normal.get_width()/2, 235, 600)
		
	if Input.is_action_just_released("interact"):
		if _grabbingPlug and get_global_mouse_position().y < $Socket.position.y + $Socket.texture.get_height():
			_plug.texture_normal = load("res://resources/puzzleTextures/plugPluggedIn.png")
			_plug.position.y = 490
			_tvPowerOn = true
			$Plug/FuseButton.visible = false
		elif !_tvPowerOn:
			_plug.position.y = 750
		_grabbingPlug = false
		
		if _grabbingDial and abs(_dial.position.x - 146) <= 10:
			_grabbingDial = false
			await get_tree().create_timer(5).timeout
			ProgressController.current_stage = ProgressEnum.Progress.STAGE_4
			ExitMinigame()
	
	if !_tvPowerOn:
		$TvScreen/Display.texture = _tvChannels[0]
	elif abs(_dial.position.x - 146) <= 10:
		$TvScreen/Display.texture = _tvChannels[2]
	else:
		$TvScreen/Display.texture = _tvChannels[1]
	
func ExitMinigame() -> void:
	get_tree().change_scene_to_packed(PlayerController.room_scenes[PlayerController.current_room])
