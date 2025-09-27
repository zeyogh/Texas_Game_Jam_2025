class_name TVStand
extends Control

@export var hasPocketKnife : bool = false
@export var hasFuse : bool = false

@onready var _plug : TextureButton = $Plug
@onready var _dial : TextureButton = $TvScreen/ChannelDial

var _fuseReplaced : bool = false
var _grabbingPlug : bool = false
var _grabbingDial : bool = false

var _tvPowerOn : bool = false
var _radioChannel : float = 156.8

func ReplaceFuse() -> void:
	if hasPocketKnife and hasFuse:
		$Plug/FuseButton.texture_normal = load("res://resources/dummy/dummyFuse.jpg")
		_fuseReplaced = true

func GrabPlug() -> void:
	if _fuseReplaced: _grabbingPlug = true

func GrabDial() -> void:
	if _tvPowerOn: _grabbingDial = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if _grabbingPlug:
			_plug.global_position.y = get_global_mouse_position().y + _plug.texture_normal.get_height()/2
		elif _grabbingDial:
			_dial.global_position.x = clamp(get_global_mouse_position().x + _dial.texture_normal.get_width()/2, 108, 308)
		
	if Input.is_action_just_released("interact"):
		if _grabbingPlug and get_global_mouse_position().y < $Socket.position.y + $Socket.texture.get_height():
			_plug.position.y = 70
			_tvPowerOn = true
		elif !_tvPowerOn:
			_plug.position.y = 460
		_grabbingPlug = false
		
		if _grabbingDial and abs(_dial.position.x - 145.5) <= 15:
			_grabbingDial = false
			print_debug("Tuned in to emergency broadcasts")
			#tune to tv emergeny broadcast station
	
	if abs(_dial.position.x - 145.5) <= 15:
		$TvScreen/Display.texture = load("res://resources/dummy/dummyStatic.jpg")
	else:
		$TvScreen/Display.texture = load("res://resources/dummy/dummyWeatherChannel.png")
	
