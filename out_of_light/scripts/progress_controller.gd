extends Node2D

signal on_current_stage_changed

func _ready() -> void:
	on_current_stage_changed.connect(_on_current_stage_changed)

var current_stage := ProgressEnum.Progress.INTRO

var entered_bathroom = false

var entered_bedroom = false

var entered_living_room = false

var entered_kitchen = false

func _can_leave_intro() -> bool:
	return entered_bathroom and entered_bedroom and entered_living_room and entered_kitchen and current_stage == ProgressEnum.Progress.INTRO
	
func _change_current_stage(stage: ProgressEnum.Progress) -> void:
	current_stage = stage
	on_current_stage_changed.emit()

func _on_current_stage_changed():
	$AudioStreamPlayer.play()
	GoalController._display_next_text()
