extends Control

func _ready() -> void:
	if PlayerController.has_key:
		$KeyButton.visible = false

func _on_opposite_button_pressed() -> void:
	if !PlayerController.has_key:
		$KeyButton.visible = false
		$LightButton.visible = false

func _on_front_button_pressed() -> void:
	if !PlayerController.has_key:
		$KeyButton.visible = true
		$LightButton.visible = true

func _on_key_button_pressed() -> void:
	PlayerController.has_key = true
	$GrabAudio.play()
	$KeyButton.queue_free()

func _on_light_button_pressed() -> void:
	if ProgressController.current_stage == ProgressEnum.Progress.STAGE_5:
		get_tree().change_scene_to_file("res://scenes/puzzles/FresnelLens.tscn")
