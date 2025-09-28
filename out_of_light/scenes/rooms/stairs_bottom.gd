extends Control


func _on_closet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/closet.tscn")
