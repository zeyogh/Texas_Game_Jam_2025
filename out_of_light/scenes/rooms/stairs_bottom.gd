extends Control

func _ready() -> void:
	if ProgressController.current_stage != ProgressEnum.Progress.STAGE_4 and ProgressController.current_stage != ProgressEnum.Progress.STAGE_5 and ProgressController.current_stage != ProgressEnum.Progress.OUTRO:
		$RoomGeneric/RightButton.visible = false

func _on_closet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/closet.tscn")
