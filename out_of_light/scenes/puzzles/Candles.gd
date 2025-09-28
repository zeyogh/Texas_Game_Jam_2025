class_name Candles
extends Control

@export var hasMatchbox : bool = PlayerController.has_matchbox

@onready var _match : TextureButton = $Match
@onready var _matchbox : TextureRect = $Matchbox

var _grabbingMatch : bool = false
var _matchIsLit : bool = false

const matchTextures : Array[Texture2D] = [
	preload("res://resources/puzzleTextures/match.png"),
	preload("res://resources/puzzleTextures/matchLit.png")
]

func GrabMatch() -> void:
	if hasMatchbox and !_matchIsLit: _grabbingMatch = true

func _ready() -> void:
	if !hasMatchbox:
		_match.visible = false
		_matchbox.visible = false
	else:
		_match.visible = true
		_matchbox.visible = true

#call when entering scene with matchbox
func GiveMatchbox() -> void:
	hasMatchbox = true
	_match.visible = true
	_matchbox.visible = true

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if _grabbingMatch and !_matchIsLit:
			_match.global_position.x = clamp(get_global_mouse_position().x - _match.texture_normal.get_width()/2, 300, 600)
			if Input.get_last_mouse_screen_velocity().x >= 3000.0:
				_match.texture_normal = matchTextures[1]
				_matchIsLit = true
	
	if _matchIsLit:
		_match.global_position = Vector2(get_global_mouse_position().x - 97, get_global_mouse_position().y - 128)
	elif Input.is_action_just_released("interact"):
		_grabbingMatch = false
		_match.global_position = Vector2(318, 744)

func LightCandles() -> void:
	if _matchIsLit: 
		$Candle.texture_normal = load("res://resources/puzzleTextures/candlesLit.png")
		_matchIsLit = false
		_match.texture_normal = matchTextures[0]
		_grabbingMatch = false
		_match.global_position = Vector2(318, 744)
		await get_tree().create_timer(1).timeout
		ProgressController.current_stage = ProgressEnum.STAGE_2
		get_tree().change_scene_to_file("res://scenes/rooms/bedroom.tscn")
