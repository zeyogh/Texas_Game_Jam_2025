class_name FresnelLensPuzzle
extends Control

enum LensColor {
	BLACK,
	WHITE,
	RED,
	YELLOW,
	GREEN
}
const _lensColorVals : Array[Color] = [Color.BLACK, Color.ANTIQUE_WHITE, Color.RED, Color.ORANGE, Color.LIME_GREEN]

class FresnelLens:
	var color : LensColor
	var trackLength : int
	
	func _init(c : LensColor, tl : int) -> void:
		color = c
		trackLength = clamp(tl, 1, 3)

var _lenses : Array[FresnelLens] = [
	FresnelLens.new(LensColor.BLACK, 1),
	FresnelLens.new(LensColor.BLACK, 1),
	FresnelLens.new(LensColor.BLACK, 1),
	FresnelLens.new(LensColor.BLACK, 1)
]
var _activeLensIdx : int = 0
@onready var _activeLens : FresnelLens = _lenses[_activeLensIdx]
@onready var _lensTexture : TextureRect = $LensTexture

func _ready() -> void:
	SetColor(LensColor.BLACK)

func SetColor(NewColor : LensColor) -> void :
	_activeLens.color = NewColor
	var mat : ShaderMaterial = _lensTexture.material
	mat.set_shader_parameter("color",_lensColorVals[NewColor])

func SetTrackLength(NewLength : int) -> void :
	_activeLens.trackLength = clamp(NewLength,1,3)

func NextLens() -> void :
	_activeLensIdx += 1
	if _activeLensIdx > 3 : _activeLensIdx = 0
	_activeLens = _lenses[_activeLensIdx]
	_reloadLens()

func PrevLens() -> void :
	print_debug("prev")
	_activeLensIdx -= 1
	if _activeLensIdx < 0 : _activeLensIdx = 3
	_activeLens = _lenses[_activeLensIdx]
	_reloadLens()

func _reloadLens() -> void :
	$TrackLever/TrackLengthShort.flip_h = false
	$TrackLever/TrackLengthMed.flip_h = false
	$TrackLever/TrackLengthLong.flip_h = false
	match _activeLens.trackLength:
		1:
			$TrackLever/TrackLengthShort.flip_h = true
		2:
			$TrackLever/TrackLengthMed.flip_h = true
		3:
			$TrackLever/TrackLengthLong.flip_h = true
	var mat : ShaderMaterial = _lensTexture.material
	mat.set_shader_parameter("color",_lensColorVals[_activeLens.color])

func StartLight() -> void :
	#check the sequence of the lenses and do the outcome
	var _nextLight := [LensColor.BLACK, LensColor.WHITE, LensColor.RED]
	var _isEmergency := false
	for _sequence in range(0,4):
		var color = _lenses[_sequence].color
		var track = _lenses[_sequence].trackLength
		if _nextLight.has(color):
			if color == LensColor.BLACK and track == 1:
				_nextLight = [LensColor.WHITE]
				_isEmergency = true
			elif color == LensColor.RED and track == 3:
				_nextLight = [LensColor.WHITE]
			elif color == LensColor.WHITE and track != 1:
				if track == 2:
					_nextLight = [LensColor.BLACK]
				elif track == 3 and !_isEmergency:
					_nextLight = [LensColor.RED]
				else: return
			else: return
		else: return
	
	await get_tree().create_timer(1).timeout
	ProgressController._change_current_stage(ProgressEnum.Progress.OUTRO)
	PlayerController.i_love_my_son = _isEmergency
	ExitMinigame()

func ExitMinigame() -> void:
	get_tree().change_scene_to_file("res://scenes/outro_cutscene.tscn")
