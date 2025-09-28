extends Control

func _on_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/bathroom_cabinet.tscn")

func _on_mirror_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/bathroom_mirror.tscn")

func _on_front_post_it_note_pressed() -> void:
	ProgressController.entered_bathroom = true
	if ProgressController._can_leave_intro():
		ProgressController._change_current_stage(ProgressEnum.Progress.STAGE_1)
