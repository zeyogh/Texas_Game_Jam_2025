extends Node2D

var current_stage := ProgressEnum.Progress.INTRO

var entered_bathroom = false

var entered_bedroom = false

var entered_living_room = false

var entered_kitchen = false

func _can_leave_intro() -> bool:
	return entered_bathroom and entered_bedroom and entered_living_room and entered_kitchen and current_stage == ProgressEnum.Progress.INTRO
