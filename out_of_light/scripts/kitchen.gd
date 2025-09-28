extends Control

func _on_opposite_button_pressed() -> void:
	$CabinetButton.visible = true
	
func _on_front_button_pressed() -> void:
	$CabinetButton.visible = false

func _on_cabinet_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/rooms/kitchen_cabinet.tscn")
