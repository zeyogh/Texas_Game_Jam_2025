extends Control

@export_file("*.tscn") var left_path: String
@export_file("*.tscn") var right_path: String
@export_file("*.tscn") var ceiling_path: String

func _on_left_button_pressed() -> void:
	get_tree().change_scene_to_file(left_path)

func _on_right_button_pressed() -> void:
	get_tree().change_scene_to_file(right_path)

func _on_ceiling_button_pressed() -> void:
	get_tree().change_scene_to_file(ceiling_path)
