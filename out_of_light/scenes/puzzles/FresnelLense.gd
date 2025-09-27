class_name FresnelLensPuzzle
extends Node2D

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
@onready var _lensTexture : TextureRect = $PuzzleFullscreen/LensArea/LensTexture

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
	_activeLensIdx -= 1
	if _activeLensIdx < 0 : _activeLensIdx = 3
	_activeLens = _lenses[_activeLensIdx]
	_reloadLens()

func _reloadLens() -> void :
	$PuzzleFullscreen/TrackLever/TrackLengthShort.flip_h = true
	$PuzzleFullscreen/TrackLever/TrackLengthMed.flip_h = true
	$PuzzleFullscreen/TrackLever/TrackLengthLong.flip_h = true
	match _activeLens.trackLength:
		1:
			$PuzzleFullscreen/TrackLever/TrackLengthShort.flip_h = false
		2:
			$PuzzleFullscreen/TrackLever/TrackLengthMed.flip_h = false
		3:
			$PuzzleFullscreen/TrackLever/TrackLengthLong.flip_h = false
	var mat : ShaderMaterial = _lensTexture.material
	mat.set_shader_parameter("color",_lensColorVals[_activeLens.color])

func StartLight() -> void :
	#check the sequence of the lenses and do the outcome
	print_debug("weewoo weewoo")
	pass
