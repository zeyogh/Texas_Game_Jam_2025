extends Control

const brokenChandelierTexture : Texture2D = preload("res://resources/rooms/chandelierBroken.png")

func _on_opposite_button_pressed() -> void:
	$TVCabinetButton.visible = false
	$Chandelier.visible = true
	if ProgressController.current_stage == ProgressEnum.Progress.STAGE_5:
		$Chandelier.texture = brokenChandelierTexture

func _on_front_button_pressed() -> void:
	$TVCabinetButton.visible = true
	$Chandelier.visible = false

func _on_tv_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/TV_cabinet.tscn")

func _on_tv_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/puzzles/TVStand.tscn")

func _on_front_post_it_note_pressed() -> void:
	ProgressController.entered_living_room = true
	if ProgressController._can_leave_intro():
		ProgressController._change_current_stage(ProgressEnum.Progress.STAGE_1)

func _on_back_post_it_note_pressed() -> void:
	ProgressController.entered_living_room = true
	if ProgressController._can_leave_intro():
		ProgressController._change_current_stage(ProgressEnum.Progress.STAGE_1)
