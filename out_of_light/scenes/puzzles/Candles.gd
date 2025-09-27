class_name Candles
extends Control

@export var hasMatchbox : bool = false

@onready var _match : TextureButton = $Match
@onready var _matchbox : TextureRect = $Matchbox

var _grabbingMatch : bool = false
var _matchIsLit : bool = false

func GrabMatch() -> void:
	if hasMatchbox and !_matchIsLit: _grabbingMatch = true

func _enter_tree() -> void:
	if !hasMatchbox:
		_match.visible = false
		_matchbox.visible = false
	else:
		_match.visible = true
		_matchbox.visible = true

func GiveMatchbox() -> void:
	hasMatchbox = true
	_match.visible = true
	_matchbox.visible = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if _grabbingMatch and !_matchIsLit:
			_match.global_position.x = clamp(get_global_mouse_position().x - _match.texture_normal.get_width()/2, _matchbox.global_position.x, _matchbox.global_position.x + _matchbox.texture.get_width())
			print_debug(Input.get_last_mouse_screen_velocity().x)
			if Input.get_last_mouse_screen_velocity().x >= 5000.0:
				#_match.texture_normal = load("litMatch")
				_matchIsLit = true
	
	if _matchIsLit:
		_match.global_position = get_global_mouse_position() - _match.texture_normal.get_size()
	elif Input.is_action_just_released("interact"):
		_grabbingMatch = false
		_match.global_position = Vector2(170, 230)

func LightCandles() -> void:
	if _matchIsLit: 
		#$Candle.texture_normal = load("litCandles")
		_matchIsLit = false
		_grabbingMatch = false
		_match.global_position = Vector2(170, 230)
		print_debug("Candles are lit!")
		#end the minigame
