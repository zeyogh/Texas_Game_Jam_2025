extends Control

func _ready() -> void:
	ProgressController.entered_living_room = true
	if ProgressController._can_leave_intro():
		ProgressController.current_stage = ProgressEnum.Progress.STAGE_1

func _on_opposite_button_pressed() -> void:
	$TVCabinetButton.visible = false

func _on_front_button_pressed() -> void:
	$TVCabinetButton.visible = true

func _on_tv_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/TV_cabinet.tscn")

func _on_tv_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/puzzles/TVStand.tscn")
