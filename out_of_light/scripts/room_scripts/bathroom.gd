extends Control

func _ready() -> void:
	ProgressController.entered_bathroom = true
	if ProgressController._can_leave_intro():
		ProgressController.current_stage = ProgressEnum.Progress.STAGE_1

func _on_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/bathroom_cabinet.tscn")

func _on_mirror_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/bathroom_mirror.tscn")
