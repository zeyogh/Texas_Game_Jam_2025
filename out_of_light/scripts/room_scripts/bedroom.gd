extends Control

func _on_opposite_button_pressed() -> void:
	$CandleButton.visible = true
	if !PlayerController.has_glasses:
		$CabinetButton.visible = false

func _on_front_button_pressed() -> void:
	$CandleButton.visible = false
	if !PlayerController.has_glasses:
		$CabinetButton.visible = true

func _on_candle_button_pressed() -> void:
	if PlayerController.has_matchbox:
		get_tree().change_scene_to_file("res://scenes/puzzles/Candles.tscn")

func _on_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/bedroom_cabinet.tscn")

func _on_front_post_it_note_pressed() -> void:
	ProgressController.entered_bedroom = true
	if ProgressController._can_leave_intro():
		ProgressController._change_current_stage(ProgressEnum.Progress.STAGE_1)

func _on_back_post_it_note_pressed() -> void:
	ProgressController.entered_bedroom = true
	if ProgressController._can_leave_intro():
		ProgressController._change_current_stage(ProgressEnum.Progress.STAGE_1)
