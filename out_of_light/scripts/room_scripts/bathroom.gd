extends Control

func _on_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/bathroom_cabinet.tscn")

func _on_mirror_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/bathroom_mirror.tscn")
