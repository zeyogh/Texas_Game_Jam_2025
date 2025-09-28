extends Control

func _ready() -> void:
	if PlayerController.has_flashlight:
		$FlashlightButton.visible = false

func _on_opposite_button_pressed() -> void:
	$CabinetButton.visible = true
	if !PlayerController.has_flashlight:
		$FlashlightButton.visible = false
	
func _on_front_button_pressed() -> void:
	$CabinetButton.visible = false
	if !PlayerController.has_flashlight:
		$FlashlightButton.visible = true

func _on_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/kitchen_cabinet.tscn")

func _on_flashlight_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/puzzles/Flashlight.tscn")

func _on_front_post_it_note_pressed() -> void:
	ProgressController.entered_kitchen = true
	if ProgressController._can_leave_intro():
		ProgressController.current_stage = ProgressEnum.Progress.STAGE_1

func _on_back_post_it_note_pressed() -> void:
	ProgressController.entered_kitchen = true
	if ProgressController._can_leave_intro():
		ProgressController._change_current_stage(ProgressEnum.Progress.STAGE_1)
